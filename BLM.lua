include('organizer-lib.lua')
include('how_about_no.lua')
include('no_interruptions.lua')
include('spam_protection.lua')
include('common_commands.lua')
include('spell_stack.lua')

autoWS = I{true, false}
autoWSToUse = I{'Gate of Tartarus'}

--Toggles DeathIdle set being used for idle and DeathPrecast being used for precast. Needed for keeping Max MP up for death
deathMode = false
--Used for custom gear to show off in town, auto updates on zoning
inTown = false
--Used to toggle sending nukes to alts or not
mirror_nuke = true

autoNukeTargets = true
doCures = false
autoBlink = false
autoAquaveil = true
autoPhalanx = I{true,false}

cumulative_spells = {
    Waterja={timestamp=0,target_id=0},
    Thundaja={timestamp=0,target_id=0},
    Stoneja={timestamp=0,target_id=0},
    Aeroja={timestamp=0,target_id=0},
    Blizzaja={timestamp=0,target_id=0},
    Firaja={timestamp=0,target_id=0},
    Comet={timestamp=0,target_id=0},
}
cumulative_duration = 60


--list of spells to use when using trigger spells and incoming mirror nuke requests
use_spells = {}
use_spells.aoe = {}
use_spells.aoe.Water = 			{'Waterja', 		'Waterga III', 	'Waterga II', 		'Waterga'}
use_spells.aoe.Thunder = 		{'Thundaja', 		'Thundaga III', 'Thundaga II', 		'Thundaga'}
use_spells.aoe.Stone = 			{'Stoneja', 		'Stonega III', 	'Stonega II', 		'Stonega'}
use_spells.aoe.Aero = 			{'Aeroja', 			'Aeroga III', 	'Aeroga II', 		'Aeroga'}
use_spells.aoe.Blizzard = 		{'Blizzaja', 		'Blizzaga III', 'Blizzaga II', 		'Blizzaga'}
use_spells.aoe.Fire = 			{'Firaja', 			'Firaga III', 	'Firaga II', 		'Firaga'}

use_spells.single = {}
use_spells.single.Water = 		{'Water VI',		'Water V', 		'Water IV', 		'Water III', 		'Water II', 		'Water'}
use_spells.single.Thunder = 	{'Thunder VI',		'Thunder V', 	'Thunder IV', 		'Thunder III', 		'Thunder II', 		'Thunder'}
use_spells.single.Stone = 		{'Stone VI',		'Stone V', 		'Stone IV', 		'Stone III', 		'Stone II', 		'Stone'}
use_spells.single.Aero = 		{'Aero VI',			'Aero V', 		'Aero IV', 			'Aero III', 		'Aero II', 			'Aero'}
use_spells.single.Blizzard = 	{'Blizzard VI',		'Blizzard V', 	'Blizzard IV', 		'Blizzard III', 	'Blizzard II', 		'Blizzard'}
use_spells.single.Fire = 		{'Fire VI',			'Fire V', 		'Fire IV', 			'Fire III', 		'Fire II', 			'Fire'}

function get_sets()
	tank = false
	nukeType = 'single'
	nukePassString = 'single'
	MBMode = 'Elemental Magic'
	mbPassString = 'N'

	spellAcc = 'Low'
	stunAcc = 'Low'
    thMode = 0
	cpFarming = false
	forceAf = false
	afBodyPercent = 66

	nukeSetTries = 0
	mythicTries = 0

	load_gear_file()
end

