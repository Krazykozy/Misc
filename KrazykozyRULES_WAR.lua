include('organizer-lib.lua')
include('no_interruptions.lua')
include('how_about_no.lua')
include('spam_protection.lua')
include('common_commands.lua')
-- include('spell_stack.lua')

autoWS = I{true, false}
autoWSToUse = I{'Resolution'}
lowDamageWS = I{false, true}
tpMode = I{'Standard', 'Hybrid', 'DT'}
accMode = I{'LowAcc','HighAcc'}
rangedDelay = 168
PL = 'Nekachu'

function get_sets()
	load_gear_file()
end

function precast(spell,action)
	if check_ready(spell) then
		if spell.type == 'Ninjutsu' then
			equip(sets.precast['General'])
		elseif spell.type == 'WeaponSkill' then
			if spell.target.distance > 10 or player.tp < 900 then
				cancel_spell()
				return
			end

            -- Check if we have a set specific to this WS
			if sets[accMode:current()][spell.english] then
                -- If we're in a DT or Hybrid TP mode, and we have a safer WS set defined, use the safer set (i.e. no Argosy+1 suicide)
                if sets[accMode:current()][spell.english]['Safer'] and tpMode:current() ~= 'Standard' then
                    equip(sets[accMode:current()][spell.english]['Safer'])
                else
                    equip(sets[accMode:current()][spell.english])
                end

                --If we're nearing 3,000 tp, and we have a moonshade replacement set defined, use the mooonshade replacement
                if sets[accMode:current()][spell.english]['3000'] and player.tp > 2900 then
				    equip(sets[accMode:current()][spell.english]['3000'])
                end
			else
				equip(sets[accMode:current()]['WeaponSkill'])
			end

            if world.time >= 1020 or world.time < 420 then
                equip( sets['NightTime WeaponSkill'] )
            end

            if lowDamageWS:current() then
                windower.add_to_chat(050, '-------------------- LOW DAMAGE WS MODE IS ON --------------------')
                equip(sets['Low Damage Weaponskill'])
            end

			windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
		elseif sets[spell.english] then
            -- If we have a set named the same as the spell, use it i.e. sets['Mighty Strikes'] gets used when using Mighty Strikes
			equip(sets[spell.english])
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	if spell.type == 'Ninjutsu' then
		if spell.english == 'Utsusemi: Ichi' then
			equip(sets.midcast['General'])
			if buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				send_command('wait 1;cancel 66;cancel 446;cancel 445;cancel 444;')
			end
		else
			equip(sets.midcast['General'])
		end
    elseif spell.cast_time ~= nil then
        equip(sets.midcast['General'])
	end
end

function aftercast(spell,action)
    if spam_protection_off(spell)then
        handle_idle()
    end
    -- checkAftercast(spell)
end

function status_change(new,old)
	handle_idle()
end

function buff_change(buff,gain_or_loss)
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
	equipSet = sets['idle']

	if player.status ~= 'Engaged' then
		equipSet = set_combine(equipSet, sets['Running'])
	else
		equipSet = sets[accMode:current()][tpMode:current()]
	end

	equip(equipSet)
end

function self_command(command)
	if command == 'trigger3' or command == 'tp' then
		tpMode:setTo('Standard')
		windower.add_to_chat(167,"TP Mode [Standard]")
		handle_idle()
	elseif command == 'trigger2' or command == 'hybrid' then
		tpMode:setTo('Hybrid')
		windower.add_to_chat(167,"TP Mode [Hybrid]")
		handle_idle()
    elseif command == 'trigger4' or command == 'dt' then
        tpMode:setTo('DT')
        windower.add_to_chat(167,"TP Mode [DT]")
        handle_idle()
	elseif command == 'trigger5' or command == 'acc' then
        accMode:next()
		windower.add_to_chat(167,"Accuracy ["..tostring(accMode:current()).."]")
		handle_idle()
	elseif command == 'idle' then
		handle_idle()
	elseif command == 'dt' or command == 'knockback_dt' then
		equip(sets['DT'])
		windower.add_to_chat(167,"DT for TP on")
	elseif command == 'death_dt' then
		equip(sets['Death'])
		windower.add_to_chat(167,"DT for Death on")
	elseif command == 'dt_end' then
		handle_idle()
		windower.add_to_chat(167,"DT for TP ended")
	elseif command == 'sneak' then
		send_command('input /ma "Monomi: Ichi" <me>;')
    elseif command == 'wsmode' then
        lowDamageWS:next()
        windower.add_to_chat(167,"Low Damage WS Mode ["..tostring(lowDamageWS:current()).."]")
	elseif command == 'invisible' then
		send_command('input /ma "Tonko: Ni" <me>;')
    elseif execute_common_command(command) then
        --done
    -- elseif stack_command(command) then
    --     --done
	end
end

-- function handle_ping()
--     if buffactive['silence'] and os.clock()-lastChat > 5 then
--         send_command('input /item "Echo Drops" <me>;')
--         lastChat = os.clock()
--     end

--     if check_ready_silent() and player.x == lastx and player.y == lasty then

--         if player.status == 'Engaged' then
--             if player.tp >= 1000 and autoWS:current() then
--                 if party_target ~= false then
--                     target_to_use = party_target
--                     local_mobs = windower.ffxi.get_mob_by_id(party_target)
--                 else
--                     local_mobs = windower.ffxi.get_mob_by_target('t')
--                 end
--                 --if local_mobs.distance < 36 and not buffactive['amnesia'] and ((local_mobs.name == 'Fear Dearg' and local_mobs.hpp < 45) or local_mobs.name ~= 'Fear Dearg') then
--                 if local_mobs.distance < 36 and not buffactive['amnesia'] then
--                     direct_push(stack_weapon_skills[autoWSToUse:current()], 'ws', 't', false)
--                 end
--             else
--                 if player.sub_job == 'SAM' then
--                     if not buffactive['Hasso'] and is_ability_ready('Hasso') then
--                         direct_push(stack_job_abilities['Hasso'], 'ja', player.name, false)
--                     end
--                     if player.tp < 1000 and is_ability_ready('Meditate') then
--                         direct_push(stack_job_abilities['Meditate'], 'ja', player.name, false)
--                     end
--                 end
--             end
--         end

--         if player.status ~= 'Resting' then
--             if doCures then
--                 cure_process()
--             end
--             handleSpareTime()
--         end
--     else
--         lastx = player.x
--         lasty = player.y
--     end
-- end