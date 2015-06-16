-- {{{ Libraries
require("awful")
require("awful.rules")
require("awful.autofocus")
require("naughty")
-- User libraries
require("vicious") -- ./vicious
require("helpers") -- helpers.lua
-- }}}
-- {{{ Default configuration
altkey = "Mod1"
modkey = "Mod4" -- your windows/apple key

editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

wallpaper_app = "feh" -- if you want to check for app before trying
wallpaper_dir = os.getenv("HOME") .. "/Pictures/Wallpaper" -- wallpaper dir

-- taglist numerals
--- arabic, chinese, {east|persian}_arabic, roman, thai, random
taglist_numbers = "chinese" -- we support arabic (1,2,3...),

cpugraph_enable = true -- Show CPU graph
cputext_format = " $1%" -- %1 average cpu, %[2..] every other thread individually

membar_enable = true -- Show memory bar
memtext_format = " $1%" -- %1 percentage, %2 used %3 total %4 free

date_format = "%a %m/%d/%Y %l:%M%p" -- refer to http://en.wikipedia.org/wiki/Date_(Unix) specifiers

networks = {'eth0'} -- add your devices network interface here netwidget, only shows first one thats up.

require_safe('personal')

-- Create personal.lua in this same directory to override these defaults


-- }}}
-- {{{ Variable definitions
local wallpaper_cmd = "find " .. wallpaper_dir .. " -type f -name '*.jpg'  -print0 | shuf -n1 -z | xargs -0 feh --bg-scale"
local home   = os.getenv("HOME")
local exec   = awful.util.spawn
local sexec  = awful.util.spawn_with_shell

-- Beautiful theme
beautiful.init(awful.util.getdir("config") .. "/themes/zhongguo/zhongguo.lua")

-- Window management layouts
layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  --awful.layout.suit.fair,
  awful.layout.suit.max,
  awful.layout.suit.magnifier,
  --awful.layout.suit.floating
}
-- }}}
-- {{{ Tags

-- Taglist numerals
taglist_numbers_langs = { 'arabic', 'chinese', 'traditional_chinese', 'east_arabic', 'persian_arabic', }
taglist_numbers_sets = {
	arabic={ 1, 2, 3, 4, 5, 6, 7, 8, 9 },
	chinese={"一", "二", "三", "四", "五", "六", "七", "八", "九", "十"},
	traditional_chinese={"壹", "貳", "叄", "肆", "伍", "陸", "柒", "捌", "玖", "拾"},
	east_arabic={'١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'}, -- '٠' 0
	persian_arabic={'٠', '١', '٢', '٣', '۴', '۵', '۶', '٧', '٨', '٩'},
	roman={'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'},
	thai={'๑', '๒', '๓', '๔', '๕', '๖', '๗', '๘', '๙', '๑๐'},
}
-- }}}
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
      --tags[s] = awful.tag({"一", "二", "三", "四", "五", "六", "七", "八", "九", "十"}, s, layouts[1])
      --tags[s] = awful.tag(taglist_numbers_sets[taglist_numbers], s, layouts[1])
	if taglist_numbers == 'random' then
		math.randomseed(os.time())
		local taglist = taglist_numbers_sets[taglist_numbers_langs[math.random(table.getn(taglist_numbers_langs))]]
		tags[s] = awful.tag(taglist, s, layouts[1])
	else
		tags[s] = awful.tag(taglist_numbers_sets[taglist_numbers], s, layouts[1])
	end
    --tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end
