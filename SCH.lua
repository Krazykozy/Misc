include('common_commands.lua')
include('how_about_no.lua')
include('organizer-lib.lua')
include('no_interruptions.lua')
include('spam_protection.lua')
include('spell_stack.lua')

--Change this in your gear file to whatever book you want to use
macro_book = 1

lastChat = 0
autoAlacrity = I{false,true}
scSchMode = true

mirror_nuke = true

mirror_nukers = T{}

MBMode = 'Elemental Magic'
--String that's passed for mirror nuking to indicating MBing or not
mbPassString = 'N'
--String sent to mirror nuking function to show aoe or single
nukePassString = 'aoe'
--Making the use_spells table global
use_spells = {}

dtMode = false

--Spell Stack Settings
--Recast time for stratagems (550 JP gift reduces this to 33s)
stratagemRecast = 48
maxStratagems = 5
--2 charge max for /SCH, 5 charge for SCH main.
maxStratagemTime = stratagemRecast*4
--Use auto curing true|false
doCures = false
--Use status cures and ally buffs on alliance true|false
allianceCheck = false
--Use cures on alliance true|false
allianceHeal = false
--Use Stoneskin automatically true|false
autoSS = false
--Use Blink automatically true|false
autoBlink = false
--Use Sublimation automatically true|false
autoSub = true
--Use Aquaveil automatically true|false
autoAquaveil = false

selfFix = {}
selfFix['paralyna'] = false
selfFix['poisona'] = false
selfFix['erase'] = false
selfFix['cursna'] = false

afBodyPercent = 70
forceAf = false

nukeType = 'aoe'

function get_sets()
	idleSet = "Idle"
	spellAcc = 'Low'
	stunAcc = 'Low'
	mythicTries = 0

	load_gear_file()

    send_command('input /macro book '..macro_book..';wait 5;gs c jpdetect;')
end

function pretarget(spell)
    if check_ready(spell) == false then
        cancel_spell()
    end

    queue_spell_if_busy(spell)

    if spell.english == 'Sneak' and spell.target.name == player.name and player.sub_job == 'DNC' and is_ability_ready('Spectral Jig') then
        cancel_spell()
        windower.send_command('input /ja "Spectral Jig" <me>;')
    end

	if spell.skill == 'Elemental Magic' then
		if spell.english:sub(-5) == 'ga II' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (buffactive['Manafont'] or buffactive['Manawell'] or player.mp >= spell.mp_cost) and pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60 then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-5),"ga")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-3) == ' VI' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (buffactive['Manafont'] or buffactive['Manawell'] or player.mp >= spell.mp_cost) and pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60 then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-3)," V")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-2) == ' V' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (buffactive['Manafont'] or buffactive['Manawell'] or player.mp >= spell.mp_cost) and pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60 then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-2)," IV")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-3) == ' IV' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (buffactive['Manafont'] or buffactive['Manawell'] or player.mp >= spell.mp_cost) and pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60 then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-3)," III")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-3) == 'III' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (buffactive['Manafont'] or buffactive['Manawell'] or player.mp >= spell.mp_cost) and pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60 then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-3)," II")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		elseif spell.english:sub(-3) == ' II' then
			pretargRecastData = windower.ffxi.get_spell_recasts()
			if (buffactive['Manafont'] or buffactive['Manawell'] or player.mp >= spell.mp_cost) and pretargRecastData[spell.recast_id] ~= nil and pretargRecastData[spell.recast_id] > 60 then
				cancel_spell()
				newSpell = spell.english:gsub(spell.english:sub(-3),"")
				send_command('input /ma "'..newSpell..'" <t>;')
			end
		end
	end
end