function pretarget(spell)
	if spell.skill == 'Elemental Magic' then
		if spell.english:sub(-2) == 'ja' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
            if (not buffactive['Manafont'] and not buffactive['Manawell'] and player.mp <= spell.mp_cost) or (pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60) then
                print('cancelling '..spell.english)
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-2),"ga III")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-6) == 'ga III' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (not buffactive['Manafont'] and not buffactive['Manawell'] and player.mp <= spell.mp_cost) or (pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60) then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-6),"ga II")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-5) == 'ga II' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (not buffactive['Manafont'] and not buffactive['Manawell'] and player.mp <= spell.mp_cost) or (pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60) then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-5),"ga")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-3) == ' VI' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (not buffactive['Manafont'] and not buffactive['Manawell'] and player.mp <= spell.mp_cost) or (pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60) then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-3)," V")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-2) == ' V' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (not buffactive['Manafont'] and not buffactive['Manawell'] and player.mp <= spell.mp_cost) or (pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60) then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-2)," IV")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-3) == ' IV' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (not buffactive['Manafont'] and not buffactive['Manawell'] and player.mp <= spell.mp_cost) or (pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60) then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-3)," III")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-3) == 'III' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (not buffactive['Manafont'] and not buffactive['Manawell'] and player.mp <= spell.mp_cost) or (pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60) then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-3)," II")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-3) == ' II' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (not buffactive['Manafont'] and not buffactive['Manawell'] and player.mp <= spell.mp_cost) or (pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60) then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-3),"")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		end
	end
end

