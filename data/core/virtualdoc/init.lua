local Object = require "core.object"
local common = require "core.common"

---@class core.virtualdoc : core.object
local VirtualDoc = Object:extend()

function VirtualDoc:__tostring()
  return "VirtualDoc"
end

-- how many lines to cache around requested line
local CACHE_RADIUS = 200

function VirtualDoc:new(filename)
  self.filename = filename
  self.abs_filename = filename

  self.file = assert(io.open(filename, "rb"))
  self.filesize = self.file:seek("end")
  self.file:seek("set", 0)

  self.line_offsets = { 0 }  -- byte offset of each line start
  self.total_lines = nil     -- unknown until fully indexed
  self.eof = false

  self.cache = {}            -- line_number -> string
  self.cache_min = 1
  self.cache_max = 0

  -- proxy so existing code can use self.lines[n]
  self.lines = setmetatable({}, {
    __index = function(_, k)
      if type(k) == "number" then
        return self:get_line(k)
      end
    end,
    __len = function()
      return self:get_line_count()
    end
  })
end

-- lazily index lines up to requested line
function VirtualDoc:index_to_line(n)
  if self.total_lines then return end
  if n <= #self.line_offsets then return end

  self.file:seek("set", self.line_offsets[#self.line_offsets])

  while #self.line_offsets < n do
    local pos = self.file:seek()
    local line = self.file:read("*l")
    if not line then
      self.total_lines = #self.line_offsets
      break
    end
    local newpos = self.file:seek()
    table.insert(self.line_offsets, newpos)
  end
end

function VirtualDoc:get_line_count()
  if self.total_lines then
    return self.total_lines
  end

  -- force full indexing if someone asks length
  self:index_to_line(math.huge)
  return self.total_lines
end

function VirtualDoc:get_line(n)
  if n < 1 then return "\n" end

  self:index_to_line(n)

  if self.total_lines and n > self.total_lines then
    return "\n"
  end

  if self.cache[n] then
    return self.cache[n]
  end

  local offset = self.line_offsets[n]
  if not offset then return "\n" end

  self.file:seek("set", offset)
  local line = self.file:read("*l")
  if not line then return "\n" end

  line = line .. "\n"

  self:add_to_cache(n, line)
  return line
end

function VirtualDoc:add_to_cache(n, line)
  self.cache[n] = line

  if self.cache_min > self.cache_max then
    self.cache_min = n
    self.cache_max = n
    return
  end

  self.cache_min = math.min(self.cache_min, n)
  self.cache_max = math.max(self.cache_max, n)

  -- evict outside sliding window
  local min_keep = n - CACHE_RADIUS
  local max_keep = n + CACHE_RADIUS

  for k in pairs(self.cache) do
    if k < min_keep or k > max_keep then
      self.cache[k] = nil
    end
  end
end

-- minimal compatibility helpers

function VirtualDoc:sanitize_position(line, col)
  local max = self:get_line_count()
  line = common.clamp(line, 1, max)
  local text = self:get_line(line)
  col = common.clamp(col, 1, #text)
  return line, col
end

function VirtualDoc:get_text(line1, col1, line2, col2, inclusive)
  line1, col1 = self:sanitize_position(line1, col1)
  line2, col2 = self:sanitize_position(line2, col2)

  if line1 == line2 then
    local line = self:get_line(line1)
    local offset = inclusive and 0 or 1
    return line:sub(col1, col2 - offset)
  end

  local result = {}
  table.insert(result, self:get_line(line1):sub(col1))

  for i = line1 + 1, line2 - 1 do
    table.insert(result, self:get_line(i))
  end

  local offset = inclusive and 0 or 1
  table.insert(result, self:get_line(line2):sub(1, col2 - offset))

  return table.concat(result)
end

function VirtualDoc:get_char(line, col)
  line, col = self:sanitize_position(line, col)
  return self:get_line(line):sub(col, col)
end

function VirtualDoc:get_name()
  return self.filename or "virtual"
end

function VirtualDoc:on_close()
  if self.file then
    self.file:close()
    self.file = nil
  end
end

return VirtualDoc
