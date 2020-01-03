
PL = 'Mauzki'
cumulative_duration = 100
organizer_items = {
    food="Crepe B. Helene",
    food2="Pear Crepe",
    echos="Echo Drops",
    relic="Claustrum",
}

cast_speed = 0.4

send_command('input /macro book 20;')

sets['Lightning'] = {waist="Hachirin-no-Obi"}
sets['Ice'] = {waist="Hachirin-no-Obi"}
sets['Water'] = {waist="Hachirin-no-Obi"}
sets['Fire'] = {waist="Hachirin-no-Obi"}
sets['Earth'] = {waist="Hachirin-no-Obi"}
sets['Wind'] = {waist="Hachirin-no-Obi"}
sets['Light'] = {waist="Hachirin-no-Obi"}
sets['Dark'] = {waist="Hachirin-no-Obi"}

sets['precast'] = {}
sets['midcast'] = {}
sets['mpBelt'] = {
    waist="Fucho-no-Obi",
}

sets['doom'] = {
	left_ring="Purity Ring",
	right_ring="Saida Ring",
    waist="Gishdubar Sash",
}

sets['Reive'] = {
	neck="Arciela's Grace +1",
}

sets['stp'] = {
    neck="Combatant's Torque",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Rajas Ring",
    right_ring="K'ayres Ring",
    waist="Patentia Sash",
}

sets['Cumulative Magic'] = {
    legs="Wicce Chausses +1",
}

sets['GearCollector'] = {
	item="Echo Drops",
	neck="Quanpur Necklace",
	left_ring="Warp Ring",
}

sets['Mythic'] = {
	main="Laevateinn",
	sub="Enki Strap"
}

