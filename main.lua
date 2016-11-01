-- Run to test functionality
local colors = require("plugin")

-- Theme is a way of setting up specific keys that map to colors
-- to be able to easily change 
local theme = {
	background={"amber", "400"},
	text={"grey", "800"}
}
colors.setTheme(theme)

-- Create a rectangle with the theme color called "background"
local rect = display.newRect(0, display.contentHeight / 2, display.contentWidth * 2, 100)
colors.setThemeFillColorFor(rect, "background", 1)

-- Create some text with the theme color called "text"
local text = display.newText({
	x=display.contentWidth / 2,
	y=display.contentHeight / 2,
	text="Hello world"
})
colors.setThemeFillColorFor(text, "text", 1)

-- Create a circle with a color specified directly (without theme)
local circle = display.newCircle(display.contentWidth / 2, display.contentHeight / 4, 50)
colors.setFillColorFor(circle, "blue", "400", 1)
