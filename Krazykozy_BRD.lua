-- ** I Use Byrth & Motenten's Functions ** --
-- Last Updated: 05/05/14 12:00 AM *Added Precast Elemental Staff Toggle* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","PDT"} -- Default Idle Set Is Movement --
	timer_reg = {}
	pianissimo_cycle = false
	ElementalStaff = 'ON' -- Set Default Precast Elemental Staff ON or OFF Here --
	Main = 'OFF' -- Set Default Main Weapon ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	-- Daurdabla Trigger Songs --
	DaurdSongs = S{"Army's Paeon","Army's Paeon II","Shining Fantasia","Herb Pastoral","Goblin Gavotte"}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "ChocoboMazurka", SC2 = "HerbPastoral", SC3 = "GoblinGavotte"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle Sets --
	sets.Idle.Movement = {
			main="Terra's Staff",
			range="Gjallarhorn",
			head="Wivre Hairpin",
			neck="Twilight Torque",
			ear1="Loquac. Earring",
			ear2="Aoidos' Earring",
			body="Gendewitha Bliaut",
			hands="Gendewitha Gages",
			ring1="Patricius Ring",
			ring2="Dark Ring",
			back="Rhapsode's Cape",
			waist="Slipor Sash",
			legs="Nares Trews",
			feet="Aoidos' Cothrn. +2"}
	sets.Idle.PDT = set_combine(sets.Idle.Movement,{
			head="Gende. Caubeen",
			legs="Gendewitha Spats"})
	sets.Resting = set_combine(sets.Idle.Movement,{})

	sets.Precast = {}
	-- Song Precast Set --
	sets.Precast.SongCast = {
			sub=empty,
			range=empty,
			ammo="Impatiens",
			head="Aoidos' Calot +2",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ear2="Aoidos' Earring",
			body="Marduk's Jubbah +1",
			hands="Gendewitha Gages",
			ring1="Prolix Ring",
			ring2="Veneficium Ring";
			back="Swith Cape +1",
			waist="Witful Belt";
			legs="Gendewitha Spats",
			feet="Brd. Slippers +2"}

	-- Elemental Staves --
	sets.Precast.Thunder = {main='Apamajas I'}
	sets.Precast.Water = {main='Haoma I'}
	sets.Precast.Fire = {main='Atar I'}
	sets.Precast.Ice = {main='Vourukasha I'}
	sets.Precast.Wind = {main='Vayuvata I'}
	sets.Precast.Earth = {main='Vishrava I'}
	sets.Precast.Light = {main='Arka I'}
	sets.Precast.Dark = {main='Xsaeta I'}

	-- Precast Daurdabla Set --
	sets.Precast.Daurdabla = {
			range="Daurdabla",
			ammo=empty,
			head="Aoidos' Calot +2",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ear2="Aoidos' Earring",
			body="Marduk's Jubbah +1",
			hands="Gendewitha Gages",
			ring1="Prolix Ring",
			ring2="Veneficium Ring";
			back="Swith Cape +1",
			waist="Witful Belt";
			legs="Gendewitha Spats",
			feet="Bokwus Boots"}

	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			body="Marduk's Jubbah +1",
			hands="Gendewitha Gages",
			ring1="Prolix Ring",
			ring2="Veneficium Ring";
			back="Swith Cape +1",
			waist="Witful Belt";
			legs="Orvail Pants",
			feet="Chelona Boots +1"}

	-- Cure Precast Set --
	sets.Precast.Cure = {
			ammo="Impatiens",
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear2="Loquac. Earring",
			body="Heka's Kalasiris",
			hands="Gendewitha Gages",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Pahtli Cape",
			waist="Witful Belt",
			legs="Orvail Pants",
			feet="Chelona Boots +1"}

	-- Midcast Base Set --
	sets.Midcast = {
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			body="Hedera Cotehardie",
			hands="Gendewitha Gages",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Swith Cape +1",
			waist="Pya'ekue Belt",
			legs="Brioso Cann. +1",
			feet="Brioso Slippers +1"}

	-- Song Debuff Set --
	sets.Midcast.Wind = {
			main="Carnwenhan",
			sub="Genbu's Shield",
			range="Gjallarhorn",
			ammo=empty,
			head="Brioso Roundlet +1",
			neck="Piper's Torque",
			ear1="Lifestorm Earring",
			ear2="Psystorm Earring",
			body="Brioso Just. +1",
			hands="Ad. Mnchtte. +2",
			ring1="Maquette Ring",
			ring2="Sangoma Ring",
			back="Rhapsode's Cape",
			waist="Demonry Sash",
			legs="Brioso Cann. +1",
			feet="Bokwus Boots"}

	-- Song Buff Set --
	sets.Midcast.WindBuff = {
			main="Carnwenhan",
			sub="Genbu's Shield",
			range="Gjallarhorn",
			ammo=empty,
			head="Aoidos' Calot +2",
			neck="Aoidos' Matinee",
			ear1="Loquac. Earring",
			ear2="Aoidos' Earring",
			body="Aoidos' Hngrln. +2",
			hands="Ad. Mnchtte. +2",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs="Mdk. Shalwar +1",
			feet="Brioso Slippers +1"}

	sets.Midcast.March = {hands="Ad. Mnchtte. +2"}
	sets.Midcast.Minuet = {body="Aoidos' Hngrln. +2"}
	sets.Midcast.Madrigal = {head="Aoidos' Calot +2"}
	sets.Midcast.Ballad = {legs="Aoidos' Rhing. +2"}
	sets.Midcast.Scherzo = {feet="Aoidos' Cothrn. +2"}
	sets.Midcast.Mazurka = {head="Nahtirah Hat"}
	sets.Midcast.Paeon = {head="Brioso Roundlet +1"}
	sets.Midcast.Finale = {}
	sets.Midcast.Lullaby = {}

	-- Cure Set --
	sets.Midcast.Cure = {
			main="Arka IV",
			sub="Achaq Grip",
			head="Gende. Caubeen",
			neck="Colossus's Torque",
			ear1="Lifestorm Earring",
			ear2="Beatific Earring",
			body="Heka's Kalasiris",
			hands="Gendewitha Gages",
			ring1="Sirona's Ring",
			ring2="Haoma's Ring",
			back="Tempered Cape",
			waist="Bishop's Sash",
			legs="Mdk. Shalwar +1",
			feet="Brioso Slippers +1"}

	-- Curaga Set --
	sets.Midcast.Curaga = {
			main="Arka IV",
			sub="Achaq Grip",
			ammo="Oreiad's Tathlum",
			head="Gende. Caubeen",
			neck="Nuna Gorget +1",
			ear1="Lifestorm Earring",
			ear2="Loquac. Earring",
			body="Heka's Kalasiris",
			hands="Gendewitha Gages",
			ring1="Aquasoul Ring",
			ring2="Karka Ring",
			back="Pahtli Cape",
			waist="Pythia Sash +1",
			legs="Gendewitha Spats",
			feet="Gende. Galoshes"}

	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
			head="Nahtirah Hat",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			body="Hedera Cotehardie",
			hands="Gendewitha Gages",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			back="Swith Cape +1",
			waist="Pya'ekue Belt",
			legs="Brioso Cann. +1",
			feet="Brioso Slippers +1"})

	-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			ring1="Haoma's Ring",
			ring2="Haoma's Ring",
			feet="Gende. Galoshes"})

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast.Haste)

	-- JA Sets --
	sets.JA = {}
	sets.JA.Nightingale = {feet="Brd. Slippers +2"}
	sets.JA.Troubadour = {body="Bard's Justaucorps +2"}
	sets.JA["Soul Voice"] = {legs="Brd. Cannions +2"}

	-- Melee Sets --
	sets.Melee = {}
	sets.Melee.MidACC = set_combine(sets.Melee,{})
	sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{})

	-- WS Base Set --
	sets.WS = {}

	sets.WS.Exenterator = {}
	sets.WS.Exenterator.MidACC = set_combine(sets.WS.Exenterator,{})
	sets.WS.Exenterator.HighACC = set_combine(sets.WS.Exenterator.MidACC,{})

	sets.WS.Evisceration = {}
	sets.WS.Evisceration.MidACC = set_combine(sets.WS.Evisceration,{})
	sets.WS.Evisceration.HighACC = set_combine(sets.WS.Evisceration.MidACC,{})

	sets.WS["Mercy Stroke"] = {}
	sets.WS["Mercy Stroke"].MidACC = set_combine(sets.WS["Mercy Stroke"],{})
	sets.WS["Mercy Stroke"].HighACC = set_combine(sets.WS["Mercy Stroke"].MidACC,{})

	sets.WS["Rudra's Storm"] = {}
	sets.WS["Rudra's Storm"].MidACC = set_combine(sets.WS["Rudra's Storm"],{})
	sets.WS["Rudra's Storm"].HighACC = set_combine(sets.WS["Rudra's Storm"].MidACC,{})

	sets.WS["Mordant Rime"] = {}

	-- Lock Main Weapon --
	sets.MainWeapon = {
			main="Carnwenhan",
			sub="Genbu's Shield"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "BardSong" or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "BardSong" and spell.target.name == player.name and buffactive.Pianissimo then -- Change Target From <me> To <t> When Pianissimo Is Active --
		change_target('<t>')
	elseif spell.type == 'BardSong' and spell.target.type and spell.target.type == 'PLAYER' and not buffactive.Pianissimo and not spell.target.charmed and not pianissimo_cycle then -- Auto Pianoissimo When You Cast A Song On A Player --
		cancel_spell()
		pianissimo_cycle = true
		send_command('input /ja "Pianissimo" <me>;wait 1.5;input /ma "'..spell.name..'" '..spell.target.name..';')
		return
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	end
	if spell.name ~= 'Pianissimo' then
		pianissimo_cycle = false
	end
end

function precast(spell,action)
	if spell.type:endswith('Magic') or spell.type == "BardSong" or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu or BardSong If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.type == 'BardSong' then
				if buffactive.Nightingale then
					equip_song_gear(spell)
					return
				else
					equip_song_gear(spell)
					equip(sets.Precast.SongCast)
				end
			elseif string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if spell.english == "Evisceration" and player.tp > 299 then
				equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and not buffactive.Nightingale and ElementalStaff == 'ON' then
		equip(sets.Precast[spell.element])
	end
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif string.find(spell.english,'Cure') then
			equipSet = equipSet.Cure
		elseif string.find(spell.english,'Cura') then
			equipSet = equipSet.Curaga
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		end
	elseif spell.type == 'BardSong' then
		equip_song_gear(spell)
	end
	equip(equipSet)
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function aftercast(spell,action)
	if spell.type and spell.type == 'BardSong' and spell.target and spell.target.name == player.name and not spell.interrupted then
		local t = os.time()

		local tempreg = {}
		for i,v in pairs(timer_reg) do
			if v < t then tempreg[i] = true end
		end
		for i,v in pairs(tempreg) do
			timer_reg[i] = nil
		end
		
		local dur = calculate_duration(spell.name)
		if timer_reg[spell.name] then
			if (timer_reg[spell.name] - t) <= 120 then
				send_command('timers delete "'..spell.name..'"')
				timer_reg[spell.name] = t + dur
				send_command('timers create "'..spell.name..'" '..dur..' down')
			end
		else
			local maxsongs = 2
			if player.equipment.range == 'Daurdabla' then
				maxsongs = maxsongs+2
			end
			if buffactive['Clarion Call'] then
				maxsongs = maxsongs+1
			end
			if maxsongs < table.length(timer_reg) then
				maxsongs = table.length(timer_reg)
			end
			
			if table.length(timer_reg) < maxsongs then
				timer_reg[spell.name] = t+dur
				send_command('timers create "'..spell.name..'" '..dur..' down')
			else
				local rep,repsong
				for i,v in pairs(timer_reg) do
					if t+dur > v then
						if not rep or rep > v then
							rep = v
							repsong = i
						end
					end
				end
				if repsong then
					timer_reg[repsong] = nil
					send_command('timers delete "'..repsong..'"')
					timer_reg[spell.name] = t+dur
					send_command('timers create "'..spell.name..'" '..dur..' down')
				end
			end
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if new == 'Engaged' then
		equipSet = sets.Melee
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Main == 'ON' then
		equip(sets.MainWeapon)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then
		send_command('input /ma "Victory March" <me>')
		add_to_chat(158,'Melee Speed II: [Victory March]')
	elseif command == 'C2' then
		send_command('input /ma "Advancing March" <me>')
		add_to_chat(158,'Melee Speed: [Advancing March]')
	elseif command == 'C3' then
		send_command('input /ma "Valor Minuet V" <me>')
		add_to_chat(158,'Melee Attack: [Valor Minuet V]')
	elseif command == 'C5' then
		send_command('input /ma "Valor Minuet IV" <me>')
		add_to_chat(158,'Melee Attack: [Valor Minuet IV]')
	elseif command == 'C7' then
		send_command('input /ma "Hunter\'s Prelude" <me>')
		add_to_chat(158,'Ranged Accuracy: [Hunter\'s Prelude]')
	elseif command == 'C15' then
		send_command('input /ma "Archer\'s Prelude" <me>')
		add_to_chat(158,'Ranged Accuracy: [Archer\'s Prelude]')
	elseif command == 'C9' then
		send_command('input /ma "Blade Madrigal" <me>')
		add_to_chat(158,'Melee Accuracy II: [Blade Madrigal]')
	elseif command == 'C10' then
		send_command('input /ma "Sword Madrigal" <me>')
		add_to_chat(158,'Melee Accuracy: [Sword Madrigal]')
	elseif command == 'C12' then
		send_command('input /ma "Valor Minuet III" <me>')
		add_to_chat(158,'Melee Attack: [Valor Minuet III]')
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C16' then -- Main Weapon Toggle --
		if Main == 'ON' then
			Main = 'OFF'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Main = 'ON'
			add_to_chat(158,'Main Weapon: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function equip_song_gear(spell)
	if DaurdSongs:contains(spell.english) then
		equip(sets.Precast.Daurdabla)
		add_to_chat(158,'Daurdabla: [ON]')
	else
		if spell.target.type == 'MONSTER' then
			equip(sets.Midcast.Wind)
			if string.find(spell.english,'Finale') then equip(sets.Midcast.Finale) end
			if string.find(spell.english,'Lullaby') then equip(sets.Midcast.Lullaby) end
		else
			equip(sets.Midcast.WindBuff)
			if string.find(spell.english,'March') then equip(sets.Midcast.March) end
			if string.find(spell.english,'Minuet') then equip(sets.Midcast.Minuet) end
			if string.find(spell.english,'Madrigal') then equip(sets.Midcast.Madrigal) end
			if string.find(spell.english,'Ballad') then equip(sets.Midcast.Ballad) end
			if string.find(spell.english,'Scherzo') then equip(sets.Midcast.Scherzo) end
			if string.find(spell.english,'Mazurka') then equip(sets.Midcast.Mazurka) end
			if string.find(spell.english,'Paeon') then equip(sets.Midcast.Paeon) end
		end
	end
end

function calculate_duration(name)
	local mult = 1
	if player.equipment.main == "Carnwenhan" then mult = mult + 0.5 end
	if player.equipment.range == 'Daurdabla' then mult = mult + 0.3 end
	if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end
	if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
	if player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
	if player.equipment.legs == "Mdk. Shalwar +1" then mult = mult + 0.1 end
	if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end

	if string.find(name,'Paeon') and player.equipment.head == 'Brioso Roundlet +1' then mult = mult + 0.1 end
	if string.find(name,'March') and player.equipment.hands == 'Ad. Mnchtte. +2' then mult = mult + 0.1 end
	if string.find(name,'Minuet') and player.equipment.body == "Aoidos' Hngrln. +2" then mult = mult + 0.1 end
	if string.find(name,'Madrigal') and player.equipment.head == "Aoidos' Calot +2" then mult = mult + 0.1 end
	if string.find(name,'Ballad') and player.equipment.legs == "Aoidos' Rhing. +2" then mult = mult + 0.1 end
	if string.find(name,'Scherzo') and player.equipment.feet == "Aoidos' Cothrn. +2" then mult = mult + 0.1 end

	if buffactive.Troubadour then
		mult = mult*2
	end
	if string.find(name,'Scherzo') then
		if buffactive['Soul Voice'] then
			mult = mult*2
		elseif buffactive['marcato'] then
			mult = mult*1.5
		end
	end

	mult = mult - 0.05

	local totalDuration = mult*120

	return totalDuration
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index>1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WHM' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 3)
	elseif player.sub_job == 'DNC' then
		set_macro_page(3, 3)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 3)
	elseif player.sub_job == 'WAR' then
		set_macro_page(10, 3)
	else
		set_macro_page(1, 3)
	end
end