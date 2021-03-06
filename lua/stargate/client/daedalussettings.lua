/*
	Stargate Lib for GarrysMod10
	Copyright (C) 2007-2009  aVoN

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
--################# The keyboard layout, you see in the stargate/Keybinders #################

--################ The controls necessary for keybinding @aVoN
function StarGate.DaedalusSettings(Panel)
	if (StarGate.CFG:Get("cap_disabled_ent","sg_vehicle_daedalus",false)) then
		Panel:Help(SGLanguage.GetMessage("stool_disabled_ship"));
		return
	end
	/*if(StarGate.HasInternet) then
		-- The HELP Button
		local VGUI = vgui.Create("SHelpButton",Panel);
		VGUI:SetHelp("config/jumper");
		VGUI:SetTopic("Help:  Jumper Config");
		Panel:AddPanel(VGUI);
	end */
	local LAYOUT = "Daedalus";
	-- Use soo much tables at the bottom to keep the sorting-order in exact this order.
	local KEYS = {
		{
			Name = SGLanguage.GetMessage("key_move_title"),
			Keys = {
				{SGLanguage.GetMessage("key_move_forward"),"FWD"},
				{SGLanguage.GetMessage("key_turn_left"),"LEFT"},
				{SGLanguage.GetMessage("key_turn_right"),"RIGHT"},
				{SGLanguage.GetMessage("key_move_back"),"BACK"},
				{SGLanguage.GetMessage("key_move_up"),"UP"},
				{SGLanguage.GetMessage("key_move_down"),"DOWN"},
				{SGLanguage.GetMessage("key_move_boost"),"SPD"},
			},
		},
		{
			Name = SGLanguage.GetMessage("key_combat_title"),
			Keys = {
				{SGLanguage.GetMessage("key_act_target"),"MODE"},
				{SGLanguage.GetMessage("key_combat_railgun"),"FIRE"},
				{SGLanguage.GetMessage("key_combat_asgard"),"FIRE2"},
			},
		},
		{
			Name = SGLanguage.GetMessage("key_act_title"),
			Keys = {
				{SGLanguage.GetMessage("key_act_exit"),"EXIT"},
			},
		},
		{
			Name = SGLanguage.GetMessage("key_rocket_title"),
			Keys = {},
		},
	}
	-- yes i'm lazy :D @ AlexALX
	for i=1,8 do
		KEYS[4].Keys[i] = {SGLanguage.GetMessage("key_rocket").." "..i,tostring(i)};
	end
	for _,v in pairs(KEYS) do
		Panel:Help("");
		Panel:Help(v.Name);
		for _,v in pairs(v.Keys) do
			local KEY = vgui.Create("SKeyboardKey",Panel);
			KEY:SetData(LAYOUT,v[1],v[2]);
			Panel:AddPanel(KEY);
		end
	end
end
