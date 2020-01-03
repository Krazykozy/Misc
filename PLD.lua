include('how_about_no.lua')
include('no_interruptions.lua')
include('spam_protection.lua')
include('common_commands.lua')
include('spell_stack.lua')
--include('keep-my-shield-on.lua')

lastChat = 0
lastJAUse = os.clock()-60
autoHate = I{true, false}
autoDefender = I{false, true}
autoReprisal = I{true, false}
autoEnlight = I{true, false}
autoPhalanx:setTo(true)
doCures = false
allianceCheck = false
allianceHeal = false
bluSpellCastRate = 8
jaUseRate = 45
lastBluSpellCastTime = 0


autoWS = I{false, true}
autoWSToUse = I{'Savage Blade', 'Chant Du Cygne', 'Red Lotus Blade', 'Atonement'}

function get_sets()
    TPSetName = "PDT"
    resetShield = 'Aegis'
    targetLevel = 'HighAcc'
    PL = 'Nekachu'
    songs = 'march march mad mad'

	send_command('input /macro book 1;')

	--load_gear_file()
	include('gear/Ulor_PLD.lua')
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
end

function precast(spell,action)
	if check_ready(spell) then
		if player.target.hpp ~= nil and player.target.hpp <= 30 and player.target.name == 'Ark Angel MR' then
			if player.equipment.sub ~= 'Aegis' then
				equip({sub='Aegis'})
				windower.add_to_chat(167,"Equipping Aegis")
			end
		end

		if spell.type == 'JobAbility' then
			if sets[targetLevel][spell.english] then
				equip(sets[targetLevel][spell.english])
			else
				equip(sets[targetLevel]['EnmitySet'])
			end
		elseif spell.type == 'WeaponSkill' then
			if spell.target.distance > 10 or player.tp < 900 then
				cancel_spell()
				return
			end

			equipSet = sets[targetLevel]['WeaponskillSet']

			if spell.english== 'Atonement' then
				equipSet = sets[targetLevel]['Atonement']
			elseif sets[targetLevel][spell.english] then
				equipSet = sets[targetLevel][spell.english]

				if world.time >= 1020 or world.time < 420 then
					equipSet = set_combine(equipSet,sets['NightTime'])
				end
			else
				if world.time >= 1020 or world.time < 420 then
					equipSet = set_combine(equipSet,sets['NightTime'])
				end
				if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
					equipSet = set_combine(equipSet,sets['DayAlign'])
				end
			end

			equip(equipSet)

			windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
		elseif spell.type == 'WhiteMagic' then
			if spell.skill == "Enhancing Magic" then
				equip(sets[targetLevel]['PreEnhance'])
			else
				if spell.english:slice(1,4) == 'Cure' then
					if spell.english == 'Cure IV' and spell.target.name == player.name and player.hpp > 75 then
						equip(sets[targetLevel]['CureCheatSet'])
					else
						equip(sets[targetLevel]['PreCast'])
					end
				else
					equip(sets[targetLevel]['PreCast'])
				end
			end
        elseif spell.type == 'BlueMagic' then
            equip(sets['BlueMagic']['PreCast'])
		elseif spell.type == 'Ninjutsu' then
			equip(sets[targetLevel]['PreCast'])
		elseif spell.type == 'Waltz' then
			if spell.english:find('Curing Waltz') then
				equip(sets['WaltzSet'])
			end
		elseif spell.type == 'Trust' then
			equip(sets['Trust'])
		elseif spell.cast_time ~= nil then
			equip(sets[targetLevel]['PreCast'])
		end
        set_priorities('hp')
		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	if spell.type == 'Ninjutsu' then
		if spell.english == 'Utsusemi: Ichi' then
			if buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] then
				send_command('wait: 2.0;cancel 66;cancel 446;cancel 445;cancel 444;')
			end
		end
		equip(sets[targetLevel]['CastingSet'])
    elseif spell.type == 'BlueMagic' then
        equip(sets['BlueMagic']['Midcast'])
	elseif spell.type == 'WhiteMagic' then
		if spell.english:slice(1,4) == 'Cure' then
			if spell.target.name == player.name then
				equip(sets[targetLevel]['SelfCureSet'])
			elseif spell.target.name ~= player.name then
				if spell.element == world.weather_element or spell.element == world.day_element then
					equip(sets[targetLevel]['CurePotencySet'], sets[spell.element])
				else
					equip(sets[targetLevel]['CurePotencySet'])
				end
			end
		elseif spell.english == 'Flash' or spell.english == 'Reprisal' then
			equip(sets[targetLevel]['CastingSet'])
		elseif spell.skill == 'Divine Magic' then
			if spell.english == 'Enlight' or spell.english == 'Enlight II' then
				equip(sets[targetLevel]['Divine Magic'])
			else
				if spell.element == world.weather_element or spell.element == world.day_element then
					equip(sets[targetLevel]['NukeSet'], sets[spell.element])
				else
					equip(sets[targetLevel]['NukeSet'])
				end
			end
		elseif spell.english == 'Phalanx' then
			equip(sets[targetLevel]['PhalanxSet'])
		else
			equip(sets[targetLevel]['CastingSet'])
		end
	elseif spell.type == 'Trust' then
		equip(sets['Trust'])
	elseif spell.cast_time ~= nil then
		equip(sets[targetLevel]['CastingSet'])
	end
    set_priorities('hp')
