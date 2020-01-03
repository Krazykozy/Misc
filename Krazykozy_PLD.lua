-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('keep-my-shield-on.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	ShieldIndex = 1
	ShieldArray = {"Aegis","Ochain",} -- 2 Types Of Shields --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Refresh","Goldsmithing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 'None'
	Repulse = 'OFF' -- Set Default Repulse ON or OFF Here --
	target_distance = 8 -- Set Default Distance Here --
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
	
	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	sc_map = {SC1="Flash", SC2="UtsusemiNi", SC3="UtsusemiIchi"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
	EnmityBlueMagic = S{"Jettatura","Sheep Song","Soporific","Blank Gaze","Geist Wall"} -- BlueMagic --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			ammo="Homiliary",
			head="Twilight Helm",
			neck="Bathy Choker +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Kumarbi's Akar",
			hands="Cab. Gauntlets +1",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Flume Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},}
	sets.Idle.Regen.Ochain = set_combine(sets.Idle.Regen,{
			main="Almace",
			sub="Ochain"})
	sets.Idle.Regen.Aegis = set_combine(sets.Idle.Regen,{
			main="Almace",
			sub="Aegis"})
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Tartarus Platemail",
			hands="Sulevia's Gauntlets +1",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
			waist="Flume Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
	sets.Idle.Movement.Ochain = set_combine(sets.Idle.Movement,{
			main="Almace",
			sub="Ochain"})
	sets.Idle.Movement.Aegis = set_combine(sets.Idle.Movement,{
			main="Almace",
			sub="Aegis"})
	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			ammo="Homiliary",
			head="",
			body="Respite Cloak",
			neck="Creed Collar",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			hands="Sulevia's Gauntlets +1",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			waist="Flume Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
	sets.Idle.Refresh.Ochain = set_combine(sets.Idle.Refresh,{
			main="Almace",
			sub="Ochain"})
	sets.Idle.Refresh.Aegis = set_combine(sets.Idle.Refresh,{
			main="Almace",
			sub="Aegis"})			

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
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},}

	sets.Idle.HELM = {
			ammo="Staunch Tathlum",
			head="",
			neck="Field Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Trench Tunic",
			hands="Worker Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Field Rope",
			legs="Dredger Hose",
			feet="Worker Boots"}

	sets.Idle.D2Ring = {
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring",
			back="Moonbeam Cape",}			

	sets.Idle.CpRing = {
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Trizek Ring",
			right_ring="Capacity Ring",
			back="Moonbeam Cape",}
			
	sets.Resting = set_combine(sets.Idle.Regen)

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- Ochain TP Sets --
	sets.TP.Ochain = {
			sub="Ochain",
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs="Souveran Diechlings",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
			back="Moonbeam Cape",}
	sets.TP.Ochain.MidACC = set_combine(sets.TP.Ochain,{
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			body="Reverence Surcoat +2",
			neck="Combatant's Torque",
			waist="Flume Belt +1",
			back="Moonbeam Cape",
			legs="Souveran Diechlings",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
	sets.TP.Ochain.HighACC = set_combine(sets.TP.Ochain.MidACC,{
			ammo="Staunch Tathlum",
			neck="Subtlety Spectacles",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Reverence Surcoat +2",
			hands="Sulevia's Gauntlets +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Rudianos's Mantle",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"})

	-- Aegis TP Sets --
	sets.TP.Aegis = {
			sub="Aegis",
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs="Souveran Diechlings",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
			back="Moonbeam Cape",}
	sets.TP.Aegis.MidACC = set_combine(sets.TP.Aegis,{
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			body="Reverence Surcoat +2",
			neck="Combatant's Torque",
			waist="Flume Belt +1",
			back="Moonbeam Cape",
			legs="Souveran Diechlings",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
	sets.TP.Aegis.HighACC = set_combine(sets.TP.Aegis.MidACC,{
			ammo="Staunch Tathlum",
			neck="Subtlety Spectacles",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Reverence Surcoat +2",
			hands="Sulevia's Gauntlets +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Rudianos's Mantle",
			legs="Sulevia's Cuisses +1",
			feet="Sulevia's Leggings +1"})

	-- Zulfiqar TP Sets --
	sets.TP.Zulfiqar = {
			main="Zulfiqar",
			sub="Utu Grip",
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			back="Bleating Mantle",
			waist="Ioskeha Belt",
			legs="Sulevia's Cuisses +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},}
	sets.TP.Zulfiqar.MidACC = set_combine(sets.TP.Zulfiqar,{
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			body="Sulevia's Platemail +1",
			back="Rudianos's Mantle",
			waist="Ioskeha Belt",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
	sets.TP.Zulfiqar.HighACC = set_combine(sets.TP.Zulfiqar.MidACC,{
			ammo="Staunch Tathlum",
			neck="Subtlety Spectacles",
			body="Sulevia's Platemail +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Rudianos's Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})

	-- Zulfiqar(Ionis) TP Sets --
	sets.TP.Zulfiqar.Ionis = set_combine(sets.TP.Zulfiqar,{
			main="Zulfiqar",
			sub="Utu Grip",
			ammo="Staunch Tathlum",
			head="Sulevia's Mask +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Sulevia's Platemail +1",
			hands="Sulevia's Gauntlets +1",
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			back="Bleating Mantle",
			waist="Ioskeha Belt",
			legs="Sulevia's Cuisses +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
	sets.TP.Zulfiqar.MidACC.Ionis = set_combine(sets.TP.Zulfiqar.Ionis,{
			head="Sulevia's Mask +1",
			body="Sulevia's Platemail +1",
			waist="Ioskeha Belt",
			back="Rudianos's Mantle",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
	sets.TP.Zulfiqar.HighACC.Ionis = set_combine(sets.TP.Zulfiqar.MidACC.Ionis,{
			ammo="Staunch Tathlum",
			neck="Subtlety Spectacles",
			body="Sulevia's Platemail +1",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Rudianos's Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})

	-- DT/DeathDT/BDT/DT Sets --
	sets.DT = {}
	sets.DT.Ochain = {
			sub="Ochain",
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Gishdubar Sash",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",}
	sets.DT.Aegis = {
			sub="Aegis",
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Gishdubar Sash",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",}

	sets.DeathDT = {}
	sets.DeathDT.Ochain = set_combine(sets.DT.Ochain,{
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",})
	sets.DeathDT.Aegis = set_combine(sets.DT.Aegis,{
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",})

	sets.BDT = {}
	sets.BDT.Ochain = set_combine(sets.DT.Ochain,{
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",})
	sets.BDT.Aegis = set_combine(sets.DT.Aegis,{
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",})	

	-- Weakness/Kiting/Repulse Sets --
	sets.Weakness = {}
	sets.Weakness.Ochain = set_combine(sets.DT.Ochain,{
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Gishdubar Sash",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",})
	sets.Weakness.Aegis = set_combine(sets.DT.Aegis,{
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Gishdubar Sash",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",})

	sets.Repulse = {}
	sets.Repulse.Ochain = {sub="Ochain",back="Repulse Mantle"}
	sets.Repulse.Aegis = {sub="Aegis",back="Repulse Mantle"}

	-- Hybrid/Shield Skill Sets --
	sets.TP.Hybrid = {
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs="Sulevi. Cuisses +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Eihwaz Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",}
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.TP.ShieldSkill = {
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +1",
			legs="Sulevi. Cuisses +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Eihwaz Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",}

	-- W.S. Base Set --
	sets.WS = {			
			ammo="Floestone",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Ramuh Ring +1",
			right_ring="Chirich Ring",
			back="Rudianos's Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulevia's Leggings +1"}
	sets.WS.MidACC = set_combine(sets.WS,{
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",})

	-- Spec. W.S. Sets --

	-- Vorpal Blade WS Sets --
	sets.WS["Vorpal Blade"] = {
			ammo="Floestone",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Epona's Ring",
			back="Rudianos's Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulevia's Leggings +1"}
	sets.WS["Vorpal Blade"].MidACC = set_combine(sets.WS["Vorpal Blade"],{
			ammo="Floestone",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Fotia Belt",
			back="Rudianos's Mantle",})
	sets.WS["Vorpal Blade"].HighACC = set_combine(sets.WS["Vorpal Blade"].MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",
			waist="Fotia Belt"})	

	--Swift Blade sets--
	sets.WS["Swift Blade"] = {
			ammo="Floestone",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			back="Rudianos's Mantle",
			waist="Latria Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulevia's Leggings +1"}
	sets.WS["Swift Blade"].MidACC = set_combine(sets.WS["Swift Blade"],{
			ammo="Floestone",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Latria Belt",
			back="Rudianos's Mantle",})
	sets.WS["Swift Blade"].HighACC = set_combine(sets.WS["Swift Blade"].MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},})			
			
	-- Savage Blade WS Sets --
	sets.WS["Savage Blade"] = {
			ammo="Floestone",
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			back="Rudianos's Mantle",
			waist="Latria Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulevia's Leggings +1"}
	sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Savage Blade"],{
			ammo="Floestone",
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Latria Belt",
			back="Rudianos's Mantle",})
	sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Savage Blade"].MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},})
			
	--Chant du Cygne sets--
	sets.WS["Chant du Cygne"] = {
			ammo="Jukukik Feather",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands="Flamma Manopolas +1",
			left_ring="Regal Ring",
			right_ring="Epona's Ring",
			back="Rudianos's Mantle",
			waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+3','STR+14','Accuracy+15',}},}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{
			ammo="Jukukik Feather",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Fotia Belt",
			back="Rudianos's Mantle",})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Fotia Belt",
			back="Rudianos's Mantle",})

	--Requiscat sets--
	sets.WS["Requiescat"] = {
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Rufescent Ring",
			back="Rudianos's Mantle",
			waist="Latria Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulevia's Leggings +1"}
	sets.WS["Requiescat"].MidACC = set_combine(sets.WS["Requiescat"],{
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},})
	sets.WS["Requiescat"].HighACC = set_combine(sets.WS["Requiescat"].MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",})

	--Resolution sets--
	sets.WS["Resolution"] = {
			ammo="Floestone",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulevia's Leggings +1"}
	sets.WS["Resolution"] .MidACC = set_combine(sets.WS["Resolution"] ,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Fotia Belt",
			back="Rudianos's Mantle",
			feet="Sulevia's Leggings +1"})
	sets.WS["Resolution"] .HighACC = set_combine(sets.WS["Resolution"] .MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",})

	--Atonement sets--
	sets.WS["Atonement"] = {
			ammo="Iron Gobbet",
			head="Cab. Coronet +1",
			neck="Unmoving Collar +1",
			left_ear="Trux Earring",
			right_ear="Ishvara Earring",
			body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Eihwaz Ring",
			back="Rudianos's Mantle",
			waist="Flume Belt +1",
			legs="Souveran Diechlings",
			feet="Chevalier's Sabatons +1"}
	sets.WS["Atonement"].MidACC = set_combine(sets.WS["Atonement"],{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body="Tartarus Platemail",
			back="Rudianos's Mantle",
			feet="Sulevia's Leggings +1"})
	sets.WS["Atonement"].HighACC = set_combine(sets.WS["Atonement"].MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body="Tartarus Platemail",
			back="Rudianos's Mantle"})

	--Knights of Round sets--
	sets.WS["Knights of Round"] = {
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Aquasoul Ring",
			right_ring="Shiva Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulevia's Leggings +1"}
	sets.WS["Knights of Round"].MidACC = set_combine(sets.WS["Knights of Round"],{
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",
			legs="Acro Breeches"})
	sets.WS["Knights of Round"].HighACC = set_combine(sets.WS["Knights of Round"].MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			back="Rudianos's Mantle",})

	--Sanguine Blade sets--
	sets.WS["Sanguine Blade"] = {			
			ammo="Floestone",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Shiva Ring +1",
			waist="Latria Belt",
			back="Rudianos's Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Sulevia's Leggings +1"}
	sets.WS["Sanguine Blade"].MidACC = set_combine(sets.WS["Sanguine Blade"],{})
	sets.WS["Sanguine Blade"].HighACC = set_combine(sets.WS["Sanguine Blade"].MidACC,{
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			back="Rudianos's Mantle",})

	-- Enmity Set --
	sets.Enmity = {
			ammo="Iron Gobbet",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			hands="Sulev. Gauntlets +1",
			legs="Souveran Diechlings",
			feet="Souveran Schuhs",
			neck="Moonbeam Necklace",
			waist="Goading Belt",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			left_ring="Eihwaz Ring",
			right_ring="Apeile Ring +1",
			back="Reiki Cloak",}		
			
	-- JA Sets --
	sets.JA = {}
	sets.JA["Shield Bash"] = set_combine(sets.Enmity,{left_ear="Knightly earring",left_ring="Fenian Ring",hands="Cab. Gauntlets +1"})
	sets.JA.Sentinel = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
	sets.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
	sets.JA["Divine Emblem"] = set_combine(sets.Enmity,{feet="Chevalier's Sabatons +1"})
	sets.JA.Fealty = set_combine(sets.Enmity,{body="Caballarius Surcoat +1"})
	sets.JA.Invincible = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
	sets.JA.Cover = set_combine(sets.Enmity,{head="Rev. Coronet +1",body="Caballarius Surcoat +1"})
	sets.JA.Palisade = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
	sets.JA.Aggressor = set_combine(sets.Enmity,{})
	sets.JA.Defender = set_combine(sets.Enmity,{})
	sets.JA.Provoke = set_combine(sets.Enmity,{})
	sets.JA.Warcry = set_combine(sets.Enmity,{})
	sets.JA.Souleater = set_combine(sets.Enmity,{})
	sets.JA["Last Resort"] = set_combine(sets.Enmity,{})
	sets.JA.Chivalry = set_combine(sets.Enmity,{hands="Cab. Gauntlets +1"})
	sets.JA.Rampart = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})

	-- Step --
	sets.Step = {
			left_ear="Zennaroi Earring",
			right_ear="Choreia Earring"}

	-- Waltz --
	sets.Waltz = {
			ammo="Sapience Orb",
			neck="Unmoving Collar +1",
			left_ring="Asklepian Ring",
			right_ring="Valseur's Ring",
			back="Moonbeam Cape",
			waist="Chaac Belt"}

	sets.Precast = {}
	--Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Sapience Orb",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Orunmila's Torque",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Tartarus Platemail",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			back="Rudianos's Mantle",
			waist="Ninurta's Sash",
			legs="Souveran Diechlings",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = {
			ammo="Sapience Orb",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Orunmila's Torque",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Tartarus Platemail",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			back="Rudianos's Mantle",
			waist="Ninurta's Sash",
			legs="Souveran Diechlings",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},}

	-- Cure Precast Set --
	sets.Precast.Cure = {
			ammo="Sapience Orb",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Diemer Gorget",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Tartarus Platemail",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Rudianos's Mantle",
			waist="Ninurta's Sash",
            legs="Enif Cosciales",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Spells Recast --
	sets.Midcast.Recast = {
			ammo="Sapience Orb",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Orunmila's Torque",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body="Tartarus Platemail",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Rudianos's Mantle",
			waist="Ninurta's Sash",
			legs="Enif Cosciales",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},}

	-- Divine Magic --
	sets.Midcast['Divine Magic'] = set_combine(sets.Midcast.Recast,{
			ammo="Sapience Orb",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			head="Jumalik Helm",
			neck="Moonbeam Necklace",
			body="Tartarus Platemail",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Rudianos's Mantle",
			waist="Bishop's Sash",
			legs="Souveran Diechlings",
			feet="Souveran Schuhs"})

	-- Cure Set --
	sets.Midcast.Cure = {
			ammo="Sapience Orb",
			head="Souveran Schaller",
			neck="Moonbeam Necklace",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			hands="Souveran Handschuhs",
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Moonbeam Cape",
			waist="Bishop's Sash",
			legs="Souveran Diechlings",
			feet="Souveran Schuhs"}

	-- Self Cure Set --
	sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{
			ammo="Sapience Orb",
			head="Souveran Schaller",
			neck="Moonbeam Necklace",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			hands="Souveran Handschuhs",
			left_ring="Asklepian Ring",
			right_ring="Lebeche Ring",
			back="Moonbeam Cape",
			waist="Gishdubar Sash",
			legs="Souveran Diechlings",
			feet="Souveran Schuhs"})

	-- Banish Set --
	sets.Midcast.Banish = {
			ammo="Sapience Orb",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			head="Jumalik Helm",
			neck="Moonbeam Necklace",
			body="Tartarus Platemail",
			left_ring="Fenian Ring",
			right_ring="Stikini Ring",
			back="Rudianos's Mantle",
			waist="Bishop's Sash",
			feet={ name="Odyssean Greaves", augments={'Mag. Acc.+10 "Mag.Atk.Bns."+10','"Cure" potency +4%','INT+8','Mag. Acc.+10','"Mag.Atk.Bns."+11',}},}
			
	-- Flash Set --
	sets.Midcast.Flash = {
			ammo="Staunch Tathlum",
			head={ name="Souveran Schaller", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			body="Reverence Surcoat +2",
			hands="Sulev. Gauntlets +1",
			legs={ name="Souveran Diechlings", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",}

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
			ammo="Sapience Orb",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",			
			neck="Incanter's Torque",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Rudianos's Mantle",
			waist="Olympus Sash",
			legs="Rev. Breeches +1",}

	-- Stoneskin --
	sets.Midcast.Stoneskin =  set_combine(sets.Midcast.Recast,{
			ammo="Sapience Orb",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Incanter's Torque",
			right_ear="Earthcry Earring",
			hands="Stone Mufflers",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Siegel Sash",
			legs="Rev. Breeches +1",})

	-- Crusade --
	sets.Midcast.Crusade = {
			ammo="Sapience Orb",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",		
			neck="Incanter's Torque",
			body="Tartarus Platemail",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Rudianos's Mantle",			
			waist="Olympus Sash",
			legs="Rev. Breeches +1",
			feet="Rev. Leggings +1"}			

	-- Phalanx --
	sets.Midcast.Phalanx = {
			ammo="Sapience Orb",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",		
			neck="Incanter's Torque",
			hands="Souveran Handschuhs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Rudianos's Mantle",
			waist="Olympus Sash",
			legs="Rev. Breeches +1",
			feet="Souveran Schuhs"}
			
	-- Enlight --
	sets.Midcast.Enlight = {
			ammo="Sapience Orb",
			head="Jumalik Helm",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			neck="Incanter's Torque",
			body="Tartarus Platemail",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Rudianos's Mantle",
			waist="Bishop's Sash",
			legs="Enif Cosciales",
			feet="Rev. Leggings +1"}			
			
	-- Reprisal --
	sets.Midcast.Reprisal = {
			ammo="Sapience Orb",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",		
			neck="Incanter's Torque",
			body="Tartarus Platemail",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Rudianos's Mantle",
			waist="Olympus Sash",
			legs="Rev. Breeches +1",
			feet="Rev. Leggings +1"}
			
    --Doom/Cursed Sets--
	sets.Doom = {
			left_ring="Purity Ring",
			right_ring="Defending Ring",
			waist="Gishdubar Sash",}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Cancel Berserk If Berserk Is On --
		send_command('cancel Berserk')
	elseif spell.english == "Defender" and buffactive.Defender then -- Cancel Defender If Defender Is On --
		send_command('cancel Defender')
	elseif spell.english == "Souleater" and buffactive.Souleater then -- Cancel Souleater If Souleater Is On --
		send_command('cancel Souleater')
	elseif spell.english == "Last Resort" and buffactive["Last Resort"] then -- Cancel Last Resort If Last Resort Is On --
		send_command('cancel Last Resort')
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
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
			if player.tp > 2941 then
				if spell.english == "Resolution" then -- Equip Vulcan's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Chant du Cygne" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
				end
				if spell.english == "Vorpal Blade" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Savage Blade" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Requiescat" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Regal Earring"})
				end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Rune" then
		equip(sets.Enmity)
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Reprisal" then
				if buffactive['Blaze Spikes'] or buffactive['Ice Spikes'] or buffactive['Shock Spikes'] then -- Cancel Blaze Spikes, Ice Spikes or Shock Spikes When You Cast Reprisal --
					cast_delay(0.2)
					send_command('cancel Blaze Spikes,Ice Spikes,Shock Spikes')
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
	elseif string.find(spell.type,'Flourish') then
		if spell.english == "Animated Flourish" then
			equip(sets.Enmity)
		else
			equip(sets.Flourish)
		end
	elseif spell.type == "Step" then
		equip(sets.Step)
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
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif (string.find(spell.english,'Cur') or spell.english == "Wild Carrot" or spell.english == "Healing Breeze") and spell.english ~= "Cursna" then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(sets.Midcast['Enhancing Magic'],{right_ring="Sheltered Ring"})
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
			equipSet = equipSet.Recast
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet,{left_ring="Fenian Ring"})
		elseif EnmityBlueMagic:contains(spell.english) or spell.english == "Stun" or string.find(spell.english,'Absorb') or spell.english == 'Aspir' or spell.english == 'Drain' then
			if buffactive.Sentinel then
				equipSet = equipSet.Recast
			else
				equipSet = equipSet.Flash
			end
		elseif string.find(spell.english,'Spikes') then
			equipSet = equipSet.Recast
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Recast
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif equipSet[spell.skill] then
			equipSet = equipSet[spell.skill]
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
end

function aftercast(spell,action)
	if buffactive['doom'] then
		equip(sets['Doom'])
		end
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('@wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		elseif spell.english == "Holy Circle" then -- Holy Circle Countdown --
			send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'DT' then
		equip(sets.DT[ShieldArray[ShieldIndex]])
	elseif Armor == 'DeathDT' then
		equip(sets.DeathDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'BDT' then
		equip(sets.BDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'Weakness' then
		equip(sets.Weakness[ShieldArray[ShieldIndex]])
	elseif Armor == 'DT' then
		equip(sets.DT[ShieldArray[ShieldIndex]])
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if Armor == 'ShieldSkill' then
			equipSet = set_combine(equipSet,sets.TP.ShieldSkill)
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		if player.hp < 1000 then
			equipSet = set_combine(equipSet,{body='Twilight Mail',head='Twilight Helm'})
		end
		if player.hp > 1000 then
			equipSet = set_combine(equipSet,sets.TP)
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Repulse == 'ON' then -- Use Repulse Toggle To Lock Repulse Mantle --
		equip(sets.Repulse[ShieldArray[ShieldIndex]])
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
	if buff == 'doom' then
		equip(sets['Doom'])
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
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Shield Type Toggle --
		ShieldIndex = (ShieldIndex % #ShieldArray) + 1
		status_change(player.status)
		add_to_chat(158,'Shield Type: '..ShieldArray[ShieldIndex])
	elseif command == 'C9' then -- Hybrid Toggle --
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
	elseif command == 'C15' then -- DeathDT Toggle --
		if Armor == 'DeathDT' then
			Armor = 'None'
			add_to_chat(123,'DeathDT Set: [Unlocked]')
		else
			Armor = 'DeathDT'
			add_to_chat(158,'DeathDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C12' then -- BDT Toggle --
		if Armor == 'BDT' then
			Armor = 'None'
			add_to_chat(123,'BDT Set: [Unlocked]')
		else
			Armor = 'BDT'
			add_to_chat(158,'BDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Weakness Set Toggle --
		if Armor == 'Weakness' then
			Armor = 'None'
			add_to_chat(123,'Weakness Set: [Unlocked]')
		else
			Armor = 'Weakness'
			add_to_chat(158,'Weakness Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- DT Toggle --
		if Armor == 'DT' then
			Armor = 'None'
			add_to_chat(123,'DT Set: [Unlocked]')
		else
			Armor = 'DT'
			add_to_chat(158,'DT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Repulse Mantle Toggle --
		if Repulse == 'ON' then
			Repulse = 'OFF'
			add_to_chat(123,'Repulse Mantle: [Unlocked]')
		else
			Repulse = 'ON'
			add_to_chat(158,'Repulse Mantle: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C11' then -- Shield Skill Toggle --
		if Armor == 'ShieldSkill' then
			Armor = 'None'
			add_to_chat(123,'Shield Skill Set: [Unlocked]')
		else
			Armor = 'ShieldSkill'
			add_to_chat(158,'Shield Skill Set: [Locked]')
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

	local waltzTPCost = {['Curing Waltz'] = 200, ['Curing Waltz II'] = 350, ['Curing Waltz III'] = 500, ['Curing Waltz IV'] = 650, ['Curing Waltz V'] = 800}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
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
	-- Default macro set/book --
	if player.sub_job == 'WAR' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 10)
	else
		set_macro_page(1, 19)
	end
end