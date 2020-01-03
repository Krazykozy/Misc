-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Shooting/QD/TP/WS. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {'Movement', 'Regen'} -- Default Idle Set Is Movement --
	Armor = 'None'
	define_roll_values()
	AutoMode = 'OFF' -- Set Default Auto RA/WS ON or OFF Here --
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	ranged_ws = S{
			"Hot Shot","Split Shot","Sniper Shot","Slug Shot","Detonator","Numbing Shot",
			"Last Stand","Leaden Salute","Wildfire"}

	ACC_Shots = S{"Light Shot","Dark Shot","Wind shot","Fire shot","Water shot","Ice shot","Thunder shot","Earth shot"}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1="CoursersRoll", SC2="DiaII", SC3="LightShot"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			main="Surcouf's Jambiya",
			range={ name="Compensator", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Bronze Bullet",
			head="Comm. Tricorne",
			body="Commodore Frac",
			hands="Meg. Gloves +1",
			legs="Mummu Kecks",
			feet="Meg. Jam. +1",
			neck="Wiglen Gorget",
			waist="Impulse Belt",
			left_ear="Assuage Earring",
			right_ear="Mendi. Earring",
			left_ring="Luzaf's Ring",
			right_ring="Barataria Ring",
			back="Camulus's Mantle",}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			main="Surcouf's Jambiya",
			range={ name="Compensator", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Bronze Bullet",
			head="Comm. Tricorne",
			body="Commodore Frac",
			hands="Meg. Gloves +1",
			legs="Mummu Kecks",
			feet="Meg. Jam. +1",
			neck="Wiglen Gorget",
			waist="Impulse Belt",
			left_ear="Assuage Earring",
			right_ear="Mendi. Earring",
			left_ring="Luzaf's Ring",
			right_ring="Barataria Ring",
			back="Camulus's Mantle",})

	-- QD Sets --
	sets.QD = {
			main="Fettering Blade",
			sub="Nusku Shield",
			range="Compensator",
			head="Umbani Cap",
			neck="Sanctity Necklace",
			ear1="Crematio Earring",
			ear2="Friomisi Earring",
			body="Mirke Wardecors",
			hands="Taeon Gloves",
			ring1="Arvina Ringlet",
			ring2="Fenrir Ring +1",
			back="Gunslinger's Cape",
			waist="Aquiline Belt",
			legs="Lak. Trews +1",
			feet="Lanun Boots"}
	sets.QD.MidACC = set_combine(sets.QD,{
			ammo="Animikii Bullet",})
	sets.QD.HighACC = set_combine(sets.QD.MidACC,{
			ammo="Animikii Bullet",
			neck="Combatant's Torque",
			ear1="Hermetic Earring",
			ear2="Gwati Earring",
			hands="Sigyn's Bazubands",
			ring1="Sangoma Ring",
			ring2="Fenrir Ring +1",
			legs="Thur. Tights +1",
			feet="Lak. Bottes +1"})

	-- PDT/MDT Sets --
	sets.PDT = {
			head="Lithelimb Cap",
			ear2="Etiolation Earring",
			ear1="Sanare Earring",
			ear2="Heartseeker Earring",
			body="Qaaxo Harness",
			hands="Umuthi Gloves",
			ring1={name="Dark Ring",augment="Phys. dmg. Taken -6%","Breath dmg. taken -4%","Spell interruption rate down 3%"},
			ring2="Defending Ring",
			back="Solemnity Cape",
			waist="Patentia Sash",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}}

	sets.MDT = set_combine(sets.PDT,{
			ear2="Etiolation Earring",
			ear1="Sanare Earring",
			ring1={name="Dark Ring",augment="Breath dmg. taken -4%","Magic dmg. Taken -5%"},
			ring2="Defending Ring",
			back="Moonbeam Cape"})

	-- Roll Set --
	sets.Rolls = set_combine(sets.PDT,{
			main="Surcouf's Jambiya",
			range={ name="Compensator", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Bronze Bullet",
			head="Comm. Tricorne",
			body="Commodore Frac",
			hands="Meg. Gloves +1",
			legs="Mummu Kecks",
			feet="Meg. Jam. +1",
			neck="Wiglen Gorget",
			waist="Impulse Belt",
			left_ear="Assuage Earring",
			right_ear="Mendi. Earring",
			left_ring="Luzaf's Ring",
			right_ring="Barataria Ring",
			back="Camulus's Mantle",})

	-- Preshot --
	sets.Preshot = {
			main="Surcouf's Jambiya",
			range={ name="Compensator", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Bronze Bullet",
			head="Aurore Beret",
			body="Commodore Frac",
			hands="Meg. Gloves +1",
			legs="Mummu Kecks",
			feet="Meg. Jam. +1",
			neck="Peacock Charm",
			waist="Impulse Belt",
			left_ear="Assuage Earring",
			right_ear="Mendi. Earring",
			left_ring="Barataria Ring",
			right_ring="Luzaf's Ring",
			back="Navarch's Mantle",}

	-- Shooting Base Set --
	sets.Midshot = {}

	-- Compensator Sets --
	sets.Midshot.Compensator = {
			main="Surcouf's Jambiya",
			range={ name="Compensator", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Bronze Bullet",
			head="Meghanada Visor +1",
			body={ name="Pursuer's Doublet", augments={'----------------',}},
			hands="Meg. Gloves +1",
			legs="Mummu Kecks",
			feet="Meg. Jam. +1",
			neck="Peacock Charm",
			waist="Impulse Belt",
			left_ear="Flame Pearl",
			right_ear="Flame Pearl",
			left_ring="Garuda Ring",
			right_ring="Garuda Ring",
			back="Navarch's Mantle",}
	sets.Midshot.Compensator.MidACC = set_combine(sets.Midshot.Compensator,{
			head="Lanun Tricorne +1",
			neck="Iqabi Necklace",
			ear1="Enervating Earring",
			back="Gunslinger's Cape"})
	sets.Midshot.Compensator.HighACC = set_combine(sets.Midshot.Compensator.MidACC,{
			hands="Sigyn's Bazubands",
			ring2="Hajduk Ring",
			legs="Feast Hose"})

	-- Armageddon Sets --
	sets.Midshot.Armageddon = {}
	sets.Midshot.Armageddon.MidACC = set_combine(sets.Midshot.Armageddon,{})
	sets.Midshot.Armageddon.HighACC = set_combine(sets.Midshot.Armageddon.MidACC,{})

	-- Melee Sets --
	sets.Melee = {			
			head="Lithelimb Cap",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			neck="Nefarious collar +1",
			body="Qaaxo Harness",
			hands="Qaaxo Mitaines",
			ring1="Epona's Ring",
			ring2="Chirich Ring",
			waist="Windbuffet Belt +1",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}}
	sets.Melee.MidACC = set_combine(sets.Melee,{
			head="Taeon Chapeau",
			neck="Iqabi Necklace"})
	sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{
			head="Taeon Chapeau",
			ear1="Zennaroi Earring",
			ear2="Brutal Earring",
			hands="Buremte Gloves",
			ring1="Patricius Ring",
			waist="Anguinus Belt"})

	-- WS Sets --
	sets.WS = {			
			head="Uk'uxkaj Cap",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Mekosuchinae Harness",
			hands="Qaaxo Mitaines",
			ring1="Epona's Ring",
			ring2="Chirich Ring",
			back="Vespid Mantle",
			waist="Fotia Belt",
			legs="Taeon Tights",
			feet={name="Qaaxo Leggings",augment="Attack +15","Magic Attack Bonus +15","STR +12"}}
	sets.WS.MidACC = set_combine(sets.WS,{
			head="Taeon Chapeau",
			waist="Fotia Belt"})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			head="Sukeroku Hachimaki",
			body="Manibozho Jerkin",
			back="Vespid Mantle",
			waist="Fotia Belt",
			feet={name="Qaaxo Leggings",augment="Attack +15","Magic Attack Bonus +15","STR +12"}})

	-- Savage Blade Sets --
	sets.WS["Savage Blade"] = {
			head="Uk'uxkaj Cap",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Mekosuchinae Harness",
			hands="Qaaxo Mitaines",
			ring1="Epona's Ring",
			ring2="Chirich Ring",
			back="Rancorous Mantle",
			waist="Fotia Belt",
			legs="Taeon Tights",
			feet={name="Qaaxo Leggings",augment="Attack +15","Magic Attack Bonus +15","STR +12"}}
	sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Savage Blade"],{
			head="Taeon Chapeau",
			waist="Fotia Belt"})
	sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Savage Blade"].MidACC,{
			head="Sukeroku Hachimaki",
			body="Manibozho Jerkin",
			back="Letalis Mantle",
			waist="Fotia Belt",
			feet={name="Qaaxo Leggings",augment="Attack +15","Magic Attack Bonus +15","STR +12"}})
			
	--Requiscat Sets--
	sets.WS.Requiescat = {
			head="Taeon Chapeau",
			neck="Fotia Gorget",
			ear1="Crematio Earring",
			ear2="Friomisi Earring",
			body="Mekosuchinae Harness",
			hands="Taeon Gloves",
			ring1="Epona's Ring",
			ring2="Fenrir Ring +1",
			back="Gunslinger Cape",
			waist="Fotia Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet={name="Qaaxo Leggings",augment="Attack +15","Magic Attack Bonus +15","STR +12"}}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{
			head="Taeon Chapeau"})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{
			head="Sukeroku Hachimaki",
			back="Gunslinger Cape"})
	
	-- Last Stand Sets --
	sets.WS["Last Stand"] = {
			ammo="Adlivun Bullet",
			head="Lanun Tricorne +1",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Ishvara Earring",
			body="Khepri Jacket",
			hands="Sigyn's Bazubands",
			ring1="Garuda Ring",
			ring2="Arvina Ringlet",
			back="Terebellum Mantle",
			waist="Fotia Belt",
			legs="Nahtirah Trousers",
			feet="Vanir Boots"}
	sets.WS["Last Stand"].MidACC = set_combine(sets.WS["Last Stand"],{
			head="Lak. Hat +1"})
	sets.WS["Last Stand"].HighACC = set_combine(sets.WS["Last Stand"].MidACC,{
			body="Lak. Frac +1",
			ring1="Hajduk Ring +1",
			ring2="Hajduk Ring +1",
			back="Gunslinger's Cape",
			legs="Thur. Tights +1"})

    -- Wildfire Sets--
    sets.WS["Wildfire"] = {
			ammo="Adlivun Bullet",
			head="Umbani Cap",
            body="Lanun Frac +1",
            ear1="Crematio Earring",
            ear2="Friomisi Earring",
            neck="Deviant Necklace",
			hands="Taeon Gloves",
			ring1="Garuda Ring",
			ring2="Fenrir Ring +1",
            waist="Aquiline Belt",
            legs="Nahtirah Trousers",
            back="Gunslinger Cape",
			feet={name="Qaaxo Leggings",augment="Attack +15","Magic Attack Bonus +15","STR +12"}}
    sets.WS["Wildfire"].MidACC = set_combine(sets.WS["Wildfire"],{})
    sets.WS["Wildfire"].HighACC = set_combine(sets.WS["Wildfire"].MidACC,{
	        head="Umbani Cap",	        
			ring1="Hajduk Ring",
			ring2="Longshot Ring",
			feet={name="Qaaxo Leggings",augment="Attack +15","Magic Attack Bonus +15","STR +12"}})

	-- Leaden Salute Sets --
	sets.WS['Leaden Salute'] = {}
	sets.WS['Leaden Salute'].MidACC = set_combine(sets.WS['Leaden Salute'],{})
	sets.WS['Leaden Salute'].HighACC = set_combine(sets.WS['Leaden Salute'].MidACC,{})

	-- Elemental Obi --
	sets.Obi = {}
	sets.Obi.Thunder = {waist='Hachirin-No-Obi'}
	sets.Obi.Water = {waist='Hachirin-No-Obi'}
	sets.Obi.Fire = {waist='Hachirin-No-Obi'}
	sets.Obi.Ice = {waist='Hachirin-No-Obi'}
	sets.Obi.Wind = {waist='Hachirin-No-Obi'}
	sets.Obi.Earth = {waist='Hachirin-No-Obi'}
	sets.Obi.Light = {waist='Hachirin-No-Obi'}
	sets.Obi.Dark = {waist='Hachirin-No-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA["Random Deal"] = {body="Lanun Frac +1"}
	sets.JA.Fold = {hands="Lanun Gauntlets"}
	sets.JA["Snake Eye"] = {legs="Lanun Culottes"}
	sets.JA["Wild Card"] = {feet="Lanun Boots"}

	-- Waltz Set --
	sets.Waltz = {
			head="Uk'uxkaj Cap",
			neck="Temperance Torque",
			ring1="Asklepian Ring",
			ring2="Valseur's Ring",
			back="Iximulew Cape",
			waist="Chaac Belt"}

	sets.Precast = {}
	--Fastcast Set --
	sets.Precast.FastCast = {			
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ear2="Etiolation Earring",
			hands="Thaumas Gloves",
			ring1="Prolix Ring",
			ring2="Veneficium Ring"}

	sets.Midcast = {}			
	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
			neck="Incanter's Torque",
			ear2="Andoaa Earring",
			waist="Olympus Sash"}			
			
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			hands="Thaumas Gloves",
			ring1="Prolix Ring",
			ring2="Veneficium Ring"})
			
    --Doom/Cursed Sets--
	sets.Doom = {
			ring1="Purity Ring",
			ring2="Defending Ring"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "CorsairRoll" and buffactive[spell.english] then -- Change Any Rolls To Double-Up When You Have A Roll Up --
		cancel_spell()
		send_command('doubleup')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ' .. player.tp)
	elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (player.status == 'Engaged' and ((ranged_ws:contains(spell.english) and spell.target.distance > 16+target_distance) or (spell.type == "WeaponSkill" and not ranged_ws:contains(spell.english) and spell.target.distance > target_distance))) then -- Cancel Ranged Attack or WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.english == 'Ranged' then -- Auto WS --
		if player.tp >= 1000 and AutoMode == 'ON' and not buffactive.amnesia then
			cancel_spell()
			autoWS()
		end
	end
end

function precast(spell,action)
	local check_ammo
	local check_ammo_count = 1
	if spell.action_type == 'Ranged Attack' then
		check_ammo = player.equipment.ammo
		if player.equipment.ammo == 'empty' or player.inventory[check_ammo].count <= check_ammo_count then
			add_to_chat(123, spell.name..' Canceled: [Out of Ammo]')
			cancel_spell()
			return
		else
			equip(sets.Preshot)
			if player.inventory[check_ammo].count <= ammo_warning_limit and player.inventory[check_ammo].count > 1 and not warning then
				add_to_chat(123, '***** [Low Ammo Warning!] *****')
				warning = true
			elseif player.inventory[check_ammo].count > ammo_warning_limit and warning then
				warning = false
			end
		end
	elseif spell.type == "Quick Draw" then
			equipSet = set_combine(sets.Preshot,{ammo="Animikii Bullet"})
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
				if spell.english == "Last Stand" and (player.tp > 2999 or buffactive.Sekkanoki) then -- Equip Auster's Pearl When You Have 3000 TP or Sekkanoki For Last Stand --
					equipSet = set_combine(equipSet,{ear1="Auster's Pearl"})
				end
				equip(equipSet)
			end
		end
	if spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
			if spell.english == "Snake Eye" then -- Auto Double-Up After You Use Snake Eye --
				send_command('@wait 1;input /ja Double-Up <me>')
			end
		end
	elseif spell.type == "CorsairRoll" or spell.english == "Double-Up" then
		equip(sets.Rolls)
		if spell.english == "Tactician's Roll" then
			equip({body="Nvrch. Frac +2"})
		elseif spell.english == "Caster's Roll" then
			equip({legs="Nvrch. Culottes +2"})
		elseif spell.english == "Courser's Roll" then
			equip({feet="Nvrch. Bottes +2"})
		end
	elseif spell.type == "CorsairShot" then
		equipSet = sets.QD
		if ACC_Shots:contains(spell.english) then
			equipSet = sets.QD.HighACC
		else
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if not ACC_Shots:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' then -- Use Obi Toggle To Unlock Elemental Obi --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
		equip(equipSet)
	elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
				return
			else
				equip(sets.Precast.FastCast)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	if spell.english=='Ranged' then
		equipSet = sets.Midshot
		if equipSet[player.equipment.range] then
			equipSet = equipSet[player.equipment.range]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		equip(equipSet)
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(equipSet,{ring2="Sheltered Ring"})
			end
			equip(sets.Midcast.Stoneskin)
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equip(sets.Midcast.Haste)
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if buffactive['doom'] then
		equip(sets['Doom'])
		end
	if spell.english == 'Ranged' and AutoMode == 'ON' then
		autoRA()
	elseif not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.type == 'CorsairRoll' then
			display_roll_info(spell)
		elseif spell.english == 'Light Shot' then -- Sleep Countdown --
			send_command('wait 50;input /echo '..spell.name..' Effect: [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..' Effect: [OFF]')
		end
	else
		status_change(player.status)
	end
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.Melee
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if player.mp >= 100 then 
			equipSet = set_combine(equipSet,{ring2='Oneiros Ring'})
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
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
	if buff == 'doom' then
		equip(sets['Doom'])
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'C2' then -- Auto RA/WS Toggle. *Don't Rely On This. It Isn't As Fast As Shooting Manually. It Is Mainly For AFK or When You Dualbox* --
		if AutoMode == 'ON' then
			AutoMode = 'OFF'
			add_to_chat(123,'Auto Mode: [OFF]')
		else
			AutoMode = 'ON'
			add_to_chat(158,'Auto Mode: [ON]')
		end
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function autoRA()
	send_command('@wait 2.7; input /ra <t>')
end

function autoWS() -- Change Auto WS Here --
	send_command('input /ws "Last Stand" <t>')
end

function define_roll_values()
	rolls = {
		CorsairsRoll		= {lucky=5, unlucky=9, bonus="Experience Points"},
		NinjaRoll		= {lucky=4, unlucky=8, bonus="Evasion"},
		HuntersRoll		= {lucky=4, unlucky=8, bonus="Accuracy"},
		ChaosRoll		= {lucky=4, unlucky=8, bonus="Attack"},
		MagussRoll		= {lucky=2, unlucky=6, bonus="Magic Defense"},
		HealersRoll		= {lucky=3, unlucky=7, bonus="Cure Potency Received"},
		PuppetRoll		= {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
		ChoralRoll		= {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
		MonksRoll		= {lucky=3, unlucky=7, bonus="Subtle Blow"},
		BeastRoll		= {lucky=4, unlucky=8, bonus="Pet Attack"},
		SamuraiRoll		= {lucky=2, unlucky=6, bonus="Store TP"},
		EvokersRoll		= {lucky=5, unlucky=9, bonus="Refresh"},
		RoguesRoll		= {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
		WarlocksRoll		= {lucky=4, unlucky=8, bonus="Magic Accuracy"},
		FightersRoll		= {lucky=5, unlucky=9, bonus="Double Attack Rate"},
		DrachenRoll		= {lucky=3, unlucky=7, bonus="Pet Accuracy"},
		GallantsRoll		= {lucky=3, unlucky=7, bonus="Defense"},
		WizardsRoll		= {lucky=5, unlucky=9, bonus="Magic Attack"},
		DancersRoll		= {lucky=3, unlucky=7, bonus="Regen"},
		ScholarsRoll		= {lucky=2, unlucky=6, bonus="Conserve MP"},
		BoltersRoll		= {lucky=3, unlucky=9, bonus="Movement Speed"},
		CastersRoll		= {lucky=2, unlucky=7, bonus="Fast Cast"},
		CoursersRoll		= {lucky=3, unlucky=9, bonus="Snapshot"},
		BlitzersRoll		= {lucky=4, unlucky=9, bonus="Attack Delay"},
		TacticiansRoll		= {lucky=5, unlucky=8, bonus="Regain"},
		AlliessRoll		= {lucky=3, unlucky=10, bonus="Skillchain Damage"},
		MisersRoll		= {lucky=5, unlucky=7, bonus="Save TP"},
		CompanionsRoll		= {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
		AvengersRoll		= {lucky=4, unlucky=8, bonus="Counter Rate"}
		}
end

function display_roll_info(spell)
	rollinfo = rolls[(string.gsub((string.gsub(spell.english, "%'+", "")), "%s+", ""))]
	if rollinfo then
		add_to_chat(158, spell.english..' = '..rollinfo.bonus..'. Lucky Roll is '..
			tostring(rollinfo.lucky)..', Unlucky Roll is '..tostring(rollinfo.unlucky)..'.')
	end
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
			
	local missingHP = 0
	local targ

	if spell.target.type == "SELF" then
		targ = alliance[1][1]
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		targ = find_player_in_alliance(spell.target.name)
		local est_max_hp = targ.hp / (targ.hpp/100)
		missingHP = math.floor(est_max_hp - targ.hp)
	end

	if targ then
		if player.sub_job == 'DNC' then
			if missingHP < 40 then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
			else
				newWaltz = 'Curing Waltz III'
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20,['Curing Waltz II'] = 35,['Curing Waltz III'] = 50,['Curing Waltz IV'] = 65,['Curing Waltz V'] = 80}
	local tpCost = waltzTPCost[newWaltz]
	local downgrade

	if player.tp < tpCost and not buffactive.trance then		
		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
			newWaltz = 'Curing Waltz IV'
		end
		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('wait 0.03;input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
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
	if player.sub_job == 'SAM' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'DRG' then
		set_macro_page(1, 10)
	else
		set_macro_page(1, 10)
	end
end