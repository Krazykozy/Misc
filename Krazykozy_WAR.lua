-- ** I Use Some of Motenten's Functions ** **Original Skeleton of this file courtesy of Flippant, overhauled by Krazykozy** --
-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy* --
include('how_about_no.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"Aganoshe","Zulfiqar","Tanmogayi","Tramontane","Blurred"} -- Default Main Weapon Is Aganoshe. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","D2Ring","CpRing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Rancor = 'ON' -- Set Default Rancor ON or OFF Here --
	BloodRage = 'ON' -- Set Default BloodRage ON or OFF Here --
	Retaliation = 'OFF' -- Set Default Retaliation ON or OFF Here --
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
	
	sc_map = {SC1="UkkosFury", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			ammo="Staunch Tathlum",
			head="Twilight Helm",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			neck="Loricate Torque +1",
			body="Kumarbi's Akar",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			hands="Sulev. Gauntlets +1",
			legs="Flamma Dirs +1",
			waist="Nierenschutz",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			feet="Hermes' Sandals"}
	sets.Idle.Regen.Aganoshe = set_combine(sets.Idle.Regen,{
			main={ name="Aganoshe", augments={'Phys. dmg. taken -3%','STR+14','Accuracy+20','Attack+18','DMG:+16',}},
			sub="Utu Grip"})
	sets.Idle.Regen.Zulfiqar = set_combine(sets.Idle.Regen,{
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Utu Grip"})
	sets.Idle.Regen.Tanmogayi = set_combine(sets.Idle.Regen,{
			main="Tanmogayi +1"})
	sets.Idle.Regen.Tramontane = set_combine(sets.Idle.Regen,{
			main="Tramontane Axe"})
	sets.Idle.Regen.Blurred = set_combine(sets.Idle.Regen,{
			main="Blurred Lance",
			sub="Utu Grip"})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs="Sulevi. Cuisses +1",
			feet="Hermes' Sandals",
			neck="Loricate Torque +1",
			waist="Nierenschutz",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},})
	sets.Idle.Movement.Aganoshe = set_combine(sets.Idle.Movement,{
			main={ name="Aganoshe", augments={'Phys. dmg. taken -3%','STR+14','Accuracy+20','Attack+18','DMG:+16',}},
			sub="Utu Grip"})
	sets.Idle.Movement.Zulfiqar = set_combine(sets.Idle.Movement,{
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Utu Grip"})
	sets.Idle.Movement.Tanmogayi = set_combine(sets.Idle.Movement,{
			main="Tanmogayi +1"})
	sets.Idle.Movement.Tramontane = set_combine(sets.Idle.Movement,{
			main="Tramontane Axe"})
	sets.Idle.Movement.Blurred = set_combine(sets.Idle.Movement,{
			main="Blurred Lance",
			sub="Utu Grip"})

	sets.Idle.D2Ring = {
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','VIT+10','Phys. dmg. taken -3',}},
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Nierenschutz",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring",
			back="Moonbeam Cape",}			

	sets.Idle.CpRing = {
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','VIT+10','Phys. dmg. taken -3',}},
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Nierenschutz",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Trizek Ring",
			right_ring="Capacity Ring",
			back="Moonbeam Cape",}		
			
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- Aganoshe TP Sets --
	sets.TP.Aganoshe = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"}
	sets.TP.Aganoshe.MidACC = set_combine(sets.TP.Aganoshe,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.HighACC = set_combine(sets.TP.Aganoshe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Aganoshe(Restraint) TP Sets --
	sets.TP.Aganoshe.Restraint = set_combine(sets.TP.Aganoshe,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.MidACC.Restraint = set_combine(sets.TP.Aganoshe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.HighACC.Restraint = set_combine(sets.TP.Aganoshe.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Aganoshe(Ionis) TP Sets --
	sets.TP.Aganoshe.Ionis = set_combine(sets.TP.Aganoshe,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.MidACC.Ionis = set_combine(sets.TP.Aganoshe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.HighACC.Ionis = set_combine(sets.TP.Aganoshe.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Aganoshe(ARestraint + Ionis) TP Sets --
	sets.TP.Aganoshe.Restraint.Ionis = set_combine(sets.TP.Aganoshe,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.MidACC.Restraint.Ionis = set_combine(sets.TP.Aganoshe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.HighACC.Restraint.Ionis = set_combine(sets.TP.Aganoshe.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Aganoshe(SAM Roll) TP Sets --
	sets.TP.Aganoshe.STP = set_combine(sets.TP.Aganoshe,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.MidACC.STP = set_combine(sets.TP.Aganoshe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.HighACC.STP = set_combine(sets.TP.Aganoshe.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Aganoshe(Restraint + SAM Roll) TP Sets --
	sets.TP.Aganoshe.Restraint.STP = set_combine(sets.TP.Aganoshe,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.MidACC.Restraint.STP = set_combine(sets.TP.Aganoshe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.HighACC.Restraint.STP = set_combine(sets.TP.Aganoshe.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Aganoshe(Ionis + SAM Roll) TP Sets --
	sets.TP.Aganoshe.Ionis.STP = set_combine(sets.TP.Aganoshe,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.MidACC.Ionis.STP = set_combine(sets.TP.Aganoshe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.HighACC.Ionis.STP = set_combine(sets.TP.Aganoshe.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
			
	-- Aganoshe(Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Aganoshe.Restraint.Ionis.STP = set_combine(sets.TP.Aganoshe,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Aganoshe.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Aganoshe.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Aganoshe.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Zulfiqar TP Sets --
	sets.TP.Zulfiqar = {
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Utu Grip",
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Sulevi. Cuisses +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"}
	sets.TP.Zulfiqar.MidACC = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.HighACC = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Zulfiqar(Restraint) TP Sets --
	sets.TP.Zulfiqar.Restraint = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.MidACC.Restraint = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.HighACC.Restraint = set_combine(sets.TP.Zulfiqar.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Zulfiqar(Ionis) TP Sets --
	sets.TP.Zulfiqar.Ionis = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.MidACC.Ionis= set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.HighACC.Ionis = set_combine(sets.TP.Zulfiqar.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Zulfiqar(Restraint + Ionis) TP Sets --
	sets.TP.Zulfiqar.Restraint.Ionis = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.MidACC.Restraint.Ionis = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.HighACC.Restraint.Ionis = set_combine(sets.TP.Zulfiqar.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Zulfiqar(SAM Roll) TP Sets --
	sets.TP.Zulfiqar.STP = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.MidACC.STP = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.HighACC.STP = set_combine(sets.TP.Zulfiqar.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Zulfiqar(Restraint + SAM Roll) TP Sets --
	sets.TP.Zulfiqar.Restraint.STP = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.MidACC.Restraint.STP = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.HighACC.Restraint.STP = set_combine(sets.TP.Zulfiqar.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Zulfiqar(Ionis + SAM Roll) TP Sets --
	sets.TP.Zulfiqar.Ionis.STP = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.MidACC.Ionis.STP = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.HighACC.Ionis.STP = set_combine(sets.TP.Zulfiqar.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Zulfiqar(Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Zulfiqar.Restraint.Ionis.STP = set_combine(sets.TP.Zulfiqar,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Zulfiqar.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Zulfiqar.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tanmogayi TP Sets --
	sets.TP.Tanmogayi = {
			main="Tanmogayi +1",
			sub="Genmei Shield",
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Sulevi. Cuisses +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"}
	sets.TP.Tanmogayi.MidACC = set_combine(sets.TP.Tanmogayi,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.HighACC = set_combine(sets.TP.Tanmogayi.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tanmogayi(Restraint) TP Sets --
	sets.TP.Tanmogayi.Restraint = set_combine(sets.TP.Tanmogayi,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.MidACC.Restraint = set_combine(sets.TP.Tanmogayi.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.HighACC.Restraint = set_combine(sets.TP.Tanmogayi.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tanmogayi(Ionis) TP Sets --
	sets.TP.Tanmogayi.Ionis = set_combine(sets.TP.Tanmogayi,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.MidACC.Ionis = set_combine(sets.TP.Tanmogayi.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.HighACC.Ionis = set_combine(sets.TP.Tanmogayi.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tanmogayi(Restraint + Ionis) TP Sets --
	sets.TP.Tanmogayi.Restraint.Ionis = set_combine(sets.TP.Tanmogayi,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.MidACC.Restraint.Ionis = set_combine(sets.TP.Tanmogayi.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.HighACC.Restraint.Ionis = set_combine(sets.TP.Tanmogayi.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tanmogayi(SAM Roll) TP Sets --
	sets.TP.Tanmogayi.STP = set_combine(sets.TP.Tanmogayi,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.MidACC.STP = set_combine(sets.TP.Tanmogayi.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.HighACC.STP = set_combine(sets.TP.Tanmogayi.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tanmogayi(Restraint + SAM Roll) TP Sets --
	sets.TP.Tanmogayi.Restraint.STP = set_combine(sets.TP.Tanmogayi,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.MidACC.Restraint.STP = set_combine(sets.TP.Tanmogayi.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.HighACC.Restraint.STP = set_combine(sets.TP.Tanmogayi.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tanmogayi(Ionis + SAM Roll) TP Sets --
	sets.TP.Tanmogayi.Ionis.STP = set_combine(sets.TP.Tanmogayi,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.MidACC.Ionis.STP = set_combine(sets.TP.Tanmogayi.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.HighACC.Ionis.STP = set_combine(sets.TP.Tanmogayi.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
			
	-- Tanmogayi(Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Tanmogayi.Restraint.Ionis.STP = set_combine(sets.TP.Tanmogayi,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Tanmogayi.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tanmogayi.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Tanmogayi.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tramontane TP Sets --
	sets.TP.Tramontane = {
			main="Tramontane",
			sub="Genmei Shield",
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Sulevi. Cuisses +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"}
	sets.TP.Tramontane.MidACC = set_combine(sets.TP.Tramontane,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.HighACC = set_combine(sets.TP.Tramontane.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tramontane(Restraint) TP Sets --
	sets.TP.Tramontane.Restraint = set_combine(sets.TP.Tramontane,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.MidACC.Restraint = set_combine(sets.TP.Tramontane.Restraint,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.HighACC.Restraint = set_combine(sets.TP.Tramontane.MidACC.Restraint,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tramontane(Ionis) TP Sets --
	sets.TP.Tramontane.Ionis = set_combine(sets.TP.Tramontane,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.MidACC.Ionis = set_combine(sets.TP.Tramontane.Ionis,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.HighACC.Ionis = set_combine(sets.TP.Tramontane.MidACC.Ionis,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tramontane(Restraint + Ionis) TP Sets --
	sets.TP.Tramontane.Restraint.Ionis = set_combine(sets.TP.Tramontane.Restraint,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.MidACC.Restraint.Ionis = set_combine(sets.TP.Tramontane.Restraint.Ionis,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.HighACC.Restraint.Ionis = set_combine(sets.TP.Tramontane.MidACC.Restraint.Ionis,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tramontane(SAM Roll) TP Sets --
	sets.TP.Tramontane.STP = set_combine(sets.TP.Tramontane,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.MidACC.STP = set_combine(sets.TP.Tramontane.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.HighACC.STP = set_combine(sets.TP.Tramontane.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tramontane(Restraint + SAM Roll) TP Sets --
	sets.TP.Tramontane.Restraint.STP = set_combine(sets.TP.Tramontane,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.MidACC.Restraint.STP = set_combine(sets.TP.Tramontane.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.HighACC.Restraint.STP = set_combine(sets.TP.Tramontane.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tramontane(Ionis + SAM Roll) TP Sets --
	sets.TP.Tramontane.Ionis.STP = set_combine(sets.TP.Tramontane,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.MidACC.Ionis.STP = set_combine(sets.TP.Tramontane.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.HighACC.Ionis.STP = set_combine(sets.TP.Tramontane.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Tramontane(Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Tramontane.Restraint.Ionis.STP = set_combine(sets.TP.Tramontane,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Tramontane.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Tramontane.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Tramontane.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Blurred TP Sets --
	sets.TP.Blurred = {
			main="Blurred Lance",
			sub="Utu Grip",
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands={ name="Valorous Mitts", augments={'Accuracy+9 Attack+9','"Store TP"+5','DEX+1','Accuracy+13','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Sulevi. Cuisses +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"}
	sets.TP.Blurred.MidACC = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.HighACC = set_combine(sets.TP.Blurred.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Blurred(Restraint) TP Sets --
	sets.TP.Blurred.Restraint = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.MidACC.Restraint = set_combine(sets.TP.Blurred.Restraint,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.HighACC.Restraint = set_combine(sets.TP.Blurred.MidACC.Restraint,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Blurred(Ionis) TP Sets --
	sets.TP.Blurred.Ionis = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.MidACC.Ionis = set_combine(sets.TP.Blurred.Ionis,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.HighACC.Ionis = set_combine(sets.TP.Blurred.MidACC.Ionis,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
			
	-- Blurred(Restraint + Ionis) TP Sets --
	sets.TP.Blurred.Restraint.Ionis = set_combine(sets.TP.Blurred.Restraint,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.MidACC.Restraint.Ionis = set_combine(sets.TP.Blurred.Restraint.Ionis,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.HighACC.Restraint.Ionis = set_combine(sets.TP.Blurred.MidACC.Restraint.Ionis,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Blurred(SAM Roll) TP Sets --
	sets.TP.Blurred.STP = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.MidACC.STP = set_combine(sets.TP.Blurred.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.HighACC.STP = set_combine(sets.TP.Blurred.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Blurred(Restraint + SAM Roll) TP Sets --
	sets.TP.Blurred.Restraint.STP = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.MidACC.Restraint.STP = set_combine(sets.TP.Blurred.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.HighACC.Restraint.STP = set_combine(sets.TP.Blurred.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})
	
	-- Blurred(Ionis + SAM Roll) TP Sets --
	sets.TP.Blurred.Ionis.STP = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.MidACC.Ionis.STP = set_combine(sets.TP.Blurred.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.HighACC.Ionis.STP = set_combine(sets.TP.Blurred.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- Blurred(Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Blurred.Restraint.Ionis.STP = set_combine(sets.TP.Blurred,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Blurred.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			body="Flamma Korazin +1",
			hands="Flamma Manopolas +1",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			legs="Flamma Dirs +1",
			waist="Ioskeha Belt",
			back="Letalis Mantle",
			feet="Flamma Gambieras +1"})
	sets.TP.Blurred.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Blurred.HighACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},})

	-- MS TP Set --
	sets.TP.MS = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",	
			body={ name="Valorous Mail", augments={'Accuracy+19','STR+4','"Store TP"+3','Accuracy+20 Attack+20','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			hands="Flamma Manopolas +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs="Flamma Dirs +1",
			back="Letalis Mantle",
			feet={ name="Valorous Greaves", augments={'Accuracy+23 Attack+23','Crit.hit rate+2','VIT+8','Accuracy+12','Attack+11',}},}

	-- Retaliation Set --
	sets.TP.Retaliation = {hands="Pumm. Mufflers +1",feet="Rvg. Calligae +2"}

	-- AM3 Rancor ON Mantle --
	sets.TP.Rancor = {back="Rancorous Mantle"}

	-- DT/MDT Sets --
	sets.DT = {
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
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
			hands="Sulevia's Gauntlets +1",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Nierenschutz",
			legs="Sulevia's Cuisses +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})

	-- Hybrid/Kiting Sets --
	sets.TP.Hybrid = set_combine(sets.DT,{
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			left_ring="Patricius Ring",
			back="Moonbeam Cape",
			waist="Cetl Belt"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			body="Mes. Haubergeon",
			waist="Dynamic Belt +1",
			legs="Pumm. Cuisses +1",
			feet="Whirlpool Greaves"})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			neck="Iqabi Necklace",
			hands="Buremte Gloves",
			back="Mauler's Mantle"})

	sets.Kiting = set_combine(sets.DT,{feet="Hermes' Sandals +1"})

	-- WS Base Set --
	sets.WS = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
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
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
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
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
						
	-- Resolution Sets --
	sets.WS.Resolution = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
			
	-- Resolution(Attack) Set --
	sets.WS.Resolution.ATT = set_combine(sets.WS.Resolution,{
			head="Valorous Mask",
			hands="Valorous Mitts"})

	-- Spinning Slash Sets --
	sets.WS["Spinning Slash"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS["Spinning Slash"].MidACC = set_combine(sets.WS["Spinning Slash"],{
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS["Spinning Slash"].HighACC = set_combine(sets.WS["Spinning Slash"].MidACC,{
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	
	-- Ground Strike Sets --
	sets.WS["Ground Strike"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS["Ground Strike"].MidACC = set_combine(sets.WS["Ground Strike"],{
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS["Ground Strike"].HighACC = set_combine(sets.WS["Ground Strike"].MidACC,{
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
		
	-- Upheaval Sets --
	sets.WS.Upheaval = {
			ammo="Iron Gobbet",
			head="Sulevia's Mask +1",
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Terra's Pearl",
			body="Sulevia's Plate. +1 ",
			hands="Sulev. Gauntlets +1",
			left_ring="Regal Ring",
			right_ring="Titan Ring +1",
			waist="Ioskeha Belt",
			back="Bleating Mantle",
			legs="Sulevi. Cuisses +1",
			feet="Sulev. Leggings +1"}
	sets.WS.Upheaval.MidACC = set_combine(sets.WS.Upheaval,{
			ammo="Iron Gobbet",
			head="Sulevia's Mask +1",
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Terra's Pearl",
			body="Sulevia's Plate. +1 ",
			hands="Sulev. Gauntlets +1",
			left_ring="Regal Ring",
			right_ring="Titan Ring +1",
			waist="Ioskeha Belt",
			back="Bleating Mantle",
			legs="Sulevi. Cuisses +1",
			feet="Sulev. Leggings +1"})
	sets.WS.Upheaval.HighACC = set_combine(sets.WS.Upheaval.MidACC,{
			ammo="Iron Gobbet",
			head="Sulevia's Mask +1",
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body="Sulevia's Plate. +1 ",
			hands="Sulev. Gauntlets +1",
			left_ring="Regal Ring",
			right_ring="Titan Ring +1",
			waist="Ioskeha Belt",
			back="Bleating Mantle",
			legs="Sulevi. Cuisses +1",
			feet="Sulev. Leggings +1"})

	-- Upheaval(Attack) Set --
	sets.WS.Upheaval.ATT = set_combine(sets.WS.Upheaval,{})

	-- Raging Rush Sets --
	sets.WS["Raging Rush"] = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS["Raging Rush"].MidACC = set_combine(sets.WS["Raging Rush"],{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS["Raging Rush"].HighACC = set_combine(sets.WS["Raging Rush"].MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})

	-- Raging Rush(Attack) Set --
	sets.WS["Raging Rush"].ATT = set_combine(sets.WS["Raging Rush"],{})	
	
	-- Ukko's Fury Sets --
	sets.WS["Ukko's Fury"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS["Ukko's Fury"].MidACC = set_combine(sets.WS["Ukko's Fury"],{
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS["Ukko's Fury"].HighACC = set_combine(sets.WS["Ukko's Fury"].MidACC,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})

	-- Ukko's Fury(Attack) Set --
	sets.WS["Ukko's Fury"].ATT = set_combine(sets.WS["Ukko's Fury"],{})

	sets.WS["King's Justice"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}
	sets.WS["King's Justice"].MidACC  = set_combine(sets.WS["King's Justice"],{
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})
	sets.WS["King's Justice"].HighACC = set_combine(sets.WS["King's Justice"].MidACC ,{
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"})

	-- Fell Cleave Set --
	sets.WS["Fell Cleave"] = {
			ammo="Seeth. Bomblet +1",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back="Bleating Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulev. Leggings +1"}

	-- MS WS Set --
	sets.MS_WS = {
			-- body="Kirin's Osode",
			back="Cavaros Mantle",
			-- legs="Jokushu Haidate",
			feet="Huginn Gambieras"}

	-- Enmity Set --
	sets.Enmity = {
			ammo="Iron Gobbet",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			neck="Moonbeam Necklace",
			body="Emet Harness +1",
			hands="Kurys Gloves",
			waist="Goading Belt",
			left_ring="Petrov Ring",
			right_ring="Eihwaz Ring",
			back="Reiki Cloak",}			
			
	-- JA Sets --
	sets.JA = {}
	sets.JA.Hasso = set_combine(sets.Enmity,{})
	sets.JA.Provoke = set_combine(sets.Enmity,{})
	sets.JA.Berserk = {body="Pumm. Lorica +1",feet="Agoge Calligae +1"}
	sets.JA.Aggressor = {head="Pumm. Mask +1",body="Agoge Lorica +1"}
	sets.JA["Blood Rage"] = {body="Rvg. Lorica +2"}
	sets.JA.Warcry = {head="Agoge Mask +1"}
	sets.JA.Tomahawk = {ammo="Thr. Tomahawk",feet="Agoge Calligae +1"}
	sets.JA["Mighty Strikes"] = {hands="Agoge Mufflers +1"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Cizin Helm +1",
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			left_ring="Kishar Ring",
			right_ring="Veneficium Ring"}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.DT,{
			hands="Agoge Mufflers +1"})
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
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
			if Attack == 'ON' then
				equipSet = equipSet["ATT"]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
			if buffactive["Mighty Strikes"] then -- Equip MS_WS Set When You Have Mighty Strikes On --
				equipSet = set_combine(equipSet,sets.MS_WS)
			end
			if spell.english == "Ukko's Fury" and buffactive['Blood Rage'] and BloodRage == "ON" then -- Use Hct. Mittens +1 Toggle For Normal Ukko's Fury Hands --
				equipSet = set_combine(equipSet,{hands="Hct. Mittens +1"})
			end
			if spell.english == "Upheaval" and world.day_element == 'Dark' then -- Equip Shadow Mantle On Darksday For Upheaval --
				equipSet = set_combine(equipSet,{back="Shadow Mantle"})
			end
			if player.tp > 2941 or buffactive.Sekkanoki then -- Equip Vulcan's Pearl When You Have 300 TP or Sekkanoki --
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
			end
			if spell.english == "Vorpal Blade" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
			end
			if spell.english == "Ground Strike" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
			end
			if spell.english == "Savage Blade" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
			end
			if spell.english == "Ukko's Fury" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
			end
			if spell.english == "Raging Rush" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
			end
			if spell.english == "Resolution" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
			end
			if spell.english == "Upheaval" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Terra's Pearl"})
			end
			if spell.english == "Requiescat" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Regal Earring"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
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
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	if spell.action_type == 'Magic' then
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
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Blood Rage" then -- Blood Rage Timer/Countdown --
			timer_blood_rage()
			send_command('wait 50;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		elseif spell.english == "Tomahawk" then -- Tomahawk Timer/Countdown --
			timer_tomahawk()
			send_command('wait 80;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;timers delete "Tomahawk";input /p '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'DT' then
		equip(sets.DT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'Kiting' then
		equip(sets.Kiting)
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
			if Rancor == 'ON' then -- Default Rancor Toggle Is Rancorous Mantle --
				equipSet = set_combine(equipSet["AM3"],sets.TP.Rancor)
			else -- Use Rancor Toggle For Atheling Mantle --
				equipSet = equipSet["AM3"]
			end
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive.Restraint and equipSet["Restraint"] then -- Restraint TP Set --
			equipSet = equipSet["Restraint"]
		end
		if buffactive.Ionis and equipSet["Ionis"] then -- Ionis TP Set --
			equipSet = equipSet["Ionis"]
		end
		if buffactive["Mighty Strikes"] then -- Mighty Strikes TP Set --
			equipSet = set_combine(equipSet,sets.TP.MS)
		end
		if buffactive.Retaliation and Retaliation == 'ON' then -- Use Retaliation Toggle For Retaliation TP Set --
			equipSet = set_combine(equipSet,sets.TP.Retaliation)
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
		if player.hp < 1000 then
			equipSet = set_combine(equipSet,{body='Twilight Mail',head='Twilight Helm'})
		end
		if player.hp > 1000 then
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
	elseif buff == "blood rage" and not gain then
		send_command('timers delete "Blood Rage"')
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 1000 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 1000+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
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
	elseif command == 'C12' then -- Kiting Toggle --
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Retaliation Toggle --
		if Retaliation == 'ON' then
			Retaliation = 'OFF'
			add_to_chat(123,'Retaliation Set: [Unlocked]')
		else
			Retaliation = 'ON'
			add_to_chat(158,'Retaliation Set: [Locked]')
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
	elseif command == 'C11' then -- Hct. Mittens +1 Toggle --
		if BloodRage == 'ON' then
			BloodRage = 'OFF'
			add_to_chat(123,'Hct. Mittens +1: [OFF]')
		else
			BloodRage = 'ON'
			add_to_chat(158,'Hct. Mittens +1: [ON]')
		end
		status_change(player.status)
	elseif command == 'C18' then -- SAM Roll Toggle --
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

function timer_blood_rage()
	local duration = 60
	send_command('timers create "Blood Rage" '..tostring(duration)..' down')
end

function timer_tomahawk()
	local duration = 90
	send_command('timers create "Tomahawk" '..tostring(duration)..' down')
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
				add_to_chat(8,'Full HP!')
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

	local waltzTPCost = {['Curing Waltz'] = 200, ['Curing Waltz II'] = 350, ['Curing Waltz III'] = 500, ['Curing Waltz IV'] = 650, ['Curing Waltz V'] = 800}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 200 then
			add_to_chat(8, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 350 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 500 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 650 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 800 then
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
		set_macro_page(1, 11)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 11)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 11)
	else
		set_macro_page(1, 11)
	end
end