include('organizer-lib.lua')
include('common_commands.lua')
include('no_interruptions.lua')
include('spam_protection.lua')
include('spell_stack.lua')

mirror_nukers = T{}
stun_acc = I{'Low','High','Max'}
stun_acc:next()
stun_acc:next()
spell_acc = I{'Low','Mid','High'}
spell_acc:next()

autoAlacrity = true
stunMode = false
scSchMode = true

--Used to toggle sending nukes to alts or not
mirror_nuke = false

mirror_nukers = T{}

MBMode = 'Elemental Magic'
mbPassString = 'N'

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
allianceCheck = true
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


function get_sets()
	idleSet = "Idle"
	stunMode = "off"
	MBMode = 'Elemental Magic'
	CurrentElement = 'Stone'
	stormName = 'Sandstorm'
	helixName = 'Geohelix'
	tank = false
	PL = 'Nekachu'

	mythicTries = 0


    load_gear_file()

	if player.sub_job == 'BLM' or player.sub_job == 'DRK' then
		send_command('input /macro book 18;lua l betastun2;')
	else
		send_command('input /macro book 18;lua u betastun2;')
	end
end

function pretarget(spell)
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
		equipSet = false
		if spell.type == 'WeaponSkill' then
			if spell.target.distance > 10 or player.tp < 900 then
				cancel_spell()
				return
			end
			if sets[spell.english] then
				equipSet = sets[spell.english]
			end

			if spell.english == 'Omniscience' then
				if spell.element == world.weather_element or spell.element == world.day_element or (spell.element == 'Dark' and buffactive['Voidstorm']) then
					equipSet = set_combine(equipSet, {waist='Hachirin-no-Obi'})
				end
			end

			windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
		elseif spell.type == 'JobAbility' then
			if sets.precast[spell.english] then
				equipSet = sets.precast[spell.english]
			end
		elseif spell.type == 'WhiteMagic' then
			if string.find(spell.english,'Cure') then
				equipSet = sets.precast['CureSet']
			else
				if spell.skill == 'Enhancing Magic' then
					if sets.precast[spell.english] then
						equipSet = sets.precast[spell.english]
					else
						equipSet = sets.precast['Enhancing Magic']
					end
				else
					equipSet = sets.precast['General']
				end
			end
		elseif spell.type == 'BlackMagic' then
			if spell.english == 'Impact' then
				equipSet = sets.precast['Impact']
				cast_delay(0.5)
			elseif spell.skill  == 'Elemental Magic' then
				equipSet = sets.precast['Elemental Magic']
			else
				equipSet = sets.precast['General']
			end
		elseif spell.type == 'Trust' then
			equipSet = sets.precast['General']
		end

		if (buffactive['Dark Arts'] or buffactive['Addendum: Black']) and (spell.skill == 'Enfeebling Magic' or spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic') then
			if spell.english ~= 'Impact' then
				equipSet = set_combine(equipSet, sets.precast['Grimoire'])
			end

			if buffactive['alacrity'] then
				equipSet = set_combine(equipSet, sets.precast['Instacast'])
			end
		elseif (buffactive['Light Arts'] or buffactive['Addendum: White']) and (spell.skill == 'Enfeebling Magic' or spell.skill == 'Healing Magic' or spell.skill == 'Divine Magic' or spell.skill == 'Enhancing Magic') then
			if spell.english ~= 'Stoneskin' then
				equipSet = set_combine(equipSet, sets.precast['Grimoire'])
			end

			if buffactive['celerity'] then
				equipSet = set_combine(equipSet, sets.precast['Instacast'])
			end
		end

		if equipSet then
			equip(equipSet)
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	if spell.type ~= 'WeaponSkill' and spell.type ~= 'JobAbility' then
		equipSet = sets.midcast['General']

		if spell.type == 'WhiteMagic' then
			if string.find(spell.english,'Cure') then
				equipSet = sets.midcast['CureSet']
			elseif spell.skill == 'Enhancing Magic' then
				if spell.english == 'Stoneskin' then
					equipSet = sets.midcast['Stoneskin']
				elseif spell.english == 'Aquaveil' then
					equipSet = sets.midcast['Aquaveil']
                elseif spell.english == 'Phalanx' then
                    equipSet = sets.midcast['Phalanx']
				elseif spell.english:sub(1,5) == 'Regen' then
					equipSet = sets.midcast['Regen']
				elseif spell.english == 'Haste' or spell.english == 'Invisible' or spell.english == 'Sneak' or spell.english:sub(-5) == 'storm' or spell.english:sub(-8) == 'storm II' or spell.english:sub(1,4) == 'Prot' or spell.english:sub(1,4) == 'Shel' or spell.english == 'Adloquium' or spell.english:sub(-6) == 'Animus' or spell.english == 'Blink' or spell.english == 'Refresh' then
					equipSet = set_combine(sets.midcast['Enhancing Magic'], set_combine(sets.midcast['Enhancing Magic Duration']))
                elseif spell.english == 'Embrava' then
                    equipSet = sets.midcast['Embrava']
				else
					equipSet = sets.midcast['Enhancing Magic']
				end

				if buffactive['Perpetuance'] then
					equipSet = set_combine(equipSet,{hands="Arbatel Bracers +1"})
				end
			elseif spell.skill == 'Enfeebling Magic' then
				equipSet = sets.midcast['Enfeebling Magic']
			end
		elseif spell.type == 'BlackMagic' then
			if spell.english == 'Stun' then
				equipSet = sets.midcast['Stun'][stun_acc:current()]
			elseif spell.english == 'Drain' or spell.english == 'Drain II' or spell.english == 'Aspir' or spell.english == 'Aspir II' then
				equipSet = sets.midcast['Drain']
			elseif spell.skill == 'Enfeebling Magic' then
				equipSet = sets.midcast['Enfeebling Magic']
			elseif spell.english == 'Impact' then
				equipSet = sets.midcast['Impact']
			elseif spell.skill == 'Elemental Magic' or spell.english == 'Kaustra' then
				if spell.element == 'Dark' then
					equipSet = set_combine(sets.midcast[spell_acc:current()][MBMode],{head="Pixie Hairpin +1"})
				else
					equipSet = sets.midcast[spell_acc:current()][MBMode]

					if spell.element == 'Earth' then
						equipSet = set_combine(equipSet, {neck="Quanpur Necklace"})
					end

					-- if spell.english:sub(-3) == 'III' or spell.english:sub(-5) == 'ga II' or spell.english:sub(-2) == 'IV' or spell.english:sub(-1) == 'V' then
					-- 	equipSet = set_combine(equipSet, sets['higherTierNuke'])
					-- end

					if spell.english:sub(-5) == 'helix' or spell.english:sub(-8) == 'helix II' then
                        if MBMode == 'Elemental Magic MB' then
                            equipSet = sets.midcast[spell_acc:current()]['Helix MB']
                        else
                            equipSet = sets.midcast[spell_acc:current()]['Helix']
                        end
					end

					if buffactive['Reive Mark'] then
						equipSet = set_combine(equipSet, {neck="Arciela's Grace +1"})
					end

                    if buffactive['Immanence'] then
                        equipSet = sets.midcast['Immanence Elemental Magic']
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
			if (spell.skill == 'Elemental Magic' and (spell.english:sub(-5) ~= 'helix' or spell.english:sub(-8) == 'helix II')) or spell.english == 'Kaustra' then
				equipSet = set_combine(equipSet, sets[spell.element])
			elseif spell.english:sub(1,3) == 'Cur' then
				equipSet = set_combine(equipSet, {back="Twilight Cape"})
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
        if autoAlacrity and spell.english == 'Stun' and (buffactive['Dark Arts'] or buffactive['Addendum: Black']) and is_stratagem_ready('Alacrity') then
            direct_push_front(stack_job_abilities['Alacrity'], 'ja', player.name, true)
        end
    end
    checkAftercast(spell)
end

function status_change(new,old)
	if check_ready_status()then
		handle_idle()
	end
end

function buff_change(buff,gain_or_loss)
	if check_ready_status() then
		if buff == 'Sublimation: Complete' or buff == 'Sublimation: Activated' then
			handle_idle()
		end
	end

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
	equipSet = sets['DT']
	if tank then
		if player.mpp < 50 then
			equipSet = set_combine(equipSet,sets['mpBelt'])
		end

		equip(equipSet)
	else
		if player.status == 'Engaged' then
			equipSet = sets['Melee']
		else
			if inTown then
				equipSet = sets.midcast['Low'][MBMode]
				if buffactive['Sublimation: Activated'] then
					equipSet = set_combine(equipSet,sets['IdleSublimation'])
				end
			else
				equipSet = sets['DT']
				if player.mp < 820 then
					equipSet = set_combine(equipSet,sets['Idle'])
				end
				if buffactive['Sublimation: Activated'] then
					equipSet = set_combine(equipSet,sets['IdleSublimation'])
				end
			end
            if party_target == false then
                equipSet = set_combine(equipSet,sets['Running'])
            end
		end
	end

	if player.mpp < 50 then
		equipSet = set_combine(equipSet,sets['mpBelt'])
	end

	if player.tp > 1900 and player.tp <= 3000 then
		equipSet = set_combine(equipSet,sets['TooMuchTP'])
	end

	if buffactive['doom'] then
		equipSet = set_combine(equipSet, sets['doom'])
	end

	equip(equipSet)
end

function next_element()
	if CurrentElement == 'Water' then
		CurrentElement = 'Thunder'
		CurrentElementga = 'Thundaga'
		stormName = 'Thunderstorm'
		helixName = 'Ionohelix'
		windower.add_to_chat(167,"Thunder Mode")
	elseif CurrentElement == 'Thunder' then
		CurrentElement = 'Stone'
		CurrentElementga = 'Stonega'
		stormName = 'Sandstorm'
		helixName = 'Geohelix'
		windower.add_to_chat(167,"Stone Mode")
	elseif CurrentElement == 'Stone' then
		CurrentElement = 'Aero'
		CurrentElementga = 'Aeroga'
		stormName = 'Windstorm'
		helixName = 'Anemohelix'
		windower.add_to_chat(167,"Aero Mode")
	elseif CurrentElement == 'Aero' then
		CurrentElement = 'Blizzard'
		CurrentElementga = 'Blizzaga'
		stormName = 'Hailstorm'
		helixName = 'Cryohelix'
		windower.add_to_chat(167,"Blizzard Mode")
	elseif CurrentElement == 'Blizzard' then
		CurrentElement = 'Fire'
		CurrentElementga = 'Firaga'
		stormName = 'Firestorm'
		helixName = 'Pyrohelix'
		windower.add_to_chat(167,"Fire Mode")
	elseif CurrentElement == 'Fire' then
		CurrentElement = 'Water'
		CurrentElementga = 'Waterga'
		stormName = 'Rainstorm'
		helixName = 'Hydrohelix'
		windower.add_to_chat(167,"Water Mode")
	end
end

function prev_element()
	if CurrentElement == 'Water' then
		CurrentElement = 'Fire'
		CurrentElementga = 'Firaga'
		stormName = 'Firestorm'
		helixName = 'Pyrohelix'
		windower.add_to_chat(167,"Fire Mode")
	elseif CurrentElement == 'Thunder' then
		CurrentElement = 'Water'
		CurrentElementga = 'Waterga'
		stormName = 'Waterstorm'
		helixName = 'Hydrohelix'
		windower.add_to_chat(167,"Water Mode")
	elseif CurrentElement == 'Stone' then
		CurrentElement = 'Thunder'
		CurrentElementga = 'Thundaga'
		stormName = 'Thunderstorm'
		helixName = 'Ionohelix'
		windower.add_to_chat(167,"Thunder Mode")
	elseif CurrentElement == 'Aero' then
		CurrentElement = 'Stone'
		CurrentElementga = 'Stonega'
		stormName = 'Sandstorm'
		helixName = 'Geohelix'
		windower.add_to_chat(167,"Stone Mode")
	elseif CurrentElement == 'Blizzard' then
		CurrentElement = 'Aero'
		CurrentElementga = 'Aeroga'
		stormName = 'Windstorm'
		helixName = 'Anemohelix'
	elseif CurrentElement == 'Fire' then
		CurrentElement = 'Blizzard'
		CurrentElementga = 'Blizzaga'
		stormName = 'Hailstorm'
		helixName = 'Cryohelix'
		windower.add_to_chat(167,"Blizzard Mode")
	end
end

function sub_job_change(new,old)
	if new == 'BLM' or new == 'DRK' then
		send_command('lua l betastun2;')
	else
		send_command('lua u betastun2;')
	end
end

function self_command(command)
	if command == 'key_s' then
		send_command('input /ma "Stun" <t>;')
	elseif command:sub(1,7) == 'element' then
		targetElement = command:gsub("element ", "")
		targetElement = targetElement:gsub(" ", "")
		targetElement = targetElement:lower()
		if targetElement == 'water' then
			CurrentElement = 'Water'
			CurrentElementga = 'Waterga'
			stormName = 'Rainstorm'
			helixName = 'Hydrohelix'
			windower.add_to_chat(167,"Water Mode")
		elseif targetElement == 'thunder' then
			CurrentElement = 'Thunder'
			CurrentElementga = 'Thundaga'
			stormName = 'Thunderstorm'
			helixName = 'Ionohelix'
			windower.add_to_chat(167,"Thunder Mode")
		elseif targetElement == 'stone' then
			CurrentElement = 'Stone'
			CurrentElementga = 'Stonega'
			stormName = 'Sandstorm'
			helixName = 'Geohelix'
			windower.add_to_chat(167,"Stone Mode")
		elseif targetElement == 'aero' then
			CurrentElement = 'Aero'
			CurrentElementga = 'Aeroga'
			stormName = 'Windstorm'
			helixName = 'Anemohelix'
			windower.add_to_chat(167,"Aero Mode")
		elseif targetElement == 'blizzard' then
			CurrentElement = 'Blizzard'
			CurrentElementga = 'Blizzaga'
			stormName = 'Hailstorm'
			helixName = 'Cryohelix'
			windower.add_to_chat(167,"Blizzard Mode")
		elseif targetElement == 'fire' then
			CurrentElement = 'Fire'
			CurrentElementga = 'Firaga'
			stormName = 'Firestorm'
			helixName = 'Pyrohelix'
			windower.add_to_chat(167,"Fire Mode")
		end
	elseif command == 'trigger1' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ma "Cure III" <t>;')
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			next_element()
		else
			windower.add_to_chat(167,"No arts active.")
			next_element()
		end
	elseif command == 'next_element' then
		next_element()
	elseif command == 'prev_element' then
		prev_element()
	elseif command == 'trigger2' or command == 'mbmode' then
		if MBMode == 'Elemental Magic' then
			MBMode = 'Elemental Magic MB'
			windower.add_to_chat(050,"MB Mode [ON]")
		else
			MBMode = 'Elemental Magic'
			windower.add_to_chat(050,"MB Mode [OFF]")
		end
	elseif command == 'trigger3' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ma "Regen V" <t>;')
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			if nukeType == 'ga' and (CurrentElementga == 'Waterga' or CurrentElementga == 'Stonega' or CurrentElementga == 'Aeroga') and is_spell_ready(CurrentElementga..' II') then
				send_command('input /ma "'..CurrentElementga..' II" <t>;')
			else
				send_command('input /ma "'..CurrentElement..' II" <t>;')
			end
			if mirror_nuke then
				local target_info = windower.ffxi.get_mob_by_target('t')
				if type(target_info) == 'table' and target_info.id ~= nil then
					if nukeType == 'single' then
						execute_common_command('mirror ele '..CurrentElement..' single '..target_info.id)
					else
						execute_common_command('mirror ele '..CurrentElement..' aoe '..target_info.id)
					end
				end
			end
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'trigger4' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ma "Erase" <t>;')
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ma "'..CurrentElement..' III" <t>;')
			if mirror_nuke then
				local target_info = windower.ffxi.get_mob_by_target('t')
				if type(target_info) == 'table' and target_info.id ~= nil then
					if nukeType == 'single' then
						execute_common_command('mirror ele '..CurrentElement..' single '..target_info.id)
					else
						execute_common_command('mirror ele '..CurrentElement..' aoe '..target_info.id)
					end
				end
			end
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'trigger5' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ma "Haste" <t>;')
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ma "'..CurrentElement..' IV" <t>;')
			if mirror_nuke then
				local target_info = windower.ffxi.get_mob_by_target('t')
				if type(target_info) == 'table' and target_info.id ~= nil then
					if nukeType == 'single' then
						execute_common_command('mirror ele '..CurrentElement..' single '..target_info.id)
					else
						execute_common_command('mirror ele '..CurrentElement..' aoe '..target_info.id)
					end
				end
			end
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'trigger6' then
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ma "'..CurrentElement..' V" <t>;')
			if mirror_nuke then
				local target_info = windower.ffxi.get_mob_by_target('t')
				if type(target_info) == 'table' and target_info.id ~= nil then
					execute_common_command('mirror ele '..CurrentElement..' single '..target_info.id)
				end
			end
		else
			windower.add_to_chat(167,"No arts active.")
		end
	elseif command == 'trigger7' then
		send_command('input /ma "'..stormName..' II" <me>;')
	elseif command == 'trigger8' then
    	send_command('input /ma "'..helixName..' II" <t>;')
	elseif command == 'aoe_nuke' then
		if player.sub_job == 'BLM' then
			if CurrentElement == 'Aero' or CurrentElement == 'Stone' or CurrentElement == 'Water' then
				send_command('input /ma "'..CurrentElementga..' II" <t>;')
			else
				send_command('input /ma "'..CurrentElementga..'" <t>;')
			end
		end
	elseif command:slice(1,8) == 'nuke_req' then
		command = command:gsub("nuke_req ","")
		if command ~= nil and string.len(command) > 0 and #spellStack == 0 then
			local nuke_request = T{}
			local counter = 1
			for w in string.gmatch(command, "%w+") do
				nuke_request[counter] = w
				counter = counter + 1
			end
			if nuke_request[1] ~= nil then
				self_command('element '..nuke_request[1])
				if (nuke_request[2] == 'single' or nuke_request[2] == 'aoe') and nuke_request[3] ~= nil then
					local request_test = windower.ffxi.get_mob_by_id(nuke_request[3])
					if request_test ~= nil and request_test.id ~= nil then
						if nuke_request[2] ~= 'single' and player.sub_job == 'BLM' then
							if (CurrentElementga == 'Waterga' or CurrentElementga == 'Stonega' or CurrentElementga == 'Aeroga') and is_spell_ready(CurrentElementga..' II') then
								send_command('//'..CurrentElementga..'2 '..nuke_request[3])
							elseif is_spell_ready(CurrentElementga) then
								send_command('//'..CurrentElementga..' '..nuke_request[3])
							end
						else
							if buffactive['Addendum: Black'] and is_spell_ready(CurrentElement..' V') then
								send_command('//'..CurrentElement..'5 '..nuke_request[3])
							elseif buffactive['Addendum: Black'] and is_spell_ready(CurrentElement..' IV') then
								send_command('//'..CurrentElement..'4 '..nuke_request[3])
							elseif is_spell_ready(CurrentElement..' III') then
								send_command('//'..CurrentElement..'3 '..nuke_request[3])
							elseif is_spell_ready(CurrentElement..' II') then
								send_command('//'..CurrentElement..'2 '..nuke_request[3])
							elseif is_spell_ready(CurrentElement) then
								send_command('//'..CurrentElement..' '..nuke_request[3])
							end
						end
					end
				end
			end
		end
	elseif execute_common_command(command) then
		--done
	elseif command == 'tank' then
		if tank == true then
			tank = false
			windower.add_to_chat(167,"Tank mode [OFF]")
		else
			tank = true
			windower.add_to_chat(167,"Tank mode [ON]")
		end
	elseif command == 'acc' or command == 'macc' or command == 'spellAcc' or command == 'trigger9' then
        spell_acc:next()
        windower.add_to_chat(050,"Magic Accuracy ["..spell_acc:current().."]")
    elseif command == 'stunacc' then
        stun_acc:next()
        windower.add_to_chat(050,"Stun Accuracy ["..stun_acc:current().."]")
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
		if player.equipment.main == 'Tupsimati' and player.equipment.sub == 'Enki     ' then
			disable('main','sub')
			mythicTries = 0
			windower.add_to_chat(167,"Mythic [ON]")
		elseif mythicTries > 10 then
			windower.add_to_chat(050,"Mythic couldn't be equipped at this time.")
		else
			enable('main','sub')
			mythicTries = mythicTries +1
			send_command('wait 1;gs c mythic;')
		end
	elseif command:sub(1,6) == 'recast' then
		--windower.add_to_chat(050,"recast: "..command)
		command = command:gsub("recast", "")
		recastData = windower.ffxi.get_spell_recasts()
		windower.add_to_chat(050,"recast: "..command.." "..(recastData[spellIDs[command]]/60))
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
            return
        end
    elseif buffactive['sleep'] then
        if os.clock()-lastChat > 10 then
            send_command('input /p zzz')
            lastChat = os.clock()
            return
        end
    end

    if check_ready_silent() and player.x == lastx and player.y == lasty then
        if buffactive['silence'] and os.clock()-lastChat > 5 then
            send_command('input /item "Echo Drops" <me>;')
            lastChat = os.clock()
            return
        end

        --[[if party_target ~= false then
            target_to_use = party_target
            if is_spell_ready('Dia') then
                direct_push(stack_spells['Dia'], 'ma', target_to_use, false)
            end
        end]]

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
                elseif selfFix['cursna'] and (buffactive['doom'] or buffactive['curse']) and (player.sub_job == 'WHM' or check_white_status()) and is_spell_ready('Cursna') then
                    direct_push_front(stack_spells['Cursna'], 'ma', player.name, true)
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

function file_unload(new_job)
	windower.send_command('lua u betastun2;')
end