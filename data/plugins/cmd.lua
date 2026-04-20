-- mod-version:4
local core = require "core"
local command = require "core.command"
local DocView = require "core.docview"

local function shell_quote(path)
  return '"' .. path:gsub('"', '\\"') .. '"'
end

local function is_docview()
  local view = core.active_view
  return view and view:is(DocView)
end

command.add(is_docview, {
  ["open:cmd"] = function()
    local dv = core.active_view
    local doc = dv and dv.doc

    if not doc or not doc.filename then
      core.error("No file is currently open")
      return
    end

    local dir = doc.filename:match("^(.*)[/\\]") or "."

    -- os.execute('start "" /b cmd.exe /K cd /d ' .. shell_quote(dir)) THIS MAKES IT ALL OPEN IN LITE-XL SHELL WHICH IS CURRENTLY USED FOR DEBUGGING BY ME
    os.execute('start "" cmd.exe /K "cd /d ' .. dir:gsub('"', '\\"') .. '"')
  end
})
