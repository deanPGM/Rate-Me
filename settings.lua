-- settings.lua, Created by hoan
-- http://developer.coronalabs.com/code/settingslua-storing-info

-- Nothing in the file needs to be amended.

module(..., package.seeall)

function settings.set(key, value)

_G.__settings[key] = value

settings.save()
end

function settings.get(key)
if _G.__settings then
return _G.__settings[key]
else
return nil
end
end

function settings.save()
local json = require("json")
local path = system.pathForFile("settings.json", system.DocumentsDirectory)
local fh = io.open(path, "w")

fh:write(json.encode(_G.__settings))
fh:close()
end

function settings.load()
local json = require("json")
local path = system.pathForFile("settings.json", system.DocumentsDirectory)
local fh, reason = io.open(path, "r")

if fh then
-- read all contents of file into a string
local contents = fh:read("*a")

local succ, data = pcall(function()
return json.decode(contents)
end)

if succ and data then
_G.__settings = data
else
_G.__settings = {}
end

print("Loaded settings")
else
print("No settings file found. \n Creating settings file")

-- create file because it doesn't exist yet
_G.__settings = {}
settings.save()
end

return fh
end

