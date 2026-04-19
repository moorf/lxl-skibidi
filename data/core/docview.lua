local core = require "core"
local common = require "core.common"
local config = require "core.config"
local style = require "core.style"
local keymap = require "core.keymap"
local translate = require "core.doc.translate"
local ime = require "core.ime"
local View = require "core.view"
local ContextMenu = require "core.contextmenu"

---@class core.docview : core.view
---@field super core.view
local DocView = View:extend()

function DocView:__tostring() return "DocView" end

DocView.context = "session"

local function move_to_line_offset(dv, line, col, offset)
  local xo = dv.last_x_offset
  if xo.line ~= line or xo.col ~= col then
    xo.offset = dv:get_col_x_offset(line, col)
  end
  xo.line = line + offset
  xo.col = dv:get_x_offset_col(line + offset, xo.offset)
  return xo.line, xo.col
end


DocView.translate = {
  ["previous_page"] = function(doc, line, col, dv)
    local min, max = dv:get_visible_line_range()
    return line - (max - min), 1
  end,

  ["next_page"] = function(doc, line, col, dv)
    if line == #doc.lines then
      return #doc.lines, #doc.lines[line]
    end
    local min, max = dv:get_visible_line_range()
    return line + (max - min), 1
  end,

  ["previous_line"] = function(doc, line, col, dv)
    if line == 1 then
      return 1, 1
    end
    return move_to_line_offset(dv, line, col, -1)
  end,

  ["next_line"] = function(doc, line, col, dv)
    if line == #doc.lines then
      return #doc.lines, math.huge
    end
    return move_to_line_offset(dv, line, col, 1)
  end,
}


function DocView:new(doc)
  DocView.super.new(self)
  self.cursor = "ibeam"
  self.scrollable = true
  self.doc = assert(doc)
  self.font = "code_font"
  self.last_x_offset = {}
  self.ime_selection = { from = 0, size = 0 }
  self.ime_status = false
  self.hovering_gutter = false
  self.v_scrollbar:set_forced_status(config.force_scrollbar_status)
  self.h_scrollbar:set_forced_status(config.force_scrollbar_status)
  self._col_x_cache = {}
  self._layout_cache = {}
  self._width_opts = { tab_offset = 0 }
end


function DocView:try_close(do_close)
  if self.doc:is_dirty()
  and #core.get_views_referencing_doc(self.doc) == 1 then
    core.command_view:enter("Unsaved Changes; Confirm Close", {
      submit = function(_, item)
        if item.text:match("^[cC]") then
          do_close()
        elseif item.text:match("^[sS]") then
          self.doc:save()
          do_close()
        end
      end,
      suggest = function(text)
        local items = {}
        if not text:find("^[^cC]") then table.insert(items, "Close Without Saving") end
        if not text:find("^[^sS]") then table.insert(items, "Save And Close") end
        return items
      end
    })
  else
    do_close()
  end
end


function DocView:get_name()
  local post = self.doc:is_dirty() and "*" or ""
  local name = self.doc:get_name()
  return name:match("[^/%\\]*$") .. post
end


function DocView:get_filename()
  if self.doc.abs_filename then
    local post = self.doc:is_dirty() and "*" or ""
    return common.home_encode(self.doc.abs_filename) .. post
  end
  return self:get_name()
end


