if require_game_build(2944) then
	menu.add_action("Vehicle Options OUTDATED", function() end)
else
	CarOptions = menu.add_submenu("Simple Vehicle Options by Tuffy")
	ModShop = CarOptions:add_submenu("ModShop")


	WheelsOp = ModShop:add_submenu("Wheels")

	F1Mod = false
	OldF1Hash = 0
	WheelsOp:add_toggle("F1 Options", function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return F1Mod
		end
	end, function()
		F1Mod = not F1Mod
		if F1Mod then
			if localplayer ~= nil then
				if localplayer:is_in_vehicle() then
					OldF1Hash = localplayer:get_current_vehicle():get_model_hash()
					localplayer:get_current_vehicle():set_model_hash(1492612435)
				end
			end
		else
			if localplayer ~= nil then
				if localplayer:is_in_vehicle() then
					localplayer:get_current_vehicle():set_model_hash(OldF1Hash)
				end
			end
		end
	end)



	BennyMod = false
	OldBennyHash = 0
	WheelsOp:add_toggle("Bennys Options", function()
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			return BennyMod
		end
	end, function()
		BennyMod = not BennyMod
		if BennyMod then
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				OldBennyHash = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(196747873)
			end
		else
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(OldBennyHash)
			end
		end
	end)
end