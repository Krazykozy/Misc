include('spam_protection.lua')
include('common_commands.lua')
include('spell_stack.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

autoRoll = true
doCures = true
autoJA = true
autoWS = I{false,true}
autoShoot = I{false,true}

corsair_rolls = {
    corsair={roll="Corsair's Roll", lucky=5, unlucky=9},
    cor={roll="Corsair's Roll", lucky=5, unlucky=9},
    exp={roll="Corsair's Roll", lucky=5, unlucky=9},
    ninja={roll="Ninja's Roll", lucky=4, unlucky=8},
    nin={roll="Ninja's Roll", lucky=4, unlucky=8},
    hunter={roll="Hunter's Roll", lucky=4, unlucky=8},
    hunters={roll="Hunter's Roll", lucky=4, unlucky=8},
    chaos={roll="Chaos Roll", lucky=4, unlucky=8},
    drk={roll="Chaos Roll", lucky=4, unlucky=8},
    magus={roll="Magus's Roll", lucky=2, unlucky=6},
    healer={roll="Healer's Roll", lucky=3, unlucky=7},
    drachen={roll="Drachen Roll", lucky=4, unlucky=8},
    choral={roll="Choral Roll", lucky=2, unlucky=6},
    monk={roll="Monk's Roll", lucky=3, unlucky=7},
    beast={roll="Beast Roll", lucky=4, unlucky=8},
    samurai={roll="Samurai Roll", lucky=2, unlucky=6},
    sam={roll="Samurai Roll", lucky=2, unlucky=6},
    evoker={roll="Evoker's Roll", lucky=5, unlucky=9},
    smn={roll="Evoker's Roll", lucky=5, unlucky=9},
    rogue={roll="Rogue's Roll", lucky=5, unlucky=9},
    thf={roll="Rogue's Roll", lucky=5, unlucky=9},
    warlock={roll="Warlock's Roll", lucky=4, unlucky=8},
    fighter={roll="Fighter's Roll", lucky=5, unlucky=9},
    fighters={roll="Fighter's Roll", lucky=5, unlucky=9},
    war={roll="Fighter's Roll", lucky=5, unlucky=9},
    puppet={roll="Puppet Roll", lucky=3, unlucky=7},
    gallant={roll="Gallant's Roll", lucky=3, unlucky=7},
    pld={roll="Gallant's Roll", lucky=3, unlucky=7},
    wizard={roll="Wizard's Roll", lucky=5, unlucky=9},
    blm={roll="Wizard's Roll", lucky=5, unlucky=9},
    dancer={roll="Dancer's Roll", lucky=3, unlucky=7},
    scholar={roll="Scholar's Roll", lucky=2, unlucky=6},
    naturalist={roll="Naturalist's Roll", lucky=3, unlucky=7},
    runeist={roll="Runeist's Roll", lucky=4, unlucky=8},
    bolter={roll="Bolter's Roll", lucky=3, unlucky=9},
    bolt={roll="Bolter's Roll", lucky=3, unlucky=9},
    caster={roll="Caster's Roll", lucky=2, unlucky=7},
    courser={roll="Courser's Roll", lucky=3, unlucky=9},
    blitzer={roll="Blitzer's Roll", lucky=4, unlucky=9},
    tactician={roll="Tactician's Roll", lucky=5, unlucky=8},
    tp={roll="Tactician's Roll", lucky=5, unlucky=8},
    allies={roll="Allies' Roll", lucky=3, unlucky=10},
    miser={roll="Miser's Roll", lucky=5, unlucky=7},
    companion={roll="Companion's Roll", lucky=2, unlucky=10},
    avenger={roll="Avenger's Roll", lucky=4, unlucky=8},
}
roll_1 = 'samurai'
finished_rolling_1 = false
roll_2 = 'rogue'
finished_rolling_2 = false

function get_sets()
    tp_mode_type = I{'Standard','DT'}
	accMode = I{'LowAcc','HighAcc'}

	load_gear_file()
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
		if spell.cast_time ~= nil and spell.cast_time > 0 then
			equip(sets.precast['General'])
        elseif spell.type == 'CorsairShot' then
            equip(sets.precast['CorsairShot'])
        elseif spell.type == 'CorsairRoll' then
            equip(sets.precast['CorsairRoll'])
		elseif spell.type == 'WeaponSkill' then
			if spell.target.distance > 10 or player.tp < 900 then
				cancel_spell()
				return
			end

            if sets[accMode:current()][spell.english] then
                equip(sets[accMode:current()][spell.english])
			elseif sets[spell.english] then
				equip(sets[spell.english])
			else
				equip(sets[accMode:current()]['WeaponSkill'])
			end

			windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
        elseif sets[accMode:current()][spell.english] then
            equip(sets[accMode:current()][spell.english])
        elseif sets.precast[spell.english] then
            cast_speed = 0.45
            equip(sets.precast[spell.english])
		elseif sets[spell.english] then
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
    elseif spell.type == 'CorsairShot' then
        equip(sets.midcast['CorsairShot'])
    elseif spell.english == "Ranged" then
        equip(sets[accMode:current()].Ranged)
	end
end

function aftercast(spell,action)
	if spam_protection_off(spell)then
		handle_idle()
	end
	checkAftercast(spell)
end

function status_change(new,old)
	handle_idle()
end

function buff_change(buff,gain_or_loss)
    check_for_aftermath_timers(buff, gain_or_loss)
    check_for_weakness_timers(buff, gain_or_loss)
end

function handle_idle()
	equipSet = sets['idle']

	if player.status ~= 'Engaged' then
		equipSet = set_combine(equipSet, sets['Running'])
	else
		equipSet = sets[accMode:current()][tp_mode_type:current()]
	end

	equip(equipSet)
end

function self_command(command)
    if command == 'trigger1' or command == 'trigger2' or command == 'trigger3' then
        tp_mode_type:next()
        windower.add_to_chat(167,"TP Mode ["..tp_mode_type:current().."]")
        handle_idle()
	elseif command == 'trigger4' or command == 'tp' then
        tp_mode_type:setTo('Standard')
		windower.add_to_chat(167,"TP Mode ["..tp_mode_type:current().."]")
		handle_idle()
	elseif command == 'trigger5' or command == 'dt' then
        tp_mode_type:setTo('DT')
		windower.add_to_chat(167,"TP Mode ["..tp_mode_type:current().."]")
		handle_idle()
    elseif command == 'trigger6' or command == 'acc' then
        accMode:next()
        windower.add_to_chat(167,"Acc Mode ["..accMode:current().."]")
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
    elseif command == 'autoroll' then
        if autoRoll then
            autoRoll = false
            windower.add_to_chat(167,"Auto-Roll [OFF]")
        else
            autoRoll = true
            windower.add_to_chat(167,"Auto-Roll [ON]")
        end
    elseif command:sub(1,5) == 'roll ' then
        commandSplit = T{}
        command = command:gsub("[%w ]+","%1")
        command = command:lower()
        if #command > 5 then
            command = command:sub(5,#command)
            commandSplit = string.split(command," ")
            j = 1
            for i=1, #commandSplit, 1 do
                for shortcutName,rollData in pairs(corsair_rolls) do
                    if commandSplit[i] and commandSplit[i]:lower() == shortcutName then
                        if j == 1 then
                            roll_1 = shortcutName
                        elseif j == 2 then
                            roll_2 = shortcutName
                        end
                        j = j + 1
                        windower.add_to_chat(050,'Adding '..rollData.roll)
                    end
                end
            end
        end
    elseif command == 'sneak' then
        if player.sub_job == 'DNC' then
            send_command('input /ja "Spectral Jig" <me>;')
        elseif player.sub_job == 'WHM' or player.sub_job == 'RDM' then
            if #spellStack > 0 then
                direct_push(stack_spells['Sneak'], 'ma', player.name, false)
            else
                send_command('input /ma "Sneak" <me>;')
            end
        end
    elseif command == 'invisible' then
        if player.sub_job == 'WHM' or player.sub_job == 'RDM' then
            if #spellStack > 0 then
                direct_push(stack_spells['Invisible'], 'ma', player.name, false)
            else
                send_command('input /ma "Invisible" <me>;')
            end
        end
    elseif command == 'cp' then
        roll_1 = 'corsair'
        roll_2 = 'wizard'
        if player.name == 'Krazykozy' then
            roll_1 = 'choral'
            roll_2 = 'gallant'
        end
        autoRoll = true
    elseif command == 'cp' then
        roll_1 = 'corsair'
        roll_2 = 'wizard'
        if player.name == 'Krazykozy' then
            roll_1 = 'choral'
            roll_2 = 'gallant'
        end
        autoRoll = true
    elseif command == 'ambu' or command == 'melee buffs' or command == 'omen trash' or command == 'levi' then
        dtMode = true
        autoJA = true
        auto1hr = true
        autoSS = false
        autoRoll = true
        roll_1 = 'samurai'
        roll_2 = 'fighter'
        if player.sub_job == 'WHM' or player.sub_job == 'RDM' then
            auto_spell_toggle('Krazykozy', 'Haste', {force_on=true})
            auto_spell_toggle('Krazykozy', 'Haste', {force_on=true})
        end
    elseif command == 'ambu melee' then
        dtMode = true
        autoJA = true
        auto1hr = true
        autoSS = false
        autoRoll = true
        roll_1 = 'samurai'
        roll_2 = 'chaos'
        if player.sub_job == 'WHM' or player.sub_job == 'RDM' then
            direct_push(stack_spells['Stoneskin'], 'ma', player.name, false)
            direct_push(stack_spells['Blink'], 'ma', player.name, false)
        end
    elseif command == 'ambu' or command == 'ambu mage' then
        dtMode = true
        autoJA = true
        auto1hr = true
        autoSS = false
        autoRoll = true
        roll_1 = 'warlock'
        roll_2 = 'evoker'
    elseif command == 'trials' then
        dtMode = false
        autoJA = true
        autoSS = false
        autoRoll = true
        roll_1 = 'samurai'
        roll_2 = 'tactician'
    elseif command == 'autows' then
        autoWS:next()
        windower.add_to_chat(050,'Auto WS ['..autoWS:current()..']')
    elseif command == 'autoshoot' then
        autoShoot:next()
        windower.add_to_chat(050,'Auto Shoot ['..autoShoot:current()..']')
	elseif execute_common_command(command) then
	elseif stack_command(command) then
	end
end

function handle_ping()
	if buffactive['silence'] and os.clock()-lastChat > 5 then
		send_command('input /item "Echo Drops" <me>;')
		lastChat = os.clock()
	end

	if check_ready_silent() and player.x == lastx and player.y == lasty then
        if player.sub_job == 'WHM' then
    		if autoSS and not buffactive['Stoneskin'] and is_spell_ready('Stoneskin') then
    			direct_push(stack_spells['Stoneskin'], 'ma', player.name, false)
    		end
    		if autoBlink and not buffactive['Blink'] and is_spell_ready('Blink') then
    			direct_push(stack_spells['Blink'], 'ma', player.name, false)
    		end
    		if autoAquaveil and not buffactive['Aquaveil'] and is_spell_ready('Aquaveil') then
    			direct_push(stack_spells['Aquaveil'], 'ma', player.name, false)
    		end
        end

        --[[if party_target ~= false then
            target_to_use = party_target
            if is_spell_ready('Dia') then
                direct_push(stack_spells['Dia'], 'ma', target_to_use, false)
            end
        end]]

        if player.status == 'Engaged' and autoShoot:current() then
            if autoWS:current() and player.tp >= 1000 then
                add_to_back(stack_weapon_skills['Last Stand'], 't', {})
            else
                add_to_back('Ranged Attack', 't', {})
            end

            if autoJA then
                if player.sub_job == 'WAR' and player.sub_job_level == 49 then
                    if not buffactive['Berserk'] and is_ability_ready('Berserk') then
                        add_to_front(stack_job_abilities['Berserk'], player.name, {})
                    end
                elseif player.sub_job == 'SAM' and player.sub_job_level == 49 then
                    if not buffactive['Meditate'] and is_ability_ready('Meditate') then
                        add_to_front(stack_job_abilities['Meditate'], player.name, {})
                    end
                end

                if not buffactive['Triple Shot'] and is_ability_ready('Triple Shot') then
                    add_to_front(stack_job_abilities['Triple Shot'], player.name, {})
                end
            end
        end

        check_auto_spell()

        if doCures then
            cure_process()
        end

        if autoRoll then
            if not buffactive[corsair_rolls[roll_1].roll] or finished_rolling_1 == false then
                finished_rolling_1 = do_main_corsair_roll(corsair_rolls[roll_1].roll, corsair_rolls[roll_1].lucky, 7)
            elseif not buffactive[corsair_rolls[roll_2].roll] or finished_rolling_2 == false  then
                finished_rolling_2 = do_main_corsair_roll(corsair_rolls[roll_2].roll, corsair_rolls[roll_2].lucky, 7)
            end
        end

		if player.status ~= 'Resting' then
			handleSpareTime()
		end
	else
		lastx = player.x
		lasty = player.y
	end
end