function precast(spell,action)
	if check_ready(spell) then
		if deathMode then
			equip(sets.precast['Death'])

			if spell.type == 'JobAbility' and sets.precast[spell.english] then
				equip(sets.precast[spell.english])
			end
		else
			if spell.type == 'WeaponSkill' then
				if spell.target.distance > 10 or player.tp < 900 then
					cancel_spell()
					return
				end

				if sets[spell.english] then
					equip(sets[spell.english])
				end

				windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
			elseif spell.type == 'JobAbility' then
				if sets.precast[spell.english] then
					equip(sets.precast[spell.english])
				end
			elseif spell.type == 'WhiteMagic' then
				if string.find(spell.english,'Cure') then
					equip(sets.precast['CureSet'])
				else
					if spell.skill  == 'Enhancing Magic' then
						if sets.precast[spell.english] then
							equip(sets.precast[spell.english])
						else
							equip(sets.precast['Enhancing Magic'])
						end
					else
						equip(sets.precast['General'])
					end
				end
			elseif spell.type == 'BlackMagic' then
				if spell.english == 'Impact' then
					equip(sets.precast['Impact'])
				else
					if spell.skill == 'Elemental Magic' then
						equip(sets.precast['Elemental Magic'])
					elseif spell.english == 'Death' and deathMode then
						equip(sets.precast['Death'])
					else
						equip(sets.precast['General'])
					end
				end
			elseif spell.type == 'Trust' then
				equip(sets.precast['General'])
			end
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
    if spell.type == 'JobAbility' or spell.type == 'WeaponSkill' then
        return true
    end

    if deathMode then
        equip(sets.precast['Death'])
        equipSet = sets.precast['Death']
    else
        equipSet = sets.midcast['General']
    end

	if spell.type == 'Ninjutsu' then
		if spell.english == 'Utsusemi: Ichi' then
			if buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				equip(sets['UtsuSet'])
				send_command('wait 1.5;cancel 66;cancel 446;cancel 445;cancel 444;')
			end
		elseif spell.english == 'Utsusemi: Ni' then
			equip(sets['UtsuSet'])
		elseif spell.type == 'Trust' then
			equip(sets['Trust'])
		end
	elseif spell.type == 'WhiteMagic' then
		if string.find(spell.english,'Cure') then
			equipSet = sets.midcast['CureSet']
		elseif spell.skill == 'Enhancing Magic' then
            if not deathMode then
    			if sets.midcast[spell.english] then
    				equipSet = sets.midcast[spell.english]
    			elseif spell.english == 'Haste' or spell.english == 'Invisible' or spell.english == 'Sneak' or spell.english:sub(-5) == 'storm' or spell.english:sub(-8) == 'storm II' or spell.english:sub(4) == 'Prot' or spell.english:sub(4) == 'Shel' or spell.english == 'Adloquium' or spell.english:sub(-6) == 'Animus' or spell.english == 'Blink' then
    				equipSet = sets.midcast['Enhancing Magic + Duration']
    			else
    				equipSet = sets.midcast['Enhancing Magic']
    			end
            end
		elseif spell.skill == 'Enfeebling Magic' then
			equipSet = sets.midcast['Enfeebling Magic']
		end
	elseif spell.type == 'BlackMagic' then
		if spell.english == 'Stun' then
			equipSet = sets.midcast['Stun'][stunAcc]
        elseif spell.english == 'Bio' then
            equipSet = set_combine(sets.midcast['Enfeebling Magic'], sets['Treasure Hunter'])
		elseif spell.english == 'Drain' or spell.english == 'Drain II' or spell.english == 'Aspir' or spell.english == 'Aspir II' or spell.english == 'Aspir III' then
            if deathMode then
                equipSet = sets.midcast['DeathAspir']
            else
                equipSet = sets.midcast['Drain']
            end
		elseif spell.skill == 'Enfeebling Magic' then
			equipSet = sets.midcast['Enfeebling Magic']
		elseif spell.english == 'Impact' then
			equipSet = sets.midcast['Impact']
		elseif spell.english == 'Death' then
			if deathMode then
				equipSet = sets.midcast['Death']
			else
				equipSet = set_combine(sets.midcast[spellAcc][MBMode],{head="Pixie Hairpin +1"})
			end
		elseif spell.skill == 'Elemental Magic' then
			if spell.element == 'Dark' then
				equipSet = set_combine(sets.midcast[spellAcc][MBMode],{head="Pixie Hairpin +1"})
            elseif spell.english == 'Burn' or spell.english == 'Frost' or spell.english == 'Choke' or spell.english == 'Rasp' or spell.english == 'Shock' or spell.english == 'Drown' then
                equipSet = sets.midcast['Elemental Enfeebling']
			else
				if spellAcc == '5k' then
					windower.add_to_chat(050,'Using 5k T1 Nuke Set')
				end
				equipSet = sets.midcast[spellAcc][MBMode]

				if spell.element == 'Earth' then
					equipSet = set_combine(equipSet, {neck="Quanpur Necklace"})
				end

				if spell.english:sub(-3) == 'III' or spell.english:sub(-5) == 'ga II' or spell.english:sub(-2) == 'ja' or spell.english:sub(-2) == 'IV' or spell.english:sub(-1) == 'V' or spell.english:sub(-2) == 'VI' then
					equipSet = set_combine(equipSet, sets['higherTierNuke'])
				end

				if buffactive['Reive Mark'] then
					equipSet = set_combine(equipSet, sets['Reive'])
				end

                if cumulative_spells[spell.english] and sets['Cumulative Magic'] and (os.clock()-cumulative_spells[spell.english].timestamp > cumulative_duration or spell.target.id ~= cumulative_spells[spell.english].target_id) then
                    equipSet = set_combine(equipSet, sets['Cumulative Magic'])
                end

                if not buffactive['Manafont'] and not buffactive['Manawell'] and (forceAf == true or (((player.mp-spell.mp_cost)/player.max_mp)*100) < afBodyPercent) then
                    equipSet = set_combine(equipSet, sets['lowMpNuke'])
                end


                if thMode == 1 then
                    equipSet = set_combine(equipSet, sets['Treasure Hunter'])
                end
			end
		end
	elseif spell.type == 'Trust' then
		equipSet = set_combine(equipSet, sets['Trust'])
	end

	if	world.weather_element ~= opposingElement[spell.element] and
		world.day_element ~= opposingElement[spell.element] and
		not buffactive[stormNames[opposingElement[spell.element]]] and
		(spell.element == world.weather_element or
		spell.element == world.day_element or
		buffactive[stormNames[spell.element]]) then
		if (spell.skill == 'Elemental Magic' and spell.english ~= 'Death' and spell.english:sub(-5) ~= 'helix') then
			equipSet = set_combine(equipSet, sets[spell.element])
			equip(sets[spell.element])
		elseif spell.english:sub(1,3) == 'Cur' then
			equipSet = set_combine(equipSet, {back="Twilight Cape"})
		end
	end

	if buffactive['doom'] then
		equipSet = set_combine(equipSet,sets['doom'])
	end

	equip(equipSet)
