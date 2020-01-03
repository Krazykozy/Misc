include('spam_protection.lua')

    


send_command('input /macro book 1; input /lockstyleset 1')


function get_sets()
	--WS Properties used for Gavialis helm, don't touch
	wsProperty = T{}
	--Level 1s used for Gavialis helm, don't touch
	wsProperty['Transfixion'] = T{'Light'}
	wsProperty['Compression'] = T{'Dark'}
	wsProperty['Liquefaction'] = T{'Fire'}
	wsProperty['Scission'] = T{'Earth'}
	wsProperty['Reverberation'] = T{'Water'}
	wsProperty['Detonation'] = T{'Wind'}
	wsProperty['Induration'] = T{'Ice'}
	wsProperty['Impaction'] = T{'Lightning'}
	--Level 2s used for Gavialis helm, don't touch
	wsProperty['Gravitation'] = T{'Dark','Earth'}
	wsProperty['Distortion'] = T{'Water','Ice'}
	wsProperty['Fusion'] = T{'Fire','Light'}
	wsProperty['Fragmentation'] = T{'Wind','Lightning'}
	--Level 3s used for Gavialis helm, don't touch
	wsProperty['Darkness'] = T{'Dark','Earth','Water','Ice'}
	wsProperty['Light'] = T{'Light','Fire','Wind','Lightning'}

	TPSetName = 'Standard'
	accMode = 'High'

	sets['Standard'] = T{}
	sets['DT'] = T{}

	sets['NighttimeWS'] = {ear1="Lugra Earring +1",ear2="Lugra Earring"}
	
	--Standard set to be equipped in combat when Standard mode is on (Low/Mid/High acc), using //gs c standard
	sets['Standard']['Low'] = {ammo = "yetshila",
		head = "Sulevia's Mask +2",neck = "Combatant's Torque",ear1 = "Digni. Earring",ear2 = "Tripudio Earring",
		body = "Boii Lorica +1",hands = "Argosy Mufflers",ring1 = "Chirich Ring",ring2 = "Petrov Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},waist = "Ioskeha Belt",legs = "Flamma Dirs +1",feet = {"Valorous Greaves", augments={'Accuracy+24 Attack+24','"Store TP"+5','STR+2','Accuracy+8',}},}
	sets['Standard']['Mid'] = {ammo = "Ginsen",
		head = {"Valorous Mask", augments={'Accuracy+25 Attack+25','Sklchn.dmg.+1%','STR+2','Accuracy+15',}},neck = "Lissome Necklace",ear1 = "Digni. Earring",ear2 = "Tripudio Earring",
		body = "Flamma Korazin +1",hands = "Flamma Manopolas +1",ring1 = "Niqmaddu Ring",ring2 = "Petrov Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},waist = "Ioskeha Belt",legs = "Pumm. Cuisses +2",feet = "Pumm. Calligae +2"}
	sets['Standard']['High'] = {ammo = "Seeth. Bomblet +1",
		head = "Pummeler's Mask +2",neck = "Subtlety Spec.",ear1 = "Digni. Earring",ear2 = "Zennaroi Earring",
		body = "Pumm. Lorica +2",hands = "Pumm. Mufflers +2",ring1 = "Niqmaddu Ring",ring2 = "Chirich Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},waist = "Goading Belt",legs = "Flamma Dirs +1",feet = {"Valorous Greaves", augments={'Accuracy+24 Attack+24','"Store TP"+5','STR+2','Accuracy+8',}},}

	--DT set to be equipped in combat when DT mode is on (Low/Mid/High acc), using //gs c DT 
	sets['DT']['Low'] = {ammo = "Staunch Tathlum",
		head = "Sulevia's Mask +2",neck = "Twilight Torque",ear1 = "Digni. Earring",ear2 = "Tripudio Earring",
		body = "Sulevia's Plate. +1",hands = "Sulev. Gauntlets +1",ring1 = "Dark Ring",ring2 = "Defending Ring",
		back = "Philidor Mantle",waist = "Ioskeha Belt",legs = "Sulevi. Cuisses +1",feet = {"Valorous Greaves", augments={'Accuracy+24 Attack+24','"Store TP"+5','STR+2','Accuracy+8',}},}
	sets['DT']['Mid'] = {ammo = "Staunch Tathlum",
		head = "Sulevia's Mask +2",neck = "Twilight Torque",ear1 = "Digni. Earring",ear2 = "Steelflash Earring",
		body = "Sulevia's Plate. +1",hands = "Sulev. Gaunetlets +1",ring1 = "Dark Ring",ring2 = "Defending Ring",
		back = "Philidor Mantle",waist = "Ioskeha Belt",legs = "Sulevi. Cuisses +1",feet = {"Valorous Greaves", augments={'Accuracy+24 Attack+24','"Store TP"+5','STR+2','Accuracy+8',}},}
	sets['DT']['High'] = {ammo = "Seeth. Bomblet +1",
		head = "Sulevia's Mask +2",neck = "Twilight Torque",ear1 = "Digni. Earring",ear2 = "Zennaroi Earring",
		body = "Sulevia's Plate. +1",hands = "Sulev. Gaunetlets +1",ring1 = "Dark Ring",ring2 = "Defending Ring",
		back = "Philidor Mantle",waist = "Nierenschutz",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1"}

	--Put your town gear here if you want to. equip with //gs c equip Town
	sets['Town'] = {}

	--Just put the items you want to equip for movement speed here. It'll put them on over the top of your current set. i.e. if you're in acc mode, you'll keep your acc gear on out of combat, but it'll equip Crimson Cuisses in the leg slot till you enter combat again.
	sets['Running'] = {}

	--Leave these lines empty, it's just creating the Table structure for sets.precast
	sets['precast'] = T{}
	sets.precast['Standard'] = T{}
	sets.precast['Standard']['Low'] = T{}
	sets.precast['Standard']['Mid'] = T{}
	sets.precast['Standard']['High'] = T{}
	sets.precast['MS'] = T{}
	sets.precast['MS']['Low'] = T{}
	sets.precast['MS']['Mid'] = T{}
	sets.precast['MS']['High'] = T{}
	sets.precast['DT'] = T{}
	sets.precast['DT']['Low'] = T{}
	sets.precast['DT']['Mid'] = T{}
	sets.precast['DT']['High'] = T{}
	
	--Basic WS sets Low/Mid/High acc
	sets.precast['Standard']['Low']['Weapon Skill'] = {ammo = "Knobkierrie",
		head = {"Valorous Mask", augments={'Accuracy+25 Attack+25','Sklchn.dmg.+1%','STR+2','Accuracy+15',}},neck = "Fotia Gorget",ear1 = "Moonshade earring",ear2 = "Digni. Earring",
		body = "Pumm. Lorica +2",hands = "Acro surcoat",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1"}

	sets.precast['Standard']['Mid']['Weapon Skill'] = {ammo = "Knobkierrie",
		head = {"Valorous Mask", augments={'Accuracy+25 Attack+25','Sklchn.dmg.+1%','STR+2','Accuracy+15',}},neck = "Fotia Gorget",ear1 = "Moonshade earring",ear2 = "Digni. Earring",
		body = "Pumm. Lorica +2",hands = "Acro surcoat",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1"}

	sets.precast['Standard']['High']['Weapon Skill'] = {ammo = "Knobkierrie",
		head = {"Valorous Mask", augments={'Accuracy+25 Attack+25','Sklchn.dmg.+1%','STR+2','Accuracy+15',}},neck = "Fotia Gorget",ear1 = "Moonshade earring",ear2 = "Digni. Earring",
		body = "Pumm. Lorica +2",hands = "Acro surcoat",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1"}

	--WS sets when in DT mode Low/Mid/High acc
	sets.precast['DT']['Low']['Weapon Skill'] = {ammo = "Knobkierrie",
		head = {"Valorous Mask", augments={'Accuracy+25 Attack+25','Sklchn.dmg.+1%','STR+2','Accuracy+15',}},neck = "Fotia Gorget",ear1 = "Moonshade earring",ear2 = "Digni. Earring",
		body = "Pumm. Lorica +2",hands = "Acro surcoat",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1"}

	sets.precast['DT']['Mid']['Weapon Skill'] = {ammo = "Knobkierrie",
		head = {"Valorous Mask", augments={'Accuracy+25 Attack+25','Sklchn.dmg.+1%','STR+2','Accuracy+15',}},neck = "Fotia Gorget",ear1 = "Moonshade earring",ear2 = "Digni. Earring",
		body = "Pumm. Lorica +2",hands = "Acro surcoat",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1"}

	sets.precast['DT']['High']['Weapon Skill'] = {ammo = "Knobkierrie",
		head = {"Valorous Mask", augments={'Accuracy+25 Attack+25','Sklchn.dmg.+1%','STR+2','Accuracy+15',}},neck = "Fotia Gorget",ear1 = "Moonshade earring",ear2 = "Digni. Earring",
		body = "Pumm. Lorica +2",hands = "Acro surcoat",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",
		back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1"}

	--Resolution sets
	sets.precast['Standard']['Low']['Resolution'] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Argosy Mufflers",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})
	sets.precast['Standard']['Mid']['Resolution'] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Argosy Mufflers",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})
	sets.precast['Standard']['High']['Resolution'] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Digni. Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Sulev. Gaunetlets +1",ring1 = "Chirich Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})

	sets.precast['DT']['Low']['Resolution'] = set_combine(sets.precast['DT']['Low']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})
	sets.precast['DT']['Mid']['Resolution'] = set_combine(sets.precast['DT']['Mid']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})
	sets.precast['DT']['High']['Resolution'] = set_combine(sets.precast['DT']['High']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})

	--Ukko's Fury sets
	sets.precast['Standard']['Low']["Ukko's Fury"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Argosy Mufflers",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})
	sets.precast['Standard']['Mid']["Ukko's Fury"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Argosy Mufflers",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})
	sets.precast['Standard']['High']["Ukko's Fury"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Digni. Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Sulev. Gaunetlets +1",ring1 = "Chirich Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})

	sets.precast['DT']['Low']["Ukko's Fury"] = set_combine(sets.precast['DT']['Low']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})
	sets.precast['DT']['Mid']["Ukko's Fury"] = set_combine(sets.precast['DT']['Mid']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})
	sets.precast['DT']['High']["Ukko's Fury"] = set_combine(sets.precast['DT']['High']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})

	--Upheaval sets
	sets.precast['Standard']['Low']["Upheaval"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Thureous Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Sulev. Gauntlets +1",ring1 = "Niqmaddu Ring",ring2 = "Karieyh ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = {"Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+4','VIT+10','Accuracy+14','Attack+14',}},feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})
	sets.precast['Standard']['Mid']["Upheaval"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Thureous Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Sulev. Gauntlets +1",ring1 = "Niqmaddu Ring",ring2 = "Karieyh ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = {"Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+4','VIT+10','Accuracy+14','Attack+14',}},feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})
	sets.precast['Standard']['High']["Upheaval"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Zennaroi Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Sulev. Gauntlets +1",ring1 = "Chirich Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = {"Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+4','VIT+10','Accuracy+14','Attack+14',}},feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})

	sets.precast['DT']['Low']["Upheaval"] = set_combine(sets.precast['DT']['Low']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Thureous Earring"})
	sets.precast['DT']['Mid']["Upheaval"] = set_combine(sets.precast['DT']['Mid']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Thureous Earring"})
	sets.precast['DT']['High']["Upheaval"] = set_combine(sets.precast['DT']['High']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Digni. Earring"})

	--King's Justice sets
	sets.precast['Standard']['Low']["King's Justice"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Argosy Mufflers",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})
	sets.precast['Standard']['Mid']["King's Justice"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Zennaroi Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Argosy Mufflers",ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})
	sets.precast['Standard']['High']["King's Justice"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Zennaroi Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = "Sulev. Gaunetlets +1",ring1 = "Chirich Ring",ring2 = "Karieyh Ring",back = {"Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Sulev. Leggings +1",ammo = "Knobkierrie"})

	sets.precast['DT']['Low']["King's Justice"] = set_combine(sets.precast['DT']['Low']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})
	sets.precast['DT']['Mid']["King's Justice"] = set_combine(sets.precast['DT']['Mid']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})
	sets.precast['DT']['High']["King's Justice"] = set_combine(sets.precast['DT']['High']['Weapon Skill'], {ear1 = "Moonshade Earring",ear2 = "Flame Pearl"})

	--Metatron Torment sets
	sets.precast['Standard']['Low']["Metatron Torment"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "otomi helm",neck = "fotia gorget",ear1 = "brutal earring",ear2 = "moonshade earring",body = "phorcys korazin",hands = "agoge mufflers +1",ring1 = "pyrosoul ring",ring2 = "karieyh ring",back = "mauler's mantle",waist = "fotia belt",legs = "Acro breeches",feet = "acro leggings",ammo = "ravager's orb"})
	sets.precast['Standard']['Mid']["Metatron Torment"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "yaoyotl helm",neck = "fotia gorget",ear1 = "zennaroi earring",ear2 = "moonshade earring",body = "phorcys korazin",hands = "agoge mufflers +1",ring1 = "pyrosoul ring",ring2 = "karieyh ring",back = "mauler's mantle",waist = "lfotia belt",legs = "Acro breeches",feet = "acro leggings",ammo = "ravager's orb"})
	sets.precast['Standard']['High']["Metatron Torment"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "gavialis helm",neck = "fotia gorget",ear1 = "zennaroi earring",ear2 = "moonshade earring",body = "Acro surcoat",hands = "acro gauntlets",ring1 = "pyrosoul ring",ring2 = "karieyh ring",back = "mauler's mantle",waist = "fotia belt",legs = "Acro breeches",feet = "acro leggings",ammo = "ravager's orb"})

	sets.precast['DT']['Low']["Metatron Torment"] = set_combine(sets.precast['DT']['Low']['Weapon Skill'], {ear1 = "moonshade earring",ear2 = "brutal earring"})
	sets.precast['DT']['Mid']["Metatron Torment"] = set_combine(sets.precast['DT']['Mid']['Weapon Skill'], {ear1 = "moonshade earring",ear2 = "brutal earring"})
	sets.precast['DT']['High']["Metatron Torment"] = set_combine(sets.precast['DT']['High']['Weapon Skill'], {ear1 = "moonshade earring",ear2 = "brutal earring"})
	
	--Mighty Strikes sets
	sets.precast['MS']['Low']["Upheaval"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Thureous Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Niqmaddu Ring",ring2 = "Karieyh ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = {"Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+4','VIT+10','Accuracy+14','Attack+14',}},feet = "Boii calligae +1",ammo = "Yetshila"})
	sets.precast['MS']['Mid']["Upheaval"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Thureous Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Niqmaddu Ring",ring2 = "Karieyh ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = {"Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+4','VIT+10','Accuracy+14','Attack+14',}},feet = "Boii calligae +1",ammo = "Yetshila"})
	sets.precast['MS']['High']["Upheaval"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Zennaroi Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Chirich Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = {"Odyssean Cuisses", augments={'Accuracy+19 Attack+19','"Store TP"+4','VIT+10','Accuracy+14','Attack+14',}},feet = "Boii calligae +1",ammo = "Yetshila"})

	sets.precast['MS']['Low']["Resolution"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})
	sets.precast['MS']['Mid']["Resolution"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})
	sets.precast['MS']['High']["Resolution"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Digni. Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Chirich Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})
   
	sets.precast['MS']['Low']["Ukko's Fury"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})
	sets.precast['MS']['Mid']["Ukko's Fury"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})
	sets.precast['MS']['High']["Ukko's Fury"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Digni. Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Chirich Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})
	
	sets.precast['MS']['Low']["King's Justice"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Flame Pearl",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})
	sets.precast['MS']['Mid']["King's Justice"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Zennaroi Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Niqmaddu Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})
	sets.precast['MS']['High']["King's Justice"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "Sulevia's Mask +2",neck = "Fotia Gorget",ear1 = "Zennaroi Earring",ear2 = "Moonshade Earring",body = "Pummeler's Lorica +2",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "Chirich Ring",ring2 = "Karieyh Ring",back = {"Mauler's Mantle", augments={'DEX+2','STR+3','Accuracy+3','Crit. hit damage +3%',}},waist = "Fotia Belt",legs = "Sulevi. Cuisses +1",feet = "Boii calligae +1",ammo = "Yetshila"})

	sets.precast['Standard']['Low']["Metatron Torment"] = set_combine(sets.precast['Standard']['Low']['Weapon Skill'], {head = "otomi helm",neck = "fotia gorget",ear1 = "brutal earring",ear2 = "moonshade earring",body = "phorcys korazin",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "pyrosoul ring",ring2 = "karieyh ring",back = "mauler's mantle",waist = "fotia belt",legs = "agoge cuisses +1",feet = "Boii calligae +1",ammo = "yetshila"})
	sets.precast['Standard']['Mid']["Metatron Torment"] = set_combine(sets.precast['Standard']['Mid']['Weapon Skill'], {head = "yaoyotl helm",neck = "fotia gorget",ear1 = "zennaroi earring",ear2 = "moonshade earring",body = "phorcys korazin",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "pyrosoul ring",ring2 = "karieyh ring",back = "mauler's mantle",waist = "fotia belt",legs = "Acro breeches",feet = "Boii calligae +1",ammo = "yetshila"})
	sets.precast['Standard']['High']["Metatron Torment"] = set_combine(sets.precast['Standard']['High']['Weapon Skill'], {head = "gavialis helm",neck = "fotia gorget",ear1 = "zennaroi earring",ear2 = "moonshade earring",body = "mes'yohi haubergeon",hands = {"Valorous Mitts", augments={'Accuracy+27','Crit. hit damage +3%','STR+10','Attack+4',}},ring1 = "pyrosoul ring",ring2 = "karieyh ring",back = "mauler's mantle",waist = "fotia belt",legs = "Acro breeches",feet = "Boii calligae +1",ammo = "yetshila"})

	--Sets for JA, put the JA name where Berserk is, and it'll use this gear for that JA's activation
	sets.precast['Berserk'] =  set_combine(sets['DT']['Low'], {body="Pummeler's Lorica +2",feet="Agoge Calligae +1"})
	sets.precast['Aggressor'] =  set_combine(sets['DT']['Low'], {head="Pummeler's Mask +2",body="Agoge Lorica +1"})
	sets.precast['Tomahawk'] =  set_combine(sets['DT']['Low'], {ammo="Throwing Tomahawk",feet="Agoge Calligae +1"})
	sets.precast['Warcry'] =  set_combine(sets['DT']['Low'], {head="Agoge Mask +1"})
	sets.precast['Blood Rage'] =  set_combine(sets['DT']['Low'], {body="Boii Lorica +1"})
	sets.precast['Restraint'] =  set_combine(sets['DT']['Low'], {body="Boii Mufflers +1"})
	sets.precast['Retaliation'] =  set_combine(sets['DT']['Low'], {hands="Pumm. Mufflers +2",feet="Boii Calligae +1"})
	sets.precast['Mighty strikes'] =  set_combine(sets['DT']['Low'], {hands="Agoge Mufflers +1"})
	sets.precast['Provoke'] =  set_combine(sets['DT']['Low'], {head="Pummeler's Mask +2",body="Pummeler's Lorica +2",hands="Pummeler's Mufflers +2",legs="Pummeler's Cuisses +2",feet="Pummeler's Calligae +2"})

	--Put your fast cast gear in here, it'll be equipped in precast for all spells that have a cast time, like utsusemi etc
	sets.precast['Fast Cast'] = {head = "fallen's burgeonet +1",neck = "Orunmila's Torque",ear1 = "Dark Earring",ear2 = "Enchntr. Earring +1",body = "Nuevo Coselete",hands = "Pavor Gauntlets",ring1 = "Veneficium Ring ",ring2 = "Prolix ring",back = "Niht Mantle",waist = "Casso sash",legs = "bale flanchard +2",feet = "Bale sollerets +2",ammo = "Impatiens"}

	--Added on top of neck at all times during reive
	sets['Reive']={neck= "Ygnas's Resolve +1"}
end

function precast(spell,action)
	if check_ready(spell) then
		if spell.type == 'WeaponSkill' then
			if spell.target.distance > 10 and player.tp > 950 then
				cancel_spell()
			end

			if buffactive['Mighty Strikes'] and sets.precast['MS'][accMode][spell.english] then
				equipSet = sets.precast['MS'][accMode][spell.english]
			elseif sets.precast[TPSetName][accMode][spell.english] then
				equipSet = sets.precast[TPSetName][accMode][spell.english]
			else
				equipSet = sets.precast[TPSetName][accMode]['Weapon Skill']
			end	

			if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
				equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end

			if buffactive['Reive Mark'] then
				equipSet = set_combine(equipSet,sets['Reive'])
			end

			if world.time >= 1020 or world.time < 420 then
				equipSet = set_combine(equipSet,sets['NighttimeWS'])
			end
			
			equip(equipSet)

			windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
		elseif sets.precast[spell.english] then
			equip(sets.precast[spell.english])
		elseif spell.cast_time ~= nil then
			equip(sets.precast['Fast Cast'])
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	--empty
end

function aftercast(spell,action)
	if spam_protection_off(spell) then
		handle_idle()
	end
end

function status_change(new,old)
	handle_idle()
end

function buff_change(buff,gain_or_loss)
	if gain_or_loss then
		if buff == 'Aftermath: Lv.3' then
			send_command('timers c "AM3" 180 up "Aftermath"')
		elseif buff == 'Aftermath: Lv.2' then
			send_command('timers c "AM2" 180 up "Aftermath"')
		elseif buff == 'Aftermath: Lv.1' then
			send_command('timers c "AM1" 180 up "Aftermath"')
		end
		if buff == 'Reive Mark' then
			equip(sets['Reive'])
		end
	else
		if buff == 'Aftermath: Lv.3' then
			send_command('timers d "AM3"')
		elseif buff == 'Aftermath: Lv.2' then
			send_command('timers d "AM2"')
		elseif buff == 'Aftermath: Lv.1' then
			send_command('timers d "AM1"')
		elseif buff == 'encumbrance' then
			windower.send_command('gs c dt_end;')
		end
	end
end


function handle_idle()
	if player.status == 'Engaged' then
		equip(sets[TPSetName][accMode])
	else
		equip(set_combine(sets[TPSetName][accMode], sets['Running']))
	end

	if buffactive['Reive Mark'] then
		equipSet = set_combine(equipSet,sets['Reive'])
	end
end

function self_command(command)
	if command:lower() == 'standard' then
		TPSetName = "Standard"
		windower.add_to_chat(167,"TP Mode [Standard]["..accMode.."]")
		handle_idle()
	elseif command == 'dt' then
		TPSetName = "DT"
		windower.add_to_chat(167,"TP Mode [DT]["..accMode.."]")
		handle_idle()
	elseif command == 'acc' then
		if accMode == 'Low' then
			accMode = 'Mid'
			windower.add_to_chat(167,"Accuracy [Mid]")
		elseif accMode == 'Mid' then
			accMode = 'High'
			windower.add_to_chat(167,"Accuracy [High]")
		else
			accMode = 'Low'
			windower.add_to_chat(167,"Accuracy [Low]")
		end
		handle_idle()
	end
end