end

function aftercast(spell,action)
	if spam_protection_off(spell)then
		handle_idle()
        set_priorities('hp')
	end
	checkAftercast(spell)
end

function status_change(new,old)
	handle_idle()
end

function buff_change(buff,gain_or_loss)
    check_for_aftermath_timers(buff, gain_or_loss)
    check_for_weakness_timers(buff, gain_or_loss)
    notify_party_of_troublesome_debuffs(buff, gain_or_loss)
	if gain_or_loss then
		if buff == 'doom' then
			equip(sets['doom'])
            set_priorities('hp')
		end
	end
end

function handle_idle()
	equipSet = sets[targetLevel][TPSetName]

	if player.equipment.main == 'empty' then
		equipSet = set_combine(equipSet, {main="Burtgang"})
		windower.add_to_chat(167,"Equipping Burtgang")
	end
	if player.equipment.sub == 'empty' then
		equipSet = set_combine(equipSet, {sub=resetShield})
		windower.add_to_chat(167,"Equipping "..resetShield)
	end

	if player.status == 'Idle' and not superTank then
		equipSet = set_combine(equipSet, sets[targetLevel]['RunningSet'])
	end

	if buffactive['Cover'] then
		equipSet = set_combine(equipSet, sets['coverActive'])
	end

	if player.mpp < 30 then
		equipSet = set_combine(equipSet, sets['mpAbsorb'])
	end

	if buffactive['doom'] then
		equipSet = set_combine(equipSet,sets['doom'])
	end

	equip(equipSet)
    set_priorities('hp')
end