end

function aftercast(spell,action)
    if spam_protection_off(spell) then
        if spell.action_type ~= 'Interruption' and cumulative_spells[spell.english] and sets['Cumulative Magic'] and (os.clock()-cumulative_spells[spell.english].timestamp > cumulative_duration or spell.target.id ~= cumulative_spells[spell.english].target_id) then
            cumulative_spells[spell.english].timestamp = os.clock()
            cumulative_spells[spell.english].target_id = spell.target.id
            send_command('timers d "'..spell.english..'";timers c "'..spell.english..'" '..cumulative_duration..' up;')
        end
		handle_idle()
	end
    checkAftercast(spell)
end

function status_change(new,old)
	if check_ready_status() then
		handle_idle()
	end
end

function buff_change(buff,gain_or_loss)
	if gain_or_loss then
		if buff == 'Aftermath: Lv.3' then
			send_command('timers c "AM3" 180 up "Aftermath"')
		elseif buff == 'Aftermath: Lv.2' then
			send_command('timers c "AM2" 270 up "Aftermath"')
		elseif buff == 'Aftermath: Lv.1' then
			send_command('timers c "AM1" 270 up "Aftermath"')
		end

		if buff == 'doom' then
			send_command('input /p doomed')
			equip(sets['doom'])
		end

		if buff == 'weakness' then
			send_command('timers c "Weakness" 300 up "Weakness"')
		end
	else
		if buff == 'Aftermath: Lv.3' then
			send_command('timers d "AM3"')
		elseif buff == 'Aftermath: Lv.2' then
			send_command('timers d "AM2"')
		elseif buff == 'Aftermath: Lv.1' then
			send_command('timers d "AM1"')
		elseif buff == 'encumbrance' then
			windower.send_command('gs c dt_end;')
		end

		if buff == 'weakness' then
			send_command('timers d "Weakness"')
		end
	end
end

function handle_idle()
	if tank then
		equipSet = sets['DT']

		if player.mpp < 50 then
			equipSet = set_combine(equipSet,sets['mpBelt'])
		end

		if buffactive['Mana Wall'] then
			equipSet = set_combine(equipSet,sets.precast['Mana Wall'])
		end

		equip(equipSet)
	else
		if player.status == 'Resting' then
			equip(sets['Resting'])
			if player.mpp < 50 then
				equip(sets['mpBelt'])
			end
		else
			if inTown then
				equipSet = sets.midcast[spellAcc][MBMode]
			else
				equipSet = sets['DT']
				if player.mp < 820 then
					equipSet = set_combine(equipSet,sets['Idle'])
				end
				if buffactive['Sublimation: Activated'] then
					equipSet = set_combine(equipSet,sets['IdleSublimation'])
				end
				if player.mpp < 50 then
					equipSet = set_combine(equipSet,sets['mpBelt'])
				end

				if deathMode then
					equipSet = sets['DeathIdle']
				end

				if player.tp > 2900 and player.tp <= 3000 then
					equipSet = set_combine(equipSet,sets['TooMuchTP'])
				end

				if buffactive['doom'] then
					equipSet = set_combine(equipSet,sets['doom'])
				end

				if buffactive['Mana Wall'] then
					equipSet = set_combine(equipSet,sets.precast['Mana Wall'])
				end

				if world.zone_id == 275 then
					local mob_array = windower.ffxi.get_mob_array()
					local mobCount = 0
					for str_index,mob_arr in pairs(mob_array) do
						if mob_arr and mob_arr.hpp > 0 and (mob_arr.name == 'Plouton' or mob_arr.name == 'Perfidien') then
							equipSet = set_combine(sets.midcast[spellAcc][MBMode],sets['lowMpNuke'])
						end
					end
				end
			end
			if not deathMode and not buffactive['Mana Wall'] and party_target == false then
                equipSet = set_combine(equipSet,sets['Running'])
            end

			if buffactive['Reive Mark'] then
				equipSet = set_combine(equipSet, {neck="Arciela's Grace +1"})
			end

			equip(equipSet)
		end
	end
