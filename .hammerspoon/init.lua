local battery = require("hs.battery")
local alert   = require("hs.alert")

local modalKey = {"alt"}

hs.hotkey.bind(modalKey, "r", function()
	hs.reload()
	hs.notify.new({title="Hammerspoon", informativeText="Reloaded configuration"}):send()
end)

local focusKeys = {
	a='Anki',
	f='Finder',
	s='Safari',
	c='Firefox',
	t='iTerm',
	p='Spotify',
	m='Telegram',
}

for key in pairs(focusKeys) do
	hs.hotkey.bind(modalKey, key, function()
		hs.application.launchOrFocus(focusKeys[key])
	end)
end

hs.hotkey.bind(modalKey, 'g', function()
  hs.execute("spotify play Guile Theme", true)
end)

hs.hotkey.bind(modalKey, 'k', function()
  hs.execute("open 'https://www.youtube.com/watch?v=y37D0BvACv0'", true)
end)

local PreviousPowerSource = battery.powerSource()

return battery.watcher.new(function()
	local total, count = 0, 0
	local CurrentPowerSource  = battery.powerSource()
	if CurrentPowerSource ~= PreviousPowerSource then
		if CurrentPowerSource ~= "AC Power" then
			for volume in require("hs.fs").dir("/Volumes") do
				if not volume:match("^%.") and volume ~= "Macintosh HD" and volume ~= "BOOTCAMP" and volume ~= "MobileBackups" then
					local _,_,_,rc = hs.execute("diskutil umount '"..volume.."'")
					total = total + 1
					if tonumber(rc) == 0 then count = count + 1 end
				end
			end
			if total > 0 then
				alert.show("Auto dismount: "..tostring(count).." of "..tostring(total).." dismounted.")
			end
		end
		PreviousPowerSource = CurrentPowerSource
	end
end):start()