function self_command(command)
	if command == 'trigger1' then
		enable('head','body')
		if player.sub_job == 'DNC' then
			if TPSetName == 'DWTPSet' then
				TPSetName = 'TPSet'
			else
				TPSetName = 'DWTPSet'
			end
		else
			TPSetName = 'TPSet'
		end
		windower.add_to_chat(167,targetLevel.." TP Mode ["..TPSetName.."]")
		handle_idle()
	elseif command == 'trigger2' then
		enable('head','body')
		TPSetName = "RR"
		windower.add_to_chat(167,targetLevel.." Auto RR Mode [ON]")
		handle_idle()
		send_command('wait 0.5;gs disable head body;')
	elseif command == 'trigger3' then
		enable('head','body')
		TPSetName = "PDT_acc"
		windower.add_to_chat(167,targetLevel.." PDT + Acc Mode [ON]")
		handle_idle()
	elseif command == 'trigger4' then
		enable('head','body')
		TPSetName = "PDT"
		windower.add_to_chat(167,targetLevel.." PDT Mode [ON]")
		handle_idle()
	elseif command == 'trigger5' then
		enable('head','body')
		TPSetName = "DT"
		windower.add_to_chat(167,targetLevel.." DT Mode [ON]")
		handle_idle()
	elseif command == 'trigger6' then
		enable('head','body')
		TPSetName = "BDT"
		windower.add_to_chat(167,targetLevel.." BDT Mode [ON]")
		handle_idle()
	elseif command == 'dt_acc' then
		enable('head','body')
		TPSetName = "PDT_acc"
		windower.add_to_chat(167,targetLevel.." DT + Acc Mode [ON]")
		handle_idle()
	elseif command == 'dt' then
		equip(sets['HighAcc']['PDT'])
		windower.add_to_chat(167,"DT for TP on")
	elseif command == 'knockback_dt' then
		equip(sets['Knockback'])
		windower.add_to_chat(167,"DT + Repulse Mantle for Knockback TP on")
	elseif command == 'death_dt' then
		equip(sets['Death'])
		windower.add_to_chat(167,"DT for Death TP on")
	elseif command == 'mdt' then
		if player.tp < 1500 then
			equip(sets['HighAcc']['PDT'], {sub="Aegis"})
			windower.add_to_chat(167,"MDT for Spell on")
		end
	elseif command == 'dt_end' then
		handle_idle(resetShield)
		windower.add_to_chat(167,"DT for TP ended")
	elseif command == 'sneak' then
		send_command('send nekachu //sneak '..player.name..';')
	elseif command == 'invisible' then
		send_command('send nekachu //invisible '..player.name..';')
	elseif command == 'acc' then
		if targetLevel == 'HighAcc' then
			targetLevel = 'LowAcc'
			windower.add_to_chat(167,"Target Level [LowAcc]")
		elseif targetLevel == 'LowAcc' then
			targetLevel = 'MidAcc'
			windower.add_to_chat(167,"Target Level [MidAcc]")
		else
			targetLevel = 'HighAcc'
			windower.add_to_chat(167,"Target Level [HighAcc]")
		end
	elseif command == 'data' then
		mobData = windower.ffxi.get_mob_by_target('t')
		if mobData ~= nil then
			for index,value in pairs(mobData) do
				if index == 'index' then
					windower.add_to_chat(158,index..' '..tostring(value))
				end
			end
		end
	elseif command:slice(1,10) == 'changesong' then
		songs = command:gsub("changesong ", "")
		windower.add_to_chat(028, 'Songs changed to '..songs)
	elseif command == 'request_songs' then
		local songsUp = 0
		if buffactive['carol'] then
			songsUp = songsUp + buffactive['carol']
		end
		if buffactive['minuet'] then
			songsUp = songsUp + buffactive['minuet']
		end
		if buffactive['march'] then
			songsUp = songsUp + buffactive['march']
		end
		if buffactive['ballad'] then
			songsUp = songsUp + buffactive['ballad']
		end
		if buffactive['minne'] then
			songsUp = songsUp + buffactive['minne']
		end
		if buffactive['madrigal'] then
			songsUp = songsUp + buffactive['madrigal']
		end
		if buffactive['Scherzo'] then
			songsUp = songsUp + 1
		end

		if songsUp <= 3 then
			send_command('send Mazuki gs c 3song;wait 0.1;send mazuki gs c sing '..songs..' '..player.name..';')
			windower.add_to_chat(028, 'Asked for 3 songs')
		else
			send_command('send Mazuki gs c 4song;wait 0.1;send mazuki gs c sing '..songs..' '..player.name..';')
			windower.add_to_chat(028, 'Asked for 4 songs')
		end
	elseif command == 'supertank' then
		if superTank then
			superTank = false
			windower.add_to_chat(028, "Super Tank mode [OFF]")
		else
			superTank = true
			windower.add_to_chat(028, "Super Tank mode [ON]")
		end
	elseif command == 'autodefender' then
        autoDefender:next()
		windower.add_to_chat(028, "Auto Defender ["..tostring(autoDefender:current()).."]")
	elseif command == 'pl' then
		if PL == 'Nekachu' then
			PL = 'Mazuki'
			windower.add_to_chat(028, "PL is now [Mazuki]")
		else
			PL = 'Nekachu'
			windower.add_to_chat(028, "PL is now [Nekachu]")
		end
	elseif command == 'ws' then
        if player.status == 'Engaged' and player.tp >= 1000 then
            if player.equipment.main == 'Burtgang' then
                if buffactive['Aftermath: Lv.3'] then
                    direct_push_front(stack_weapon_skills[autoWSToUse:current()], 'ws', 't', false)
                elseif player.tp == 3000 then
                    direct_push_front(stack_weapon_skills['Atonement'], 'ws', 't', false)
                end
            else
                direct_push_front(stack_weapon_skills[autoWSToUse:current()], 'ws', 't', false)
            end
		end
	elseif command == 'autovoke' or command == 'autohate' then
        autoHate:next()
        windower.add_to_chat(028, "Auto Hate ["..tostring(autoHate:current()).."]")
    elseif command == 'autoreprisal' then
        autoReprisal:next()
        windower.add_to_chat(028, "Auto Reprisal ["..tostring(autoReprisal:current()).."]")
    elseif command == 'autoenlight' then
        autoEnlight:next()
        windower.add_to_chat(028, "Auto Enlight ["..tostring(autoEnlight:current()).."]")
	elseif command == 'autows' then
        autoWS:next()
        windower.add_to_chat(028, "Auto WS ["..tostring(autoWS:current()).."]")
	elseif command == 'wstouse' then
        autoWSToUse:next()
		windower.add_to_chat(028, "Auto WS ["..autoWSToUse:current().."]")
    elseif command == 'ambu' or command == 'levi' or command == 'ambu melee' or command == 'ambu2' or command == 'ambu mage' or command == 'omen trash' or command == 'quetz' then
        autoEnlight:setTo(false)
        allowFollow:setTo(false)
        direct_push(stack_spells['Crusade'], 'ma', player.name, false)
        direct_push(stack_spells['Phalanx'], 'ma', player.name, false)
        direct_push(stack_spells['Enlight II'], 'ma', player.name, false)
	elseif execute_common_command(command) then
	elseif stack_command(command) then
		--done
    elseif command == 'mb_light' then
        target_to_use = 'bt'
        if party_target ~= false then
            target_to_use = party_target
        end
        if is_spell_ready('Flash') then
            direct_push_front(stack_spells['Flash'], 'ma', target_to_use, false)
        elseif is_spell_ready('Holy') then
            direct_push_front(stack_spells['Holy'], 'ma', target_to_use, false)
        end
	end
