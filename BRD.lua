include('common_commands.lua')
include('how_about_no.lua')
include('organizer-lib.lua')
include('no_interruptions.lua')
include('spam_protection.lua')
include('spell_stack.lua')
-- include('includes/file_logging')

-- Don't listen to requests to assist meleeing targets
allow_engage:setTo(false)

lullabyWearing = false
--Duration of non JA songs
songDuration = 120
--Duration of JA songs
songDurationJA = 420
--self_status_fix
totalSongs = 3
currentMaxSongs = totalSongs

dummySongs = T{stack_spells['Earth Carol II'], stack_spells['Light Carol II']}
threnodies = I{'Ice Threnody', 'Lightning Threnody', 'Earth Threnody', 'Wind Threnody', 'Ice Threnody', 'Light Threnody', 'Dark Threnody', 'Fire Threnody'}
maccLevel = I{'Low', 'Mid', 'High'}

function get_sets()
	currentThrenody = 'Fire Threnody'
	songMode = 'Gjallarhorn'
	mythicTries = 0
	lastSongs = 0
	lastChat = 0
	doCures = true
	allianceCheck = true
	allianceHeal = false
	autoJA = false
	auto1hr = false
	autoSS = false
	lastx = 0
	lasty = 0
	songs = T{}
	doingSV = false
	replaceSong = "Sentinel's Scherzo"
	dtMode = false
	justUsedJA = false

	send_command('input /macro book 1;wait 15;gs c check_has_marsyas;')
    self_command('check_has_marsyas')

    load_gear_file()

    if sets['ExtraSong']['PrecastSet'].range == 'Daurdabla' then
        totalSongs = 4
    end
    currentMaxSongs = totalSongs
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

    if buffactive['Nightingale'] and buffactive['Troubadour'] then
        if spell.english == "Honor March" then
            equip(sets['Honor March']['MidcastSet'])
        elseif spell.english:sub(1,13) == "Mage's Ballad" then
            equip(sets['Gjallarhorn']['BalladMidcast'])
        elseif spell.english == "Sentinel's Scherzo" then
            equip(sets['Gjallarhorn']['Scherzo'])
        elseif spell.english == 'Horde Lullaby' or spell.english == 'Horde Lullaby II' then
            equip(sets[maccLevel:current()]['Horde Lullaby'])
        elseif spell.english == 'Foe Lullaby' or spell.english == 'Foe Lullaby II' then
            equip(sets[maccLevel:current()]['Lullaby'])
        elseif spell.english:sub(1,12) == "Army's Paeon" then
            equip(sets['Gjallarhorn']['Paeon'])
        else
            equip(sets[songMode]['MidcastSet'])
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

			if sets[spell.english] then
				if buffactive['Reive Mark'] then
					equip(sets[spell.english],sets['Reive'])
				else
					equip(sets[spell.english])
				end
			end

			windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
		elseif spell.english == "Spectral Jig" and is_ability_ready('Spectral Jig') then
			send_command('cancel 71;')
		elseif spell.type == "JobAbility" then
			if sets[spell.english] then
				equip(sets[spell.english])
			end
            if spell.english == "Clarion Call" then
				currentMaxSongs = totalSongs + 1
            end
		elseif spell.type == "BardSong" then
			if buffactive["clarion call"] then
				currentMaxSongs = totalSongs+1
			end

			if buffactive['pianissimo'] and (spell.english =='Horde Lullaby' or spell.english == 'Horde Lullaby II') then
				send_command('cancel 409;')
			end

            songMode = 'Gjallarhorn'

            if type(dummySongs) == 'table' then
                for i,v in pairs(dummySongs) do
                    if v.en ~= nil and v.en == spell.english then
				        songMode = 'ExtraSong'
                    end
                end
            end

			if buffactive['Nightingale'] and buffactive['Troubadour'] then
                if spell.english == "Honor March" then
                    equip(sets['Honor March']['MidcastSet'])
				elseif spell.english:sub(1,13) == "Mage's Ballad" then
					equip(sets[songMode]['BalladMidcast'])
				elseif spell.english == "Sentinel's Scherzo" then
					equip(sets[songMode]['Scherzo'])
				elseif spell.english == 'Horde Lullaby' or spell.english == 'Horde Lullaby II' then
					equip(sets[maccLevel:current()]['Horde Lullaby'])
				elseif spell.english == 'Foe Lullaby' or spell.english == 'Foe Lullaby II' then
					equip(sets[maccLevel:current()]['Lullaby'])
                elseif spell.english:sub(1,12) == "Army's Paeon" then
                    equip(sets[songMode]['Paeon'])
				elseif spell.english:sub(-5) == "Etude" and sets[songMode]['Etude']  then
					equip(sets[songMode]['Etude'])
				else
					equip(sets[songMode]['MidcastSet'])
				end
			else
                if spell.english == "Honor March" then
                    equip(sets['Honor March']['PrecastSet'])
                else
				    equip(sets[songMode]['PrecastSet'])
                end
			end
        elseif spell.type == 'WhiteMagic' then
            if player.sub_job == "DNC" and spell.english == 'Sneak' then
                cancel_spell()
                send_command('input /ja "Spectral Jig" <me>;')
            elseif spell.english:sub(1,4) == 'Cure' or spell.english:sub(1,4) == 'Cura' then
                equip(sets.precast['CureSet'])
            else
                if spell.skill == 'Enhancing Magic' then
                    equip(sets.precast['Enhancing Magic'])
                else
                    equip(sets.precast['General'])
                end
            end
        elseif spell.type == 'BlackMagic' or spell.type == 'Trust' then
            equip(sets.precast['General'])
		elseif spell.english == "Spectral Jig" and is_ability_ready('Spectral Jig') then
			send_command('cancel 71;')
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	if spell.type == "BardSong" then
        songMode = 'Gjallarhorn'

        if type(dummySongs) == 'table' then
            for i,v in pairs(dummySongs) do
                if v.en ~= nil and v.en == spell.english then
                    songMode = 'ExtraSong'
                end
            end
        end

        if spell.english == "Honor March" then
            equip(sets['Honor March']['MidcastSet'])
		elseif spell.english:sub(1,13) == "Mage's Ballad" then
			equip(sets[songMode]['BalladMidcast'])
		elseif spell.english:sub(-8) == "Madrigal" then
			equip(sets[songMode]['Madrigal'])
		elseif spell.english:sub(-7) == "Prelude" then
			equip(sets[songMode]['Prelude'])
		elseif spell.english == "Sentinel's Scherzo" then
			equip(sets[songMode]['Scherzo'])
		elseif spell.english == 'Horde Lullaby' or spell.english == 'Horde Lullaby II' then
			equip(sets[maccLevel:current()]['Horde Lullaby'])
		elseif spell.english == 'Foe Lullaby' or spell.english == 'Foe Lullaby II' then
			equip(sets[maccLevel:current()]['Lullaby'])
		elseif spell.english:sub(1,12) == "Army's Paeon" then
			equip(sets[songMode]['Paeon'])
        elseif sets[songMode]['Etude'] and spell.english:sub(-5) == "Etude"then
            equip(sets[songMode]['Etude'])
        elseif sets[songMode]['Threnody'] and (spell.english:sub(-11) == 'Threnody II' or spell.english:sub(-8) == 'Threnody') then
            equip(sets[songMode]['Threnody'])
		elseif spell.english == "Maiden's Virelai" or spell.english == 'Pining Nocturne' or spell.english:sub(-5) == 'Elegy' or spell.english == 'Magic Finale' or spell.english:sub(0,7) == 'Foe Req' then
			equip(sets['MaccSet'])
		else
			equip(sets[songMode]['MidcastSet'])
		end
    elseif spell.skill == 'Enhancing Magic' then
            if spell.english == 'Stoneskin' then
                equip(set_combine(sets.midcast['Enhancing Magic Duration'], sets.midcast['Stoneskin']))
            elseif spell.english == 'Aquaveil' then
                equip(set_combine(sets.midcast['Enhancing Magic Duration'], sets.midcast['Aquaveil']))
            elseif spell.english:sub(1,5) == 'Regen' then
                equip(set_combine(sets.midcast['Enhancing Magic'], set_combine(sets.midcast['Enhancing Magic Duration'], sets.midcast['Regen']) ))
            elseif spell.english == 'Haste' or
                spell.english == 'Invisible' or
                spell.english == 'Sneak' or
                spell.english:sub(-5) == 'storm' or
                spell.english:sub(4) == 'Prot' or
                spell.english:sub(4) == 'Shel' or
                spell.english == 'Blink' or
                spell.english == 'Refresh' then
                equip(set_combine(sets.midcast['General'],sets.midcast['Enhancing Magic Duration']))
            else
                equip(set_combine(sets.midcast['Enhancing Magic'], sets.midcast['Enhancing Magic Duration']))
            end
	elseif spell.type == "WhiteMagic" then
        if spell.english:sub(1,4) == 'Cure' or spell.english:sub(1,4) == 'Cura' then
            equip(sets.midcast['Cure'])
        elseif spell.skill == 'Enfeebling Magic' then
            equip(sets.midcast['Enfeebling Magic'])
		end
    elseif spell.type == 'BlackMagic' then
        if spell.skill == 'Enfeebling Magic' then
            equip(sets.midcast['Enfeebling Magic'])
        elseif spell.skill == 'Elemental Magic' then
            equip(sets.midcast['Elemental Magic'])
        end
    elseif spell.type == 'Ninjutsu' then
        equip(sets.midcast['General'])
        if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4)']) then
            send_command('wait 1.5;cancel 66;cancel 446;cancel 445;cancel 444;')
        end
    elseif spell.type ~= 'WeaponSkill' and spell.type ~= 'JobAbility' then
        equip(sets.midcast['General'])
	end
