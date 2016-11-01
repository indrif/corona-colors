local pathOfThisFile = ...
local json = require("json")
local theme = {
	primary={"amber", "500"},
	text_dark={"grey", "800"},
	text_light={"grey", "600"}
}

-- Load from resource file
local path = system.pathForFile("colors.json", system.ResourceDirectory)
local file = io.open(path, "r")
local colorsString = file:read("*a")
io.close(file)
file = nil
local colors = json.decode(colorsString)

-- Helper function for converting hex to r,g,b table
local hex2rgb = function(hex)
	hex = hex:gsub("#", "")
	return {
		r=tonumber("0x"..hex:sub(1,2)),
		g=tonumber("0x"..hex:sub(3,4)),
		b=tonumber("0x"..hex:sub(5,6))
	}
end

local setFillColorFor = function(obj, colorName, colorShade, alpha)
	local color = hex2rgb(colors[colorName][colorShade])
	obj:setFillColor(color.r / 255.0, color.g / 255.0, color.b / 255.0, alpha)
end

return {
	setTheme = function(themeData)
		theme = themeData
	end,
	getTheme = function()
		return theme
	end,
	setFillColorFor = setFillColorFor,
	setThemeFillColorFor = function(obj, name, alpha)
		local themeColor = theme[name]
		setFillColorFor(obj, themeColor[1], themeColor[2], alpha)
	end,
	getThemeFillColor = function(name, alpha)
		local themeColor = theme[name]
		local color = hex2rgb(colors[themeColor[1]][themeColor[2]])
		return {
			r=color.r,
			g=color.g,
			b=color.b,
			a=alpha
		}
	end,
}