function precast(spell,action)
	if check_ready(spell) then
		if spell.type == 'WeaponSkill' then
			if spell.target.distance > 10 or player.tp < 900 then
				cancel_spell()
				return
			end
			cast_speed = 1
			if sets[spell.english] then
				equip(sets[spell.english])
			end

			if spell.english == 'Omniscience' then
				if spell.element == world.weather_element or spell.element == world.day_element or (spell.element == 'Dark' and buffactive['Voidstorm']) then
					equip({waist='Anrin Obi'})
				end
			end

			windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
		elseif spell.type == 'JobAbility' then
			cast_speed = 1
			if sets.precast[spell.english] then
				equip(sets.precast[spell.english])
			end
		elseif spell.type == 'WhiteMagic' then
			cast_speed = 0.8
			if string.find(spell.english,'Cure') then
				equip(sets.precast['CureSet'])
			else
				if spell.skill == 'Enhancing Magic' then
					equip(sets.precast['Enhancing Magic'])
				else
					equip(sets.precast['General'])
				end
			end

			if buffactive['Light Arts'] then
				equip(sets.precast['Grimoire'])
			end
			if buffactive['celerity'] then
				cast_speed = 0.4
			end
		elseif spell.type == 'BlackMagic' then
			if spell.english == 'Impact' then
				cast_speed = 0.8
				equip(sets.precast['Impact'])
				cast_delay(0.5)
			else
				cast_speed = 0.6
                if sets.precast['Elemental Magic'] then
                    equip(sets.precast['General'])
                else
				    equip(sets.precast['General'])
                end
			end
			if buffactive['alacrity'] then
				cast_speed = 0.4
			end
		elseif spell.type == 'Trust' then
			equip(sets.precast['General'])
		end

		if (buffactive['Dark Arts'] or buffactive['Addendum: Black']) and (spell.skill == 'Enfeebling Magic' or spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic') then
			if spell.english ~= 'Impact' then
				equip(sets.precast['Grimoire'])
			end
		elseif (buffactive['Light Arts'] or buffactive['Addendum: White']) and (spell.skill == 'Enfeebling Magic' or spell.skill == 'Healing Magic' or spell.skill == 'Divine Magic' or spell.skill == 'Enhancing Magic') then
			if spell.english ~= 'Stoneskin' then
				equip(sets.precast['Grimoire'])
			end
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	if spell.type ~= 'WeaponSkill' and spell.type ~= 'JobAbility' and spell.type ~= 'Scholar' then
		equipSet = sets.midcast['General']
        if spell.skill == 'Enhancing Magic' then
            if spell.english == 'Stoneskin' then
                equipSet = sets.midcast['Stoneskin']
            elseif spell.english == 'Aquaveil' then
                equipSet = sets.midcast['Aquaveil']
            elseif spell.english == 'Refresh' then
                equipSet = sets.midcast['Refresh']
            elseif spell.english == 'Phalanx' then
                equipSet = sets.midcast['Phalanx']
            elseif spell.english:sub(1,5) == 'Regen' then
                equipSet = sets.midcast['Regen']
            elseif spell.english == 'Haste' or spell.english == 'Invisible' or spell.english == 'Sneak' or spell.english:sub(-5) == 'storm' or spell.english:sub(-8) == 'storm II' or spell.english:sub(4) == 'Prot' or spell.english:sub(4) == 'Shel' or spell.english == 'Adloquium' or spell.english:sub(-6) == 'Animus' or spell.english == 'Blink' or spell.english == 'Refresh' then
                equipSet = set_combine(sets.midcast['General'],sets.midcast['Enhancing Magic Duration'])
            elseif spell.english == 'Embrava' then
                equipSet = sets.midcast['Embrava']
            elseif spell.english == 'Warp' or spell.english == 'Warp II' then
                equipSet = sets.midcast['General']
            else
                equipSet = set_combine(sets.midcast['Enhancing Magic'], sets.midcast['Enhancing Magic Duration'])
            end

            if buffactive['Perpetuance'] then
                equipSet = set_combine(equipSet,{hands="Arbatel Bracers +1"})
            end
		elseif spell.type == 'WhiteMagic' then
			if string.find(spell.english,'Cure') then
				equipSet = sets.midcast['CureSet']
			elseif spell.skill == 'Enfeebling Magic' then
				equipSet = sets.midcast['Enfeebling Magic']
			end
        elseif spell.english == 'Dia' or spell.english == 'Bio' then
            equipSet = set_combine(equipSet, sets['TH'])
		elseif spell.type == 'BlackMagic' then
			if spell.english == 'Stun' then
				equipSet = sets.midcast['Stun'][stunAcc]
			elseif spell.english == 'Drain' or spell.english == 'Drain II' or spell.english == 'Aspir' or spell.english == 'Aspir II' then
				equipSet = sets.midcast['Stun']
			elseif spell.skill == 'Enfeebling Magic' then
				equipSet = sets.midcast['Enfeebling Magic']
			elseif spell.english == 'Impact' then
				equipSet = sets.midcast['Impact']
			elseif spell.skill == 'Elemental Magic' or spell.english == 'Kaustra' then
                local previousMBMode = MBMode
                if use_mb_on_next_nuke == true then
                    MBMode = 'Elemental Magic MB'
                end
				equipSet = sets.midcast[spellAcc][MBMode]

                if spell.element == 'Dark' then
                    equipSet = set_combine(sets.midcast[spellAcc][MBMode],sets['DarkMagic'])
                end

				if buffactive['Reive Mark'] then
					equipSet = set_combine(equipSet, sets['Reive'])
				end

				if (forceAf == true or (((player.mp-spell.mp_cost)/player.max_mp)*100) < afBodyPercent) then
					equipSet = set_combine(equipSet, sets['lowMpNuke'])
				end

                if buffactive['Immanence'] then
                    equipSet = sets.midcast['Immanence Elemental Magic']
                end

                if use_mb_on_next_nuke == true then
                    MBMode = previousMBMode
                    use_mb_on_next_nuke = false
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
			if (spell.skill == 'Elemental Magic' and (spell.english:sub(-5) ~= 'helix' or spell.english:sub(-8) == 'helix II')) or spell.english == 'Kaustra' then
				equipSet = set_combine(equipSet, sets[spell.element])
			end
			if spell.skill == 'Elemental Magic' and buffactive['Klimaform'] then
				equipSet = set_combine(equipSet, sets['Klimaform'])
			end
		end

		equip(equipSet)
	end
end

function aftercast(spell,action)
	if spam_protection_off(spell)then
		handle_idle()
        if autoAlacrity:current() and spell.english == 'Stun' and (buffactive['Dark Arts'] or buffactive['Addendum: Black']) and is_stratagem_ready('Alacrity') then
            direct_push_front(stack_job_abilities['Alacrity'], 'ja', player.name, true)
        end
	end
	checkAftercast(spell)
end

function status_change(new,old)
	handle_idle()
end

function sub_job_change(new,old)
	if new == 'BLM' or new == 'DRK' then
		send_command('lua l betastun2;')
	else
		send_command('lua u betastun2;')
	end
	setUsableMirrorSpells()
end

function buff_change(buff,gain_or_loss)
	if check_ready_status() then
		if buff == 'Sublimation: Complete' or buff == 'Sublimation: Activated' then
			equip(sets['IdleSublimation'])
		end
	end

	if gain_or_loss then
		if buff == 'Aftermath: Lv.3' then
			send_command('timers c "AM3" 180 up "Aftermath"')
		elseif buff == 'Aftermath: Lv.2' then
			send_command('timers c "AM2" 180 up "Aftermath"')
		elseif buff == 'Aftermath: Lv.1' then
			send_command('timers c "AM1" 180 up "Aftermath"')
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
    if player.status == 'Engaged' then
        equip(sets['Melee'])

        if buffactive['Reive Mark'] then
            equip(sets['Reive'])
        end
    else
        if player.mpp > 80 or dtMode then
            equip(sets['Idle DT'])
        else
            equip(sets['Idle Refresh'])
        end

        if buffactive['Sublimation: Activated'] then
            equip(sets['IdleSublimation'])
        end

        if player.status == 'Resting' then
            equip(sets['Resting'])
        end

        if not dtMode and party_target == false then
            equip(sets['Running'])
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

function nukeWithElement(elementToUse, singleOrAoe, tierToUse)
	setUsableMirrorSpells()

	--Check we have a nuke for this element
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

function nukeTargetIDWithElement(elementToUse, singleOrAoe, tierToUse, targetID)
	--Ensure we're not already queued to do something with spellStack
	if spellStack ~= nil and #spellStack == 0 or spellStack == nil then
		setUsableMirrorSpells()
		if MBMode == 'Elemental Magic MB' or (singleOrAoe == 'aoe' and use_spells[singleOrAoe] == nil) then
			singleOrAoe = 'single'
		end
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
end

function self_command(command)
    if command == 'trigger1' then
        command = 'next_element'
    end

	if command == 'key_s' then
		send_command('input /ma "Stun" <t>;')
    elseif command == 'autoalacrity' then
        autoAlacrity:next()
        windower.add_to_chat(167,"Auto Alacrity ["..tostring(autoAlacrity:current()).."]")
    elseif command == 'stunmode' then
        stunMode:next()
        windower.add_to_chat(167,"Stun Mode ["..tostring(stunMode:current()).."]")
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
	elseif command == 'mbmode' then
		if MBMode == 'Elemental Magic' then
			MBMode = 'Elemental Magic MB'
			mbPassString = 'Y'
			windower.add_to_chat(050,"MB Mode [ON]")
		else
			MBMode = 'Elemental Magic'
			mbPassString = 'N'
			windower.add_to_chat(050,"MB Mode [OFF]")
		end
	elseif command == 'trigger2' then
        if MBMode == 'Elemental Magic' then
            MBMode = 'Elemental Magic MB'
            mbPassString = 'Y'
            windower.add_to_chat(050,"MB Mode [ON]")
        else
            MBMode = 'Elemental Magic'
            mbPassString = 'N'
            windower.add_to_chat(050,"MB Mode [OFF]")
        end
	elseif command == 'trigger3' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ma "Regen V" <t>;')
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
            nukeWithElement(elements_base:current(), nukeType, 1)
            processMirrorNukes(nukePassString)
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'trigger4' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ma "Erase" <t>;')
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
            nukeWithElement(elements_base:current(), nukeType, 3)
            processMirrorNukes(nukePassString)
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'trigger5' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ma "Haste" <t>;')
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
            nukeWithElement(elements_base:current(), 'single', 4)
            processMirrorNukes(nukePassString)
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'trigger6' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ma "'..elements_base:current()..' V" <t>;')
            nukeWithElement(elements_base:current(), 'single', 5)
            processMirrorNukes(nukePassString)
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'trigger7' then
		send_command('input /ma "'..elements_storm:current()..' II" <me>;')
	elseif command == 'trigger8' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ma "'..elements_helix:current()..' II" <t>;')
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'acc' or command == 'spellAcc' or command == 'trigger9' then
		if spellAcc == 'Low' then
			spellAcc = 'Mid'
			stunAcc = 'High'
			windower.add_to_chat(050,"Mid Spell Acc.")
		elseif spellAcc == 'Mid' then
			spellAcc = 'High'
			stunAcc = 'High'
			windower.add_to_chat(050,"High Spell Acc.")
		elseif spellAcc == 'High' then
			spellAcc = 'Low'
			stunAcc = 'Low'
			windower.add_to_chat(050,"Low Spell Acc.")
		end
    elseif command == 'tank' then
        if not dtMode then
            dtMode = true
            windower.add_to_chat(028, "Idle DT [ON]")
        else
            dtMode = false
            windower.add_to_chat(028, "Idle DT [OFF]")
        end
        handle_idle()
	elseif command == 'sneak' then
		send_command('input /ma "Sneak" <me>;')
	elseif command == 'invisible' then
		send_command('input /ma "Invisible" <me>;')
	elseif command == 'alt_ws' then
		send_command('send mazuki gs c ws;')
	elseif command == 'dt' or command == 'knockback_dt' or command == 'death_dt' then
		equip(sets['DT'])
	elseif command == 'dt_end' then
		handle_idle()
	elseif command == 'melee' then
		equip(sets['Melee'])
		if player.equipment.main == 'Akademos' and player.equipment.sub == 'Enki Strap' then
			disable('main','sub')
			mythicTries = 0
			windower.add_to_chat(167,"Melee [ON]")
		elseif mythicTries > 10 then
			windower.add_to_chat(050,"Akademos couldn't be equipped at this time.")
		else
			enable('main','sub')
			mythicTries = mythicTries +1
			send_command('wait 1;gs c melee;')
		end
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
    elseif command == 'dia2' then
        direct_push(stack_spells['Dia II'], 'ma', 'bt', true)
    elseif command == 'ambu2' then
        add_to_back(stack_job_abilities['Dark Arts'], player.name)
        add_to_back(stack_spells['Thunderstorm II'], player.name, {with_stratagem="Addendum: Black"})
        MBMode = 'Elemental Magic MB'
        mbPassString = 'Y'
        nukeType = 'single'
        nukePassString = 'single'
        elements_base:setTo('Thunder')
        elements_helix:jumpTo(elements_base.pos)
        elements_am:jumpTo(elements_base.pos)
        elements_geo:jumpTo(elements_base.pos)
        elements_storm:jumpTo(elements_base.pos)
        stunMode:setTo(false)
        scSchMode = true
        dtMode = false
        doCures = false
    elseif command == 'ambu mage' then
        if player.name == 'Nekachu' then
            add_to_back(stack_job_abilities['Light Arts'], player.name)
            add_to_back(stack_spells['Thunderstorm II'], 'Miang')
            add_to_back(stack_spells['Stoneskin'], player.name, {with_stratagem="Accession"})
            add_to_back(stack_spells['Aquaveil'], player.name, {with_stratagem="Accession"})
            add_to_back(stack_job_abilities['Perpetuance'], player.name)
            add_to_back(stack_spells['Regen V'], player.name, {with_stratagem="Accession"})
            add_to_back(stack_job_abilities['Dark Arts'], player.name)
            add_to_back(stack_spells['Thunderstorm II'], player.name, {with_stratagem="Addendum: Black"})
        else
            add_to_back(stack_job_abilities['Dark Arts'], player.name)
            add_to_back(stack_spells['Thunderstorm II'], 'Miang')
        end
        MBMode = 'Elemental Magic MB'
        mbPassString = 'Y'
        nukeType = 'single'
        nukePassString = 'single'
        elements_base:setTo('Fire')
        elements_helix:jumpTo(elements_base.pos)
        elements_am:jumpTo(elements_base.pos)
        elements_geo:jumpTo(elements_base.pos)
        elements_storm:jumpTo(elements_base.pos)
        stunMode:setTo(false)
        scSchMode = true
        dtMode = true
        doCures = false
        autoMB = false
    elseif command == 'quetz' then
        doCures = true
        scSchMode = false
        dtMode = false
        stunMode:setTo(false)
        autoAquaveil = true
        add_to_back(stack_job_abilities['Light Arts'], player.name)
        add_to_back(stack_job_abilities['Accession'], player.name)
        add_to_back(stack_spells['Regen V'], player.name, {with_stratagem="Perpetuance"})
        add_to_back(stack_spells['Protect V'], player.name, {with_stratagem="Accession"})
        add_to_back(stack_spells['Shell V'], player.name, {with_stratagem="Accession"})
    elseif command == 'cp' then
        doCures = true
        scSchMode = false
        dtMode = false
        stunMode:setTo(false)
        autoAquaveil = true
        if player.name == 'Tosel' then
            add_to_back(stack_job_abilities['Light Arts'], player.name)
            add_to_back(stack_job_abilities['Accession'], player.name)
            add_to_back(stack_spells['Regen V'], player.name, {with_stratagem="Perpetuance"})
        end
        send_command('cancel 39;wait 1;cancel 116;')
	elseif execute_common_command(command) then
		--done
	elseif stack_command(command) then
		--done
	end
end

function check_white_status()
	if autoStrat and not scSchMode then
		if not buffactive['Addendum: White'] and not buffactive['Light Arts'] and is_ability_ready('Light Arts') then
			direct_push(stack_job_abilities['Light Arts'], 'ja', player.name, true)
		elseif not buffactive['Addendum: White'] and buffactive['Light Arts'] and is_stratagem_ready('Addendum: White') then
			direct_push(stack_job_abilities['Addendum: White'], 'ja', player.name, true)
		elseif buffactive['Addendum: White'] then
			return true
		else
			return false
		end
	else
		return true
	end
end

function check_black_status()
	if autoStrat then
		if not buffactive['Addendum: Black'] and not buffactive['Dark Arts'] and is_ability_ready('Dark Arts') then
			direct_push(stack_job_abilities['Dark Arts'], 'ja', player.name, true)
		elseif not buffactive['Addendum: Black'] and buffactive['Dark Arts'] and is_stratagem_ready('Addendum: Black') then
			direct_push(stack_job_abilities['Addendum: Black'], 'ja', player.name, true)
		elseif buffactive['Addendum: Black'] then
			return true
		else
			return false
		end
	else
		return true
	end
end

function handle_ping()
	if buffactive['petrification'] then
		if os.clock()-lastChat > 10 then
			send_command('input /p stoned')
			lastChat = os.clock()
		end
	elseif buffactive['sleep'] then
		if os.clock()-lastChat > 10 then
			send_command('input /p zzz')
			lastChat = os.clock()
		end
	end

	if check_ready_silent() and player.x == lastx and player.y == lasty then
		--if buffactive['silence'] and os.clock()-lastChat > 5 then
		--	send_command('input /item "Echo Drops" <me>;')
		--	lastChat = os.clock()
		--end

		if autoSS and not buffactive['stoneskin'] and is_spell_ready('Stoneskin') then
			direct_push(stack_spells['Stoneskin'], 'ma', player.name, true)
		end
		if autoBlink and not buffactive['Blink'] and is_spell_ready('Blink') then
			direct_push(stack_spells['Blink'], 'ma', player.name, true)
		end
		if autoAquaveil and not buffactive['Aquaveil'] and is_spell_ready('Aquaveil') then
			direct_push(stack_spells['Aquaveil'], 'ma', player.name, true)
		end

        if not scSchMode and player.sub_job_level > 0 then
            if player.sub_job == 'WHM' then
                if selfFix['paralyna'] and buffactive['paralysis'] and is_spell_ready('Paralyna') then
                    direct_push(stack_spells['Paralyna'], 'ma', player.name, true)
                elseif selfFix['poisona'] and buffactive['poison'] and is_spell_ready('Poisona') then
                    direct_push(stack_spells['Poisona'], 'ma', player.name, true)
                elseif selfFix['erase'] and buffactive['bio'] or buffactive['bind'] or buffactive['weight'] or buffactive['slow'] then
                    direct_push(stack_spells['Erase'], 'ma', player.name, true)
                elseif selfFix['cursna'] and (buffactive['doom'] or buffactive['curse']) and is_spell_ready('Cursna') then
                    direct_push_front(stack_spells['Cursna'], 'ma', player.name, true)
                end

                if not buffactive['reraise'] and is_spell_ready('Reraise') then
                    direct_push(stack_spells['Reraise'], 'ma', player.name, true)
                end
            else
                if selfFix['paralyna'] and buffactive['paralysis'] and is_spell_ready('Paralyna') and check_white_status() then
                    direct_push(stack_spells['Paralyna'], 'ma', player.name, true)
                elseif selfFix['poisona'] and buffactive['poison'] and is_spell_ready('Poisona') and check_white_status() then
                    direct_push(stack_spells['Poisona'], 'ma', player.name, true)
                elseif selfFix['erase'] and (buffactive['bio'] or buffactive['bind'] or buffactive['weight'] or buffactive['slow']) and check_white_status() then
                    direct_push(stack_spells['Erase'], 'ma', player.name, true)
                elseif selfFix['cursna'] and (buffactive['doom'] or buffactive['curse']) and is_spell_ready('Cursna') and check_white_status() then
                    direct_push(stack_spells['Cursna'], 'ma', player.name, true)
                end
            end
        end

		--[[if not buffactive['reraise'] and not scSchMode then
			if not buffactive['Addendum: White'] and not buffactive['Light Arts'] and is_ability_ready('Light Arts') then
				direct_push(stack_job_abilities['Light Arts'], 'ja', player.name, true)
			elseif not buffactive['Addendum: White'] and buffactive['Light Arts'] and is_stratagem_ready('Addendum: White') then
				direct_push(stack_job_abilities['Addendum: White'], 'ja', player.name, true)
			elseif buffactive['Addendum: White'] and is_spell_ready('Reraise III') then
				direct_push(stack_spells['Reraise III'], 'ma', player.name, true)
			end
		end]]--

		if autoSub then
			if not buffactive['weakness'] and not buffactive['Sublimation: Complete'] and not buffactive['Sublimation: Activated'] and is_ability_ready('Sublimation') then
				direct_push(stack_job_abilities['Sublimation'], 'ja', player.name, true)
			end
			if not buffactive['weakness'] and player.mp < 600 and buffactive['Sublimation: Complete'] and is_ability_ready('Sublimation')then
				direct_push(stack_job_abilities['Sublimation'], 'ja', player.name, true)
			end
		end

		if player.sub_job == 'RDM' and player.sub_job_level > 0 then
			if not buffactive['weakness'] and  player.mp < 200 and player.hp > 1000 and is_ability_ready('Convert') then
				direct_push(stack_job_abilities['Convert'], 'ja', player.name, true)
			end

			if not buffactive['Sublimation: Complete'] and not buffactive['Sublimation: Activated'] and not buffactive['refresh'] and is_spell_ready('Refresh') then
				direct_push(stack_spells['Refresh'], 'ma', player.name, true)
			end
        elseif player.sub_job == 'NIN' then
            if not buffactive['Copy Image (2)'] and not buffactive['Copy Image (3)'] and not buffactive['Copy Image (4)'] then
                if is_spell_ready('Utsusemi: Ni') then
                    direct_push_front(gearswap.res.spells[339], 'ma', player.name, false)
                elseif is_spell_ready('Utsusemi: Ichi') then
                    direct_push_front(gearswap.res.spells[338], 'ma', player.name, false)
                end
            end
		end

		check_auto_spell()
		if doCures then
			cure_process()
		end
		handleSpareTime()
	else
		if player.hp == 0 then
			clear_spell_stack()
		end
		lastx = player.x
		lasty = player.y
	end
end

function setUsableMirrorSpells()
	if (player.sub_job == 'BLM') then
		use_spells.aoe = {}
		use_spells.aoe.Water = 			{'Waterga II', 		'Waterga'}
		use_spells.aoe.Thunder = 		{				 	'Thundaga'}
		use_spells.aoe.Stone = 			{'Stonega II', 		'Stonega'}
		use_spells.aoe.Aero = 			{'Aeroga II', 		'Aeroga'}
		use_spells.aoe.Blizzard = 		{					'Blizzaga'}
		use_spells.aoe.Fire = 			{					'Firaga'}
	else
		use_spells.aoe = nil
	end

	if buffactive['Addendum: Black'] then
		use_spells.single = {}
		use_spells.single.Water = 		{'Water V', 	'Water IV', 		'Water III', 		'Water II', 		'Water'}
		use_spells.single.Thunder = 	{'Thunder V', 	'Thunder IV', 		'Thunder III', 		'Thunder II', 		'Thunder'}
		use_spells.single.Stone = 		{'Stone V', 	'Stone IV', 		'Stone III', 		'Stone II', 		'Stone'}
		use_spells.single.Aero = 		{'Aero V', 		'Aero IV', 			'Aero III', 		'Aero II', 			'Aero'}
		use_spells.single.Blizzard = 	{'Blizzard V', 	'Blizzard IV', 		'Blizzard III', 	'Blizzard II', 		'Blizzard'}
		use_spells.single.Fire =		{'Fire V', 		'Fire IV', 			'Fire III', 		'Fire II', 			'Fire'}
	else
		use_spells.single = {}
		use_spells.single.Water = 		{'Water III', 		'Water II', 		'Water'}
		use_spells.single.Thunder = 	{'Thunder III', 	'Thunder II', 		'Thunder'}
		use_spells.single.Stone = 		{'Stone III', 		'Stone II', 		'Stone'}
		use_spells.single.Aero = 		{'Aero III', 		'Aero II', 			'Aero'}
		use_spells.single.Blizzard = 	{'Blizzard III', 	'Blizzard II', 		'Blizzard'}
		use_spells.single.Fire =		{'Fire III', 		'Fire II', 			'Fire'}
	end
end

setUsableMirrorSpells()

function file_unload(file_name)
    windower.text.delete('stackoutput')
end