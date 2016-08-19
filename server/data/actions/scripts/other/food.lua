local foods = {
	[2362] = {5, "Crunch."}, -- carrot
	[2666] = {15, "Munch."}, -- meat
	[2667] = {12, "Munch."}, -- fish
	[2668] = {10, "Mmmm."}, -- salmon
	[2669] = {17, "Munch."}, -- northern pike
	[2670] = {4, "Gulp."}, -- shrimp
	[2671] = {30, "Chomp."}, -- ham
	[2672] = {60, "Chomp."}, -- dragon ham
	[2673] = {5, "Yum."}, -- pear
	[2674] = {6, "Yum."}, -- red apple
	[2675] = {13, "Yum."}, -- orange
	[2676] = {8, "Yum."}, -- banana
	[2677] = {1, "Yum."}, -- blueberry
	[2678] = {18, "Slurp."}, -- coconut
	[2679] = {1, "Yum."}, -- cherry
	[2680] = {2, "Yum."}, -- strawberry
	[2681] = {9, "Yum."}, -- grapes
	[2682] = {20, "Yum."}, -- melon
	[2683] = {17, "Munch."}, -- pumpkin
	[2684] = {5, "Crunch."}, -- carrot
	[2685] = {6, "Munch."}, -- tomato
	[2686] = {9, "Crunch."}, -- corncob
	[2687] = {2, "Crunch."}, -- cookie
	[2688] = {2, "Munch."}, -- candy cane
	[2689] = {10, "Crunch."}, -- bread
	[2690] = {3, "Crunch."}, -- roll
	[2691] = {8, "Crunch."}, -- brown bread
	[2695] = {6, "Gulp."}, -- egg
	[2696] = {9, "Smack."}, -- cheese
	[2787] = {9, "Munch."}, -- white mushroom
	[2788] = {4, "Munch."}, -- red mushroom
	[2789] = {22, "Munch."}, -- brown mushroom
	[2790] = {30, "Munch."}, -- orange mushroom
	[2791] = {9, "Munch."}, -- wood mushroom
	[2792] = {6, "Munch."}, -- dark mushroom
	[2793] = {12, "Munch."}, -- some mushrooms
	[2794] = {3, "Munch."}, -- some mushrooms
	[2795] = {36, "Munch."}, -- fire mushroom
	[2796] = {5, "Munch."}, -- green mushroom
	[5097] = {4, "Yum."}, -- mango
	[6125] = {8, "Gulp."}, -- tortoise egg
	[6278] = {10, "Mmmm."}, -- cake
	[6279] = {15, "Mmmm."}, -- decorated cake
	[6393] = {12, "Mmmm."}, -- valentine's cake
	[6394] = {15, "Mmmm."}, -- cream cake
	[6501] = {20, "Mmmm."}, -- gingerbread man
	[6541] = {6, "Gulp."}, -- coloured egg (yellow)
	[6542] = {6, "Gulp."}, -- coloured egg (red)
	[6543] = {6, "Gulp."}, -- coloured egg (blue)
	[6544] = {6, "Gulp."}, -- coloured egg (green)
	[6545] = {6, "Gulp."}, -- coloured egg (purple)
	[6569] = {1, "Mmmm."}, -- candy
	[6574] = {5, "Mmmm."}, -- bar of chocolate
	[7158] = {15, "Munch."}, -- rainbow trout
	[7159] = {13, "Munch."}, -- green perch
	[7372] = {2, "Yum."}, -- ice cream cone (crispy chocolate chips)
	[7373] = {2, "Yum."}, -- ice cream cone (velvet vanilla)
	[7374] = {2, "Yum."}, -- ice cream cone (sweet strawberry)
	[7375] = {2, "Yum."}, -- ice cream cone (chilly cherry)
	[7376] = {2, "Yum."}, -- ice cream cone (mellow melon)
	[7377] = {2, "Yum."}, -- ice cream cone (blue-barian)
}

function onUse(player, item, fromPosition, target, toPosition)
	local food = foods[item.itemid]
	if food == nil then
		return false
	end

	local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + food[1]) >= 1200 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are full.")
	else
		player:feed(food[1] * 12)
		player:say(food[2], TALKTYPE_MONSTER_SAY)
		item:remove(1)
	end
	return true
end