sets['Resting'] = {
	ammo="Vanir Battery",
	main="Bolelabunga",
	sub="Genbu's Shield",
	head={ name="Merlinic Hood", augments={'CHR+6','Enmity-8','"Refresh"+2','Accuracy+11 Attack+11','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	neck="Loricate Torque +1",
    left_ear="Lugalbanda Earring",
    right_ear="Sanare Earring",
	body="Amalric Doublet +1",
	hands={ name="Merlinic Dastanas", augments={'Magic dmg. taken -1%','Pet: INT+3','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
	left_ring="Defending Ring",
	right_ring="Dark Ring",
	back="Moonlight Cape",
	waist="Shinjutsu-no-Obi +1",
	legs="Assid. Pants +1",
	feet={ name="Merlinic Crackows", augments={'Pet: "Mag.Atk.Bns."+26','Pet: VIT+4','"Refresh"+1','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
}

sets['Idle'] = {
	ammo="Staunch Tathlum +1",
	main="Bolelabunga",
	sub="Genbu's Shield",
	head={ name="Merlinic Hood", augments={'CHR+6','Enmity-8','"Refresh"+2','Accuracy+11 Attack+11','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
	neck="Loricate Torque +1",
    left_ear="Lugalbanda Earring",
    right_ear="Sanare Earring",
	body="Amalric Doublet +1",
    hands={ name="Merlinic Dastanas", augments={'Magic dmg. taken -1%','Pet: INT+3','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
	left_ring="Defending Ring",
	right_ring="Dark Ring",
	back="Moonlight Cape",
	waist="Witful Belt",
	legs="Assid. Pants +1",
	feet={ name="Merlinic Crackows", augments={'Pet: "Mag.Atk.Bns."+26','Pet: VIT+4','"Refresh"+1','Accuracy+3 Attack+3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
}


sets['DT'] = {
	ammo="Staunch Tathlum +1",
	main="Bolelabunga",
	sub="Genbu's Shield",
	head={ name="Merlinic Hood", augments={'Damage taken-4%','"Mag.Atk.Bns."+10',}},
	neck="Loricate Torque +1",
    left_ear="Lugalbanda Earring",
    right_ear="Sanare Earring",
	body={ name="Merlinic Jubbah", augments={'Damage taken-4%','INT+10','Mag. Acc.+3',}},
	hands={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+5','Mag. Acc.+9 "Mag.Atk.Bns."+9','Damage taken-5%','Accuracy+7 Attack+7',}},
	left_ring="Defending Ring",
	right_ring="Dark Ring",
	back="Moonlight Cape",
	waist="Witful Belt",
	legs={ name="Merlinic Shalwar", augments={'Damage taken-4%','MND+9',}},
	feet={ name="Merlinic Crackows", augments={'Damage taken-2%','AGI+7','Mag. Acc.+14','"Mag.Atk.Bns."+3',}},
}

sets['Running'] = {	feet="Herald's Gaiters" }


sets['Town'] = sets['DT']

sets['BolelabungaSet'] = {
    main="Bolelabunga",
    sub="Genbu's Shield"
}

sets['Treasure Hunter'] = {
    hands={ name="Merlinic Dastanas", augments={'Accuracy+16','Pet: Attack+23 Pet: Rng.Atk.+23','"Treasure Hunter"+2','Accuracy+7 Attack+7',}},
    waist="Chaac Belt",
}

sets['TooMuchTP'] = { neck="Chrys. Torque" }

sets['Melee'] = {
    ammo="Hasty Pinion +1",
    head={ name="Merlinic Hood", augments={'Damage taken-4%','"Mag.Atk.Bns."+10',}},
    body="Spaekona's Coat +3",
    hands={ name="Merlinic Dastanas", augments={'STR+8','"Store TP"+2','Weapon skill damage +9%','Accuracy+9 Attack+9',}},
    legs="Jhakri Slops +1",
    feet="Battlecast Gaiters",
    neck="Asperity Necklace",
    waist="Cetl Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="K'ayres Ring",
    right_ring="Rajas Ring",
    back="Moonlight Cape",
}

sets.precast['General'] = {
	ammo="Sapience Orb",
	head={ name="Merlinic Hood", augments={'"Fast Cast"+7','CHR+9','"Mag.Atk.Bns."+10',}},
	neck="Orunmila's Torque",
	ear1="Etiolation Earring",
	ear2="Enchntr. Earring +1",
	body="Zendik Robe",
	hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+8 "Mag.Atk.Bns."+8','"Fast Cast"+7','"Mag.Atk.Bns."+5',}},
	left_ring="Kishar Ring",
	right_ring="Weather. Ring",
	back="Perimede Cape",
	waist="Witful Belt",
	legs="Psycloth Lappas",
	feet={ name="Merlinic Crackows", augments={'Pet: DEX+5','Attack+29','"Fast Cast"+7','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
}

sets.midcast['General'] =set_combine(sets.precast['General'],
 {
	ammo="Pemphredo Tathlum",
    back="Bane Cape",
})

sets.midcast['5k'] = {}
sets.midcast['Low'] = {}
sets.midcast['Mid'] = {}
sets.midcast['High'] = {}

sets.precast['Elemental Magic'] = set_combine(sets.precast['General'],
 {
    right_ring="Weather. Ring",
	back="Perimede Cape",
	waist="Witful Belt"
})

sets['DeathIdle'] = {
	main="Bolelabunga",
	sub="Genbu's Shield",
	ammo="Psilomene",

	head="Pixie Hairpin +1",
	neck="Orunmila's Torque",
	ear1="Etiolation Earring",
	ear2="Barkaro. Earring",

	body="Amalric Doublet +1",
	hands="Amalric Gages +1",
	left_ring="Mephitas's Ring",
	right_ring="Mephitas's Ring +1",

	back="Bane Cape",
	waist="Shinjutsu-no-Obi +1",
	legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	feet="Amalric Nails +1"
}

sets.precast['Death'] = set_combine(sets['DeathIdle'],
 {
 	ammo={name="Psilomene",priority=14},

    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',},priority=16},

 	body={name="Zendik Robe",priority=15},
	left_ring={name="Weather. Ring",priority=1},

	back={name="Bane Cape",priority=17},
	waist={name="Shinjutsu-no-Obi +1",priority=18},
	legs={name="Psycloth Lappas",priority=19},
	feet={name="Amalric Nails +1",priority=20},
})

sets.midcast['Death'] = set_combine(sets['DeathIdle'],
 {
    ammo={name="Psilomene",priority=3},

	head={name="Pixie Hairpin +1",priority=43},
 	neck={name="Mizu. Kubikazari",priority=4},
	ear1={name="Etiolation Earring",priority=44},
	ear2={name="Barkaro. Earring",priority=45},

	body={name="Amalric Doublet +1",priority=50},
	hands={name="Amalric Gages +1",priority=46},
    left_ring={name="Archon Ring",priority=2},
	right_ring={name="Mephitas's Ring +1",priority=48},

	back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Mag.Atk.Bns."+10',},priority=47},
	legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',},priority=49},
	feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+11%','INT+9',},priority=1},
})

sets.midcast['5k']['Elemental Magic'] = set_combine(sets.precast['General'],
{
	main="Laevateinn",
	sub="Enki Strap",
	ammo="Vanir Battery",
	head="Pixie Hairpin +1",
	neck="Loricate Torque +1",
	ear1="Etiolation Earring",
	ear2="Genmei Earring",
	left_ring="Ifrit Ring +1",
	right_ring="Ifrit Ring +1",
	waist="Windbuffet Belt +1",
	back="Moonlight Cape",
    feet=empty,
    hands=empty,
})

sets.midcast['5k']['Elemental Magic MB'] = set_combine(sets.midcast['5k']['Elemental Magic'], {})

sets.midcast['Low']['Elemental Magic'] = {
	main="Laevateinn",
	sub="Enki Strap",
	ammo="Pemphredo Tathlum",
	head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
	neck="Saevus Pendant +1",
	ear1="Barkaro. Earring",
	ear2="Regal Earring",
	body="Amalric Doublet +1",
	hands="Amalric Gages +1",
	left_ring="Shiva Ring +1",
	right_ring="Shiva Ring +1",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	waist="Yamabuki-no-Obi",
	legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	feet="Amalric Nails +1"
}

sets.midcast['Low']['Elemental Magic MB'] = set_combine(sets.midcast['Low']['Elemental Magic'],
{
	head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+13','Magic burst dmg.+10%','INT+14','Mag. Acc.+13',}},
    body="Ea Houppelande",
	legs="Ea Slops +1",
	feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+11%','INT+9',}},
	neck="Mizu. Kubikazari",
	right_ring="Mujin Band"
})

sets.midcast['Mid']['Elemental Magic'] = {
	main="Laevateinn",
	sub="Enki Strap",
	ammo="Pemphredo Tathlum",
	head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
	neck="Sanctity Necklace",
	ear1="Barkaro. Earring",
	ear2="Regal Earring",
	body="Amalric Doublet +1",
	hands="Amalric Gages +1",
	left_ring="Shiva Ring +1",
	right_ring="Shiva Ring +1",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	waist="Yamabuki-no-Obi",
	legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	feet="Amalric Nails +1"
}

sets.midcast['Mid']['Elemental Magic MB'] = set_combine(sets.midcast['Mid']['Elemental Magic'],
{
	head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+13','Magic burst dmg.+10%','INT+14','Mag. Acc.+13',}},
    body="Ea Houppelande",
	legs="Ea Slops +1",
	feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+11%','INT+9',}},
	neck="Mizu. Kubikazari",
	right_ring="Mujin Band"
})

sets.midcast['High']['Elemental Magic'] = {
	main="Laevateinn",
	sub="Enki Strap",
	ammo="Pemphredo Tathlum",
	head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
	neck="Sanctity Necklace",
	ear1="Barkaro. Earring",
	ear2="Digni. Earring",
	body="Amalric Doublet +1",
	hands="Amalric Gages +1",
	left_ring="Stikini Ring",
	right_ring="Stikini Ring",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	waist="Eschan Stone",
	legs={name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Conserve MP"+1','MND+2','Mag. Acc.+12','"Mag.Atk.Bns."+15',}},
	feet={name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+8','INT+4','Mag. Acc.+5','"Mag.Atk.Bns."+15',}}
}

sets.midcast['High']['Elemental Magic MB'] = set_combine(sets.midcast['High']['Elemental Magic'],
{
	head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+13','Magic burst dmg.+10%','INT+14','Mag. Acc.+13',}},
    body="Ea Houppelande",
	legs="Ea Slops +1",
	feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+11%','INT+9',}},
	neck="Mizu. Kubikazari",
	right_ring="Mujin Band"
})

sets['higherTierNuke'] = {
}

sets['lowMpNuke'] = {
	body="Spaekona's Coat +3",
}

sets['Myrkr'] = {
	ammo="Psilomene",
	head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	neck="Sanctity Necklace",
	ear1="Etiolation Earring",
	ear2="Moonshade Earring",
	body="Amalric Doublet +1",
	hands="Amalric Gages +1",
	left_ring="Mephitas's Ring",
	right_ring="Mephitas's Ring +1",
	back="Bane Cape",
	waist="Shinjutsu-no-Obi +1",
	legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	feet="Amalric Nails +1"
}

sets['Vidohunir'] = {
	ammo="Pemphredo Tathlum",
	head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
	neck="Imbodla Necklace",
	ear1="Crematio Earring",
	ear2="Regal Earring",
	body="Amalric Doublet +1",
	hands="Amalric Gages +1",
	left_ring="Shiva Ring +1",
	right_ring="Shiva Ring +1",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	waist="Yamabuki-no-Obi",
	legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	feet="Amalric Nails +1",
}

sets['Starburst'] = sets['Vidohunir']
sets['Sunburst'] = sets['Vidohunir']
sets['Rock Crusher'] = sets['Vidohunir']
sets['Earth Crusher'] = sets['Vidohunir']
sets['Cataclysm'] = sets['Vidohunir']

sets.precast['Enhancing Magic'] = set_combine(sets.precast['General'], { waist="Siegel Sash" })

sets.midcast['Enhancing Magic'] = set_combine(sets.midcast['General'], {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','DMG:+12',}},
    sub="Ammurapi Shield",
    head={ name="Telchine Cap", augments={'"Conserve MP"+4','Enh. Mag. eff. dur. +8',}},
    body={ name="Telchine Chas.", augments={'"Mag.Atk.Bns."+6','Spell interruption rate down -8%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Telchine Gloves", augments={'Spell interruption rate down -10%','Enh. Mag. eff. dur. +9',}},
    legs={ name="Telchine Braconi", augments={'"Mag.Atk.Bns."+18','Spell interruption rate down -8%','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Acc.+21','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	neck="Colossus's Torque",
	ear1="Andoaa Earring",
	ear2="Enchntr. Earring +1",
	left_ring="Weather. Ring",
	right_ring="Kishar Ring",
	back="Merciful Cape",
	waist="Olympus Sash",
})

sets.midcast['Enhancing Magic Duration'] = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','DMG:+12',}},
    sub="Ammurapi Shield",
    head={ name="Telchine Cap", augments={'"Conserve MP"+4','Enh. Mag. eff. dur. +8',}},
    body={ name="Telchine Chas.", augments={'"Mag.Atk.Bns."+6','Spell interruption rate down -8%','Enh. Mag. eff. dur. +8',}},
    hands={ name="Telchine Gloves", augments={'Spell interruption rate down -10%','Enh. Mag. eff. dur. +9',}},
    legs={ name="Telchine Braconi", augments={'"Mag.Atk.Bns."+18','Spell interruption rate down -8%','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Acc.+21','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
}

sets.midcast['Enhancing Magic + Duration'] = set_combine(sets.precast['Enhancing Magic'], sets.midcast['Enhancing Magic Duration'])

sets.precast['Stoneskin'] = set_combine(sets.precast['Enhancing Magic'], {
	head="Umuthi hat",
})

sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic + Duration'], {
	neck="Nodens Gorget",
	ear2="Earthcry Earring",
	legs="Shedir Seraweels"
})

sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic + Duration'], {
 	main="Vadose Rod",
 	sub="Genbu's Shield",
	head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
	waist="Emphatikos Rope",
	legs="Shedir Seraweels"
})

sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic + Duration'], {
    hands={ name="Merlinic Dastanas", augments={'STR+7','DEX+1','Phalanx +3','Accuracy+11 Attack+11',}},
    feet={ name="Merlinic Crackows", augments={'Pet: STR+2','STR+7','Phalanx +1','Accuracy+9 Attack+9',}},
})

sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic + Duration'], {
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    waist="Gishdubar Sash",
})

sets.midcast['Drain'] = set_combine(sets.midcast['High']['Elemental Magic'] ,{
	ammo="Vanir Battery",
	ear1="Hirudinea Earring",
	ear2="Etiolation Earring",
	hands="Arch. Gloves +1",
	back="Bane Cape",
    neck="Erra Pendant",
	waist="Fucho-no-Obi",
	legs="Spae. Tonban +3",
	feet={ name="Merlinic Crackows", augments={'Pet: DEX+5','Attack+29','"Fast Cast"+7','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
	left_ring="Evanescence Ring",
	right_ring="Archon Ring"
})

sets.midcast['DeathAspir'] = set_combine(sets.midcast['Drain'] ,{
    ammo="Psilomene",
    head="Pixie Hairpin +1",
    ear1="Etiolation Earring",
    ear2="Barkaro. Earring",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    left_ring="Mephitas's Ring +1",
    right_ring="Archon Ring",
    back="Bane Cape",
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
})

sets.midcast['Enfeebling Magic'] = {
	ammo="Pemphredo Tathlum",
	head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
	neck="Imbodla Necklace",
	ear1="Barkaro. Earring",
	ear2="Digni. Earring",
	body="Spaekona's Coat +3",
	hands="Lurid Mitts",
	left_ring="Kishar Ring",
	right_ring="Stikini Ring",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	waist="Luminary Sash",
	legs="Psycloth Lappas",
	feet="Medium's Sabots"
}

sets.midcast['Elemental Enfeebling'] = set_combine(sets.midcast['Enfeebling Magic'], {
    ammo="Pemphredo Tathlum",
    head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
    neck="Imbodla Necklace",
    ear1="Barkaro. Earring",
    ear2="Digni. Earring",
    body="Spaekona's Coat +3",
    hands={ name="Amalric Gages +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
    waist="Luminary Sash",
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Conserve MP"+1','MND+2','Mag. Acc.+12','"Mag.Atk.Bns."+15',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+8','INT+4','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
})

sets['Trust'] = sets['Town']

sets.precast['Manafont'] = { body="Arch. Coat +1" }
sets.precast['Mana Wall'] = { back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}, feet="Wicce Sabots +1" }

sets.midcast['Stun'] = T{}

sets.midcast['Stun']['Low'] = {
    sub="Clerisy Strap +1",
	ammo="Pemphredo Tathlum",
	head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
	neck="Orunmila's Torque",
	ear1="Etiolation Earring",
	ear2="Enchntr. Earring +1",
	body="Zendik Robe",
	hands={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+5','Mag. Acc.+9 "Mag.Atk.Bns."+9','Damage taken-5%','Accuracy+7 Attack+7',}},
	left_ring="Kishar Ring",
	right_ring="Weather. Ring",
	back="Bane Cape",
	waist="Witful Belt",
	legs="Psycloth Lappas",
	feet={ name="Merlinic Crackows", augments={'Pet: DEX+5','Attack+29','"Fast Cast"+7','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
}

sets.midcast['Stun']['High'] = {
    sub="Clerisy Strap +1",
	ammo="Pemphredo Tathlum",
	head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
	neck="Erra Pendant",
	ear1="Gwati Earring",
	ear2="Enchntr. Earring +1",
	body="Zendik Robe",
	hands={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+5','Mag. Acc.+9 "Mag.Atk.Bns."+9','Damage taken-5%','Accuracy+7 Attack+7',}},
    left_ring="Stikini Ring",
	right_ring="Stikini Ring",
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	waist="Witful Belt",
	legs="Psycloth Lappas",
	feet={ name="Merlinic Crackows", augments={'Pet: DEX+5','Attack+29','"Fast Cast"+7','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
}

sets.precast['Impact'] = set_combine(sets.precast['General'], { head=empty,body="Twilight Cloak" })

sets.midcast['Impact'] = set_combine(sets.midcast['High']['Elemental Magic'], {
    sub="Clerisy Strap +1",
	ammo="Pemphredo Tathlum",
	ear1="Gwati Earring",
	ear2="Enchntr. Earring +1",
	head=empty,
	body="Twilight Cloak",
	left_ring="Stikini Ring",
	right_ring="Stikini Ring",
    neck="Erra Pendant",
	waist="Luminary Sash",
	legs={name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Conserve MP"+1','MND+2','Mag. Acc.+12','"Mag.Atk.Bns."+15',}},
	back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
})

sets.precast['CureSet'] = {
	ammo="Impatiens",
	head={name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
	neck="Orunmila's Torque",
	ear1="Etiolation Earring",
	ear2="Enchntr. Earring +1",
	hands={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+5','Mag. Acc.+9 "Mag.Atk.Bns."+9','Damage taken-5%','Accuracy+7 Attack+7',}},
	left_ring="Kishar Ring",
	right_ring="Weather. Ring",
	back="Pahtli Cape",
	waist="Witful Belt",
	legs="Psycloth Lappas"
}

sets.midcast['CureSet'] = {
    ammo="Psilomene",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Fast Cast"+1','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
    body="Vrikodara Jupon",
    hands="Revealer's Mitts",
    legs="Gyve Trousers",
    feet={ name="Medium's Sabots", augments={'MP+40','MND+6','"Conserve MP"+5','"Cure" potency +3%',}},
    neck="Nesanica Torque",
    waist="Bishop's Sash",
    left_ear="Mendi. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Ephedra Ring",
    right_ring="Stikini Ring",
    back="Moonlight Cape",
}

sets['Gate of Tartarus'] = {
    main="Claustrum",
    sub="Enki Strap",
    ammo="Vanir Battery",
    head={ name="Merlinic Hood", augments={'"Fast Cast"+7','CHR+9','"Mag.Atk.Bns."+10',}},
    body="Spaekona's Coat +3",
    hands={ name="Merlinic Dastanas", augments={'STR+8','"Store TP"+2','Weapon skill damage +9%','Accuracy+9 Attack+9',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet="Battlecast Gaiters",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Ifrit Ring +1",
    right_ring="Ifrit Ring +1",
    back="Moonlight Cape",
}