end

function processMirrorNukes(singleOrAoe)
	--Only do this if mirror nuke mode is on
	if mirror_nuke then
		--Check we get a valid target
		local target_info = windower.ffxi.get_mob_by_target('t')
		if type(target_info) == 'table' and target_info.id ~= nil then
			--send the nuke element, aoe/single, mb/no_MB, target_ID to the common_commands mirror function
			execute_common_command('mirror ele '..elements_base:current()..' '..singleOrAoe..' '..mbPassString..' '..target_info.id)
		end
	end
end

function processMirrorNukesWithId(singleOrAoe, target_info)
    --Only do this if mirror nuke mode is on
    if mirror_nuke then
        --Check we get a valid target
        if type(target_info) == 'table' and target_info.id ~= nil then
            --send the nuke element, aoe/single, mb/no_MB, target_ID to the common_commands mirror function
            execute_common_command('mirror ele '..elements_base:current()..' '..singleOrAoe..' '..mbPassString..' '..target_info.id)
        end
    end
end


function nukeWithElement(elementToUse, singleOrAoe, tierToUse)
	--Check the target exists and is in range (21 yalms)
	local request_test = windower.ffxi.get_mob_by_target('t')
	if request_test ~= nil and request_test.id ~= nil and request_test.distance <= 441 then
		--Geo ra spells are 12 yalms max, force single target if this condition isnt met
		if player.main_job == 'GEO' and singleOrAoe == 'aoe' and request_test.distance > 144 then
			singleOrAoe = 'single'
		end

		--Check we have a nuke available for this element, and then select the best match
		if use_spells ~= nil and use_spells[singleOrAoe] ~= nil and use_spells[singleOrAoe][elementToUse] ~= nil then
			local numTiers = #use_spells[singleOrAoe][elementToUse]+1
			local bestMatchValue = false
			local bestMatchSpell = false
			for i,v in pairs(use_spells[singleOrAoe][elementToUse]) do
				if is_spell_ready(v) then
					if bestMatchValue == false then
						bestMatchValue = numTiers-i-tierToUse
						bestMatchSpell = v
					elseif (numTiers-i-tierToUse) >= 0 and (numTiers-i-tierToUse) <= bestMatchValue then
						bestMatchValue = numTiers-i-tierToUse
						bestMatchSpell = v
					end
				end
			end
			if bestMatchSpell ~= false then
				send_command('input /ma "'..bestMatchSpell..'" <t>;')
			end
		end
	end
end


function nukeTargetIDWithElement(elementToUse, singleOrAoe, tierToUse, targetID)
	if targetID ~= nil then
		--Check the target ID exists and is in range (21 yalms)
		local request_test = windower.ffxi.get_mob_by_id(targetID)
		if request_test ~= nil and request_test.id ~= nil and request_test.distance <= 441 then
			--Check we have a nuke to this
			if use_spells ~= nil and use_spells[singleOrAoe] ~= nil and use_spells[singleOrAoe][elementToUse] ~= nil then
				local numTiers = #use_spells[singleOrAoe][elementToUse]+1
				local bestMatchValue = false
				local bestMatchSpell = false
				for i,v in pairs(use_spells[singleOrAoe][elementToUse]) do
					if is_spell_ready(v) then
						if bestMatchValue == false then
							bestMatchValue = numTiers-i-tierToUse
							bestMatchSpell = v
						elseif (numTiers-i-tierToUse) >= 0 and (numTiers-i-tierToUse) <= bestMatchValue then
							bestMatchValue = numTiers-i-tierToUse
							bestMatchSpell = v
						end
					end
				end
				if bestMatchSpell ~= false then
					send_command('input /ma "'..bestMatchSpell..'" '..targetID..';')
				end
			end
		end
	end