end

function handle_ping()
    -- local players = windower.ffxi.get_party()
    -- for index,p in pairs(players) do
    --     if type(p) == 'table' and p.name ~= nil and p.mob ~= nil and type(p.mob) == 'table' and p.mob.x ~= nil and p.mob.y ~= nil then
    --         if p.name == 'Miang' then
    --             run_to_distance(3, p.mob.x, p.mob.y)
    --         end
    --     end
    -- end



    if player.hp == 0 and (#spellStack > 0 or party_target ~= false) then
        party_target = false
        clear_spell_stack()
        windower.add_to_chat(028,'Unsetting any party target and clearing stack')
    end

    if buffactive['doom'] and os.clock()-lastChat > 5 then
        send_command('input /p Doom;wait 0.5;')
        lastChat = os.clock()
	elseif buffactive['silence'] and os.clock()-lastChat > 5 then
		send_command('input /item "Echo Drops" <me>;')
		lastChat = os.clock()
	--elseif buffactive['poison'] and os.clock()-lastChat > 5 then
	--	send_command('input /item "Antidote" <me>;')
	--	lastChat = os.clock()
	end

    doNothingElse = false
    if buffactive['doom'] and os.clock()-lastChat > 2 then
        local bag_data = windower.ffxi.get_items(0)
        if checkNumberOfItem(bag_data,5306) then
            send_command('input /item "Hallowed Water" <me>;')
            doNothingElse = true
        elseif checkNumberOfItem(bag_data,4154) then
            send_command('input /item "Holy Water" <me>;')
            doNothingElse = true
        end
        send_to_alts_in_range('gs c directstring doom '..player.name..';')
        lastChat = os.clock()
    --elseif (buffactive['vit down'] or buffactive['defense down'] or buffactive['magic def. down'] or buffactive['max hp down']) and os.clock()-lastChat > 2 then
    --    local bag_data = windower.ffxi.get_items(0)
    --    if checkNumberOfItem(bag_data,4149) then
    --        send_command('input /item "Panacea" <me>;')
    --        doNothingElse = true
    --    end
    --    send_to_alts_in_range('gs c directstring erase '..player.name..';')
    --    lastChat = os.clock()
    end

	if doNothingElse == false and check_ready_silent() and player.x == lastx and player.y == lasty then
		local thisHealNeeded = player.max_hp-player.hp

		if player.hpp < 50 and thisHealNeeded > 500 and os.clock()-lastChat > 15 then
			windower.play_sound(windower.addon_path..'data/sounds/alarm.wav')
			lastChat = os.clock()
		end

		if player.status == 'Engaged' or party_target ~= false then
            target_to_use = 't'
            if party_target ~= false then
                target_to_use = party_target
                local_mobs = windower.ffxi.get_mob_by_id(party_target)
            else
                local_mobs = windower.ffxi.get_mob_by_target('t')
            end

            if autoHate:current() then
                if player.sub_job == 'WAR' then
                    if local_mobs.distance < 256 and is_ability_ready('Provoke') then
                        direct_push(stack_job_abilities['Provoke'], 'ja', target_to_use, false)
                    end
                elseif player.sub_job == 'BLU' and os.clock() - lastBluSpellCastTime > bluSpellCastRate and local_mobs.id ~= 17526883 then
                    if local_mobs.distance <= spell_distances[stack_spells['Jettatura'].range] and is_spell_ready('Jettatura') then
                        direct_push(stack_spells['Jettatura'], 'ma', target_to_use, false)
                        lastBluSpellCastTime = os.clock()
                    elseif local_mobs.distance <= spell_distances[stack_spells['Geist Wall'].range] and is_spell_ready('Geist Wall') then
                        direct_push(stack_spells['Geist Wall'], 'ma', party_target)
                        lastBluSpellCastTime = os.clock()
                    elseif local_mobs.distance <= spell_distances[stack_spells['Sheep Song'].range] and is_spell_ready('Sheep Song') then
                        direct_push(stack_spells['Sheep Song'], 'ma', party_target)
                        lastBluSpellCastTime = os.clock()
                    end
                end
    			if local_mobs.distance <= 442 and is_spell_ready('Flash') then
    				direct_push(stack_spells['Flash'], 'ma', target_to_use, false)
    			end
            end

            if local_mobs ~= nil and local_mobs.name ~= nil and local_mobs.name ~= 'Yakshi' and local_mobs.name ~= 'Glassy Gorger' then
    			if autoHate:current() and not buffactive['enmity boost'] and is_spell_ready('Crusade') then
    				direct_push(stack_spells['Crusade'], 'ma', player.name, false)
    			end
    			if autoReprisal:current() and not buffactive['reprisal'] and is_spell_ready('Reprisal') then
    				direct_push(stack_spells['Reprisal'], 'ma', player.name, false)
    			end
    			if autoPhalanx:current() and not buffactive['phalanx'] and is_spell_ready('Phalanx') then
    				direct_push(stack_spells['Phalanx'], 'ma', player.name, false)
    			end
    			if autoEnlight:current() and not buffactive['enlight'] and is_spell_ready('Enlight II') then
    				direct_push(stack_spells['Enlight II'], 'ma', player.name, false)
    			end
    			if autoDefender:current() and player.sub_job == 'WAR' and is_ability_ready('Defender') then
    				direct_push(stack_job_abilities['Defender'], 'ja', player.name, false)
    			end
                if autoHate:current() and os.clock()-lastJAUse > jaUseRate then
                    if is_ability_ready('Sentinel') then
                        direct_push(stack_job_abilities['Sentinel'], 'ja', player.name, false)
                    elseif is_ability_ready('Rampart') then
                        direct_push(stack_job_abilities['Rampart'], 'ja', player.name, false)
                    elseif is_ability_ready('Palisade') then
                        direct_push(stack_job_abilities['Palisade'], 'ja', player.name, false)
                    elseif is_ability_ready('Shield Bash') and target_to_use == 't' and local_mobs.distance < 36 then
                        direct_push(stack_job_abilities['Shield Bash'], 'ja', target_to_use, false)
                    elseif player.sub_job == 'WAR' and is_ability_ready('Warcry') then
                          direct_push(stack_job_abilities['Warcry'], 'ja', player.name, false)
                    end
                    lastJAUse = os.clock()
                end
            end

            if player.sub_job == 'DNC' then
                if player.tp > 100 and not buffactive['Finishing Move 2'] and not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] and is_ability_ready('Box Step') then
                    direct_push(stack_job_abilities['Box Step'], 'ja', target_to_use, false)
                end
                if (buffactive['Finishing Move 2'] or buffactive['Finishing Move 3'] or buffactive['Finishing Move 4'] or buffactive['Finishing Move 5']) and is_ability_ready('Violent Flourish') then
                    direct_push(stack_job_abilities['Violent Flourish'], 'ja', target_to_use, false)
                end
            end

			if autoWS:current() and player.status == 'Engaged' and player.tp >= 1000 and local_mobs.distance < 36 and not buffactive['amnesia'] then
                if player.equipment.main == 'Burtgang' then
                    if buffactive['Aftermath: Lv.3'] then
                        direct_push_front(stack_weapon_skills[autoWSToUse:current()], 'ws', target_to_use, false)
                    elseif player.tp == 3000 then
                        direct_push_front(stack_weapon_skills['Atonement'], 'ws', target_to_use, false)
                    end
                else
                    direct_push_front(stack_weapon_skills[autoWSToUse:current()], 'ws', target_to_use, false)
                end
			end
		end

        if player.sub_job == 'NIN' then
            if not buffactive['Copy Image (2)'] and not buffactive['Copy Image (3)'] and not buffactive['Copy Image (4)'] then
                if is_spell_ready('Utsusemi: Ni') then
                    direct_push_front(gearswap.res.spells[339], 'ma', player.name, false)
                elseif is_spell_ready('Utsusemi: Ichi') then
                    direct_push_front(gearswap.res.spells[338], 'ma', player.name, false)
                end
            end
        end

		if player.status ~= 'Resting' then
			if doCures then
				cure_process()
			end
			handleSpareTime()
		end
	else
		lastx = player.x
		lasty = player.y
	end
end