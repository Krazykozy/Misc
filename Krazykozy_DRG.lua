-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"TP","LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"Habile","Blurred"} -- Default TP Set Is Habile. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Refresh","Goldsmithing","Fishing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Seigan = 'ON' -- Set Default Seigan Set ON or OFF Here --
	Third_Eye = 'ON' -- Set Default Third Eye Set ON or OFF Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	target_distance = 7 -- Set Default Distance Here --
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
	
	sc_map = {SC1="Resolution", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

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
	sets.Idle.Regen.Habile = set_combine(sets.Idle.Regen,{
			main="Habile Mazrak",
			sub="Utu Grip"})
	sets.Idle.Regen.Blurred = set_combine(sets.Idle.Regen,{
			main="Blurred Lance",
			sub="Utu Grip"})

	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head="",
			neck="Bathy Choker +1",
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
	sets.Idle.Refresh.Habile = set_combine(sets.Idle.Refresh,{
			main="Habile Mazrak",
			sub="Utu Grip"})			
	sets.Idle.Refresh.Blurred = set_combine(sets.Idle.Refresh,{
			main="Blurred Lance",
			sub="Utu Grip"})
			
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			neck="Loricate Torque +1",
			body="Tartarus Platemail",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			hands="Sulev. Gauntlets +1",
			waist="Sarissapho. Belt",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Sulev. Leggings +1"})
	sets.Idle.Movement.Habile = set_combine(sets.Idle.Movement,{
			main="Habile Mazrak",
			sub="Utu Grip"})
	sets.Idle.Movement.Blurred = set_combine(sets.Idle.Movement,{
			main="Blurred Lance",
			sub="Utu Grip"})
			
	sets.Idle.Goldsmithing = {
			main="Caduceus",
			sub="Toreutic Shield",
			ammo="Staunch Tathlum",
			head="Shaded Spectacles",
			neck="Goldsmith's Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Goldsmith's Smock",
			hands="Goldsmith's Cuffs",
			left_ring="Orvail Ring +1",
			right_ring="Craftmaster's Ring",
			back="Moonbeam Cape",
			waist="Goldsmith's Belt",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},}		
			
	sets.Idle.Fishing = {
			range="Ebisu Fishing Rod",
			head="Lithelimb Cap",
			neck="Fisher's Torque",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			left_ring="Puffin Ring",
			right_ring="Noddy Ring",
			back="",
			waist="Muscle Belt +1",
			legs="Angler's Hose",
			feet="Waders"}

	sets.Idle.HELM = {
			ammo="Staunch Tathlum",
			head="",
			neck="Field Torque",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="",
			hands="",
			left_ring="",
			right_ring="",
			back="",
			waist="Field Rope",
			legs="",
			feet=""}	

	sets.Idle.D2Ring = {
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring"}			

	sets.Idle.CpRing = {
			left_ring="Trizek Ring",
			right_ring="Capacity Ring"}			
			
	-- TP Base Set --
	sets.TP = {}

    -- Habile TP Sets --	
	sets.TP.Habile = {
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},}
	sets.TP.Habile.LowACC = set_combine(sets.TP.Habile,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	sets.TP.Habile.MidACC = set_combine(sets.TP.Habile.LowACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	sets.TP.Habile.HighACC = set_combine(sets.TP.Habile.MidACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
 
    -- Habile(Ionis) TP Sets --
    sets.TP.Habile.Ionis = set_combine(sets.TP.Habile,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
 	sets.TP.Habile.LowACC.Ionis = set_combine(sets.TP.Habile.Ionis,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	sets.TP.Habile.MidACC.Ionis = set_combine(sets.TP.Habile.Ionis,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
    sets.TP.Habile.HighACC.Ionis = set_combine(sets.TP.Habile.MidACC.Ionis,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
 
    -- Habile(SAM Roll) TP Sets --
    sets.TP.Habile.STP = set_combine(sets.TP.Habile,{})
 	sets.TP.Habile.LowACC.STP = set_combine(sets.TP.Habile.STP,{})
    sets.TP.Habile.MidACC.STP = set_combine(sets.TP.Habile.MidACC,{})
    sets.TP.Habile.HighACC.STP = set_combine(sets.TP.Habile.HighACC,{})
 
    -- Habile(Ionis + SAM Roll) TP Sets --
    sets.TP.Habile.Ionis.STP = set_combine(sets.TP.Habile.Ionis,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
 	sets.TP.Habile.LowACC.Ionis.STP = set_combine(sets.TP.Habile.Ionis.STP,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	sets.TP.Habile.MidACC.Ionis.STP = set_combine(sets.TP.Habile.Ionis.STP,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
    sets.TP.Habile.HighACC.Ionis.STP = set_combine(sets.TP.Habile.MidACC.Ionis.STP,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

    -- Blurred TP Sets --	
	sets.TP.Blurred = {
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},}
	sets.TP.Blurred.LowACC = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	sets.TP.Blurred.MidACC = set_combine(sets.TP.Blurred.LowACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	sets.TP.Blurred.HighACC = set_combine(sets.TP.Blurred.MidACC,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
 
    -- Blurred(Ionis) TP Sets --
    sets.TP.Blurred.Ionis = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
 	sets.TP.Blurred.LowACC.Ionis = set_combine(sets.TP.Blurred.Ionis,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	sets.TP.Blurred.MidACC.Ionis = set_combine(sets.TP.Blurred.Ionis,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
    sets.TP.Blurred.HighACC.Ionis = set_combine(sets.TP.Blurred.MidACC.Ionis,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
 
    -- Blurred(SAM Roll) TP Sets --
    sets.TP.Blurred.STP = set_combine(sets.TP.Blurred,{})
 	sets.TP.Blurred.LowACC.STP = set_combine(sets.TP.Blurred.STP,{})
    sets.TP.Blurred.MidACC.STP = set_combine(sets.TP.Blurred.MidACC,{})
    sets.TP.Blurred.HighACC.STP = set_combine(sets.TP.Blurred.HighACC,{})
 
    -- Blurred(Ionis + SAM Roll) TP Sets --
    sets.TP.Blurred.Ionis.STP = set_combine(sets.TP.Blurred.Ionis,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
 	sets.TP.Blurred.LowACC.Ionis.STP = set_combine(sets.TP.Blurred.Ionis.STP,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	sets.TP.Blurred.MidACC.Ionis.STP = set_combine(sets.TP.Blurred.Ionis.STP,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
    sets.TP.Blurred.HighACC.Ionis.STP = set_combine(sets.TP.Blurred.MidACC.Ionis.STP,{
			ammo="Seeth. Bomblet +1",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			legs="Sulevi. Cuisses +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
			
	-- Seigan TP Set --
	sets.TP.Seigan = set_combine(sets.DT,{
			left_ear="Cryptic Earring",
			right_ear="Odnowa Earring +1",
			hands="Kurys Gloves",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Solemnity Cape",
			waist="Lieutenant's Sash"})

	-- Third Eye TP Set --
	sets.TP['Third Eye'] = set_combine(sets.DT,{
			left_ear="Cryptic Earring",
			right_ear="Odnowa Earring +1",
			hands="Kurys Gloves",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Solemnity Cape",
			waist="Lieutenant's Sash"})

	-- DT/MDT Sets --
	sets.DT = {
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Tartarus Platemail",
			hands="Sulevia's Gauntlets +1",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Nierenschutz",
			legs="Sulevia's Cuisses +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},}

	sets.MDT = set_combine(sets.DT,{
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Tartarus Platemail",
			hands="Sulevia's Gauntlets +1",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Nierenschutz",
			legs="Sulevia's Cuisses +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
			
	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.DT,{
			left_ear="Dignitary's Earring",
			right_ear="Bladeborn Earring"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS.MidACC = set_combine(sets.WS.LowACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})

	-- WS Sets --
	sets.WS.Drakesbane = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS.Drakesbane.LowACC = set_combine(sets.WS.Drakesbane,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS.Drakesbane.MidACC = set_combine(sets.WS.Drakesbane.LowACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS.Drakesbane.HighACC = set_combine(sets.WS.Drakesbane.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})

	-- Drakesbane(Low Level Content) Set --
	sets.WS.Drakesbane.LowContent = set_combine(sets.WS.Drakesbane,{
			neck="Ganesha's Mala",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Windbuffet Belt"})
	-- Drakesbane(High Attack) Set --
	sets.WS.Drakesbane.HighATT = set_combine(sets.WS.Drakesbane,{
			ammo="Ginsen",
			head="Yaoyotl Helm",
			neck="Justiciar's Torque",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Prosilio Belt"})

	sets.WS.Stardiver = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS.Stardiver.LowACC = set_combine(sets.WS.Stardiver,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS.Stardiver.MidACC = set_combine(sets.WS.Stardiver.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS.Stardiver.HighACC = set_combine(sets.WS.Stardiver.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})

	-- Stardiver(High Attack) Set --
	sets.WS.Stardiver.HighATT = set_combine(sets.WS.Stardiver,{
			ammo="Potestas Bomblet",
			body="Miki. Breastplate"})

	-- Lunge Set --
	sets.Lunge = {
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','INT+8','Mag. Acc.+5','"Mag.Atk.Bns."+10',}},
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Samnuha Coat",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Toro Cape",
			waist="Eschan Stone",
			legs="Limbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Mag.Atk.Bns."+13',}},}

	-- Enmity Set --
	sets.Enmity = {
			ammo="Iron Gobbet",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			neck="Moonbeam Necklace",
			body="Emet Harness +1",
			hands="Kurys Gloves",
			waist="Chaac Belt",
			right_ear="Trux Earring",
			left_ring="Petrov Ring",
			right_ring="Eihwaz Ring",
			back="Reiki Cloak",}			
						
	-- JA Sets --
	sets.JA = {}
	sets.JA.Hasso = set_combine(sets.Enmity,{})
	sets.JA.Jump = {
			ammo="Ginsen",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			left_ear="Dignitary's Earring",
			right_ear="Brutal Earring",
			body="Lncr. Plackart +2",
			hands="Ogier's Gauntlets",
			left_ring="K'ayres Ring",
			right_ring="Chirich Ring",
			back="Atheling Mantle",
			waist="Windbuffet Belt",
			legs="Lncr. Cuissots +2",
			feet="Huginn Gambieras"}
	sets.JA.Jump.LowACC = set_combine(sets.JA.Jump,{
			head="Yaoyotl Helm",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands="Xaddi Gauntlets",
			back="Letalis Mantle",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses",
			feet="Xaddi Boots"})
	sets.JA.Jump.MidACC = set_combine(sets.JA.Jump.LowACC,{
			head="Yaoyotl Helm",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands="Xaddi Gauntlets",
			back="Letalis Mantle",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses",
			feet="Xaddi Boots"})
	sets.JA.Jump.HighACC = set_combine(sets.JA.Jump.MidACC,{
			neck="Ziel Charm",
			left_ring="Mars's Ring"})

	sets.JA["High Jump"] = set_combine(sets.JA.Jump,{})
	sets.JA["High Jump"].LowACC = set_combine(sets.JA["High Jump"],{})
	sets.JA["High Jump"].MidACC = set_combine(sets.JA.Jump.MidACC,{})
	sets.JA["High Jump"].HighACC = set_combine(sets.JA.Jump.HighACC,{})

	sets.JA["Spirit Jump"] = set_combine(sets.JA.Jump,{
			feet="Lncr. Schynbld. +2"})
	sets.JA["Spirit Jump"].LowACC = set_combine(sets.JA["Spirit Jump"],{
			head="Yaoyotl Helm",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands="Xaddi Gauntlets",
			back="Letalis Mantle",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses"})
	sets.JA["Spirit Jump"].MidACC = set_combine(sets.JA["Spirit Jump"].LowACC,{
			head="Yaoyotl Helm",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands="Xaddi Gauntlets",
			back="Letalis Mantle",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses"})
	sets.JA["Spirit Jump"].HighACC = set_combine(sets.JA["Spirit Jump"].MidACC,{
			neck="Ziel Charm",
			left_ring="Mars's Ring"})

	sets.JA["Soul Jump"] = set_combine(sets.JA.Jump,{})
	sets.JA["Soul Jump"].LowACC = set_combine(sets.JA.Jump,{})
	sets.JA["Soul Jump"].MidACC = set_combine(sets.JA.Jump.MidACC,{})
	sets.JA["Soul Jump"].HighACC = set_combine(sets.JA.Jump.HighACC,{})

	sets.JA.Angon = {ammo="Angon",left_ear="Dragoon's Earring",hands="Wym. Fng. Gnt. +2"}
	sets.JA["Ancient Circle"] = {"Vishap Brais +1"}
	sets.JA['Call Wyvern'] = {body="Wym. Mail +2"}

	sets.Pet = {}
	sets.Pet.WyvernHP = {
			head="Wym. Armet +2",
			neck="Lancer's Torque",
			body="Wyvern Mail",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back="Updraft Mantle",
			waist="Glassblower's Belt",
			legs="Vishap Brais +1",
			feet="Wym. Greaves +2"}

	sets.JA["Spirit Link"] = set_combine(sets.Pet.WyvernHP,{head="Vishap Armet +1",hands="Lncr. Vmbrc. +2"})
	sets.Pet["Restoring Breath"] = set_combine(sets.Pet.WyvernHP)
	sets.Pet["Smiting Breath"] = set_combine(sets.Pet.WyvernHP)
	sets.Pet["Steady Wing"] = set_combine(sets.Pet.WyvernHP)

	-- Healing Breath Trigger --
	sets.HealingBreathTrigger = set_combine(sets.Pet.WyvernHP,{
			ammo="Egoist's Tathlum",
			head="Vishap Armet +1",
			body="Wym. Mail +2",
			hands="Ares' Gauntlets +1",
			left_ring="K'ayres Ring",
			right_ring="Meridian Ring",
			back="Strendu Mantle",
			legs="Osmium Cuisses",
			feet="Ejekamal Boots"})

	-- Waltz Set --
	sets.Waltz = {
			ammo="Staunch Tathlum",
			head={ name="Uk'uxkaj Cap", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','STR+8',}},
			neck="Unmoving Collar +1",
			left_ear="Cryptic Earring",
			right_ear="Etiolation Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			left_ring="Asklepian Ring",
			right_ring="Valseur's Ring",
			back="Laic Mantle",
			waist="Chaac Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Sapience Orb",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			body="Taeon Tabard",
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			waist="Ninurta's Sash",
			legs="Limbo Trousers",
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},}

	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{legs="Futhark Trousers +1"})

	-- Midcast Base Set --
	sets.Midcast = {neck="Incanter's Torque"}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.DT,{})

	-- Utsusemi Midcast Set --
	sets.Midcast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	-- Flash Set --
	sets.Midcast.Flash = set_combine(sets.Enmity,{left_ear="Dignitary's Earring",right_ear="Gwati Earring",neck="Incanter's Torque",left_ring="Stikini Ring",right_ring="Stikini Ring",legs="Runeist Tights +1"})

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {head="Erilaz Galea +1",right_ear="Andoaa Earring",neck="Incanter's Torque",hands="Runeist Mitons +1",waist="Olympus Sash",legs="Futhark Trousers +1",left_ring="Stikini Ring",right_ring="Stikini Ring"}

	-- Stoneskin --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{head="Carmine Mask",left_ear="Earthcry Earring"})

	-- Phalanx --
	sets.Midcast.Phalanx = set_combine(sets.Midcast['Enhancing Magic'],{head="Futhark Bandeau +1"})

	-- Regen --
	sets.Midcast.Regen = {head="Rune. Bandeau +1",neck="Incanter's Torque",left_ring="Stikini Ring",right_ring="Stikini Ring"}

	-- Divine Magic --
	sets.Midcast['Divine Magic'] = set_combine(sets.Enmity,{neck="Incanter's Torque",left_ring="Stikini Ring",right_ring="Stikini Ring",legs="Runeist Tights +1"})

    --Doom/Cursed Sets--
	sets.Doom = {
			left_ring="Purity Ring",
			right_ring="Defending Ring"}
end


function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Spirit Jump" and not pet.isvalid then -- Change Spirit Jump To Jump If Wyvern Is Not Present --
		cancel_spell()
		send_command('Jump')
	elseif spell.english == "Soul Jump" and not pet.isvalid then -- Change Soul Jump To High Jump If Wyvern Is Not Present --
		cancel_spell()
		send_command('HighJump')
	elseif spell.english == "Dismiss" and pet.hpp < 100 then -- Cancel Dismiss If Wyvern's HP Is Under 100% --
		cancel_spell()
		add_to_chat(123, spell.english .. ' Canceled: [' .. pet.hpp .. ']')
		return
	elseif spell.english == "Call Wyvern" and pet.isvalid then -- Change Call Wyvern To Dismiss If Wyvern Is Present --
		cancel_spell()
		send_command('Dismiss')
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
	end
end

function precast(spell,action)
	if spell.english == 'Ranged' then
		equip({ammo="Pebble"})
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
			if equipSet[AttArray[AttIndex]] then
				equipSet = equipSet[AttArray[AttIndex]]
			end
			if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
			if player.tp > 299 or buffactive.Sekkanoki then -- Equip Vulcan's Pearl When You Have 300 TP or Sekkanoki --
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
			end
			if spell.english == "Drakesbane" and string.find(spell.target.name,'Dynamis Lord') then -- Equip Phorcys Korazin When You Use Drakesbane On DL & ADL --
				equipSet = set_combine(equipSet,{body="Phorcys Korazin"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		equipSet = sets.JA
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if spell.english == "High Jump" and NM_For_Brais:contains(spell.target.name) and Brais == 'ON' then -- Use Vishap Brais +1 Toggle To Equip Vishap Brais +1 For High Jump --
			equipSet = set_combine(equipSet,{legs="Vishap Brais +1"})
		end
		equip(equipSet)
	elseif spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123,'Utsusemi Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
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
	elseif spell.type == "PetCommand" then
		equip(sets.Pet[spell.english])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	if spell.english == 'Ranged' then
		equip({ammo="Pebble"})
	elseif spell.action_type == 'Magic' then
		if string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		elseif HB_Mage_SubJob:contains(player.sub_job) and player.hpp < 51 and pet.isvalid then
			equip(sets.HealingBreathTrigger)
		elseif HB_DD_SubJob:contains(player.sub_job) and player.hpp < 34 and pet.isvalid then
			equip(sets.HealingBreathTrigger)
		else
			equip(sets.Midcast.Haste)
		end

		spam_protection_on(spell)
	else
		cancel_spell()

	end
end

function aftercast(spell,action)
	if buffactive['doom'] then
		equip(sets['Doom'])
		end
	if not string.find(spell.english,'Breath') then
		status_change(player.status)
	elseif not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif string.find(spell.english,'Jump') then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Angon" then -- Angon Timer/Countdown --
			timer_angon()
			send_command('wait 80;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;timers delete "Angon";input /p '..spell.name..': [OFF]')
		elseif spell.english == "Ancient Circle" then -- Ancient Circle Countdown --
			send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		end
	end
end

function status_change(new,old)
	if Armor == 'DT' then
		equip(sets.DT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			equipSet = equipSet["AM3"]
		end
		if buffactive["Aftermath"] and equipSet["AM"] then
            equipSet = equipSet["AM"]
        end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
			equipSet = equipSet["STP"]
		end
		if buffactive.Seigan and Seigan == 'ON' then -- Use Seigan Toggle For Seigan TP Set --
			equipSet = set_combine(equipSet,sets.TP.Seigan)
		end
		if buffactive["Third Eye"] and Third_Eye == 'ON' then -- Use Third Eye Toggle For Third Eye TP Set --
			equipSet = set_combine(equipSet,sets.TP["Third Eye"])
		end
		if player.hp < 1000 then
			equipSet = set_combine(equipSet,{body='Twilight Mail',head='Twilight Helm'})
		end
		if player.hp > 1000 then
			equipSet = set_combine(equipSet,sets.TP)
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
	elseif buff == "perfect defense" then -- PD Timer --
		if gain then
			send_command('timers create "Perfect Defense" 57 down')
		else
			send_command('timers delete "Perfect Defense"')
			add_to_chat(123,'PD: [OFF]')
		end
	elseif buff == 'aggressor' and not gain then
		add_to_chat(123,'Aggressor: [OFF]')
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == 'doom' then
		equip(sets['Doom'])
	end
	if not midaction() then
		status_change(player.status)
	end
end

function pet_midcast(spell,action)
	if string.find(spell.english,'Breath') then
		equip(sets.Pet["Restoring Breath"])
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
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
		status_change(player.status)
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
	elseif command == 'C7' then -- DT Toggle --
		if Armor == 'DT' then
			Armor = 'None'
			add_to_chat(123,'DT Set: [Unlocked]')
		else
			Armor = 'DT'
			add_to_chat(158,'DT Set: [Locked]')
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
	elseif command == 'C16' then -- Seigan Toggle --
		if Seigan == 'ON' then
			Seigan = 'OFF'
			add_to_chat(123,'Seigan Set: [Unlocked]')
		else
			Seigan = 'ON'
			add_to_chat(158,'Seigan Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C12' then -- Third Eye Toggle --
		if Third_Eye == 'ON' then
			Third_Eye = 'OFF'
			add_to_chat(123,'Third Eye Set: [Unlocked]')
		else
			Third_Eye = 'ON'
			add_to_chat(158,'Third Eye Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C11' then -- SAM Roll Toggle --
		if Samurai_Roll == 'ON' then
			Samurai_Roll = 'OFF'
			add_to_chat(123,'SAM Roll: [OFF]')
		else
			Samurai_Roll = 'ON'
			add_to_chat(158,'SAM Roll: [ON]')
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
	elseif command == 'C10' then -- Cancel Meikyo Shisui --
		send_command('Cancel Meikyo Shisui')
		add_to_chat(123,'Meikyo Shisui: [OFF]')
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//'..sc_map[command])
	end
end

function timer_angon()
	local duration = 90
	send_command('timers create "Angon" '..tostring(duration)..' down')
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
	if player.sub_job == 'SAM' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'DNC' then
		set_macro_page(5, 5)
	elseif player.sub_job == 'WAR' then
		set_macro_page(9, 5)
	elseif player.sub_job == 'WHM' then
		set_macro_page(3, 5)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 5)
	else
		set_macro_page(1, 5)
	end
end