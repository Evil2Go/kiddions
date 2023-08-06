-- [OP Recovery]
-- made by tuffy

opr = menu.add_submenu("OP Recovery")

function GetMPX()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 1 then
		mpx = "MP1_"
	else
		mpx = "MP0_"
	end
		return mpx
end

opr:add_action("Remove Transaction Error", function()
	globals.set_int(4536673, 0)
	globals.set_int(4536674, 0)
	globals.set_int(4536675, 0)
end)




-- // Property Trade-In \\ -- 

pt = opr:add_submenu("Property Trade-In (use $500mil option)")

prop_index = 1
prop_lst = {'NIGHTCLUB', 'AUTO_SHOP', 'ARCADE'}
prop_stat = ''
prop_price = 0

pt:add_array_item("Select Property", {'Nightclub', 'Auto Shop', 'Arcade'},
function()
	return prop_index
end, function(value)
	prop_index = value
	prop_stat = GetMPX().."PROP_"..prop_lst[value].."_VALUE"
	prop_price = stats.get_int(prop_stat)
	--prop_price = value + 10
	print("Property Selected: "..prop_stat.."\nValue: "..prop_price)
end)

pt:add_int_range("Selected Property Value", 0, 0, 2147483647,
function() return prop_price end, function(value) end)

pt:add_action("Property Value = 100 mil", function()
	prop_price = 100000000
end)
pt:add_action("Property Value = 500 mil", function()
	prop_price = 500000000
end)
pt:add_action("Property Value = 1 Bil", function()
	prop_price = 1000000000
end)
pt:add_action("Property Value = 2 Bil", function()
	prop_price = 2000000000
end)

pt:add_action("Finalize Price", function()
	stats.set_int(prop_stat, prop_price)
end)



 -- // Hanger Sell \\ --

hs = opr:add_submenu("Hanger Sell")

gm = script("gb_smuggler")

cargo_price = 0

hs:add_int_range("Selected Cargo Value", 0, 0, 2147483647,
function() return cargo_price end, function(value) end)

hs:add_action("Cargo = 8 Mil", function()
	cargo_price = 8000000
end)
hs:add_action("Cargo = 2 Bil", function()
	cargo_price = 2000000000
end)
hs:add_int_range("Custom Value", 500000, 0, 2000000000,
function() 
 	return 0 
end, function(value)
	cargo_price = value
end)

hs:add_action("Finalize Price", function()
	for i = 284955,284963
	do
		globals.set_int(i,cargo_price)
	end
end)

hs:add_action("Remove Sell Cooldown", function()
	globals.set_int(2766148,0)
    globals.set_int(284896,0)
    globals.set_int(284897,0)
    globals.set_int(284898,0)
    globals.set_int(284899,0)
    globals.set_int(284900,0)
end)

hs:add_action("Instant Sell", function()
	if gm:is_active()
	then
		gm:set_int(2963,0)
	end
end)

hs:add_action("Instant Source", function()
	if gm:is_active()
	then
		gm:set_int(1999,-1)
	end
end)

--[[
hs:add_action("Source Assistant", function()
	gm:set_int(2698,15)
	globals.set_int(2798615,25)
end)
]]

hs:add_action("TP to Laptop", function()
localplayer:set_position(vector3(-1239.252, -3001.763, -44.17004))
end)