function DocView:get_scrollable_size()
  if not config.scroll_past_end then
    local _, _, _, h_scroll = self.h_scrollbar:get_track_rect()
    return self:get_line_height() * (#self.doc.lines) + style.padding.y * 2 + h_scroll
  end
  return self:get_line_height() * (#self.doc.lines - 1) + self.size.y
end

function DocView:get_h_scrollable_size()
  return math.huge
end


function DocView:get_font()
  return style[self.font]
end


function DocView:get_line_height()
  return math.floor(self:get_font():get_height() * config.line_height)
end


function DocView:get_gutter_width()
  local padding = style.padding.x * 2
  return self:get_font():get_width(#self.doc.lines) + padding, padding
end


function DocView:get_line_screen_position(line, col)
  local x, y = self:get_content_offset()
  local lh = self:get_line_height()
  local gw = self:get_gutter_width()

  y = y + (line - 1) * lh + style.padding.y

  if col then
    local xoffset = self:get_col_x_offset(line, col)
    return x + gw + xoffset, y
  else
    return x + gw, y
  end
end

function DocView:get_line_text_y_offset()
  local lh = self:get_line_height()
  local th = self:get_font():get_height()
  return (lh - th) / 2
end


function DocView:get_visible_line_range()
  local x, y, x2, y2 = self:get_content_bounds()
  local lh = self:get_line_height()
  local minline = math.max(1, math.floor((y - style.padding.y) / lh) + 1)
  local maxline = math.min(#self.doc.lines, math.floor((y2 - style.padding.y) / lh) + 1)
  return minline, maxline
end


function DocView:get_col_x_offset(line, col)
  if not col then return 0 end

  local default_font = self:get_font()
  local _, indent_size = self.doc:get_indent_info()
  default_font:set_tab_size(indent_size)

  local column = 1
  local xoffset = 0

  for _, type, text in self.doc.highlighter:each_token(line) do
    local font = style.syntax_fonts[type] or default_font
    if font ~= default_font then
      font:set_tab_size(indent_size)
    end

    local text_len = #text

    -- If entire token is before target column, measure whole token at once
    if column + text_len <= col then
      xoffset = xoffset + font:get_width(text, { tab_offset = xoffset })
      column = column + text_len
    else
      -- Only measure partial token
      local remaining = col - column
      if remaining > 0 then
        local partial = text:sub(1, remaining)
        xoffset = xoffset + font:get_width(partial, { tab_offset = xoffset })
      end
      return xoffset
    end
  end

  return xoffset
end

function DocView:_build_line_layout(line)
  local cache = {}

  local default_font = self:get_font()
  local _, indent_size = self.doc:get_indent_info()
  default_font:set_tab_size(indent_size)

  local columns = {}
  local xoffset = 0
  local column = 1

  columns[column] = 0

  for _, type, text in self.doc.highlighter:each_token(line) do
    local font = style.syntax_fonts[type] or default_font
    if font ~= default_font then
      font:set_tab_size(indent_size)
    end

    for char in common.utf8_chars(text) do
      xoffset = xoffset + font:get_width(char, { tab_offset = xoffset })
      column = column + #char
      columns[column] = xoffset
    end
  end

  cache.columns = columns
  self._layout_cache[line] = cache
  return cache
end
function DocView:get_x_offset_col(line, x)
  local line_text = self.doc.lines[line]
  local cache = self._layout_cache[line]

  local default_font = self:get_font()
  local _, indent_size = self.doc:get_indent_info()
  default_font:set_tab_size(indent_size)

  -- rebuild cache if needed
  if not cache then
    cache = {
      text = line_text,
      tokens = {},
      cumulative_widths = {},
      total_width = 0,
      char_count = #line_text
    }

    local xoffset = 0
    local opts = self._width_opts

    for _, type, text in self.doc.highlighter:each_token(line) do
      local font = style.syntax_fonts[type] or default_font
      if font ~= default_font then
        font:set_tab_size(indent_size)
      end

      opts.tab_offset = xoffset
      local width = font:get_width(text, opts)

      table.insert(cache.tokens, {
        text = text,
        font = font,
        start_x = xoffset,
        width = width
      })

      xoffset = xoffset + width
      table.insert(cache.cumulative_widths, xoffset)
    end

    cache.total_width = xoffset
    self._layout_cache[line] = cache
  end

  -- ✅ Early exits
  if x <= 0 then
    return 1
  end

  if x >= cache.total_width then
    return #line_text
  end

  ------------------------------------------------------------------
  -- ✅ LONG LINE FAST MODE (CRITICAL)
  ------------------------------------------------------------------
  if cache.char_count > 10000 then
    -- approximate column directly
    local avg = cache.total_width / cache.char_count
    local col = math.floor(x / avg)

    if col < 1 then col = 1 end
    if col > cache.char_count then col = cache.char_count end

    return col
  end
  ------------------------------------------------------------------

  -- ✅ Binary search token by cumulative width
  local lo, hi = 1, #cache.cumulative_widths
  local token_index = hi

  while lo <= hi do
    local mid = (lo + hi) // 2
    if cache.cumulative_widths[mid] >= x then
      token_index = mid
      hi = mid - 1
    else
      lo = mid + 1
    end
  end

  local token = cache.tokens[token_index]
  local xoffset = token.start_x
  local i = 1

  -- compute starting character index
  for j = 1, token_index - 1 do
    i = i + #cache.tokens[j].text
  end

  -- walk only inside this token
  local opts = self._width_opts
  for char in common.utf8_chars(token.text) do
    opts.tab_offset = xoffset
    local w = token.font:get_width(char, opts)

    if xoffset + w >= x then
      return (x <= xoffset + (w / 2)) and i or i + #char
    end

    xoffset = xoffset + w
    i = i + #char
  end

  return #line_text
end

function DocView:dget_x_offset_col(line, x)
  print(x)
   --string.sub(line, 1, 10)
  
  local line_text = self.doc.lines[line]
  local cache = self._layout_cache[line]
  --print(line_text)
  local default_font = self:get_font()
  local _, indent_size = self.doc:get_indent_info()
  default_font:set_tab_size(indent_size)
  -- rebuild cache if needed
  if cache then
    print(cache and "HIT" or "MISS")
    print(string.sub(cache.text, 1, 10))
  end
  print(string.sub(line_text, 1, 10))
  print(string.sub(line, 1, 10))
  if not cache then
    cache = {
      text = line_text,
      tokens = {},
      cumulative_widths = {},
      total_width = 0
    }

    local xoffset = 0
    local opts = self._width_opts

    for _, type, text in self.doc.highlighter:each_token(line) do
      local font = style.syntax_fonts[type] or default_font
      if font ~= default_font then
        font:set_tab_size(indent_size)
      end

      opts.tab_offset = xoffset
      local width = font:get_width(text, opts)

      table.insert(cache.tokens, {
        text = text,
        font = font,
        start_x = xoffset,
        width = width
      })

      xoffset = xoffset + width
      table.insert(cache.cumulative_widths, xoffset)
    end

    cache.total_width = xoffset
    self._layout_cache[line] = cache
  end

  -- early exit if past end of line
  if x >= cache.total_width then
    return #line_text
  end

  -- ✅ Binary search token by cumulative width
  local lo, hi = 1, #cache.cumulative_widths
  local token_index = hi

  while lo <= hi do
    local mid = math.floor((lo + hi) / 2)
    if cache.cumulative_widths[mid] >= x then
      token_index = mid
      hi = mid - 1
    else
      lo = mid + 1
    end
  end

  local token = cache.tokens[token_index]
  local xoffset = token.start_x
  local i = 1

  -- compute starting character index
  for j = 1, token_index - 1 do
    i = i + #cache.tokens[j].text
  end

  -- ✅ only walk characters inside matched token
  local opts = self._width_opts
  for char in common.utf8_chars(token.text) do
    opts.tab_offset = xoffset
    local w = token.font:get_width(char, opts)

    if xoffset + w >= x then
      return (x <= xoffset + (w / 2)) and i or i + #char
    end

    xoffset = xoffset + w
    i = i + #char
  end

  return #line_text
end

function DocView:get_x_offset_col_original(line, x)
  local line_text = self.doc.lines[line]

  local xoffset, i = 0, 1
  local default_font = self:get_font()
  local _, indent_size = self.doc:get_indent_info()
  default_font:set_tab_size(indent_size)
  for _, type, text in self.doc.highlighter:each_token(line) do
    local font = style.syntax_fonts[type] or default_font
    if font ~= default_font then font:set_tab_size(indent_size) end
    local width = font:get_width(text, {tab_offset = xoffset})
    -- Don't take the shortcut if the width matches x,
    -- because we need last_i which should be calculated using utf-8.
    if xoffset + width < x then
      xoffset = xoffset + width
      i = i + #text
    else
      for char in common.utf8_chars(text) do
        local w = font:get_width(char, {tab_offset = xoffset})
        if xoffset + w >= x then
          return (x <= xoffset + (w / 2)) and i or i + #char
        end
        xoffset = xoffset + w
        i = i + #char
      end
    end
  end

  return #line_text
end

function DocView:get_x_offset_col2(line, target_x)
  self._layout_cache = self._layout_cache or {}

  local cache = self._layout_cache[line]
  if not cache then
    cache = self:_build_line_layout(line)
  end

  local columns = cache.columns
  if not columns or #columns == 0 then
    return 1
  end

  -- Binary search for closest column
  local low, high = 1, #columns

  while low < high do
    local mid = (low + high) // 2
    if columns[mid] < target_x then
      low = mid + 1
    else
      high = mid
    end
  end

  -- Now low is first column whose x >= target_x
  local col = low

  -- Snap to nearest side of glyph (preserve original behavior)
  local prev_x = columns[col - 1] or 0
  local curr_x = columns[col]

  if target_x <= prev_x + (curr_x - prev_x) / 2 then
    return col - 1
  end

  return col
end


function DocView:resolve_screen_position(x, y)
  local ox, oy = self:get_line_screen_position(1)
  local line = math.floor((y - oy) / self:get_line_height()) + 1
  line = common.clamp(line, 1, #self.doc.lines)
  local col = self:get_x_offset_col(line, x - ox)
  return line, col
end


function DocView:scroll_to_line(line, ignore_if_visible, instant)
  print(line)
  local min, max = self:get_visible_line_range()
  if not (ignore_if_visible and line > min and line < max) then
    local x, y = self:get_line_screen_position(line)
    local ox, oy = self:get_content_offset()
    local _, _, _, scroll_h = self.h_scrollbar:get_track_rect()
    self.scroll.to.y = math.max(0, y - oy - (self.size.y - scroll_h) / 2)
    if instant then
      self.scroll.y = self.scroll.to.y
    end
  end
end


function DocView:supports_text_input()
  return true
end

function DocView:scroll_to_make_visible(line, col)
  local ox, oy = self:get_content_offset()
  local x, ly = self:get_line_screen_position(line, col)
  local lh = self:get_line_height()

  local _, _, _, scroll_h = self.h_scrollbar:get_track_rect()
  local overscroll = math.min(lh * 2, self.size.y)

  self.scroll.to.y = common.clamp(
    self.scroll.to.y,
    ly - oy - self.size.y + scroll_h + overscroll,
    ly - oy - lh
  )

  if col then
    local gw = self:get_gutter_width()
    local xoffset = x - ox - gw  -- reuse computed value

    local xmargin = 3 * self:get_font():get_width(" ")
    local xsup = xoffset + gw + xmargin
    local xinf = xoffset - xmargin

    local _, _, scroll_w = self.v_scrollbar:get_track_rect()
    local size_x = math.max(0, self.size.x - scroll_w)

    if xsup > self.scroll.x + size_x then
      self.scroll.to.x = xsup - size_x
    elseif xinf < self.scroll.x then
      self.scroll.to.x = math.max(0, xinf)
    end
  end
end

function DocView:on_mouse_moved(x, y, ...)
  DocView.super.on_mouse_moved(self, x, y, ...)

  self.hovering_gutter = false
  local gw = self:get_gutter_width()

  if self:scrollbar_hovering() or self:scrollbar_dragging() then
    self.cursor = "arrow"
  elseif gw > 0 and x >= self.position.x and x <= (self.position.x + gw) then
    self.cursor = "arrow"
    self.hovering_gutter = true
  else
    self.cursor = "ibeam"
  end

  if self.mouse_selecting then
    local l1, c1 = self:resolve_screen_position(x, y)
    local l2, c2, snap_type = table.unpack(self.mouse_selecting)
    if keymap.modkeys["ctrl"] then
      if l1 > l2 then l1, l2 = l2, l1 end
      self.doc.selections = { }
      for i = l1, l2 do
        self.doc:set_selections(i - l1 + 1, i, math.min(c1, #self.doc.lines[i]), i, math.min(c2, #self.doc.lines[i]))
      end
    else
      if snap_type then
        l1, c1, l2, c2 = self:mouse_selection(self.doc, snap_type, l1, c1, l2, c2)
      end
      self.doc:set_selection(l1, c1, l2, c2)
    end
  end
end


function DocView:mouse_selection(doc, snap_type, line1, col1, line2, col2)
  local swap = line2 < line1 or line2 == line1 and col2 <= col1
  if swap then
    line1, col1, line2, col2 = line2, col2, line1, col1
  end
  if snap_type == "word" then
    line1, col1 = translate.start_of_word(doc, line1, col1)
    line2, col2 = translate.end_of_word(doc, line2, col2)
  elseif snap_type == "lines" then
    col1, col2, line2 = 1, 1, line2 + 1
  end
  if swap then
    return line2, col2, line1, col1
  end
  return line1, col1, line2, col2
end


function DocView:on_mouse_pressed(button, x, y, clicks)
  if button ~= "left" or not self.hovering_gutter then
    return DocView.super.on_mouse_pressed(self, button, x, y, clicks)
  end
  local line = self:resolve_screen_position(x, y)
  if keymap.modkeys["shift"] then
    local sline, scol, sline2, scol2 = self.doc:get_selection(true)
    if line > sline then
      self.doc:set_selection(sline, 1, line,  #self.doc.lines[line])
    else
      self.doc:set_selection(line, 1, sline2, #self.doc.lines[sline2])
    end
  else
    if clicks == 1 then
      self.doc:set_selection(line, 1, line, 1)
    elseif clicks == 2 then
      self.doc:set_selection(line, 1, line, #self.doc.lines[line])
    end
  end
  return true
end


function DocView:on_mouse_released(...)
  DocView.super.on_mouse_released(self, ...)
  self.mouse_selecting = nil
end


function DocView:on_text_input(text)
  self.doc:text_input(text)
end

function DocView:on_ime_text_editing(text, start, length)
  self.doc:ime_text_editing(text, start, length)
  self.ime_status = #text > 0
  self.ime_selection.from = start
  self.ime_selection.size = length

  -- Set the composition bounding box that the system IME
  -- will consider when drawing its interface
  local line1, col1, line2, col2 = self.doc:get_selection(true)
  local col = math.min(col1, col2)
  self:update_ime_location()
  self:scroll_to_make_visible(line1, col + start)
end

---Update the composition bounding box that the system IME
---will consider when drawing its interface
function DocView:update_ime_location()
  if not self.ime_status then return end

  local line1, col1, line2, col2 = self.doc:get_selection(true)
  local x, y = self:get_line_screen_position(line1)
  local h = self:get_line_height()
  local col = math.min(col1, col2)

  local x1, x2 = 0, 0

  if self.ime_selection.size > 0 then
    -- focus on a part of the text
    local from = col + self.ime_selection.from
    local to = from + self.ime_selection.size
    x1 = self:get_col_x_offset(line1, from)
    x2 = self:get_col_x_offset(line1, to)
  else
    -- focus the whole text
    x1 = self:get_col_x_offset(line1, col1)
    x2 = self:get_col_x_offset(line2, col2)
  end

  ime.set_location(x + x1, y, x2 - x1, h)
end

function DocView:update()
  -- scroll to make caret visible and reset blink timer if it moved
  local line1, col1, line2, col2 = self.doc:get_selection()
  if (line1 ~= self.last_line1 or col1 ~= self.last_col1 or
      line2 ~= self.last_line2 or col2 ~= self.last_col2) and self.size.x > 0 then
    if core.active_view == self and not ime.editing then
      self:scroll_to_make_visible(line1, col1)
    end
    core.blink_reset()
    self.last_line1, self.last_col1 = line1, col1
    self.last_line2, self.last_col2 = line2, col2
  end

  -- update blink timer
  if not config.disable_blink and system.window_has_focus(core.window) and self == core.active_view and not self.mouse_selecting then
    local T, t0 = config.blink_period, core.blink_start
    local ta, tb = core.blink_timer, system.get_time()
    if ((tb - t0) % T < T / 2) ~= ((ta - t0) % T < T / 2) then
      core.redraw = true
    end
    core.blink_timer = tb
  end

  self:update_ime_location()

  DocView.super.update(self)
end


function DocView:draw_line_highlight(x, y)
  local lh = self:get_line_height()
  renderer.draw_rect(x, y, self.size.x, lh, style.line_highlight)
end


function DocView:draw_line_text(line, x, y)
  local default_font = self:get_font()
  local tx, ty = x, y + self:get_line_text_y_offset()
  local last_token = nil
  local tokens = self.doc.highlighter:get_line(line).tokens
  local tokens_count = #tokens
  if string.sub(tokens[tokens_count], -1) == "\n" then
    last_token = tokens_count - 1
  end
  local start_tx = tx
  for tidx, type, text in self.doc.highlighter:each_token(line) do
    local color = style.syntax[type]
    local font = style.syntax_fonts[type] or default_font
    -- do not render newline, fixes issue #1164
    if tidx == last_token then text = text:sub(1, -2) end
    tx = renderer.draw_text(font, text, tx, ty, color, {tab_offset = tx - start_tx})
    if tx > self.position.x + self.size.x then break end
  end
  return self:get_line_height()
end


function DocView:draw_overwrite_caret(x, y, width)
  local lh = self:get_line_height()
  renderer.draw_rect(x, y + lh - style.caret_width, width, style.caret_width, style.caret)
end


function DocView:draw_caret(x, y)
  local lh = self:get_line_height()
  renderer.draw_rect(x, y, style.caret_width, lh, style.caret)
end

function DocView:draw_line_body(line, x, y)
  -- draw highlight if any selection ends on this line
  local draw_highlight = false
  local hcl = config.highlight_current_line
  if hcl ~= false then
    for lidx, line1, col1, line2, col2 in self.doc:get_selections(false) do
      if line1 == line then
        if hcl == "no_selection" then
          if (line1 ~= line2) or (col1 ~= col2) then
            draw_highlight = false
            break
          end
        end
        draw_highlight = true
        break
      end
    end
  end
  if draw_highlight and core.active_view == self then
    self:draw_line_highlight(x + self.scroll.x, y)
  end

  -- draw selection if it overlaps this line
  local lh = self:get_line_height()
  for lidx, line1, col1, line2, col2 in self.doc:get_selections(true) do
    if line >= line1 and line <= line2 then
      local text = self.doc.lines[line]
      if line1 ~= line then col1 = 1 end
      if line2 ~= line then col2 = #text + 1 end
      local x1 = x + self:get_col_x_offset(line, col1)
      local x2 = x + self:get_col_x_offset(line, col2)
      if x1 ~= x2 then
        renderer.draw_rect(x1, y, x2 - x1, lh, style.selection)
      end
    end
  end

  -- draw line's text
  return self:draw_line_text(line, x, y)
end


function DocView:draw_line_gutter(line, x, y, width)
  local color = style.line_number
  for _, line1, _, line2 in self.doc:get_selections(true) do
    if line >= line1 and line <= line2 then
      color = style.line_number2
      break
    end
  end
  x = x + style.padding.x
  local lh = self:get_line_height()
  common.draw_text(self:get_font(), color, line, "right", x, y, width, lh)
  return lh
end


function DocView:draw_ime_decoration(line1, col1, line2, col2)
  local x, y = self:get_line_screen_position(line1)
  local line_size = math.max(1, SCALE)
  local lh = self:get_line_height()

  -- Draw IME underline
  local x1 = self:get_col_x_offset(line1, col1)
  local x2 = self:get_col_x_offset(line2, col2)
  renderer.draw_rect(x + math.min(x1, x2), y + lh - line_size, math.abs(x1 - x2), line_size, style.text)

  -- Draw IME selection
  local col = math.min(col1, col2)
  local from = col + self.ime_selection.from
  local to = from + self.ime_selection.size
  x1 = self:get_col_x_offset(line1, from)
  if from ~= to then
    x2 = self:get_col_x_offset(line1, to)
    line_size = style.caret_width
    renderer.draw_rect(x + math.min(x1, x2), y + lh - line_size, math.abs(x1 - x2), line_size, style.caret)
  end
  self:draw_caret(x + x1, y)
end


function DocView:draw_overlay()
  if core.active_view == self then
    local minline, maxline = self:get_visible_line_range()

    -- draw caret if it overlaps this line
    local T = config.blink_period
    for _, line1, col1, line2, col2 in self.doc:get_selections() do
      if line1 >= minline and line1 <= maxline
      and system.window_has_focus(core.window) then
        if ime.editing then
          self:draw_ime_decoration(line1, col1, line2, col2)
        else
          if config.disable_blink
          or (core.blink_timer - core.blink_start) % T < T / 2 then
            local x, y = self:get_line_screen_position(line1, col1)
            if self.doc.overwrite then
              self:draw_overwrite_caret(x, y, self:get_font():get_width(self.doc:get_char(line1, col1)))
            else
              self:draw_caret(x, y)
            end
          end
        end
      end
    end
  end
end

function DocView:draw()
  self:draw_background(style.background)
  local _, indent_size = self.doc:get_indent_info()
  self:get_font():set_tab_size(indent_size)

  local minline, maxline = self:get_visible_line_range()
  if not self.doc.eof and maxline >= #self.doc.lines - 20 then
    self.doc:load_chunk(100)
  end
  local lh = self:get_line_height()

  local x, y = self:get_line_screen_position(minline)
  local gw, gpad = self:get_gutter_width()
  for i = minline, maxline do
    y = y + (self:draw_line_gutter(i, self.position.x, y, gpad and gw - gpad or gw) or lh)
  end

  local pos = self.position
  x, y = self:get_line_screen_position(minline)
  -- the clip below ensure we don't write on the gutter region. On the
  -- right side it is redundant with the Node's clip.
  core.push_clip_rect(pos.x + gw, pos.y, self.size.x - gw, self.size.y)
  for i = minline, maxline do
    y = y + (self:draw_line_body(i, x, y) or lh)
  end
  self:draw_overlay()
  core.pop_clip_rect()

  self:draw_scrollbar()
end

function DocView:on_context_menu()
  return { items = {
    { text = "Cut",     command = "doc:cut" },
    { text = "Copy",    command = "doc:copy" },
    { text = "Paste",   command = "doc:paste" },
    ContextMenu.DIVIDER,
    { text = "Find",    command = "find-replace:find"    },
    { text = "Replace", command = "find-replace:replace" }
  } }, self
end

local function wrap_with_timer(tbl, name)
  local original = tbl[name]
  if type(original) ~= "function" then return end

  tbl[name] = function(...)
    local start_time = os.clock()
    local results = { original(...) }
    local elapsed = (os.clock() - start_time) * 1000 -- ms
    if elapsed>6.0 then
      io.write(string.format("LUATIME %s: %.3f ms\n", name, elapsed))
    end
    return table.unpack(results)
  end
end

-- Wrap all DocView functions
for k, v in pairs(DocView) do
  if type(v) == "function" then
    wrap_with_timer(DocView, k)
  end
end
return DocView