end

function aftercast(spell,action)
	if spam_protection_off(spell)then
		if spell.english == 'Troubadour' or spell.english == 'Nightingale' then
			justUsedJA = true
		end
        if spell.english == 'Horde Lullaby II' then
            if buffactive['Troubadour'] and buffactive['Nightingale'] and buffactive['Clarion Call'] then
                send_command('timers d "Horde Lullaby II";timers c "Horde Lullaby II" 440 up;')
                send_to_alts_in_range('timers d "Horde Lullaby II";timers c "Horde Lullaby II" 440 up;')
                lullabyWearing = os.clock()+440-30
            elseif buffactive['Troubadour'] and buffactive['Nightingale'] and buffactive['Marcato'] then
                send_command('timers d "Horde Lullaby II";timers c "Horde Lullaby II" 380 up;')
                send_to_alts_in_range('timers d "Horde Lullaby II";timers c "Horde Lullaby II" 380 up;')
                lullabyWearing = os.clock()+380-30
            elseif buffactive['Troubadour'] and buffactive['Nightingale'] then
                send_command('timers d "Horde Lullaby II";timers c "Horde Lullaby II" 360 up;')
                send_to_alts_in_range('timers d "Horde Lullaby II";timers c "Horde Lullaby II" 360 up;')
                lullabyWearing = os.clock()+360-30
            else
                send_command('timers d "Horde Lullaby II";timers c "Horde Lullaby II" 181 up;')
                send_to_alts_in_range('timers d "Horde Lullaby II";timers c "Horde Lullaby II" 181 up;')
                lullabyWearing = os.clock()+181-30
            end
        end
		handle_idle()
	end

	checkAftercast(spell)
end

function handle_idle()
	if player.status == 'Engaged' then
		if player.sub_job == 'DNC' or player.sub_job == 'NIN' then
			equip(sets['DWMeleeSet'])
		else
			equip(sets['MeleeSet'])
		end
	elseif player.status == 'Resting' then
		equip(sets['Resting'])

		if world.area == 'NYZUL ISLE' or world.area == 'ALZADAAL UNDERSEA RUINS' or world.area == 'ZHAYOLM REMNANTS' or world.area == 'ARRAPAGO REMNANTS' or world.area == 'BHAFLAU REMNANTS' or world.area == 'SILVER SEA REMNANTS' then
			equip({ring2 = "Balrahn's Ring"})
		end
	else
		if player.mpp > 80 or dtMode then
			equipSet = sets['IdleSet']
		else
			equipSet = sets['IdleRefreshSet']

			if world.area == 'NYZUL ISLE' or world.area == 'ALZADAAL UNDERSEA RUINS' or world.area == 'ZHAYOLM REMNANTS' or world.area == 'ARRAPAGO REMNANTS' or world.area == 'BHAFLAU REMNANTS' or world.area == 'SILVER SEA REMNANTS' then
				equip({ring2 = "Balrahn's Ring"})
			end
		end

		if not dtMode then
			equipSet = set_combine(equipSet, sets['Running'])
		end
		equip(equipSet)
	end

	if buffactive['Reive Mark'] then
		equip(sets['Reive'])
	end
end

