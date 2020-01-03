-- Last Updated: 16/12/15 4:11 AM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid/Stun. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"Scythe","Zulfiqar","Sword"} -- Default Main Weapon Is Scythe. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Rancor = 'ON' -- Set Default Rancor ON or OFF Here --
	Mekira = 'ON' -- Set Default Mekira ON or OFF Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	--WS Properties
	wsProperty = T{}
	--Level 1s
	wsProperty['Transfixion'] = T{'Light'}
	wsProperty['Compression'] = T{'Dark'}
	wsProperty['Liquefaction'] = T{'Fire'}
	wsProperty['Scission'] = T{'Earth'}
	wsProperty['Reverberation'] = T{'Water'}
	wsProperty['Detonation'] = T{'Wind'}
	wsProperty['Induration'] = T{'Ice'}
	wsProperty['Impaction'] = T{'Lightning'}
	--Level 2s
	wsProperty['Gravitation'] = T{'Dark','Earth'}
	wsProperty['Distortion'] = T{'Water','Ice'}
	wsProperty['Fusion'] = T{'Fire','Light'}
	wsProperty['Fragmentation'] = T{'Wind','Lightning'}
	--Level 3s
	wsProperty['Darkness'] = T{'Dark','Earth','Water','Ice'}
	wsProperty['Light'] = T{'Light','Fire','Wind','Lightning'}		
		
	sc_map = {SC1="Resolution", SC2="LastResort", SC3="Souleater"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			neck="Loricate Torque +1",
			body="Kumarbi's Akar",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			hands="Sulev. Gauntlets +1",
			waist="Sarissapho. Belt",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Sulev. Leggings +1"}
	sets.Idle.Regen.Scythe = set_combine(sets.Idle.Regen,{
			main="Scythe",
			sub="Bloodrain Strap"})
	sets.Idle.Regen.Zulfiqar = set_combine(sets.Idle.Regen,{
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Bloodrain Strap"})
	sets.Idle.Regen.Sword = set_combine(sets.Idle.Regen,{
			main="Sword",
			sub="Shield"})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			neck="Loricate Torque +1",
			body="Chozor. Coselete",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			hands="Sulev. Gauntlets +1",
			waist="Sarissapho. Belt",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Sulev. Leggings +1"})
	sets.Idle.Movement.Scythe = set_combine(sets.Idle.Movement,{
			main="Scythe",
			sub="Bloodrain Strap"})
	sets.Idle.Movement.Zulfiqar = set_combine(sets.Idle.Movement,{
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Bloodrain Strap"})
	sets.Idle.Movement.Sword = set_combine(sets.Idle.Movement,{
			main="Sword",
			sub="Shield"})

	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head="",
			neck="Wiglen Gorget",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Respite Cloak",
			hands="Kurys Gloves",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Fucho-no-Obi",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Sulev. Leggings +1"})
	sets.Idle.Refresh.Scythe = set_combine(sets.Idle.Refresh,{
			main="Scythe",
			sub="Bloodrain Strap"})
	sets.Idle.Refresh.Zulfiqar = set_combine(sets.Idle.Refresh,{
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Bloodrain Strap"})
	sets.Idle.Refresh.Sword = set_combine(sets.Idle.Refresh,{
			main="Sword",
			sub="Shield"})

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- Scythe(AM3 Down) TP Sets --
	sets.TP.Scythe = {
			main="Scythe",
			sub="Bloodrain Strap",
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},}
	sets.TP.Scythe.MidACC = set_combine(sets.TP.Scythe,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Scythe.HighACC = set_combine(sets.TP.Scythe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})

	-- Scythe(AM3 Up) TP Sets --
	sets.TP.Scythe.AM3 = set_combine(sets.TP.Scythe,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Scythe.MidACC.AM3 = set_combine(sets.TP.Scythe.AM3,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Scythe.HighACC.AM3 = set_combine(sets.TP.Scythe.MidACC.AM3,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})

	-- Scythe(AM3 Down: High Haste) TP Sets --
	sets.TP.Scythe.HighHaste = set_combine(sets.TP.Scythe,{})
	sets.TP.Scythe.MidACC.HighHaste = set_combine(sets.TP.Scythe.HighHaste,{})
	sets.TP.Scythe.HighACC.HighHaste = set_combine(sets.TP.Scythe.MidACC.HighHaste,{})

	-- Scythe(AM3 Up: High Haste) TP Sets --
	sets.TP.Scythe.AM3.HighHaste = set_combine(sets.TP.Scythe.AM3,{})
	sets.TP.Scythe.MidACC.AM3.HighHaste = set_combine(sets.TP.Scythe.AM3.HighHaste,{})
	sets.TP.Scythe.HighACC.AM3.HighHaste = set_combine(sets.TP.Scythe.MidACC.AM3.HighHaste,{})

	-- Scythe(AM3 Down: Ionis) TP Sets --
	sets.TP.Scythe.Ionis = set_combine(sets.TP.Scythe,{})
	sets.TP.Scythe.MidACC.Ionis = set_combine(sets.TP.Scythe.Ionis,{})
	sets.TP.Scythe.HighACC.Ionis = set_combine(sets.TP.Scythe.MidACC.Ionis,{})

	-- Scythe(AM3 Up: Ionis) TP Sets --
	sets.TP.Scythe.AM3.Ionis = set_combine(sets.TP.Scythe.AM3,{})
	sets.TP.Scythe.MidACC.AM3.Ionis = set_combine(sets.TP.Scythe.AM3.Ionis,{})
	sets.TP.Scythe.HighACC.AM3.Ionis = set_combine(sets.TP.Scythe.MidACC.AM3.Ionis,{})

	-- Scythe(AM3 Down: High Haste + Ionis) TP Sets --
	sets.TP.Scythe.HighHaste.Ionis = set_combine(sets.TP.Scythe.HighHaste,{})
	sets.TP.Scythe.MidACC.HighHaste.Ionis = set_combine(sets.TP.Scythe.HighHaste.Ionis,{})
	sets.TP.Scythe.HighACC.HighHaste.Ionis = set_combine(sets.TP.Scythe.MidACC.HighHaste.Ionis,{})

	-- Scythe(AM3 Up: High Haste + Ionis) TP Sets --
	sets.TP.Scythe.AM3.HighHaste.Ionis = set_combine(sets.TP.Scythe.AM3.HighHaste,{})
	sets.TP.Scythe.MidACC.AM3.HighHaste.Ionis = set_combine(sets.TP.Scythe.AM3.HighHaste.Ionis,{})
	sets.TP.Scythe.HighACC.AM3.HighHaste.Ionis = set_combine(sets.TP.Scythe.MidACC.AM3.HighHaste.Ionis,{})

	-- Scythe(AM3 Down: SAM Roll) TP Sets --
	sets.TP.Scythe.STP = set_combine(sets.TP.Scythe,{})
	sets.TP.Scythe.MidACC.STP = set_combine(sets.TP.Scythe.MidACC,{})
	sets.TP.Scythe.HighACC.STP = set_combine(sets.TP.Scythe.HighACC,{})

	-- Scythe(AM3 Up: SAM Roll) TP Sets --
	sets.TP.Scythe.AM3.STP = set_combine(sets.TP.Scythe.AM3,{})
	sets.TP.Scythe.MidACC.AM3.STP = set_combine(sets.TP.Scythe.MidACC.AM3,{})
	sets.TP.Scythe.HighACC.AM3.STP = set_combine(sets.TP.Scythe.HighACC.AM3,{})

	-- Scythe(AM3 Down: High Haste + SAM Roll) TP Sets --
	sets.TP.Scythe.HighHaste.STP = set_combine(sets.TP.Scythe.HighHaste,{})
	sets.TP.Scythe.MidACC.HighHaste.STP = set_combine(sets.TP.Scythe.MidACC.HighHaste,{})
	sets.TP.Scythe.HighACC.HighHaste.STP = set_combine(sets.TP.Scythe.HighACC.HighHaste,{})

	-- Scythe(AM3 Up: High Haste + SAM Roll) TP Sets --
	sets.TP.Scythe.AM3.HighHaste.STP = set_combine(sets.TP.Scythe.HighHaste,{})
	sets.TP.Scythe.MidACC.AM3.HighHaste.STP = set_combine(sets.TP.Scythe.MidACC.HighHaste,{})
	sets.TP.Scythe.HighACC.AM3.HighHaste.STP = set_combine(sets.TP.Scythe.HighACC.HighHaste,{})

	-- Scythe(AM3 Down: Ionis + SAM Roll) TP Sets --
	sets.TP.Scythe.Ionis.STP = set_combine(sets.TP.Scythe.Ionis,{})
	sets.TP.Scythe.MidACC.Ionis.STP = set_combine(sets.TP.Scythe.MidACC.Ionis,{})
	sets.TP.Scythe.HighACC.Ionis.STP = set_combine(sets.TP.Scythe.HighACC.Ionis,{})

	-- Scythe(AM3 Up: Ionis + SAM Roll) TP Sets --
	sets.TP.Scythe.AM3.Ionis.STP = set_combine(sets.TP.Scythe.AM3,{})
	sets.TP.Scythe.MidACC.AM3.Ionis.STP = set_combine(sets.TP.Scythe.MidACC.AM3,{})
	sets.TP.Scythe.HighACC.AM3.Ionis.STP = set_combine(sets.TP.Scythe.HighACC.AM3,{})

	-- Scythe(AM3 Down: High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Scythe.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.HighHaste,{})
	sets.TP.Scythe.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.MidACC.HighHaste,{})
	sets.TP.Scythe.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.HighACC.HighHaste,{})

	-- Scythe(AM3 Up: High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Scythe.AM3.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.HighHaste,{})
	sets.TP.Scythe.MidACC.AM3.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.MidACC.HighHaste,{})
	sets.TP.Scythe.HighACC.AM3.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.HighACC.HighHaste,{})

	-- Zulfiqar TP Sets --
	sets.TP.Zulfiqar = {
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Bloodrain Strap",
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},}
	sets.TP.Zulfiqar.MidACC = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Zulfiqar.HighACC = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})

	-- Zulfiqar(High Haste) TP Sets --
	sets.TP.Zulfiqar.HighHaste = set_combine(sets.TP.Zulfiqar,{})
	sets.TP.Zulfiqar.MidACC.HighHaste = set_combine(sets.TP.Zulfiqar.HighHaste,{})
	sets.TP.Zulfiqar.HighACC.HighHaste = set_combine(sets.TP.Zulfiqar.MidACC.HighHaste,{})

	-- Zulfiqar(Ionis) TP Sets --
	sets.TP.Zulfiqar.Ionis = set_combine(sets.TP.Zulfiqar,{})
	sets.TP.Zulfiqar.MidACC.Ionis = set_combine(sets.TP.Zulfiqar.Ionis,{})
	sets.TP.Zulfiqar.HighACC.Ionis = set_combine(sets.TP.Zulfiqar.MidACC.Ionis,{})

	-- Zulfiqar(High Haste + Ionis) TP Sets --
	sets.TP.Zulfiqar.HighHaste.Ionis = set_combine(sets.TP.Zulfiqar.HighHaste,{})
	sets.TP.Zulfiqar.MidACC.HighHaste.Ionis = set_combine(sets.TP.Zulfiqar.HighHaste.Ionis,{})
	sets.TP.Zulfiqar.HighACC.HighHaste.Ionis = set_combine(sets.TP.Zulfiqar.MidACC.HighHaste.Ionis,{})

	-- Zulfiqar(SAM Roll) TP Sets --
	sets.TP.Zulfiqar.STP = set_combine(sets.TP.Zulfiqar,{})
	sets.TP.Zulfiqar.MidACC.STP = set_combine(sets.TP.Zulfiqar.MidACC,{})
	sets.TP.Zulfiqar.HighACC.STP = set_combine(sets.TP.Zulfiqar.HighACC,{})

	-- Zulfiqar(High Haste + SAM Roll) TP Sets --
	sets.TP.Zulfiqar.HighHaste.STP = set_combine(sets.TP.Zulfiqar.HighHaste,{})
	sets.TP.Zulfiqar.MidACC.HighHaste.STP = set_combine(sets.TP.Zulfiqar.MidACC.HighHaste,{})
	sets.TP.Zulfiqar.HighACC.HighHaste.STP = set_combine(sets.TP.Zulfiqar.HighACC.HighHaste,{})

	-- Zulfiqar(Ionis + SAM Roll) TP Sets --
	sets.TP.Zulfiqar.Ionis.STP = set_combine(sets.TP.Zulfiqar.Ionis,{})
	sets.TP.Zulfiqar.MidACC.Ionis.STP = set_combine(sets.TP.Zulfiqar.MidACC.Ionis,{})
	sets.TP.Zulfiqar.HighACC.Ionis.STP = set_combine(sets.TP.Zulfiqar.HighACC.Ionis,{})

	-- Zulfiqar(High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Zulfiqar.HighHaste.Ionis.STP = set_combine(sets.TP.Zulfiqar.HighHaste,{})
	sets.TP.Zulfiqar.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Zulfiqar.MidACC.HighHaste,{})
	sets.TP.Zulfiqar.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Zulfiqar.HighACC.HighHaste,{})

	-- Sword(AM Down) TP Sets --
	sets.TP.Sword = {
			main="Sword",
			sub="Shield",
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},}
	sets.TP.Sword.MidACC = set_combine(sets.TP.Sword,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Sword.HighACC = set_combine(sets.TP.Sword.MidACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})

	-- Sword(AM Up) TP Sets --
	sets.TP.Sword.AM = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.AM = set_combine(sets.TP.Sword.AM,{})
	sets.TP.Sword.HighACC.AM = set_combine(sets.TP.Sword.MidACC.AM,{})

	-- Sword(AM Down: High Haste) TP Sets --
	sets.TP.Sword.HighHaste = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.HighHaste = set_combine(sets.TP.Sword.HighHaste,{})
	sets.TP.Sword.HighACC.HighHaste = set_combine(sets.TP.Sword.MidACC.HighHaste,{})

	-- Sword(AM Up: High Haste) TP Sets --
	sets.TP.Sword.AM.HighHaste = set_combine(sets.TP.Sword.AM,{})
	sets.TP.Sword.MidACC.AM.HighHaste = set_combine(sets.TP.Sword.AM.HighHaste,{})
	sets.TP.Sword.HighACC.AM.HighHaste = set_combine(sets.TP.Sword.MidACC.AM.HighHaste,{})

	-- Sword(AM Down: Ionis) TP Sets --
	sets.TP.Sword.Ionis = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.Ionis = set_combine(sets.TP.Sword.Ionis,{})
	sets.TP.Sword.HighACC.Ionis = set_combine(sets.TP.Sword.MidACC.Ionis,{})

	-- Sword(AM Up: Ionis) TP Sets --
	sets.TP.Sword.AM.Ionis = set_combine(sets.TP.Sword.AM,{})
	sets.TP.Sword.MidACC.AM.Ionis = set_combine(sets.TP.Sword.AM.Ionis,{})
	sets.TP.Sword.HighACC.AM.Ionis= set_combine(sets.TP.Sword.MidACC.AM.Ionis,{})

	-- Sword(AM Down: High Haste + Ionis) TP Sets --
	sets.TP.Sword.HighHaste.Ionis = set_combine(sets.TP.Sword.HighHaste,{})
	sets.TP.Sword.MidACC.HighHaste.Ionis = set_combine(sets.TP.Sword.HighHaste.Ionis,{})
	sets.TP.Sword.HighACC.HighHaste.Ionis = set_combine(sets.TP.Sword.MidACC.HighHaste.Ionis,{})

	-- Sword(AM Up: High Haste + Ionis) TP Sets --
	sets.TP.Sword.AM.HighHaste.Ionis = set_combine(sets.TP.Sword.AM.HighHaste,{})
	sets.TP.Sword.MidACC.AM.HighHaste.Ionis = set_combine(sets.TP.Sword.AM.HighHaste.Ionis,{})
	sets.TP.Sword.HighACC.AM.HighHaste.Ionis = set_combine(sets.TP.Sword.MidACC.AM.HighHaste.Ionis,{})

	-- Sword(AM Down: SAM Roll) TP Sets --
	sets.TP.Sword.STP = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.STP = set_combine(sets.TP.Sword.MidACC,{})
	sets.TP.Sword.HighACC.STP = set_combine(sets.TP.Sword.HighACC,{})

	-- Sword(AM Up: SAM Roll) TP Sets --
	sets.TP.Sword.AM.STP = set_combine(sets.TP.Sword.AM,{})
	sets.TP.Sword.MidACC.AM.STP = set_combine(sets.TP.Sword.MidACC.AM,{})
	sets.TP.Sword.HighACC.AM.STP = set_combine(sets.TP.Sword.HighACC.AM,{})

	-- Sword(AM Down: High Haste + SAM Roll) TP Sets --
	sets.TP.Sword.HighHaste.STP = set_combine(sets.TP.Sword.HighHaste,{})
	sets.TP.Sword.MidACC.HighHaste.STP = set_combine(sets.TP.Sword.MidACC.HighHaste,{})
	sets.TP.Sword.HighACC.HighHaste.STP = set_combine(sets.TP.Sword.HighACC.HighHaste,{})

	-- Sword(AM Up: High Haste + SAM Roll) TP Sets --
	sets.TP.Sword.AM.HighHaste.STP = set_combine(sets.TP.Sword.HighHaste,{})
	sets.TP.Sword.MidACC.AM.HighHaste.STP = set_combine(sets.TP.Sword.MidACC.HighHaste,{})
	sets.TP.Sword.HighACC.AM.HighHaste.STP = set_combine(sets.TP.Sword.HighACC.HighHaste,{})

	-- Sword(AM Down: Ionis + SAM Roll) TP Sets --
	sets.TP.Sword.Ionis.STP = set_combine(sets.TP.Sword.Ionis,{})
	sets.TP.Sword.MidACC.Ionis.STP = set_combine(sets.TP.Sword.MidACC.Ionis,{})
	sets.TP.Sword.HighACC.Ionis.STP = set_combine(sets.TP.Sword.HighACC.Ionis,{})

	-- Sword(AM Up: Ionis + SAM Roll) TP Sets --
	sets.TP.Sword.AM.Ionis.STP = set_combine(sets.TP.Sword.AM,{})
	sets.TP.Sword.MidACC.AM.Ionis.STP = set_combine(sets.TP.Sword.MidACC.AM,{})
	sets.TP.Sword.HighACC.AM.Ionis.STP = set_combine(sets.TP.Sword.HighACC.AM,{})

	-- Sword(AM Down: High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Sword.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.HighHaste,{})
	sets.TP.Sword.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.MidACC.HighHaste,{})
	sets.TP.Sword.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.HighACC.HighHaste,{})

	-- Sword(AM Up: High Haste + Ionis + SAM Roll) TP Sets --
	sets.TP.Sword.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.HighHaste,{})
	sets.TP.Sword.MidACC.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.MidACC.HighHaste,{})
	sets.TP.Sword.HighACC.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.HighACC.HighHaste,{})

	-- Scythe(AM3 Down) /SAM TP Sets --
	sets.TP.Scythe.SAM = {
			main="Scythe",
			sub="Bloodrain Strap",
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},}
	sets.TP.Scythe.SAM.MidACC = set_combine(sets.TP.Scythe.SAM,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Scythe.SAM.HighACC = set_combine(sets.TP.Scythe.SAM.MidACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})

	-- Scythe(AM3 Up) /SAM TP Sets --
	sets.TP.Scythe.SAM.AM3 = set_combine(sets.TP.Scythe.SAM,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Scythe.SAM.MidACC.AM3 = set_combine(sets.TP.Scythe.SAM.AM3,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Scythe.SAM.HighACC.AM3 = set_combine(sets.TP.Scythe.SAM.MidACC.AM3,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})

	-- Scythe(AM3 Down: High Haste) /SAM TP Sets --
	sets.TP.Scythe.SAM.HighHaste = set_combine(sets.TP.Scythe.SAM,{})
	sets.TP.Scythe.SAM.MidACC.HighHaste = set_combine(sets.TP.Scythe.SAM.HighHaste,{})
	sets.TP.Scythe.SAM.HighACC.HighHaste = set_combine(sets.TP.Scythe.SAM.MidACC.HighHaste,{})

	-- Scythe(AM3 Up: High Haste) /SAM TP Sets --
	sets.TP.Scythe.SAM.AM3.HighHaste = set_combine(sets.TP.Scythe.SAM.AM3,{})
	sets.TP.Scythe.SAM.MidACC.AM3.HighHaste = set_combine(sets.TP.Scythe.SAM.AM3.HighHaste,{})
	sets.TP.Scythe.SAM.HighACC.AM3.HighHaste = set_combine(sets.TP.Scythe.SAM.MidACC.AM3.HighHaste,{})

	-- Scythe(AM3 Down: Ionis) /SAM TP Sets --
	sets.TP.Scythe.SAM.Ionis = set_combine(sets.TP.Scythe.SAM,{})
	sets.TP.Scythe.SAM.MidACC.Ionis = set_combine(sets.TP.Scythe.SAM.Ionis,{})
	sets.TP.Scythe.SAM.HighACC.Ionis = set_combine(sets.TP.Scythe.SAM.MidACC.Ionis,{})

	-- Scythe(AM3 Up: Ionis) /SAM TP Sets --
	sets.TP.Scythe.SAM.AM3.Ionis = set_combine(sets.TP.Scythe.SAM.AM3,{})
	sets.TP.Scythe.SAM.MidACC.AM3.Ionis = set_combine(sets.TP.Scythe.SAM.AM3.Ionis,{})
	sets.TP.Scythe.SAM.HighACC.AM3.Ionis = set_combine(sets.TP.Scythe.SAM.MidACC.AM3.Ionis,{})

	-- Scythe(AM3 Down: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Scythe.SAM.HighHaste.Ionis = set_combine(sets.TP.Scythe.SAM.HighHaste,{})
	sets.TP.Scythe.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Scythe.SAM.HighHaste.Ionis,{})
	sets.TP.Scythe.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Scythe.SAM.MidACC.HighHaste.Ionis,{})

	-- Scythe(AM3 Up: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Scythe.SAM.AM3.HighHaste.Ionis = set_combine(sets.TP.Scythe.SAM.AM3.HighHaste,{})
	sets.TP.Scythe.SAM.MidACC.AM3.HighHaste.Ionis = set_combine(sets.TP.Scythe.SAM.AM3.HighHaste.Ionis,{})
	sets.TP.Scythe.SAM.HighACC.AM3.HighHaste.Ionis = set_combine(sets.TP.Scythe.SAM.MidACC.AM3.HighHaste.Ionis,{})

	-- Scythe(AM3 Down: SAM Roll) /SAM TP Sets --
	sets.TP.Scythe.SAM.STP = set_combine(sets.TP.Scythe.SAM,{})
	sets.TP.Scythe.SAM.MidACC.STP = set_combine(sets.TP.Scythe.SAM.MidACC,{})
	sets.TP.Scythe.SAM.HighACC.STP = set_combine(sets.TP.Scythe.SAM.HighACC,{})

	-- Scythe(AM3 Up: SAM Roll) /SAM TP Sets --
	sets.TP.Scythe.SAM.AM3.STP = set_combine(sets.TP.Scythe.SAM.AM3,{})
	sets.TP.Scythe.SAM.MidACC.AM3.STP = set_combine(sets.TP.Scythe.SAM.MidACC.AM3,{})
	sets.TP.Scythe.SAM.HighACC.AM3.STP = set_combine(sets.TP.Scythe.SAM.HighACC.AM3,{})

	-- Scythe(AM3 Down: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Scythe.SAM.HighHaste.STP = set_combine(sets.TP.Scythe.SAM.HighHaste,{})
	sets.TP.Scythe.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Scythe.SAM.MidACC.HighHaste,{})
	sets.TP.Scythe.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Scythe.SAM.HighACC.HighHaste,{})

	-- Scythe(AM3 Up: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Scythe.SAM.AM3.HighHaste.STP = set_combine(sets.TP.Scythe.SAM.HighHaste,{})
	sets.TP.Scythe.SAM.MidACC.AM3.HighHaste.STP = set_combine(sets.TP.Scythe.SAM.MidACC.HighHaste,{})
	sets.TP.Scythe.SAM.HighACC.AM3.HighHaste.STP = set_combine(sets.TP.Scythe.SAM.HighACC.HighHaste,{})

	-- Scythe(AM3 Down: Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Scythe.SAM.Ionis.STP = set_combine(sets.TP.Scythe.SAM.Ionis,{})
	sets.TP.Scythe.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Scythe.SAM.MidACC.Ionis,{})
	sets.TP.Scythe.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Scythe.SAM.HighACC.Ionis,{})

	-- Scythe(AM3 Up: Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Scythe.SAM.AM3.Ionis.STP = set_combine(sets.TP.Scythe.SAM.AM3,{})
	sets.TP.Scythe.SAM.MidACC.AM3.Ionis.STP = set_combine(sets.TP.Scythe.SAM.MidACC.AM3,{})
	sets.TP.Scythe.SAM.HighACC.AM3.Ionis.STP = set_combine(sets.TP.Scythe.SAM.HighACC.AM3,{})

	-- Scythe(AM3 Down: High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Scythe.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.SAM.HighHaste,{})
	sets.TP.Scythe.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.SAM.MidACC.HighHaste,{})
	sets.TP.Scythe.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.SAM.HighACC.HighHaste,{})

	-- Scythe(AM3 Up: High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Scythe.SAM.AM3.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.SAM.HighHaste,{})
	sets.TP.Scythe.SAM.MidACC.AM3.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.SAM.MidACC.HighHaste,{})
	sets.TP.Scythe.SAM.HighACC.AM3.HighHaste.Ionis.STP = set_combine(sets.TP.Scythe.SAM.HighACC.HighHaste,{})

	-- Zulfiqar /SAM TP Sets --
	sets.TP.Zulfiqar.SAM = {
			main="Zulfiqar",
			sub="Bloodrain Strap",
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},}
	sets.TP.Zulfiqar.SAM.MidACC = set_combine(sets.TP.Zulfiqar.SAM,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Zulfiqar.SAM.HighACC = set_combine(sets.TP.Zulfiqar.SAM.MidACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})

	-- Zulfiqar(High Haste) /SAM TP Sets --
	sets.TP.Zulfiqar.SAM.HighHaste = set_combine(sets.TP.Zulfiqar.SAM,{})
	sets.TP.Zulfiqar.SAM.MidACC.HighHaste = set_combine(sets.TP.Zulfiqar.SAM.HighHaste,{})
	sets.TP.Zulfiqar.SAM.HighACC.HighHaste = set_combine(sets.TP.Zulfiqar.SAM.MidACC.HighHaste,{})

	-- Zulfiqar(Ionis) /SAM TP Sets --
	sets.TP.Zulfiqar.SAM.Ionis = set_combine(sets.TP.Zulfiqar.SAM,{})
	sets.TP.Zulfiqar.SAM.MidACC.Ionis = set_combine(sets.TP.Zulfiqar.SAM.Ionis,{})
	sets.TP.Zulfiqar.SAM.HighACC.Ionis = set_combine(sets.TP.Zulfiqar.SAM.MidACC.Ionis,{})

	-- Zulfiqar(High Haste + Ionis) /SAM TP Sets --
	sets.TP.Zulfiqar.SAM.HighHaste.Ionis = set_combine(sets.TP.Zulfiqar.SAM.HighHaste,{})
	sets.TP.Zulfiqar.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Zulfiqar.SAM.HighHaste.Ionis,{})
	sets.TP.Zulfiqar.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Zulfiqar.SAM.MidACC.HighHaste.Ionis,{})

	-- Zulfiqar(SAM Roll) /SAM TP Sets --
	sets.TP.Zulfiqar.SAM.STP = set_combine(sets.TP.Zulfiqar.SAM,{})
	sets.TP.Zulfiqar.SAM.MidACC.STP = set_combine(sets.TP.Zulfiqar.SAM.MidACC,{})
	sets.TP.Zulfiqar.SAM.HighACC.STP = set_combine(sets.TP.Zulfiqar.SAM.HighACC,{})

	-- Zulfiqar(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Zulfiqar.SAM.HighHaste.STP = set_combine(sets.TP.Zulfiqar.SAM.HighHaste,{})
	sets.TP.Zulfiqar.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Zulfiqar.SAM.MidACC.HighHaste,{})
	sets.TP.Zulfiqar.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Zulfiqar.SAM.HighACC.HighHaste,{})

	-- Zulfiqar(Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Zulfiqar.SAM.Ionis.STP = set_combine(sets.TP.Zulfiqar.SAM.Ionis,{})
	sets.TP.Zulfiqar.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Zulfiqar.SAM.MidACC.Ionis,{})
	sets.TP.Zulfiqar.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Zulfiqar.SAM.HighACC.Ionis,{})

	-- Zulfiqar(High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Zulfiqar.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Zulfiqar.SAM.HighHaste,{})
	sets.TP.Zulfiqar.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Zulfiqar.SAM.MidACC.HighHaste,{})
	sets.TP.Zulfiqar.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Zulfiqar.SAM.HighACC.HighHaste,{})

	-- Sword(AM Down) /SAM TP Sets --
	sets.TP.Sword.SAM = {
			main="Sword",
			sub="Bloodrain Strap",
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},}
	sets.TP.Sword.SAM.MidACC = set_combine(sets.TP.Sword.SAM,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})
	sets.TP.Sword.SAM.HighACC = set_combine(sets.TP.Sword.SAM.MidACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Magic dmg. taken -1%','STR+2','Accuracy+12','Attack+14',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Rajas Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','"Store TP"+4','DEX+1','Attack+1',}},})

	-- Sword(AM Up) /SAM TP Sets --
	sets.TP.Sword.SAM.AM = set_combine(sets.TP.Sword.SAM,{})
	sets.TP.Sword.SAM.MidACC.AM = set_combine(sets.TP.Sword.SAM.AM,{})
	sets.TP.Sword.SAM.HighACC.AM = set_combine(sets.TP.Sword.SAM.MidACC.AM,{})

	-- Sword(AM Down: High Haste) /SAM TP Sets --
	sets.TP.Sword.SAM.HighHaste = set_combine(sets.TP.Sword.SAM,{})
	sets.TP.Sword.SAM.MidACC.HighHaste = set_combine(sets.TP.Sword.SAM.HighHaste,{})
	sets.TP.Sword.SAM.HighACC.HighHaste = set_combine(sets.TP.Sword.SAM.MidACC.HighHaste,{})

	-- Sword(AM Up: High Haste) /SAM TP Sets --
	sets.TP.Sword.SAM.AM.HighHaste = set_combine(sets.TP.Sword.SAM.AM,{})
	sets.TP.Sword.SAM.MidACC.AM.HighHaste = set_combine(sets.TP.Sword.SAM.AM.HighHaste,{})
	sets.TP.Sword.SAM.HighACC.AM.HighHaste = set_combine(sets.TP.Sword.SAM.MidACC.AM.HighHaste,{})

	-- Sword(AM Down: Ionis) /SAM TP Sets --
	sets.TP.Sword.SAM.Ionis = set_combine(sets.TP.Sword.SAM,{})
	sets.TP.Sword.SAM.MidACC.Ionis = set_combine(sets.TP.Sword.SAM.Ionis,{})
	sets.TP.Sword.SAM.HighACC.Ionis = set_combine(sets.TP.Sword.SAM.MidACC.Ionis,{})

	-- Sword(AM Up: Ionis) /SAM TP Sets --
	sets.TP.Sword.SAM.AM.Ionis = set_combine(sets.TP.Sword.SAM.AM,{})
	sets.TP.Sword.SAM.MidACC.AM.Ionis = set_combine(sets.TP.Sword.SAM.AM.Ionis,{})
	sets.TP.Sword.SAM.HighACC.AM.Ionis = set_combine(sets.TP.Sword.SAM.MidACC.AM.Ionis,{})

	-- Sword(AM Down: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Sword.SAM.HighHaste.Ionis = set_combine(sets.TP.Sword.SAM.HighHaste,{})
	sets.TP.Sword.SAM.MidACC.HighHaste.Ionis = set_combine(sets.TP.Sword.SAM.HighHaste.Ionis,{})
	sets.TP.Sword.SAM.HighACC.HighHaste.Ionis = set_combine(sets.TP.Sword.SAM.MidACC.HighHaste.Ionis,{})

	-- Sword(AM Up: High Haste + Ionis) /SAM TP Sets --
	sets.TP.Sword.SAM.AM.HighHaste.Ionis = set_combine(sets.TP.Sword.SAM.AM.HighHaste,{})
	sets.TP.Sword.SAM.MidACC.AM.HighHaste.Ionis = set_combine(sets.TP.Sword.SAM.AM.HighHaste.Ionis,{})
	sets.TP.Sword.SAM.HighACC.AM.HighHaste.Ionis = set_combine(sets.TP.Sword.SAM.MidACC.AM.HighHaste.Ionis,{})

	-- Sword(AM Down: SAM Roll) /SAM TP Sets --
	sets.TP.Sword.SAM.STP = set_combine(sets.TP.Sword.SAM,{})
	sets.TP.Sword.SAM.MidACC.STP = set_combine(sets.TP.Sword.SAM.MidACC,{})
	sets.TP.Sword.SAM.HighACC.STP = set_combine(sets.TP.Sword.SAM.HighACC,{})

	-- Sword(AM Up: SAM Roll) /SAM TP Sets --
	sets.TP.Sword.SAM.AM.STP = set_combine(sets.TP.Sword.SAM.AM,{})
	sets.TP.Sword.SAM.MidACC.AM.STP = set_combine(sets.TP.Sword.SAM.MidACC.AM,{})
	sets.TP.Sword.SAM.HighACC.AM.STP = set_combine(sets.TP.Sword.SAM.HighACC.AM,{})

	-- Sword(AM Down: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Sword.SAM.HighHaste.STP = set_combine(sets.TP.Sword.SAM.HighHaste,{})
	sets.TP.Sword.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Sword.SAM.MidACC.HighHaste,{})
	sets.TP.Sword.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Sword.SAM.HighACC.HighHaste,{})

	-- Sword(AM Up: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Sword.SAM.AM.HighHaste.STP = set_combine(sets.TP.Sword.SAM.HighHaste,{})
	sets.TP.Sword.SAM.MidACC.AM.HighHaste.STP = set_combine(sets.TP.Sword.SAM.MidACC.HighHaste,{})
	sets.TP.Sword.SAM.HighACC.AM.HighHaste.STP = set_combine(sets.TP.Sword.SAM.HighACC.HighHaste,{})

	-- Sword(AM Down: Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Sword.SAM.Ionis.STP = set_combine(sets.TP.Sword.SAM.Ionis,{})
	sets.TP.Sword.SAM.MidACC.Ionis.STP = set_combine(sets.TP.Sword.SAM.MidACC.Ionis,{})
	sets.TP.Sword.SAM.HighACC.Ionis.STP = set_combine(sets.TP.Sword.SAM.HighACC.Ionis,{})

	-- Sword(AM Up: Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Sword.SAM.AM.Ionis.STP = set_combine(sets.TP.Sword.SAM.AM,{})
	sets.TP.Sword.SAM.MidACC.AM.Ionis.STP = set_combine(sets.TP.Sword.SAM.MidACC.AM,{})
	sets.TP.Sword.SAM.HighACC.AM.Ionis.STP = set_combine(sets.TP.Sword.SAM.HighACC.AM,{})

	-- Sword(AM Down: High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Sword.SAM.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.SAM.HighHaste,{})
	sets.TP.Sword.SAM.MidACC.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.SAM.MidACC.HighHaste,{})
	sets.TP.Sword.SAM.HighACC.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.SAM.HighACC.HighHaste,{})

	-- Sword(AM Up: High Haste + Ionis + SAM Roll) /SAM TP Sets --
	sets.TP.Sword.SAM.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.SAM.HighHaste,{})
	sets.TP.Sword.SAM.MidACC.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.SAM.MidACC.HighHaste,{})
	sets.TP.Sword.SAM.HighACC.AM.HighHaste.Ionis.STP = set_combine(sets.TP.Sword.SAM.HighACC.HighHaste,{})

	-- AM3 Rancor ON Mantle --
	sets.TP.Rancor = {back="Rancorous Mantle"}

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Iron Gobbet",
			head="Cizin Helm +1",
			neck="Twilight Torque",
			ear1="Black Earring",
			ear2="Darkness Earring",
			body="Cizin Mail +1",
			hands="Cizin Mufflers +1",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Shadow Mantle",
			waist="Flume Belt",
			legs="Cizin Breeches +1",
			feet="Cizin Greaves +1"}

	sets.MDT = set_combine(sets.PDT,{
			ammo="Demonry Stone",
			head="Laeradr Helm",
			ear1="Merman's Earring",
			ear2="Sanare Earring",
			body="Nocturnus Mail",
			ring1="Shadow Ring",
			back="Engulfer Cape",
			waist="Resolute Belt"})

	-- Hybrid Set --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Pak Corselet +1",
			waist="Goading Belt",
			feet="Whirlpool Greaves"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {}

	-- Resolution Sets --
	sets.WS.Resolution = {
			ammo="Aqreqaq Bomblet",
			head="Otomi Helm",
			neck="Soil Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Igno. Cuirass +1",
			hands="Miki. Gauntlets",
			ring1="Pyrosoul Ring",
			ring2="Pyrosoul Ring",
			back="Atheling Mantle",
			waist="Soil Belt",
			legs="Igno. Flan. +1",
			feet="Mikinaak Greaves"}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{
			head="Yaoyotl Helm",
			feet="Whirlpool Greaves"})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{
			legs="Miki. Cuisses"})

	-- Resolution(Attack) Set --
	sets.WS.Resolution.ATT = set_combine(sets.WS.Resolution,{})

	-- Catastrophe Sets --
	sets.WS.Catastrophe = {
			ammo="Bomb Core",
			head="Otomi Helm",
			neck="Soil Gorget",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Spiral Ring",
			ring2="Aife's Annulet",
			back="Atheling Mantle",
			waist="Soil Belt",
			legs="Igno. Flan. +1",
			feet="Mikinaak Greaves"}
	sets.WS.Catastrophe.MidACC = set_combine(sets.WS.Catastrophe,{
			head="Yaoyotl Helm",
			feet="Whirlpool Greaves"})
	sets.WS.Catastrophe.HighACC = set_combine(sets.WS.Catastrophe.MidACC,{
			body="Miki. Breastplate",
			legs="Miki. Cuisses"})

	-- Catastrophe(Attack) Set --
	sets.WS.Catastrophe.ATT = set_combine(sets.WS.Catastrophe,{})

	-- Entropy Sets --
	sets.WS.Entropy = {
			ammo="Ombre Tathlum",
			head="Otomi Helm",
			neck="Soil Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Igno. Cuirass +1",
			hands="Miki. Gauntlets",
			ring1="Spiral Ring",
			ring2="Aife's Annulet",
			back="Atheling Mantle",
			waist="Soil Belt",
			legs="Igno. Flan. +1",
			feet="Mikinaak Greaves"}
	sets.WS.Entropy.MidACC = set_combine(sets.WS.Entropy,{
			head="Yaoyotl Helm",
			body="Mes. Haubergeon",
			feet="Whirlpool Greaves"})
	sets.WS.Entropy.HighACC = set_combine(sets.WS.Entropy.MidACC,{
			body="Miki. Breastplate",
			legs="Miki. Cuisses"})

	-- Entropy(Attack) Set --
	sets.WS.Entropy.ATT = set_combine(sets.WS.Entropy,{})

	-- Insurgency Sets --
	sets.WS.Insurgency = {}
	sets.WS.Insurgency.MidACC = set_combine(sets.WS.Insurgency,{})
	sets.WS.Insurgency.HighACC = set_combine(sets.WS.Insurgency.MidACC,{})

	-- JA Sets --
	sets.JA = {}
	sets.JA["Blood Weapon"] = {body="Fallen's Cuirass"}
	sets.JA["Diabolic Eye"] = {hands="Fall. Fin. Gaunt. +1"}
	sets.JA["Nether Void"] = {legs="Bale Flanchard +2"}
	sets.JA["Arcane Circle"] = {feet="Igno. Sollerets +1"}
	sets.JA["Last Resort"] = {feet="Fall. Sollerets +1"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Haruspex Hat +1",
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ring1="Prolix Ring",
			ring2="Veneficium Ring",
			legs="Enif Cosciales"}

	-- Precast Dark Magic --
	sets.Precast['Dark Magic'] = set_combine(sets.Precast.FastCast,{head="Fall. Burgeonet +1"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})

	-- Dark Magic Set --
	sets.Midcast['Dark Magic'] = {
			head="Igno. Burgeonet +1",
			neck="Dark Torque",
			ear1="Pensee Earring",
			ear2="Dark Earring",
			body="Demon's Harness",
			hands="Fall. Fin. Gaunt. +1",
			ring1="Archon Ring",
			ring2="Sangoma Ring",
			back="Merciful Cape",
			waist="Casso Sash",
			legs="Bale Flanchard +2",
			feet="Bale Sollerets +2"}

	-- Stun Sets --
	sets.Midcast.Stun = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Endark Set --
	sets.Midcast.Endark = set_combine(sets.Midcast['Dark Magic'],{})

	-- Enfeebling Magic Set --
	sets.Midcast['Enfeebling Magic'] = {body="Igno. Cuirass +1"}

	-- Elemental Magic Set --
	sets.Midcast['Elemental Magic'] = {}

	-- Dread Spikes Set --
	sets.Midcast['Dread Spikes'] = {
			ammo="Egoist's Tathlum",
			head="Ganesha's Mask",
			neck="Dualism Collar",
			ear1="Bloodgem Earring",
			ear2="Cassie Earring",
			body="Bale Cuirass +2",
			hands="Ares' Gauntlets +1",
			ring1="Bomb Queen Ring",
			ring="Meridian Ring",
			back="Strendu Mantle",
			waist="Oneiros Belt",
			legs="Osmium Cuisses",
			feet="Llwyd's Clogs"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 290 then -- Cancel Meditate If TP Is Above 290 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
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
			if Attack == 'ON' then
				equipSet = equipSet["ATT"]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
			if spell.english == "Catastrophe" and (world.day_element == 'Dark' or world.day_element == 'Earth') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Darksday or Earthsday --
				equipSet = set_combine(equipSet,{head="Mekira-oto +1"})
			end
			if spell.english == "Resolution" or spell.english == "Entropy" then
				if spell.english == "Resolution" and (world.day_element == 'Thunder' or world.day_element == 'Wind' or world.day_element == 'Earth') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Lightningday or Windsday or Earthsday --
					equipSet = set_combine(equipSet,{head="Mekira-oto +1"})
				elseif spell.english == "Entropy" and (world.day_element == 'Dark' or world.day_element == 'Earth' or world.day_element == 'Water') and Mekira == 'ON' then -- Equip Mekira-oto +1 On Darksday or Earthsday or Watersday --
					equipSet = set_combine(equipSet,{head="Mekira-oto +1"})
				end
				if player.tp > 299 or buffactive.Sekkanoki then -- Equip Bale Earring When You Have 300 TP or Sekkanoki --
					equipSet = set_combine(equipSet,{ear1="Bale Earring"})
				end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.english == "Stun" then
				if buffactive.Hasso or buffactive.Seigan then -- Cancel Hasso or Seigan When You Use Stun --
					cast_delay(0.2)
					send_command('cancel Hasso,Seigan')
				end
				equip(sets.Precast.FastCast)
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if string.find(spell.english,'Absorb') then
			if buffactive["Dark Seal"] then -- Equip Aug'd Abs. Burgeonet +2 When You Have Dark Seal Up --
				equipSet = set_combine(equipSet,{head="Abs. Burgeonet +2"})
			end
		elseif string.find(spell.english,'Drain') or string.find(spell.english,'Aspir') or string.find(spell.english,'Bio') then
			if world.day == "Darksday" or world.weather_element == "Dark" then -- Equip Anrin Obi On Darksday or Dark Weather --
				equipSet = set_combine(equipSet,{waist="Anrin Obi"})
			end
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 1.7;cancel stoneskin')
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
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Arcane Circle" then -- Arcane Circle Countdown --
			send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		elseif spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" then -- Sleep Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		end
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
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			if Rancor == 'ON' then -- Default Rancor Toggle Is Rancorous Mantle --
				equipSet = set_combine(equipSet["AM3"],sets.TP.Rancor)
			else -- Use Rancor Toggle For Atheling Mantle --
				equipSet = equipSet["AM3"]
			end
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive["Last Resort"] and buffactive.March == 2 and (buffactive.Haste or buffactive.Embrava) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
			equipSet = equipSet["STP"]
		end
		equip(equipSet)
	else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if player.mp >= 100 then
			equipSet = set_combine(equipSet,{ring1='Oneiros Ring'})
		end
		if player.hp < 300 then
			equipSet = set_combine(equipSet,{body='Twilight Mail',head='Twilight Helm'})
		end
		if player.hp > 300 then
			equipSet = set_combine(equipSet,sets.TP)
		end
		equip(equipSet)
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
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
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
	elseif command == 'C17' then -- Main Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
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
	elseif command == 'C16' then -- Rancor Toggle --
		if Rancor == 'ON' then
			Rancor = 'OFF'
			add_to_chat(123,'Rancor: [OFF]')
		else
			Rancor = 'ON'
			add_to_chat(158,'Rancor: [ON]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
		else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Mekira Toggle --
		if Mekira == 'ON' then
			Mekira = 'OFF'
			add_to_chat(123,'Mekira: [OFF]')
		else
			Mekira = 'ON'
			add_to_chat(158,'Mekira: [ON]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 'Twilight'
			add_to_chat(158,'Twilight Set: [locked]')
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
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
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
		set_macro_page(2, 6)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 6)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 6)
	elseif player.sub_job == 'DNC' then
		set_macro_page(9, 6)
	elseif player.sub_job == 'SCH' then
		set_macro_page(8, 6)
	else
		set_macro_page(2, 6)
	end
end