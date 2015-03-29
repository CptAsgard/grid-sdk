--========= Copyright © 2013-2015, Planimeter, All rights reserved. ==========--
--
-- Purpose: Game client interface
--
--============================================================================--

require( "engine.client.camera" )

local camera    = camera
local gui       = gui
local hook      = hook
local region    = region
local unrequire = unrequire
local _G        = _G

module( "game.client" )

function createDefaultPanels()
	local hudmoveindicator = gui.hudmoveindicator( _G.g_Viewport )

	-- local regiontitle = gui.regiontitle( _G.g_Viewport )
	-- regiontitle:activate()
end

function draw()
	if ( not playerInitialized ) then
		return
	end

	region.drawWorld()
	_G.entity.drawAll()
end

function load( arg )
	_G.g_Viewport     = gui.viewport( _G.g_RootPanel )
	_G.g_DebugOverlay = gui.debugoverlaypanel( _G.g_Viewport )
end

function onAxisSignin()
end

function onMainMenuActivate()
end

function onMainMenuClose()
end

function quit()
	_G.g_DebugOverlay:remove()
	_G.g_DebugOverlay = nil
	_G.g_Viewport:remove()
	_G.g_Viewport = nil

	unrequire( "game.client" )
	_G.gameclient = nil
end

shutdown = quit

function update( dt )
end