function filtered_action(spell,action)
	if player.sub_job == "DNC" and spell.english == 'Sneak' then
		cancel_spell()
		send_command('input /ja "Spectral Jig" <me>;')
	end
end

function status_change(new,old)
	if check_ready_status()then
		handle_idle(new)
	end
end

function buff_change(buff,gain_or_loss)
    check_for_aftermath_timers(buff, gain_or_loss)
    check_for_weakness_timers(buff, gain_or_loss)
    notify_party_of_troublesome_debuffs(buff, gain_or_loss)
	if not gain_or_loss then
		if buff == 'Troubadour' or buff == 'Nightingale' then
			justUsedJA = false
		end
	end
end

function self_command(command)
	if command == 'heal' then
		local j = windower.ffxi.get_party() or {}
		biggestCureNeeded = 0
		playerToCure = ''
		for i,v in pairs(j) do
			if v.hp > 0 and v.hpp > 0 and v.hpp < 100 then
				if (v.hp/((v.hpp)/100))-v.hp > biggestCureNeeded then
					biggestCureNeeded = math.floor((v.hp/((v.hpp)/100))-v.hp)
					playerToCure = v.name
				end
			end
		end

		if buffactive['doom'] then
			send_command('send nekachu //cursna '..player.name..';')
		elseif biggestCureNeeded > 900 then
			send_command('send nekachu //cure5 '..playerToCure..';')
		elseif biggestCureNeeded > 650 then
			send_command('send nekachu //cure4 '..playerToCure..';')
		elseif buffactive['petrification'] then
			send_command('send nekachu //stona '..player.name..';')
		elseif buffactive['curse'] then
			send_command('send nekachu gs c castspell cursna '..player.name:lower()..';')
		elseif buffactive['paralysis'] then
			send_command('send nekachu //paralyna '..player.name:lower()..';')
		elseif buffactive['Max HP Down'] then
			send_command('send nekachu //erase '..player.name:lower()..';')
		elseif biggestCureNeeded > 300 then
			send_command('send nekachu //cure3 '..playerToCure..';')
		elseif buffactive['poison'] then
			send_command('send nekachu //poisona '..player.name:lower()..';')
		elseif buffactive['bind'] or buffactive['weight'] or buffactive['bio'] then
			send_command('send nekachu //erase '..player.name:lower()..';')
		elseif buffactive['Sleep'] then
			send_command('send nekachu //cure '..player.name:lower()..';')
		elseif buffactive['Regen'] == nil then
			send_command('send nekachu //regen4 '..player.name:lower()..';')
		else
			windower.add_to_chat(050,"Nothing to do.")
		end
	elseif command == 'buff' then
		if buffactive['Haste'] == nil then
			send_command('send nekachu //haste '..player.name:lower()..';')
		elseif buffactive['Protect'] == nil then
			send_command('send nekachu //protectrav;')
		elseif buffactive['Shell'] == nil then
			send_command('send nekachu //shellrav;')
		else
			windower.add_to_chat(050,"Nothing to do.")
		end
	elseif command == 'ws' then
		if player.status == 'Engaged' and player.tp >= 1000 then
			send_command('input /ws "Rudra\'s Storm" <t>;')
		end
	elseif command == 'step' and songs['sing'] == false then
		if player.status == 'Engaged' and player.sub_job == 'DNC' then
			send_command('input /ja "Box Step" <t>;')
		end
	elseif command == 'flourish' and songs['sing'] == false then
		if player.status == 'Engaged' and player.sub_job == 'DNC' then
			send_command('input /ja "Violent Flourish" <t>;')
		end
	elseif command:sub(1,12) == 'remove songs' then
		commandSplit = T{}
		command = command:gsub("[%w ]+","%1")
		if #command > 14 then
			command = command:sub(14,#command)
			commandSplit = string.split(command," ")
			local nameToRemove = checkName(commandSplit[#commandSplit])
			if spell_target ~= '' then
				remove_song_by_target(nameToRemove)
			end
		end
	elseif command:sub(1,12) == 'keep singing' then
		commandSplit = T{}
		command = command:gsub("[%w ]+","%1")
		if #command > 14 then
			command = command:sub(14,#command)
			commandSplit = string.split(command," ")
			table.clear(songs)

			songCount = #commandSplit-1
			spell_target = ''

			if check_for_target(commandSplit[#commandSplit]) then
				if commandSplit[#commandSplit] == 'self' then
					spell_target = 'self'
				else
					spell_target = checkName(commandSplit[#commandSplit])
				end
				songCount = songCount - 1
			end

			if spell_target == '' then
				spell_target = player.name
			end
			--Add the command to resing array for this target (only one set of songs to resing per target)
			resingSongs[spell_target] = {
									nextSing = os.clock()+1,
									fails=0,
									songs=command,
									target=spell_target
									}
		end
	elseif command:sub(1,4) == 'sing' then
		commandSplit = T{}
		command = command:gsub("[%w ]+","%1")
		if #command > 6 then
			command = command:sub(6,#command)
			commandSplit = string.split(command," ")
			table.clear(songs)

			doingSV = false
			doingJA = false

			for i=1, #commandSplit, 1 do
				if commandSplit[i] and commandSplit[i]:lower() == 'ja' then
					doingJA = true
					commandSplit:remove(i)
				end
				if commandSplit[i] and commandSplit[i]:lower() == '1hr' then
					doingSV = true
					commandSplit:remove(i)
				end
			end

			songCount = #commandSplit
			spell_target = ''
			if check_for_target(commandSplit[#commandSplit]) then
				if commandSplit[#commandSplit] == 'self' then
					spell_target = 'self'
				else
					spell_target = checkName(commandSplit[#commandSplit])
				end
				songCount = songCount - 1
			end

			if spell_target == '' then
				spell_target = player.name
			end

            if spell_target ~= player.name then
                args = {partyCheck=true, pianissimo=true}
            else
                args = {partyCheck=true}
            end

            if (autoJA or doingJA) and not buffactive['encumbrance'] and spell_target == player.name and not buffactive['paralysis'] and not buffactive['amnesia'] and not buffactive['impairment'] and is_ability_ready('Troubadour') and is_ability_ready('Nightingale') then
                if (auto1hr or doingSV) and is_ability_ready('Soul Voice') and is_ability_ready('Clarion Call') then
                    doingSV = true
                    doingJA = true
                    currentMaxSongs = totalSongs+1
                    direct_push_front(gearswap.res.job_abilities[164], 'ja', player.name, false)
                    direct_push_front(gearswap.res.job_abilities[163], 'ja', player.name, false)
                    direct_push_front(gearswap.res.job_abilities[25], 'ja', player.name, false)
                    direct_push_front(gearswap.res.job_abilities[332], 'ja', player.name, false)
                elseif is_ability_ready('Marcato') then
                    doingJA = true
                    direct_push_front(gearswap.res.job_abilities[164], 'ja', player.name, false)
                    direct_push_front(gearswap.res.job_abilities[163], 'ja', player.name, false)
                    direct_push_front(gearswap.res.job_abilities[284], 'ja', player.name, false)
                end
            end

            -- If this command is in the resing array, set the next sing time, and reset fail count to 0
            -- The way the resing works is, it stores the original sing command in an array, with a recast (next sing) time on it.
            if type(resingSongs) == 'table' and resingSongs[spell_target] ~= nil then
                if resingSongs[spell_target].songs == command then
                    if doingJA or justUsedJA or buffactive['Troubadour'] or buffactive['Nightingale'] then
                        resingSongs[spell_target].nextSing = os.clock()+songDurationJA
                        resingSongs[spell_target].fails = 0
                        send_command('timers c "Songs ['..spell_target..']" '..songDurationJA..' up "Advancing March"')
                    else
                        resingSongs[spell_target].nextSing = os.clock()+songDuration
                        resingSongs[spell_target].fails = 0
                        send_command('timers c "Songs ['..spell_target..']" '..songDuration..' up "Advancing March"')
                    end
                end
            else
                windower.add_to_chat(158,'Songs on '..spell_target..' added to queue')
            end

            local possibleBuffs = {
                march = 1,
                prelude = 1,
                mambo = 1,
                carol = 1,
                madrigal = 1,
                scherzo = 1,
                minuet = 1,
                ballad = 1,
                minne = 1,
                paeon = 1,
                hymnus = 1,
                mazurka = 1,
                etude = 1,
            }
            print(spell_target)


            -- Try to determine if dummy songs are needed
            -- Start by getting all people within sing range. We have to use the alliance GS table, since it contains a log of all buffs on pt members
            local ptData = windower.ffxi.get_party()
            local needDummy = false
            local sCount = 0
            if alliance[1] ~= nil then
                for i,v in pairs(alliance[1]) do
                    sCount = 0
                    --Make sure it's a valid pt member table to check
                    if type(v) == 'table' and v.name ~= nil and type(v.mob) == 'table' and v.mob.distance ~= nil and v.mob.distance ~= 0.089004568755627 and v.buffactive ~= nil and ((spell_target == player.name and v.mob.distance <= 100) or (spell_target == 'self' and player.name == v.name and v.mob.distance <= 440) or (spell_target == v.name and v.mob.distance <= 440)) then
                        for ii,vv in pairs(possibleBuffs) do
                            if v.buffactive[ii] ~= nil then
                                sCount = sCount + v.buffactive[ii]
                            end
                        end
                        if sCount < currentMaxSongs then
                            needDummy = true
                        end
                    end
                end
            end


            -- Step through the sing command, adding the songs to the queue
			for i=1, currentMaxSongs, 1 do
				if commandSplit[i] ~= nil then
                    if needDummy then
                        if totalSongs == 3 then
                            if currentMaxSongs == 3 and i == 3 and songCount > 2 then
                                add_to_back(dummySongs[1], spell_target, args)
                            elseif currentMaxSongs == 4 and i == 4 and songCount > 3 then
                                add_to_back(dummySongs[1], spell_target, args)
                            end
                        elseif totalSongs == 4 then
                            if currentMaxSongs == 4 then
                                if i == 3 and songCount > 2 then
                                    add_to_back(dummySongs[1], spell_target, args)
                                elseif i == 4 and songCount > 3 then
                                    add_to_back(dummySongs[2], spell_target, args)
                                end
                            elseif currentMaxSongs == 5 then
                                if i == 4 and songCount > 3 then
                                    add_to_back(dummySongs[1], spell_target, args)
                                elseif i == 5 and songCount > 4 then
                                    add_to_back(dummySongs[2], spell_target, args)
                                end
                            end
                        end
                    end
                    get_song_from_command(commandSplit[i], spell_target)
				end
			end

			if (doingSV or buffactive['Soul Voice']) and songs:contains("Victory March") and songs:contains("Advancing March") then
				--See what we can replace Advancing March with
				if songs:contains("Valor Minuet V") or songs:contains("Valor Minuet IV") or songs:contains("Valor Minuet III") or songs:contains("Valor Minuet II") or songs:contains("Valor Minuet") then
					--Melee songs, see if 4 3 2 or 1 are set
					if not songs:contains("Valor Minuet V") then
						replaceSong = 'Valor Minuet V'
					elseif not songs:contains("Valor Minuet IV") then
						replaceSong = 'Valor Minuet IV'
					elseif not songs:contains("Valor Minuet III") then
						replaceSong = 'Valor Minuet III'
					elseif not songs:contains("Valor Minuet II") then
						replaceSong = 'Valor Minuet II'
					elseif not songs:contains("Valor Minuet") then
						replaceSong = 'Valor Minuet'
					else
						replaceSong = "Sentinel's Scherzo"
					end
				elseif songs:contains("Sword Madrigal") or songs:contains("Blade Madrigal") then
					if songs:contains("Sword Madrigal") and songs:contains("Blade Madrigal") then
						--Both acc songs on, throw on minuets
						if not songs:contains("Valor Minuet V") then
							replaceSong = 'Valor Minuet V'
						elseif not songs:contains("Valor Minuet IV") then
							replaceSong = 'Valor Minuet IV'
						elseif not songs:contains("Valor Minuet III") then
							replaceSong = 'Valor Minuet III'
						elseif not songs:contains("Valor Minuet II") then
							replaceSong = 'Valor Minuet II'
						elseif not songs:contains("Valor Minuet") then
							replaceSong = 'Valor Minuet'
						end
					elseif songs:contains("Sword Madrigal") and not songs:contains("Blade Madrigal") then
						replaceSong = 'Blade Madrigal'
					elseif songs:contains("Blade Madrigal") and not songs:contains("Sword Madrigal") then
						replaceSong = 'Sword Madrigal'
					else
						replaceSong = "Sentinel's Scherzo"
					end
				elseif songs:contains("Mage's Ballad III") or songs:contains("Mage's Ballad II") or songs:contains("Mage's Ballad") then
					--Mage songs, see if all ballads are on
					if not songs:contains("Mage's Ballad III") then
						replaceSong = "Mage's Ballad III"
					elseif not songs:contains("Mage's Ballad II") then
						replaceSong = "Mage's Ballad II"
					elseif not songs:contains("Mage's Ballad") then
						replaceSong = "Mage's Ballad"
					else
						replaceSong = "Sentinel's Scherzo"
					end
				elseif songs:contains("Knight's Minne V") and songs:contains("Knight's Minne IV") and songs:contains("Knight's Minne III") and songs:contains("Knight's Minne II") and songs:contains("Knight's Minne") then
					--Tank songs, see if 4 3 2 or 1 are set
					if not songs:contains("Knight's Minne V") then
						replaceSong = "Knight's Minne V"
					elseif not songs:contains("Knight's Minne IV") then
						replaceSong = "Knight's Minne IV"
					elseif not songs:contains("Knight's Minne III") then
						replaceSong = "Knight's Minne III"
					elseif not songs:contains("Knight's Minne II") then
						replaceSong = "Knight's Minne II"
					elseif not songs:contains("Knight's Minne") then
						replaceSong = "Knight's Minne"
					else
						replaceSong = "Sentinel's Scherzo"
					end
				end
				if replaceSong ~= nil then
					spell_stack_replace('Advancing March',replaceSong)
				end
			end
		end
	elseif command:lower() == '3song' then
		currentMaxSongs = tonumber(totalSongs)
		windower.add_to_chat(050,tostring(currentMaxSongs).." song mode.")
	elseif command:lower() == '4song' then
		currentMaxSongs = tonumber(totalSongs)+1
		windower.add_to_chat(050,tostring(currentMaxSongs).." song mode.")
    elseif command == 'macc' then
        maccLevel:next()
        windower.add_to_chat(050,"Macc level ["..maccLevel:current().."]")
	elseif command == 'finale' then
		if player.sub_job == "DNC" then
            threnodies:next()
			send_command('input /ma "'..threnodies:current()..'" <bt>;')
		else
			send_command('input /ma "Magic Finale" <bt>;')
		end
    elseif command == 'dispel' then
        target_to_use = 'bt'
        if party_target ~= false then
            target_to_use = party_target
        end

        if is_spell_ready('Magic Finale') then
            direct_push(stack_spells['Magic Finale'], 'ma', target_to_use, false)
        end
	elseif command == 'debuff' then
        target_to_use = 'bt'
        if party_target ~= false then
            target_to_use = party_target
        end

        if is_spell_ready('Foe Requiem VII') then
            direct_push(stack_spells['Foe Requiem VII'], 'ma', target_to_use, false)
        end
        if is_spell_ready('Carnage Elegy') then
            direct_push(stack_spells['Carnage Elegy'], 'ma', target_to_use, false)
        end
        if is_spell_ready('Pining Nocturne') then
            direct_push(stack_spells['Pining Nocturne'], 'ma', target_to_use, false)
        end
    elseif command == 'sleepga' then
        target_to_use = 'bt'
        if party_target ~= false then
            target_to_use = party_target
        end

        if is_spell_ready('Horde Lullaby II') then
            direct_push(stack_spells['Horde Lullaby II'], 'ma', target_to_use, false)
        elseif is_spell_ready('Horde Lullaby') then
            direct_push(stack_spells['Horde Lullaby'], 'ma', target_to_use, false)
        end
	elseif command == 'melee' then
		if player.sub_job == "DNC" then
			equip(sets['dualWield'])
			windower.add_to_chat(050,"Dual Wield On")
		else
			equip(sets['dagger'])
			windower.add_to_chat(050,"Dagger On")
		end
		if player.sub_job == "DNC" and player.equipment.main == 'Taming Sari' and player.equipment.sub == 'Atoyac' then
			disable('main','sub')
			mythicTries = 0
			windower.add_to_chat(167,"Melee [ON]")
		elseif player.equipment.main == 'Taming Sari' and player.equipment.sub == "Genbu's Shield" then
			disable('main','sub')
			mythicTries = 0
			windower.add_to_chat(167,"Melee [ON]")
		elseif mythicTries > 10 then
			windower.add_to_chat(050,"Melee couldn't be equipped at this time.")
		else
			enable('main','sub')
			mythicTries = mythicTries +1
			send_command('wait 1;gs c melee;')
		end
	elseif command == 'off' then
		enable('main','sub')
		windower.add_to_chat(050,"Melee Mode [OFF]")
		equip(sets[idleSet])
	elseif command == 'ja' then
		if not buffactive['paralysis'] and not buffactive['amnesia'] and not buffactive['impairment'] and is_ability_ready('Troubadour') and is_ability_ready('Nightingale') and is_ability_ready('Marcato') then
			if world.area:find("San d'Oria") or world.area:find("Bastok") or world.area:find("Windurst") or world.area:find("Jeuno") or world.area:find("Adoulin") or world.area == "Ru'Lude Gardens" or world.area == 'Al Zahbi' or world.area == "Aht Urhgan Whitegate" or world.area == "Tavnazian Safehold" then
			else
				direct_push_front(gearswap.res.job_abilities[163], 'ja', player.name, {fixed_order=true})
				direct_push_front(gearswap.res.job_abilities[164], 'ja', player.name, {fixed_order=true})
				direct_push_front(gearswap.res.job_abilities[284], 'ja', player.name, {fixed_order=true})
			end
		else
			if buffactive['paralysis'] then
				send_command('input /p Paralyzed, not using JA')
			elseif buffactive['impairment'] then
				send_command("input /p JA Locked, can't use JA")
			elseif buffactive['amnesia'] then
				send_command("input /p Amnesia, can't use JA")
			else
				send_command("input /p JA not ready")
			end
		end
    elseif execute_common_command(command) then
        --done
    elseif stack_command(command) then
        --done
	elseif command == 'sneak' then
		send_command('input /ma "Sneak" <me>')
	elseif command == 'invisible' then
		send_command('input /ma "Invisible" <me>')
	elseif command == 'tank' then
		if not dtMode then
			dtMode = true
			windower.add_to_chat(028, "Idle DT [ON]")
		else
			dtMode = false
			windower.add_to_chat(028, "Idle DT [OFF]")
		end
		handle_idle()
	elseif command == 'levi' then
		dtMode = true
		autoJA = true
		autoSS = false
		resingSongs['Mazuki'] = {
								nextSing = os.clock()+1,
								fails=0,
								songs='march scherzo march str str Mazuki',
								target='Mazuki'
								}
		resingSongs['Nekachu'] = {
								nextSing = os.clock()+15,
								fails=0,
								songs='bal Nekachu',
								target='Nekachu'
								}
		resingSongs['Norzu'] = {
								nextSing = os.clock()+20,
								fails=0,
								songs='bal Norzu',
								target='Norzu'
								}
        resingSongs['self'] = {
                                nextSing = os.clock()+25,
                                fails=0,
                                songs='bal self',
                                target='self'
                                }
    elseif command == 'melee buffs' then
        dtMode = true
        autoJA = true
        auto1hr = true
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='march march min min str Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Norzu'] = {
                                nextSing = os.clock()+13,
                                fails=0,
                                songs='bal Norzu',
                                target='Norzu'
                                }
        resingSongs['Nekachu'] = {
                                nextSing = os.clock()+19,
                                fails=0,
                                songs='bal Nekachu',
                                target='Nekachu'
                                }
        resingSongs['self'] = {
                                nextSing = os.clock()+30,
                                fails=0,
                                songs='bal self',
                                target='self'
                                }
	elseif command == 'ambu' or command == 'ambu melee' then
        doCures = true
		dtMode = true
		autoJA = true
		auto1hr = true
		autoSS = false
        autoBlink = false
        -- priority_players['Miang'] = 0.1
        -- priority_players['Nekachu'] = 0.1
        -- priority_players['Mazuki'] = 0.1
        -- priority_players['Norzu'] = 0.1
        -- priority_players['Ulor'] = 0.1
        -- priority_players['Tosel'] = 1.0
        if player.sub_job == 'WHM' or player.sub_job == 'RDM' then
            direct_push(stack_spells['Stoneskin'], 'ma', player.name, false)
            -- direct_push(stack_spells['Blink'], 'ma', player.name, false)
        end
		resingSongs['Mazuki'] = {
								nextSing = os.clock()+1,
								fails=0,
								songs='march march bal bal bal Mazuki',
								target='Mazuki'
								}
        resingSongs['Miang'] = {
                                nextSing = os.clock()+36,
                                fails=0,
                                songs='march march str str mad Miang',
                                target='Miang'
                                }
        resingSongs['Ulor'] = {
                                nextSing = os.clock()+39,
                                fails=0,
                                songs='march march bal Ulor',
                                target='Ulor'
                                }
        -- resingSongs['Nekachu'] = {
        --                         nextSing = os.clock()+35,
        --                         fails=0,
        --                         songs='march march dex min dex Nekachu',
        --                         target='Nekachu'
        --                         }
    elseif command == 'ambu2' then
        dtMode = true
        autoJA = true
        auto1hr = true
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='march mad march min min Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Tosel'] = {
                                nextSing = os.clock()+13,
                                fails=0,
                                songs='bal Tosel',
                                target='Tosel'
                                }
        resingSongs['Nekachu'] = {
                                nextSing = os.clock()+19,
                                fails=0,
                                songs='bal Nekachu',
                                target='Nekachu'
                                }
        resingSongs['self'] = {
                                nextSing = os.clock()+30,
                                fails=0,
                                songs='bal self',
                                target='self'
                                }
    elseif command == 'ambu3' then
        dtMode = true
        autoJA = true
        auto1hr = true
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='bal bal bal march march Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Miang'] = {
                                nextSing = os.clock()+13,
                                fails=0,
                                songs='march march mad scherzo min Miang',
                                target='Miang'
                                }
        resingSongs['Ulor'] = {
                                nextSing = os.clock()+26,
                                fails=0,
                                songs='march march mad bal mad Ulor',
                                target='Ulor'
                                }
        direct_push(gearswap.res.spells[54], 'ma', player.name, false)
        direct_push(gearswap.res.spells[53], 'ma', player.name, false)
        direct_push(gearswap.res.spells[55], 'ma', player.name, false)
    elseif command == 'ambu mage' then
        dtMode = true
        autoJA = true
        auto1hr = true
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='int march2 bal int march1 Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Ulor'] = {
                                nextSing = os.clock()+13,
                                fails=0,
                                songs='minne march march bal bal Ulor',
                                target='Ulor'
                                }
        direct_push(gearswap.res.spells[54], 'ma', player.name, false)
        direct_push(gearswap.res.spells[53], 'ma', player.name, false)
        direct_push(gearswap.res.spells[55], 'ma', player.name, false)
    elseif command == 'ambu rng' then
        dtMode = true
        autoJA = true
        auto1hr = true
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='honor prelude prelude min min Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Ulor'] = {
                                nextSing = os.clock()+13,
                                fails=0,
                                songs='scherzo march march bal mad Ulor',
                                target='Ulor'
                                }
        resingSongs['Nekachu'] = {
                                nextSing = os.clock()+30,
                                fails=0,
                                songs='bal Nekachu',
                                target='Nekachu'
                                }
        resingSongs['Norzu'] = {
                                nextSing = os.clock()+34,
                                fails=0,
                                songs='bal Norzu',
                                target='Norzu'
                                }
        resingSongs['self'] = {
                                nextSing = os.clock()+38,
                                fails=0,
                                songs='bal self',
                                target='self'
                                }
        direct_push(gearswap.res.spells[54], 'ma', player.name, false)
        direct_push(gearswap.res.spells[53], 'ma', player.name, false)
        direct_push(gearswap.res.spells[55], 'ma', player.name, false)
    elseif command == 'quetz' then
        dtMode = false
        autoJA = true
        auto1hr = true
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='march march min bal dex Mazuki',
                                target='Mazuki'
                                }
    elseif command == 'omen trash' then
        dtMode = false
        autoJA = false
        auto1hr = false
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='march march min bal Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Miang'] = {
                                nextSing = os.clock()+30,
                                fails=0,
                                songs='march march str str Miang',
                                target='Miang'
                                }
    elseif command == 'omen mage trash' then
        dtMode = false
        autoJA = false
        auto1hr = false
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='march bal bal int Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Ulor'] = {
                                nextSing = os.clock()+20,
                                fails=0,
                                songs='march march bal mad Ulor',
                                target='Ulor'
                                }
    elseif command == 'omen kin' then
        dtMode = false
        autoJA = true
        auto1hr = true
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='march march bal bal bal Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Miang'] = {
                                nextSing = os.clock()+30,
                                fails=0,
                                songs='march march str str min Miang',
                                target='Miang'
                                }
        resingSongs['Ulor'] = {
                                nextSing = os.clock()+45,
                                fails=0,
                                songs='march march bal Ulor',
                                target='Ulor'
                                }
        resingSongs['Norzu'] = {
                                nextSing = os.clock()+55,
                                fails=0,
                                songs='bal Norzu',
                                target='Norzu'
                                }
    elseif command == 'omen ou' then
        dtMode = false
        autoJA = true
        auto1hr = true
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='march march bal bal scherzo Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Miang'] = {
                                nextSing = os.clock()+15,
                                fails=0,
                                songs='march march mad min str Miang',
                                target='Miang'
                                }
        resingSongs['Ulor'] = {
                                nextSing = os.clock()+25,
                                fails=0,
                                songs='march march bal bal Ulor',
                                target='Ulor'
                                }
        resingSongs['Norzu'] = {
                                nextSing = os.clock()+30,
                                fails=0,
                                songs='bal Norzu',
                                target='Norzu'
                                }
    elseif command == 'omen boss' then
        dtMode = false
        autoJA = true
        auto1hr = false
        autoSS = false
        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='scherzo march march mad mad Mazuki',
                                target='Mazuki'
                                }
        resingSongs['Ulor'] = {
                                nextSing = os.clock()+18,
                                fails=0,
                                songs='scherzo march bal mad mad Ulor',
                                target='Ulor'
                                }
        resingSongs['Nekachu'] = {
                                nextSing = os.clock()+24,
                                fails=0,
                                songs='bal Nekachu',
                                target='Nekachu'
                                }
        resingSongs['Norzu'] = {
                                nextSing = os.clock()+30,
                                fails=0,
                                songs='bal Norzu',
                                target='Norzu'
                                }
        resingSongs['self'] = {
                                nextSing = os.clock()+36,
                                fails=0,
                                songs='bal self',
                                target='self'
                                }
    elseif command == 'trials' then
        dtMode = false
        autoJA = true
        auto1hr = true
        autoSS = false

        resingSongs['Mazuki'] = {
                                nextSing = os.clock()+1,
                                fails=0,
                                songs='march march str str agi Mazuki',
                                target='Mazuki'
                                }
    elseif command == 'check_has_marsyas' then
        has_marsyas = false
        if checkNumberOfItem(windower.ffxi.get_items(0), 21398) == true then
            has_marsyas = true
        elseif not has_marsyas and checkNumberOfItem(windower.ffxi.get_items(8), 21398) == true then
            has_marsyas = true
        elseif not has_marsyas and checkNumberOfItem(windower.ffxi.get_items(10), 21398) == true then
            has_marsyas = true
        elseif not has_marsyas and checkNumberOfItem(windower.ffxi.get_items(11), 21398) == true then
            has_marsyas = true
        elseif not has_marsyas and checkNumberOfItem(windower.ffxi.get_items(12), 21398) == true then
            has_marsyas = true
        end
    elseif command == 'blind' and (player.sub_job == 'BLM' or player.sub_job == 'RDM') then
        target_to_use = 'bt'
        if party_target ~= false then
            target_to_use = party_target
        end
        direct_push(stack_spells['Blind'], 'ma', target_to_use, false)
    elseif command == 'mb_light' then
        target_to_use = 'bt'
        if party_target ~= false then
            target_to_use = party_target
        end
        if player.sub_job == 'WHM' or player.sub_job == 'RDM' then
            direct_push_front(stack_spells['Dia'], 'ma', target_to_use, false)
        end
    elseif command == 'request_speed' then
        send_command('input /ma "Chocobo Mazurka" <me>;')
	end
end

function handle_ping()
    if lullabyWearing ~= false and lullabyWearing-os.clock() <= 0 then
        send_command('input /p Lullaby wearing in 30s')
        lullabyWearing = false
	elseif buffactive['petrification'] and os.clock()-lastChat > 10 then
		send_command('input /p stoned')
		lastChat = os.clock()
	elseif buffactive['sleep'] and os.clock()-lastChat > 10 then
		send_command('input /p zzz')
		lastChat = os.clock()
	elseif buffactive['silence'] and os.clock()-lastChat > 2 then
		send_command('input /item "Echo Drops" <me>;')
		lastChat = os.clock()
      return
	elseif (buffactive['doom'] or buffactive['curse']) and os.clock()-lastChat > 2 then
		send_command('input /item "Holy Water" <me>;')
		lastChat = os.clock()
        return
	end

	if check_ready_silent() and player.x == lastx and player.y == lasty then

		if player.sub_job_level > 0 then
			if player.sub_job == 'WHM' then
                --[[if party_target ~= false then
                    target_to_use = party_target
                    if is_spell_ready('Dia') then
                        direct_push(stack_spells['Dia'], 'ma', target_to_use, false)
                    end
                end]]

				if not buffactive['reraise'] and is_spell_ready('Reraise') then
					direct_push(gearswap.res.spells[135], 'ma', player.name, true)
				end
				if autoSS and not buffactive['stoneskin'] and is_spell_ready('Stoneskin') then
					direct_push(gearswap.res.spells[54], 'ma', player.name, false)
				end
				if autoBlink and not buffactive['Blink'] and is_spell_ready('Blink') then
					direct_push(gearswap.res.spells[53], 'ma', player.name, false)
				end
				if autoAquaveil and not buffactive['Aquaveil'] and is_spell_ready('Aquaveil') then
					direct_push(gearswap.res.spells[55], 'ma', player.name, false)
				end

                if selfFix['cursna'] and (buffactive['doom'] or buffactive['curse']) and is_spell_ready('Cursna') then
                    direct_push_front(gearswap.res.spells[20], 'ma', player.name, false)
                end
                if selfFix['erase'] and (buffactive['bind'] or buffactive['weight'] or buffactive['slow']) then
                    direct_push(gearswap.res.spells[143], 'ma', player.name, false)
                end
                if selfFix['poisona'] and buffactive['poison'] then
                    direct_push(gearswap.res.spells[14], 'ma', player.name, false)
                end
                if selfFix['paralyna'] and buffactive['paralysis'] then
                    direct_push(gearswap.res.spells[15], 'ma', player.name, false)
                end

			elseif player.sub_job == 'DNC' then
				if (buffactive['paralysis'] or buffactive['bind'] or buffactive['weight'] or buffactive['slow']) and player.tp >= gearswap.res.job_abilities[194].tp_cost then
					direct_push(gearswap.res.job_abilities[194], 'ja', player.name, true)
				end

				local testhp = player.max_hp-player.hp

				if player.tp >= gearswap.res.job_abilities[189].tp_cost and testhp > 390 then
					direct_push(gearswap.res.job_abilities[192], 'ja', player.name, false)
				end

				if player.status == 'Engaged' and not buffactive['amnesia'] and not buffactive['impairment'] and not buffactive['Haste Samba'] and player.tp >= gearswap.res.job_abilities[189].tp_cost then
					direct_push(gearswap.res.job_abilities[189], 'ja', player.name, false)
				end
			elseif player.sub_job == 'RDM' then

                if autoSS and not buffactive['stoneskin'] and is_spell_ready('Stoneskin') then
                    direct_push(gearswap.res.spells[54], 'ma', player.name, false)
                end
                if autoBlink and not buffactive['Blink'] and is_spell_ready('Blink') then
                    direct_push(gearswap.res.spells[53], 'ma', player.name, false)
                end
                if autoAquaveil and not buffactive['Aquaveil'] and is_spell_ready('Aquaveil') then
                    direct_push(gearswap.res.spells[55], 'ma', player.name, false)
                end

				if not buffactive['weakness'] and  player.mp < 200 and player.hp > 1000 and is_ability_ready('Convert') then
					direct_push(gearswap.res.job_abilities[83], 'ja', player.name, true)
				end
				if not buffactive['refresh'] and recastData[gearswap.res.spells[109].recast_id] == 0 and player.mp > gearswap.res.spells[109].mp_cost then
					direct_push(gearswap.res.spells[109], 'ma', player.name, true)
				end
				if autoPhalanx:current() and not buffactive['Phalanx'] and recastData[gearswap.res.spells[106].recast_id] == 0 and player.mp > gearswap.res.spells[106].mp_cost then
					direct_push(gearswap.res.spells[109], 'ma', player.name, true)
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
		end

		if doCures then
			cure_process()
		end

		check_auto_spell()
		check_songs()
		handleSpareTime()
	else
		if player.hp == 0 then
			clear_spell_stack()
		end
		lastx = player.x
		lasty = player.y
	end
end

function file_unload(file_name)
    windower.text.delete('stackoutput')
end

function get_song_buff_from_command(song_command)
    if song_command == 'march' or song_command == 'march1' or song_command == 'amarch' or song_command == 'vmarch' or song_command == 'march2' or song_command == 'hmarch' or song_command == 'honor' or song_command == 'march3' then
        return 'march'
    elseif song_command == 'prelude' or song_command == 'prelude1' or song_command == 'hprelude' or song_command == 'prelude2' or song_command == 'aprelude' then
        return 'prelude'
    elseif song_command == 'mambo' or song_command == 'mambo1' or song_command == 'lmambo'or song_command == 'mambo2' or song_command == 'hmambo' then
        return 'mambo'
    elseif song_command == 'lcarol' or song_command == 'lcarol1' or song_command == 'lcarol2' or
           song_command == 'dcarol' or song_command == 'dcarol1' or song_command == 'dcarol2' or
           song_command == 'fcarol' or song_command == 'fcarol1' or song_command == 'fcarol2' or
           song_command == 'ecarol' or song_command == 'ecarol1' or song_command == 'ecarol2' or
           song_command == 'wcarol' or song_command == 'wcarol1' or song_command == 'wcarol2' or
           song_command == 'acarol' or song_command == 'acarol1' or song_command == 'acarol2' or
           song_command == 'bcarol' or song_command == 'bcarol1' or song_command == 'bcarol2' or
           song_command == 'tcarol' or song_command == 'tcarol1' or song_command == 'tcarol2' then
        return 'carol'
    elseif song_command == 'madrigal' or song_command == 'mad' or song_command == 'mad1'or song_command == 'smad' or song_command == 'bmad' or song_command == 'mad2' then
        return 'madrigal'
    elseif song_command == 'scherzo' then
        return 'scherzo'
    elseif song_command == 'minuet' or song_command == 'min' or song_command == 'min1' or song_command == 'minuet1' or song_command == 'min2' or song_command == 'minuet2' or song_command == 'min3' or song_command == 'minuet3' or song_command == 'min4' or song_command == 'minuet4' or song_command == 'min5' or song_command == 'minuet5' then
        return 'minuet'
    elseif song_command == 'ballad' or song_command == 'bal' or song_command == 'bal1' or song_command == 'ballad1' or song_command == 'bal2' or song_command == 'ballad2' or song_command == 'bal3' or song_command == 'ballad3' then
        return 'ballad'
    elseif song_command == 'minne' or song_command == 'minne1' or song_command == 'minne2' or song_command == 'minne3' or song_command == 'minne4' or song_command == 'minne5' then
        return 'minne'
    elseif song_command == 'paeon' or song_command == 'paeon1' or song_command == 'paeon2' or song_command == 'paeon3' or song_command == 'paeon4' or song_command == 'paeon5' or song_command == 'paeon6' then
        return 'paeon'
    elseif song_command == 'hymnus' then
        return 'hymnus'
    elseif song_command == 'mazurka' then
        return 'mazurka'
    elseif song_command == 'str' or song_command == 'str1' or song_command == 'str2' or
           song_command == 'dex' or song_command == 'dex1' or song_command == 'dex2' or
           song_command == 'vit' or song_command == 'vit1' or song_command == 'vit2' or
           song_command == 'agi' or song_command == 'agi1' or song_command == 'agi2' or
           song_command == 'int' or song_command == 'int1' or song_command == 'int2' or
           song_command == 'mnd' or song_command == 'mnd1' or song_command == 'mnd2' or
           song_command == 'chr' or song_command == 'chr1' or song_command == 'chr2' then
        return 'etude'
    end
    return false
end

function getBuffsForSongSet(songSet)
   -- Get a table of possible buffs
    local possibleBuffs = T{}
    local songBuffName = false
    for i,v in pairs(songSet) do
        if v ~= nil then
            songBuffName = get_song_buff_from_command(v)
            if songBuffName ~= false then
                if possibleBuffs[songBuffName] ~= nil then
                    possibleBuffs[songBuffName] = possibleBuffs[songBuffName] + 1
                else
                    possibleBuffs[songBuffName] = 1
                end
            end
        end
    end
    -- Add in the dummy song buffs too
    songBuffName = get_song_buff_from_command(dummySongs[1])
    if songBuffName ~= false then
        if possibleBuffs[songBuffName] ~= nil then
            possibleBuffs[songBuffName] = possibleBuffs[songBuffName] + 1
        else
            possibleBuffs[songBuffName] = 1
        end
    end
    songBuffName = get_song_buff_from_command(dummySongs[2])
    if songBuffName ~= false then
        if possibleBuffs[songBuffName] ~= nil then
            possibleBuffs[songBuffName] = possibleBuffs[songBuffName] + 1
        else
            possibleBuffs[songBuffName] = 1
        end
    end
end