end

function self_command(command)
	if command == 'trigger1' then
		command = 'next_element'
	end

	if command == 'key_s' then
		send_command('input /ma "Stun" <t>;')
	elseif command == 'type' then
		if nukeType == 'aoe' then
			nukeType = 'single'
			nukePassString = 'single'
			windower.add_to_chat(167,"Single Target Mode")
		else
			nukeType = 'aoe'
			nukePassString = 'aoe'
			windower.add_to_chat(167,"AoE Target Mode")
		end
	elseif command == 'trigger2' or command == 'mbmode' then
		if MBMode == 'Elemental Magic' then
			MBMode = 'Elemental Magic MB'
			mbPassString = 'Y'
			windower.add_to_chat(050,"MB Mode [ON]")
		else
			MBMode = 'Elemental Magic'
			mbPassString = 'N'
			windower.add_to_chat(050,"MB Mode [OFF]")
		end
	elseif command == 'tier1' or command == 't1' then
		nukeWithElement(elements_base:current(), nukeType, 1)
		processMirrorNukes(nukePassString)
	elseif command == 'trigger3' or command == 'tier2' or command == 't2' then
		nukeWithElement(elements_base:current(), nukeType, 2)
		processMirrorNukes(nukePassString)
	elseif command == 'trigger4' or command == 'tier3' or command == 't3' then
		nukeWithElement(elements_base:current(), nukeType, 3)
		processMirrorNukes(nukePassString)
	elseif command == 'trigger5' or command == 'tier4' or command == 't4' then
		nukeWithElement(elements_base:current(), nukeType, 4)
		processMirrorNukes(nukePassString)
	elseif command == 'trigger6' or command == 'tier5' or command == 't5' then
		nukeWithElement(elements_base:current(), 'single', 5)
		processMirrorNukes('single')
	elseif command == 'trigger7' or command == 'tier6' or command == 't6' then
		nukeWithElement(elements_base:current(), 'single', 6)
		processMirrorNukes('single')
	elseif command == 'am' then
		send_command('input /ma "'..elements_am:current()..'" <t>;')
	elseif command == 'am2' or command == 'amii' then
		send_command('input /ma "'..elements_am:current()..' II" <t>;')
	elseif player.sub_job == 'SCH' and command == 'trigger8' or command == 'helix' then
		send_command('input /ma "'..elements_helix:current()..'" <t>;')
    elseif execute_common_command(command) then
    elseif stack_command(command) then
	elseif command:slice(1,8) == 'nuke_req' then
		command = command:gsub("nuke_req ","")
		if command ~= nil and string.len(command) > 0 then
			local nuke_request = T{}
			local counter = 1
			for w in string.gmatch(command, "%w+") do
				nuke_request[counter] = w
				counter = counter + 1
			end
			if nuke_request[1] ~= nil and nuke_request[2] ~= nil and nuke_request[3] ~= nil and nuke_request[4] ~= nil then
				self_command('element '..nuke_request[1])
				if nuke_request[3] == 'Y' then
					MBMode = 'Elemental Magic MB'
					mbPassString = 'Y'
				else
					MBMode = 'Elemental Magic'
					mbPassString = 'N'
				end
				nukeTargetIDWithElement(nuke_request[1], nuke_request[2], 6, nuke_request[4])
			end
		end
	elseif command == 'acc' or command == 'spellAcc' or command == 'trigger9' then
		if spellAcc == 'Low' then
			spellAcc = 'Mid'
			windower.add_to_chat(050,"Mid Acc.")
		elseif spellAcc == 'Mid' then
			spellAcc = 'High'
			windower.add_to_chat(050,"High Acc.")
		elseif spellAcc == 'High' then
			spellAcc = '5k'
			windower.add_to_chat(050,"5k T1 Nukes.")
		elseif spellAcc == '5k' then
			spellAcc = 'Low'
			windower.add_to_chat(050,"Low Acc.")
		end
	elseif command == 'sneak' then
		send_command('input /ma "Sneak" <me>;')
	elseif command == 'invisible' then
		send_command('input /ma "Invisible" <me>;')
	elseif command == 'dt' then
		equip(sets['DT'])
		windower.add_to_chat(167,"DT for TP on")
	elseif command == 'dt_end' then
		windower.add_to_chat(167,"DT for TP ended")
	elseif command == 'knockback_dt' then
		equip(sets['DT'])
		windower.add_to_chat(167,"DT + Repulse Mantle for Knockback TP on")
	elseif command == 'death_dt' then
		equip(sets['DT'])
		windower.add_to_chat(167,"DT for Death TP on")
	elseif command == 'mythic' then
		equip(sets['Mythic'])
		if player.equipment.main == 'Laevateinn' and player.equipment.sub == "Enki Strap" then
			disable('main','sub')
			mythicTries = 0
			windower.add_to_chat(167,"Laevateinn [ON]")
		elseif mythicTries > 10 then
			windower.add_to_chat(050,"Laevateinn couldn't be equipped at this time.")
			mythicTries = 0
		else
			enable('main','sub')
			mythicTries = mythicTries +1
			send_command('wait 1;gs c mythic;')
		end
	elseif command == 'locknuke' then
		if not buffactive['encumbrance'] then
			allGearOn = true
			lockSet = sets.midcast[spellAcc][MBMode]
			for i,v in pairs(lockSet) do
				if i == 'body' then
					if player.equipment[i] == 'Spae. Coat +1' then
						disable(i)
					else
						windower.add_to_chat(050,'['..player.equipment[i]..'] '..i..' ['..v..']')
						enable(i)
						allGearOn = false
					end
				else
					if type(v) == 'table' then
						if player.equipment[i] == v.name then
							disable(i)
						else
							windower.add_to_chat(050,'['..player.equipment[i]..'] '..i..' ['..v.name..']')
							enable(i)
							allGearOn = false
						end
					else
						if player.equipment[i] == v then
							disable(i)
						else
							windower.add_to_chat(050,'['..player.equipment[i]..'] '..i..' ['..v..']')
							enable(i)
							allGearOn = false
						end
					end
				end
			end
			if allGearOn then
				--disable('range','ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
				nukeSetTries = 0
				windower.add_to_chat(167,"Nuking gear [ON]")
			elseif nukeSetTries > 1 then
				windower.add_to_chat(050,"Nuking gear couldn't be equipped at this time.")
				nukeSetTries = 0
			else
				equip(sets.midcast[spellAcc][MBMode],sets['lowMpNuke'])
				--enable('range','ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
				nukeSetTries = nukeSetTries +1
				send_command('wait 1;gs c locknuke;')
			end
		end
	elseif command == 'unlock' then
		enable('range','ammo','head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
		print('Slots enabled.')
	elseif command == 'forceaf' then
		if forceAf == false then
			forceAf = true
			windower.add_to_chat(050,"Force AF Body [ON]")
		else
			forceAf = false
			windower.add_to_chat(050,"Force AF Body [OFF]")
		end
	elseif command == 'tank' then
		if tank == true then
			tank = false
			windower.add_to_chat(167,"Tank mode [OFF]")
		else
			tank = true
			windower.add_to_chat(167,"Tank mode [ON]")
		end
	elseif command == 'deathmode' then
		if deathMode == true then
			deathMode = false
			windower.add_to_chat(167,"Death mode [OFF]")
		else
			deathMode = true
			windower.add_to_chat(167,"Death mode [ON]")
		end
    elseif command == 'th' then
        if thMode == 0 then
            thMode = 1
            windower.add_to_chat(167,"TH mode [ON]")
        else
            thMode = 0
            windower.add_to_chat(167,"TH mode [OFF]")
        end
    elseif command == 'cp' then
        autoNukeTargets = true
        mirror_nukers = T{'Nekachu', 'Norzu'}
        -- mirror_nukers = T{'Nekachu', 'Ulor', 'Norzu'}
        elements_base:setTo('Blizzard')
        nukeType = 'aoe'
        nukePassString = 'aoe'
        autoPhalanx:setTo(true)
        -- send_command('cancel 39;wait 1;cancel 116;')
	end
end

function handle_ping()
    --if os.clock()-lastChat > 1 then
--      send_command('input /item "Silt Pouch" <me>;')
--      lastChat = os.clock()
--  end
    if buffactive['silence'] and os.clock()-lastChat > 5 then
        send_command('input /item "Echo Drops" <me>;')
        lastChat = os.clock()
    end

    if check_ready_silent() and player.x == lastx and player.y == lasty then
        if autoSS and (player.sub_job == 'WHM' or player.sub_job == 'RDM' or player.sub_job == 'SCH' or player.sub_job == 'RUN') and not buffactive['stoneskin'] and is_spell_ready('Stoneskin') then
            direct_push(stack_spells['Stoneskin'], 'ma', player.name, true)
        end
        if autoPhalanx:current() and player.sub_job == 'RDM' and not buffactive['phalanx'] and is_spell_ready('Phalanx') then
            direct_push(stack_spells['Phalanx'], 'ma', player.name, false)
        end
        if autoBlink and (player.sub_job == 'WHM' or player.sub_job == 'RDM' or player.sub_job == 'SCH' or player.sub_job == 'RUN') and not buffactive['Blink'] and is_spell_ready('Blink') then
            direct_push(stack_spells['Blink'], 'ma', player.name, true)
        end
        if autoAquaveil and (player.sub_job == 'WHM' or player.sub_job == 'RDM' or player.sub_job == 'SCH' or player.sub_job == 'RUN') and not buffactive['Aquaveil'] and is_spell_ready('Aquaveil') then
            direct_push(stack_spells['Aquaveil'], 'ma', player.name, true)
        end

        if player.hp < 650 and player.mp > 300 and is_ability_ready('Mana Wall') then
            direct_push(stack_job_abilities['Mana Wall'], 'ja', player.name, true)
        end

        if player.sub_job == 'SCH' then
            if not buffactive['Dark Arts'] and not buffactive['Addendum: Black'] then
                direct_push(stack_job_abilities['Dark Arts'], 'ja', player.name, false)
            end
            if autoSub then
                if not buffactive['weakness'] and not buffactive['Sublimation: Complete'] and not buffactive['Sublimation: Activated'] and is_ability_ready('Sublimation') then
                    direct_push(stack_job_abilities['Sublimation'], 'ja', player.name, true)
                end
                if not buffactive['weakness'] and player.mp < 600 and buffactive['Sublimation: Complete'] and is_ability_ready('Sublimation')then
                    direct_push(stack_job_abilities['Sublimation'], 'ja', player.name, true)
                end
            end
        end

        if doCures then
            cure_process()
        end

        -- if autoNukeTargets and #spellStack == 0 then
        --     local mobsToNuke = nearest_claimable_enemies({'Territorial Mantis','Lentic Toad', 'Lucani', 'Glowering Ladybug'})
        --     if #mobsToNuke > 0 then
        --         if #mobsToNuke >= 2 then
        --             print(mobsToNuke[1].name)
        --             nukeTargetIDWithElement(elements_base:current(), 'aoe', mobsToNuke[1].id)
        --             processMirrorNukesWithId('aoe', mobsToNuke[2].id)
        --         else
        --             nukeTargetIDWithElement(elements_base:current(), 'single', mobsToNuke[1].id)
        --             processMirrorNukesWithId('single', mobsToNuke[1].id)
        --         end
        --     end
        -- end
        handleSpareTime()
    else
        lastx = player.x
        lasty = player.y
    end
end

function party_target_change()
    if check_ready_status() then
        handle_idle()
    end
end

function file_unload(file_name)
    windower.text.delete('stackoutput')
end