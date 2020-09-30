--[[---------------------------------PURPOSE-----------------------------------
	Generates static pages with embeded Grafana iframes.
---------------------------------------------------------------------------]]--

-- Ugly stuff to let us load packages from our passed file directory.
local function GetFilePath()
	local path = debug.getinfo(2, "S").source:sub(2)
	return path:match("(.*[/\\])") or "." -- Windows hack stuff
end
-- So we can load modules from the directory this script is in...
package.path = package.path .. ";" .. GetFilePath() .. "/?.lua" 

local HTML = require("htmltemplates") -- HTML is messy, hide it away.
local panels = require("panels")	-- Loads all the panels to populate.

local timeScales = {}
timeScales[1] = {"24 Hours", "now-24h", "now"}
timeScales[2] = {"7 Days", "now-7d", "now"}
timeScales[3] = {"30 Days", "now-30d", "now"}
timeScales[4] = {"1 Year", "now-1y", "now"}
timeScales[5] = {"2 Years", "now-2y", "now"}

--[[
	Latency Pages
--]]

local function GenerateSection(timescale, panel)
	local section = "" .. HTML.section
	-- This is probably a really slow way to do this, but it isn't an issue yet
	section = string.gsub(section, "$TIMESCALEENGLISH", tostring(timescale[1]))
	section = string.gsub(section, "$FROM", tostring(timescale[2]))
	section = string.gsub(section, "$TO", tostring(timescale[3]))
	section = string.gsub(section, "$PANELID", tostring(panel.id))
	return section
end

local function GeneratePanel(panel)
	-- Header, page title, and body text
	local pagetitle = string.upper(panel.name) .. " LATENCY (NACL)"
	local output = ""
	output	=	output .. HTML.header .. pagetitle .. HTML.headertail
	output	=	output .. HTML.bodycontenthead .. pagetitle .. HTML.bodycontenttail

	-- Generate and append sections
	output	=	output ..	HTML.linkboxbegin

	for i=1, #timeScales do
		local timescale = timeScales[i]
		local section = GenerateSection(timescale, panel)
		output	=	output .. section
	end

	output	=	output .. HTML.linkboxtail
	-- Finish
	output	=	output .. HTML.tail
	return output
end

local function WriteHTML(panel)
	local file, code = io.open( ( GetFilePath() .. "latency/" .. ( panel.url or string.lower(panel.name) ) ) .. ".html", "w")
	if not file then 
		return nil, code 
	end
	file:write(GeneratePanel(panel))
	return file, code
end

-- Generate Latency Pages
for i=1, #panels do
	local panel = panels[i]
	local didWrite = WriteHTML(panel)
	local code = ""
	if didWrite == nil then
		os.execute("mkdir " .. GetFilePath() .. "latency") -- Make the directory if it didn't exist
		didWrite, code = WriteHTML(panel)
	end
	if didWrite == nil then -- Messy, but abort if something went really wrong.
		error(code)
	end
	print("Wrote: " .. (panel.url or string.lower(panel.name)) .. ".html" )
end

--[[
	Index/Landing Page
--]]

-- Reusable code
local function GenerateFlexbox(i, max, panel)
	local flexbox = "" .. HTML.index.flexgraph
	flexbox = string.gsub(flexbox, "$PANELNAME", tostring(panel.name))
	flexbox = string.gsub(flexbox, "$URL", ( panel.url or string.lower(tostring(panel.name)) ) .. ".html" )
	flexbox = string.gsub(flexbox, "$PANELID", tostring(panel.id))
	local flextype = "graphs"
	if i == 1 then
		flextype = "start"
	elseif i == max then
		flextype = "end"
	end
	flexbox = string.gsub(flexbox, "$FLEXTYPE", flextype)
	return flexbox
end

local function GeneratePanelTable(ptab)
	local newpanel = ""
	for i=1, #ptab do
		local panel = ptab[i]
		newpanel = newpanel .. GenerateFlexbox(i, #ptab, panel)
	end
	return newpanel
end

-- Didn't do all of this in a function because it wasn't really needed.

local transits = {}
local exchanges = {}
local endpoints = {}

-- Sort our panels into their types so we can build HTML sections.
for i=1, #panels do
	local panel = panels[i]
	if panel.type == "transit" then
		transits[#transits + 1 ] = panel
	elseif panel.type == "exchange" then
		exchanges[#exchanges + 1 ] = panel
	elseif panel.type == "endpoint" then 
		endpoints[#endpoints + 1 ] = panel
	end
end

-- This is ugly!
-- TODO: Make this not horrible, don't hard code the array at least?
local outtab = {}
outtab[1] = HTML.index.header
-- Transits
outtab[2]	= HTML.index.linkboxhead
outtab[3]	= HTML.index.h4transit
outtab[4]	= HTML.index.flexcontainerhead
outtab[5]	= GeneratePanelTable(transits)
outtab[6]	= HTML.index.flexcontainertail
--Exchanges (part of the same linkbox)
outtab[7]	= HTML.index.h4exchange
outtab[8]	= HTML.index.flexcontainerhead
outtab[9]	= GeneratePanelTable(exchanges)
outtab[10]	= HTML.index.flexcontainertail
outtab[11]	= HTML.index.linkboxtail
-- Endpoints (new linkbox)
outtab[12]	= HTML.index.linkboxhead
outtab[13]	= HTML.index.h4endpoint
outtab[14]	= HTML.index.flexcontainerhead
outtab[15]	= GeneratePanelTable(endpoints)
outtab[16]	= HTML.index.flexcontainertail
outtab[17]	= HTML.index.linkboxtail
--
outtab[18]	= HTML.index.footer

local file = io.open( GetFilePath() .. "index.html", "w")
assert(file:write(table.concat(outtab)))
print("====================" )
print("Wrote: " .. "index.html" )
print("\n \t DONE!" )
