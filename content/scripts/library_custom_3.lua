g_revolution_spectator_team = 1
g_revolution_welcome = "Spectator Console"


if g_radar_ranges == nil then
	-- revolution is not installed, tell the user
	update_screen_overrides = function(screen_w, screen_h, ticks)
		update_ui_text(20, 20, "Spectator mode needs Revolution mod 1.3+",
				110, 0, color_white, 0)
		return false
	end
end


function g_revolution_override_radar_range(vehicle)
	-- if in spectator mode,
	-- team 1 is the spectator, so set the radar range of the team 1 carrier to 400km
	-- set the range of all others to zero to reduce cpu and false nails

	if vehicle and get_is_spectator_mode() then
		if vehicle:get() and vehicle:get_definition_index() == e_game_object_type.chassis_carrier then
			if vehicle:get_team() == g_revolution_spectator_team then
				return 400 * 1000
			end
		end
	end
	return 0
end

if g_rev_mods ~= nil then
	table.insert(g_rev_mods, "Spectator Mode")
end