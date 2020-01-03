-- ** I Use Some of Motenten's Functions ** --
-- Last Updated: 05/03/14 6:30 AM ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Pet"} -- Default Idle Set Is Movement --
	PetIndex = 1
	PetArray = {"Melee","Ranged","Tank","Nuke","Healing","Magic"} -- Default Pet TP Set Is Melee --
	Armor = 'None'
	Pet = 'OFF' -- Set Default Pet Set ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	petWS = S{
			"Slapstick","Knockout","Magic Mortar","Chimera Ripper","String Clipper","Cannibal Blade",
			"Bone Crusher","String Shredder","Arcuballista","Daze","Armor Piercer","Armor Shatterer"}

	sc_map = {SC1="VictorySmite", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			head="Oce. Headpiece +1",
			neck="Wiglen Gorget",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Hizamaru Haramaki +1",
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Muscle Belt +1",
			legs={ name="Herculean Trousers", augments={'Damage taken-2%','DEX+5','Accuracy+13',}},
			feet="Hermes' Sandals"}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			legs={ name="Herculean Trousers", augments={'Damage taken-2%','DEX+5','Accuracy+13',}},})
	sets.Idle.Pet = set_combine(sets.Idle.Regen,{})
	sets.Resting = {}

	-- TP Base Set --
	sets.TP = {}

	-- TP Sets --
	sets.TP = {
			head="Hizamaru Somen +1",
			neck="Combatant's Torque",
			left_ear="Mache Earring",
			right_ear="Mache Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands="Ryuo Tekko",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Letalis Mantle",
			waist="Windbuffet Belt +1",
			legs={ name="Herculean Trousers", augments={'Accuracy+20 Attack+20','"Store TP"+2','STR+10','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},}
	sets.TP.MidACC = set_combine(sets.TP,{
			head="Hizamaru Somen +1",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands="Ryuo Tekko",
			back="Letalis Mantle",
			waist="Windbuffet Belt +1",
			legs={ name="Herculean Trousers", augments={'Accuracy+20 Attack+20','"Store TP"+2','STR+10','Accuracy+13',}},
			back="Letalis Mantle",
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			head={ name="Herculean Helm", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','MND+10','Accuracy+8',}},
			neck="Subtlety Spectacles",
			left_ear="Mache Earring",
			right_ear="Mache Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands="Ryuo Tekko",
			left_ring="Cacoethic Ring",
			right_ring="Cacoethic Ring +1",
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+20 Attack+20','"Store TP"+2','STR+10','Accuracy+13',}},
			back="Grounded Mantle +1",
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})

	sets.TP.Pet = {}
	-- Pet Melee --
	sets.TP.Pet.Melee = {
			head="Foire Taj +1",
			ear1="Cirque Earring",
			body="Foire Tobe +1",
			hands="Pitre Dastanas +1",
			back="Pantin Cape",
			legs="Foire Churidars +1",
			feet="Foire Bab. +1"}

	-- Pet Ranged --
	sets.TP.Pet.Ranged = {
			body="Pitre Tobe",
			hands="Cirque Guanti +2",
			legs="Cirq. Pantaloni +2"}

	-- Pet Tank --
	sets.TP.Pet.Tank = {}

	-- Pet Nuke --
	sets.TP.Pet.Nuke = {
			legs="Pitre Churidars",
			feet="Pitre Babouches +1"}

	-- Pet Healing --
	sets.TP.Pet.Healing = {
			hands="Pitre Dastanas +1",
			legs="Foire Churidars +1"}

	-- Pet Healing & Nuke --
	sets.TP.Pet.Magic = {}

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Iron Gobbet",
			head="Otronif Mask +1",
			neck="Twilight Torque",
			ear1="Black Earring",
			ear2="Darkness Earring",
			body="Otro. Harness +1",
			hands="Otronif Gloves +1",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Shadow Mantle",
			waist="Flume Belt",
			legs="Otronif Brais +1",
			feet="Otronif Boots +1"}

	sets.MDT = set_combine(sets.PDT,{
			ammo="Demonry Stone",
			ear1="Merman's Earring",
			ear2="Sanare Earring",
			ring1="Shadow Ring",
			back="Engulfer Cape",
			waist="Resolute Belt"})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {}

	-- WS Sets --
	sets.WS["Victory Smite"] = {
			ammo="Potestas Bomblet",
			head="Uk'uxkaj Cap",
			neck="Rancor Collar",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Otro. Harness +1",
			hands="Otronif Gloves +1",
			ring1="Epona's Ring",
			ring2="Rajas Ring",
			back="Buquwik Cape",
			waist="Caudata Belt",
			legs="Otronif Brais +1",
			feet="Otronif Boots +1"}
	sets.WS["Victory Smite"].MidACC = set_combine(sets.WS["Victory Smite"],{})
	sets.WS["Victory Smite"].HighACC = set_combine(sets.WS["Victory Smite"].MidACC,{})

	sets.WS["Shijin Spiral"] = {}
	sets.WS["Shijin Spiral"].MidACC = set_combine(sets.WS["Shijin Spiral"],{})
	sets.WS["Shijin Spiral"].HighACC = set_combine(sets.WS["Shijin Spiral"].MidACC,{})

	sets.WS["Stringing Pummel"] = {}
	sets.WS["Stringing Pummel"].MidACC = set_combine(sets.WS["Stringing Pummel"],{})
	sets.WS["Stringing Pummel"].HighACC = set_combine(sets.WS["Stringing Pummel"].MidACC,{})

	-- JA Sets --
	sets.JA = {}
	sets.JA["Tactical Switch"] = {feet="Cirque Scarpe +2"}
	sets.JA.Repair = {feet="Foire Bab. +1"}
	sets.JA.Ventriloquy = {legs="Pitre Churidars"}
	sets.JA["Role Reversal"] = {feet="Pitre Babouches +1"}

	-- Reduces Overload Rate Set --
	sets.Maneuver = {
			neck="Buffoon's Collar +1",
			body="Cirque Farsetto +2",
			hands="Foire Dastanas +1",
			back="Dispersal Mantle"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ring1="Prolix Ring",
			ring2="Veneficium Ring"}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})

	sets.Midcast.Pet = {}
	-- Pet WS Set --
	sets.Midcast.Pet.WS = {
			head="Cirque Cappello +2",
			hands="Cirque Guanti +2",
			legs="Cirq. Pantaloni +2"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
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
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then -- Cancel Utsusemi If You Have 3+ Shadows Up --
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
	elseif spell.type == "PetCommand" then
		if string.find(spell.english,'Maneuver') then
			equip(sets.Maneuver)
		end
	end
end

function midcast(spell,action)
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then -- Cancel Copy Image 1 & 2 For Utsusemi: Ichi --
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then -- Cancel Sneak --
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
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Pet == 'ON' then -- Use Pet Toggle For Pet Sets --
		equip(sets.TP.Pet[PetArray[PetIndex]])
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == 'weakness' then -- Weakness Timer --
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

function pet_midcast(spell,action)
	if petWS:contains(spell.english) then
		equip(sets.Midcast.Pet.WS)
	end
end

function pet_aftercast(spell,action)
	status_change(player.status)
end

function pet_change(pet,gain)
	status_change(player.status)
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C3' then -- Pet Set Toggle --
		PetIndex = (PetIndex % #PetArray) + 1
		add_to_chat(158,'Pet Set: ' .. PetArray[PetIndex])
		status_change(player.status)
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
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
	elseif command == 'C9' then -- Pet Toggle --
		if Pet == 'ON' then
			Pet = 'OFF'
			add_to_chat(123,'Pet Set: [Unlocked]')
		else
			Pet = 'ON'
			add_to_chat(158,'Pet Set: [Locked]')
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
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
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
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
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
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
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
	if player.sub_job == 'WAR' then
		set_macro_page(1, 19)
	elseif player.sub_job == 'DNC' then
		set_macro_page(3, 19)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 19)
	else
		set_macro_page(1, 19)
	end
end