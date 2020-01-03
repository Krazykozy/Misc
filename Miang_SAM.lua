include('healbuff.lua')
include('spam_protection.lua')

function get_sets()
	TPSet = 97
	idleMode = "Running"
	accMode = 'LowAcc'
	PL = 'Nekachu'

	send_command('input /macro book 3;lua unload betastun2;lua unload thsetter;')

	sets['Gear Collector1'] = {main="Eminent Lance"}
	sets['Gear Collector2'] = {main="Tsurumaru"}
	sets['Gear Collector3'] = {main="Anahera Blade", head = "Twilight Helm", body="Twilight Mail"}
	sets['GearCollector'] = {ring1="Warp Ring"}

	sets['HighAcc'] = T{}
	sets['MidAcc'] = T{}
	sets['LowAcc'] = T{}

	baseTP = 127
	tpValue = T{}
	--58 STP set (18 in gear)
	tpValue[58] = math.floor(baseTP*1.58)
	--72 STP set (32 in gear)
	tpValue[72] = math.floor(baseTP*1.72)
	--85 STP set (45 in gear)
	tpValue[85] = math.floor(baseTP*1.85)
	--97 STP set (57 in gear)
	tpValue[97] = math.floor(baseTP*1.97)

	sets['HighAcc'][58] = {sub="Bloodrain Strap",range="Cibitshavore",ammo="Eminent Arrow",head="Yaoyotl Helm",neck="Agitator's Collar",ear1="Heartseeker Earring",ear2="Bladeborn Earring",body="Sakonji Domaru +1",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Patricius Ring",back="Takaha Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Waki. Sune-Ate +1"}
	sets['HighAcc'][72] = {sub="Bloodrain Strap",range="Cibitshavore",ammo="Eminent Arrow",head="Yaoyotl Helm",neck="Agitator's Collar",ear1="Heartseeker Earring",ear2="Bladeborn Earring",body="Sakonji Domaru +1",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Patricius Ring",back="Takaha Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Waki. Sune-Ate +1"}
	sets['HighAcc'][85] = {sub="Bloodrain Strap",range="Cibitshavore",ammo="Eminent Arrow",head="Yaoyotl Helm",neck="Agitator's Collar",ear1="Heartseeker Earring",ear2="Bladeborn Earring",body="Sakonji Domaru +1",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Patricius Ring",back="Takaha Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Waki. Sune-Ate +1"}
	sets['HighAcc'][97] = {sub="Bloodrain Strap",range="Cibitshavore",ammo="Eminent Arrow",head="Yaoyotl Helm",neck="Agitator's Collar",ear1="Heartseeker Earring",ear2="Bladeborn Earring",body="Sakonji Domaru +1",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Patricius Ring",back="Takaha Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Waki. Sune-Ate +1"}

	sets['MidAcc'][58] = {sub="Pole Grip",range="Cibitshavore",ammo="Eminent Arrow",head="Sakonji Kabuto +1",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="Mars's Ring",ring2="Patricius Ring",back="Takaha Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Waki. Sune-Ate +1"}
	sets['MidAcc'][72] = {sub="Pole Grip",range="Cibitshavore",ammo="Eminent Arrow",head="Sakonji Kabuto +1",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="Mars's Ring",ring2="Patricius Ring",back="Takaha Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Waki. Sune-Ate +1"}
	sets['MidAcc'][85] = {sub="Pole Grip",range="Cibitshavore",ammo="Eminent Arrow",head="Sakonji Kabuto +1",neck="Asperity Necklace",ear1="Tripudio Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="Mars's Ring",ring2="Patricius Ring",back="Takaha Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Waki. Sune-Ate +1"}
	sets['MidAcc'][97] = {sub="Pole Grip",range="Cibitshavore",ammo="Eminent Arrow",head="Sakonji Kabuto +1",neck="Ganesha's Mala",ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="Mars's Ring",ring2="Patricius Ring",back="Takaha Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Waki. Sune-Ate +1"}

	sets['LowAcc'][58] = {sub="Pole Grip",range="Cibitshavore",ammo="Eminent Arrow",head="Otomi Helm",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="Mars's Ring",ring2="Oneiros Ring",back="Atheling Mantle",waist="Windbuffet Belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
	sets['LowAcc'][72] = {sub="Pole Grip",range="Cibitshavore",ammo="Eminent Arrow",head="Sakonji Kabuto +1",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="K'ayres Ring",ring2="Oneiros Ring",back="Atheling Mantle",waist="Windbuffet Belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
	sets['LowAcc'][85] = {sub="Pole Grip",range="Cibitshavore",ammo="Eminent Arrow",head="Sakonji Kabuto +1",neck="Ganesha's Mala",ear1="Trux Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="K'ayres Ring",ring2="Oneiros Ring",back="Takaha Mantle",waist="Windbuffet Belt",legs="Xaddi Cuisses",feet="Otronif Boots +1"}
	sets['LowAcc'][97] = {sub="Pole Grip",range="Cibitshavore",ammo="Eminent Arrow",head="Sakonji Kabuto +1",neck="Asperity Necklace",ear1="Trux Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="K'ayres Ring",ring2="Rajas Ring",back="Takaha Mantle",waist="Windbuffet Belt",legs="Wakido Haidate +1",feet="Otronif Boots +1"}

	sets['HighAcc']['DT'] = {head="Yaoyotl Helm",neck="Agitator's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Xaddi Mail",hands="Otronif Gloves +1",ring1="Defending Ring",ring2="Patricius Ring",back="Mollusca Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Otronif Boots +1"}
	sets['MidAcc']['DT'] = {head="Yaoyotl Helm",neck="Agitator's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Xaddi Mail",hands="Otronif Gloves +1",ring1="Defending Ring",ring2="Patricius Ring",back="Mollusca Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Otronif Boots +1"}
	sets['LowAcc']['DT'] = {head="Yaoyotl Helm",neck="Agitator's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",body="Xaddi Mail",hands="Otronif Gloves +1",ring1="Defending Ring",ring2="Patricius Ring",back="Mollusca Mantle",waist="Dynamic Belt +1",legs="Xaddi Cuisses",feet="Otronif Boots +1"}

	sets['HighAcc']['StandardDT'] = sets['HighAcc']['DT']
	sets['MidAcc']['StandardDT'] = sets['MidAcc']['DT']
	sets['LowAcc']['StandardDT'] = sets['LowAcc']['DT']

	sets['HighAcc']['WSSet'] = {head="Yaoyotl Helm",neck="Agitator's Collar",ear1="Moonshade Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Buremte Gloves",ring1="Ifrit Ring",ring2="Candent Ring",back="Takaha Mantle",waist="Metalsinger Belt",legs="Miki. Cuisses",feet="Waki. Sune-Ate +1"}
	sets['MidAcc']['WSSet'] = {head="Otomi Helm",neck="Ganesha's Mala",ear1="Moonshade Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Miki. Gauntlets",ring1="Ifrit Ring",ring2="Ifrit Ring",back="Buquwik Cape",waist="Metalsinger Belt",legs="Wakido Haidate +1",feet="Sak. Sune-Ate +1"}
	sets['LowAcc']['WSSet'] = {head="Otomi Helm",neck="Ganesha's Mala",ear1="Moonshade Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Miki. Gauntlets",ring1="Ifrit Ring",ring2="Ifrit Ring",back="Buquwik Cape",waist="Metalsinger Belt",legs="Wakido Haidate +1",feet="Sak. Sune-Ate +1"}

	sets['HighAcc']['Tachi: Gekko'] = sets['HighAcc']['WSSet']
	sets['MidAcc']['Tachi: Gekko'] = sets['MidAcc']['WSSet']
	sets['LowAcc']['Tachi: Gekko'] = sets['LowAcc']['WSSet']

	sets['HighAcc']['Tachi: Yukikaze'] = sets['HighAcc']['Tachi: Gekko']
	sets['MidAcc']['Tachi: Yukikaze'] = sets['MidAcc']['Tachi: Gekko']
	sets['LowAcc']['Tachi: Yukikaze'] = sets['LowAcc']['Tachi: Gekko']

	sets['HighAcc']['Tachi: Rana'] = sets['HighAcc']['Tachi: Gekko']
	sets['MidAcc']['Tachi: Rana'] = sets['MidAcc']['Tachi: Gekko']
	sets['LowAcc']['Tachi: Rana'] = sets['LowAcc']['Tachi: Gekko']

	sets['HighAcc']['Tachi: Fudo'] = set_combine(sets['HighAcc']['WSSet'], {neck="Snow Gorget",waist="Metalsinger Belt"})
	sets['MidAcc']['Tachi: Fudo'] = set_combine(sets['MidAcc']['WSSet'], {neck="Snow Gorget",waist="Metalsinger Belt"})
	sets['LowAcc']['Tachi: Fudo'] = set_combine(sets['LowAcc']['WSSet'], {neck="Snow Gorget",waist="Metalsinger Belt"})

	sets['HighAcc']['KashaSet'] = set_combine(sets['HighAcc']['WSSet'], {neck="Ganesha's Mala",waist="Light Belt"})
	sets['MidAcc']['KashaSet'] = set_combine(sets['MidAcc']['WSSet'], {neck="Ganesha's Mala",waist="Light Belt"})
	sets['LowAcc']['KashaSet'] = set_combine(sets['LowAcc']['WSSet'], {neck="Ganesha's Mala",waist="Light Belt"})

	sets['HighAcc']['RequiescatSet'] = set_combine(sets['HighAcc']['WSSet'], {neck="Shadow Gorget",back="Atheling Mantle",waist="Shadow Belt",feet="Whirlpool Greaves"})
	sets['MidAcc']['RequiescatSet'] = set_combine(sets['MidAcc']['WSSet'], {neck="Shadow Gorget",back="Atheling Mantle",waist="Shadow Belt",feet="Whirlpool Greaves"})
	sets['LowAcc']['RequiescatSet'] = set_combine(sets['LowAcc']['WSSet'], {neck="Shadow Gorget",back="Atheling Mantle",waist="Shadow Belt",feet="Whirlpool Greaves"})

	sets['HighAcc']['Tachi: Shoha'] = set_combine(sets['HighAcc']['WSSet'], {neck="Shadow Gorget",waist="Shadow Belt"})
	sets['MidAcc']['Tachi: Shoha'] = {head="Otomi Helm",body="Sakonji Domaru +1",hands="Miki. Gauntlets",legs="Wakido Haidate +1",feet="Sak. Sune-Ate +1",neck="Ganesha's Mala",waist="Windbuffet Belt",ear1="Moonshade Earring",ear2="Brutal Earring",ring1="Ifrit Ring",ring2="Rajas Ring",back="Buquwik Cape"} 
	sets['LowAcc']['Tachi: Shoha'] = {head="Otomi Helm",body="Sakonji Domaru +1",hands="Miki. Gauntlets",legs="Wakido Haidate +1",feet="Sak. Sune-Ate +1",neck="Ganesha's Mala",waist="Windbuffet Belt",ear1="Moonshade Earring",ear2="Brutal Earring",ring1="Ifrit Ring",ring2="Rajas Ring",back="Buquwik Cape"} 

	sets['Running'] = set_combine(sets['HighAcc']['DT'], {back="Shadow Mantle",feet="Danzo Sune-Ate"})

	sets['Warding Circle'] = {head="Wakido Kabuto +1"}

	sets['Meikyo Shisui'] = set_combine(sets['HighAcc']['DT'], {feet="Sak. Sune-Ate +1"})

	sets['Meditate'] = {head="Wakido Kabuto +1",hands="Sakonji Kote"}

	sets['Town'] = set_combine(sets['HighAcc']['DT'], {head="Shaded Specs.",neck="Agitator's Collar",body="Hachiryu Haramaki",hands="Wakido Kote +1",ring2="Patricius Ring",back="Takaha Mantle",legs="Hachiryu Haidate",feet="Danzo Sune-Ate"})

	sets['UtsuSet'] = set_combine(sets['HighAcc']['DT'], {ear2="Loquac. Earring"})

	sets['Trust'] = {main="Tsurumaru",head="Wakido Kabuto +1",body="Wakido Domaru +1",hands="Wakido Kote +1",legs="Wakido Haidate +1",feet="Waki. Sune-Ate +1"}
		
end

function precast(spell,action)
	if check_ready(spell) then
		if spell.type == 'WeaponSkill' then
			if spell.target.distance > 10 or player.tp < 900 then
				cancel_spell()
				return
			end

			if sets[accMode][spell.english] then
				equip(sets[accMode][spell.english])
			else
				equip(sets[accMode]['WSSet'])
			end

			if buffactive['Meikyo Shisui'] then
				windower.add_to_chat(209, "Meikyo Shisui On")
				equip({feet="Sak. Sune-Ate +1"})
			end

			windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
		elseif spell.type == 'JobAbility' then
			if sets[spell.english] then
				equip(sets[spell.english])
			end
		elseif spell.type == 'Ninjutsu' then
			if buffactive['hasso'] or buffactive['seigan'] then
				cast_delay(0.1)
				send_command('cancel 353;cancel 354;')
			end
			equip(sets['UtsuSet'])
		elseif spell.type == 'Trust' then
			equip(sets['Trust'])
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	if spell.type == 'Ninjutsu' then
		if spell.english == 'Utsusemi: Ichi' then
			if buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				equip(sets['UtsuSet'])
				send_command('cancel 66;cancel 446;cancel 445;cancel 444;')
			end
		elseif spell.english == 'Utsusemi: Ni' then
			equip(sets['UtsuSet'])
		end
	elseif spell.type == 'Trust' then
		equip(sets['Trust'])
	end
end

function aftercast(spell,action)
	if spell.type == 'WeaponSkill' and spell.action_type ~= 'Interruption' then
		send_command('wait 0.5;gs c stpcalc;')
	end
	if spam_protection_off(spell)then
		handle_idle()
	end
end

function status_change(new,old)
	handle_idle()
end

function buff_change(buff,gain_or_loss)
	if buff == 'encumbered' and gain_or_loss == 'loss' then
		equip(set_combine(sets[accMode][TPSet],{main='Tsurumaru'}))
	elseif gain_or_loss == 'gain' then
		heal_me()
	end
end

function filtered_action(spell,action)
	if spell.type == 'WhiteMagic' then
		windower.add_to_chat(209,'Filtered Action '..spell.english..' on '..spell.target.name..' sent to nekachu')
		cancel_spell()
		send_command('send nekachu //'..spell.english..' '..spell.target.name..';')
	end
end


function handle_idle()
	if player.equipment.main == 'empty' or player.equipment.sub == 'empty' then
		equip(set_combine(sets[accMode][TPSet],{main='Tsurumaru'}))
	end
	if player.status == 'Engaged' then
		if accMode == 'LowAcc' and player.mp < 100 then
			equip(sets[accMode][TPSet], {ring2="Raja's Ring"})
		else
			equip(sets[accMode][TPSet])
		end
	else
		if inTown then
			equip(sets['Town'])
		else
			equip(sets[idleMode])
		end
	end
end

function self_command(command)
	if command == 'ping' then
		if check_ready_silent() then
			if player.tp < 1000 then
				local tpNeeded = 1000 - player.tp
				local currentBest = 1000
				local bestIndex = 1000
				local hitsNeeded = 1000
				for i,v in pairs(tpValue) do
					hitsNeeded = math.ceil(tpNeeded/v)
					--windower.add_to_chat(050, 'Checking '..i..' STP for '..v..' per hits, '..hitsNeeded..' <= '..currentBest)
					if hitsNeeded < currentBest or (hitsNeeded == currentBest and i < bestIndex) then
						bestIndex = i
						currentBest = hitsNeeded
					end
				end
				--windower.add_to_chat(050, '-----------')
				--windower.add_to_chat(050, 'Using '..bestIndex..' STP for '..currentBest..' hits to 1000 ['..player.tp..'%]')
				if TPSet ~= bestIndex then
					windower.add_to_chat(050, 'Using '..bestIndex..' STP for '..currentBest..' hits to 1000 ['..player.tp..'%]')
					TPSet = bestIndex
					handle_idle()
				end
			else
				TPSet = 58
			end
		end
	elseif command == 'stpcalc' then
			if player.tp < 1000 then
				local tpNeeded = 1000 - player.tp
				local currentBest = 1000
				local bestIndex = 1000
				local hitsNeeded = 1000
				for i,v in pairs(tpValue) do
					hitsNeeded = math.ceil(tpNeeded/v)
					--windower.add_to_chat(050, 'Checking '..i..' STP for '..v..' per hits, '..hitsNeeded..' <= '..currentBest)
					if hitsNeeded < currentBest or (hitsNeeded == currentBest and i < bestIndex) then
						bestIndex = i
						currentBest = hitsNeeded
					end
				end
				--windower.add_to_chat(050, '-----------')
				if TPSet ~= bestIndex then
					windower.add_to_chat(050, 'Using '..bestIndex..' STP for '..currentBest..' hits to 1000 ['..player.tp..'%]')
					TPSet = bestIndex
					handle_idle()
				end
			else
				TPSet = 58
			end
	elseif command == 'checktwilight' then
		if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
			disable('head','body')
		else
			enable('head','body')
			equip({head="Twilight Helm",body="Twilight Mail"})
			send_command('wait 0.2;gs c checktwilight;')
		end
	elseif command == 'trigger1' then
		enable('head','body')
		TPSet = 'StandardDT'
		idleMode = "DT"
		windower.add_to_chat(167,"Mode [RR + "..accMode.."]")
		handle_idle()
		if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
			disable('head','body')
		else
			equip({head="Twilight Helm",body="Twilight Mail"})
			send_command('wait 0.2;gs c checktwilight;')
		end
	elseif command == 'trigger2' then
		enable('head','body')
		TPSet = 'StandardDT'
		idleMode = 'Running'
		windower.add_to_chat(167,"Mode [DT + "..accMode.."]")
		handle_idle()
	elseif command == 'trigger3' then
		enable('head','body')
		TPSet = 'Standard'
		windower.add_to_chat(167,"Mode [Standard + "..accMode.."]")
		idleMode = 'Running'
		handle_idle()
	elseif command == 'trigger4' then
		if accMode == 'LowAcc' then
			accMode = 'MidAcc'
			windower.add_to_chat(167,"Accuracy [Mid]")
		elseif accMode == 'MidAcc' then
			accMode = 'HighAcc'
			windower.add_to_chat(167,"Accuracy [High]")
		else
			accMode = 'LowAcc'
			windower.add_to_chat(167,"Accuracy [Low]")
		end
		handle_idle()
	elseif command == 'weapon' then
		if weaponSet == "Anahera" then
			equip({main='Tsurumaru',sub="Pole Grip"})
			windower.add_to_chat(167,"Changing to Tsurumaru")
		else
			equip({main='Anahera Blade',sub="Pole Grip"})
			windower.add_to_chat(167,"Changing to Anahera Blade")
		end
	elseif command == 'dt' or command == 'mdt' then
		equip(sets['DT'])
		windower.add_to_chat(167,"DT for TP on")
	elseif command == 'dt_end' then
		handle_idle()
		windower.add_to_chat(167,"DT for TP end")
	elseif command == 'sneak' then
		send_command('send nekachu //sneak Miang;')
	elseif command == 'invisible' then
		send_command('send nekachu //invisible Miang;')
	elseif command == 'heal' then
		if player.sub_job == "NIN" then
			if buffactive['silence'] then
				send_command('input /item "Echo Drops" <me>;')
			end
			send_command('input /ma "Utsusemi: Ichi" <me>;')
		else
			heal_me()
		end
	elseif command == 'buff' then
		if player.sub_job == "NIN" then
			if buffactive['silence'] then
				send_command('input /item "Echo Drops" <me>;')
			end
			send_command('input /ma "Utsusemi: Ni" <me>;')
		else
			buff_me()
		end
	elseif command == 'alt_ws' then
		send_command('send nekachu gs c ws;send mazuki /exenterator;')
	elseif string.find(command,'equip') then
		gearSet = command:gsub("equip ", "")
		if gearSet ~= nil then
			if sets[gearSet] then
				equip(sets[gearSet])
				windower.add_to_chat(158,"Equipping "..gearSet)
			elseif sets[accMode][gearSet] then
				equip(sets[accMode][gearSet])
				windower.add_to_chat(158,"Equipping "..accMode.." "..gearSet)
			else 
				windower.add_to_chat(158,"Set "..gearSet.." not found")
			end
		end
	elseif string.find(command,'msg') then
		commandSplit = T{}
		commandSplit = string.split(command," ")
		if commandSplit[2] ~= nil then
			if commandSplit[2] == 'RR' then
				windower.add_to_chat(158,"Nekachu - Missing RR")
			end
		end
	elseif command == 'soul' then
		send_command('input /item "Soultrapper 2000" <t>;')
		send_command('send mazuki gs c soul;send nekachu gs c soul;')
	elseif command == 'town on' then
		inTown = true
	elseif command == 'town off' then
		inTown = false
	elseif command == 'request_songs' then
		send_command('send mazuki gs c sing min march march min Miang;')
	elseif command == 'lockstyle' then
		send_command("input /lockstyle off;wait 1.5;gs c equip Town;wait 1.5;input /lockstyle on;wait 1;gs c equip 58")
	end
end