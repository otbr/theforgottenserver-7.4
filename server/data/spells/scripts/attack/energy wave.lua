local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)
--setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

local area = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level * 2) + (maglevel * 3)) * 1.34
	max = -((level * 2) + (maglevel * 3)) * 2.33
--	min = -((level * 2) + (maglevel * 3)) * 1.15
--	max = -((level * 2) + (maglevel * 3)) * 1.9
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	-- check for stairHop delay
	if not getCreatureCondition(cid, CONDITION_PACIFIED) then
		return doCombat(cid, combat, var)
	else
		cid:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
		cid:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end
