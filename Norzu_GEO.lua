organizer_items = {
    echos="Echo Drops",
    capring="Capacity Ring",
    vocring="Vocation Ring",
    facring="Facility Ring",
    capmantle="Mecisto. Mantle",
    ring="Warp Ring",
    food="Pear Crepe"
}

send_command('input /macro book 20;')

HagondesHat_MAcc = {name="Hagondes Hat +1",augments={"Mag. Acc.+29","Phys. dmg. taken -3%"}}
HagondesHat_MATK = {name="Hagondes Hat +1",augments={"Mag.Atk.Bns.+26","Phys. dmg. taken -3%"}}

opposingElement = T{}
opposingElement['Water'] = 'Fire'
opposingElement['Lightning'] = 'Water'
opposingElement['Earth'] = 'Lightning'
opposingElement['Wind'] = 'Earth'
opposingElement['Ice'] = 'Wind'
opposingElement['Fire'] = 'Ice'
opposingElement['Light'] = 'Dark'
opposingElement['Dark'] = 'Light'

stormNames = T{}
stormNames['Water'] = 'Rainstorm'
stormNames['Lightning'] = 'Thunderstorm'
stormNames['Earth'] = 'Sandstorm'
stormNames['Wind'] = 'Windstorm'
stormNames['Ice'] = 'Hailstorm'
stormNames['Fire'] = 'Firestorm'
stormNames['Light'] = 'Voidstorm'
stormNames['Dark'] = 'Aurorastorm'

sets['Lightning'] = {}
sets['Ice'] = {}
sets['Water'] = {}
sets['Fire'] = {}
sets['Earth'] = {}
sets['Wind'] = {}
sets['Light'] = {}
sets['Dark'] = {}

sets['precast'] = {}
sets['midcast'] = {}
sets['mpBelt'] = {}

sets['Reive'] = {neck="Arciela's Grace +1"}

sets['Mythic'] = {main={ name="Grioavolr", augments={'Magic burst mdg.+1%','INT+13','Mag. Acc.+17','"Mag.Atk.Bns."+29','Magic Damage +3',}},sub="Umbra Strap"}

sets['Resting'] = {main="Bolelabunga",sub="Genbu's Shield",
    range="Dunna",
    head={ name="Merlinic Hood", augments={'"Rapid Shot"+4','Rng.Atk.+4','"Refresh"+2','Accuracy+1 Attack+1','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    body="Hagondes Coat +1",
    hands="Hagondes Cuffs +1",
    legs={ name="Merlinic Shalwar", augments={'Pet: "Mag.Atk.Bns."+22','"Subtle Blow"+4','"Refresh"+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    feet="Regal Pumps +1",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Spellbr. Earring",
    right_ear="Ethereal Earring",
    left_ring="Dark Ring",
    right_ring="Defending Ring",
    back="Umbra Cape"}

sets['DT'] = {
    main="Solstice",
    sub="Genbu's Shield",
    range="Dunna",
    head="Hagondes Hat +1",
    body="Hagondes Coat +1",
    hands="Hagondes Cuffs +1",
    legs="Hagondes Pants +1",
    feet="Azimuth Gaiters +1",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Moonshade Earring",
    right_ear="Ethereal Earring",
    left_ring="Dark Ring",
    right_ring="Defending Ring",
    back="Umbra Cape"}

sets['IdleRefresh'] = set_combine(sets['DT'], {
        head={ name="Merlinic Hood", augments={'"Rapid Shot"+4','Rng.Atk.+4','"Refresh"+2','Accuracy+1 Attack+1','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
        legs={ name="Merlinic Shalwar", augments={'Pet: "Mag.Atk.Bns."+22','"Subtle Blow"+4','"Refresh"+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    })

sets['Town'] = sets['DT']

sets['Running'] = {feet="Geo. Sandals +1"}

sets['BubbleActive'] = {body="Gyve Doublet"}

sets['BolelabungaSet'] = {main="Bolelabunga",sub="Genbu's Shield"}

sets['TooMuchTP'] = {}

sets.precast['General'] = {
    main={ name="Grioavolr", augments={'Magic burst mdg.+1%','INT+13','Mag. Acc.+17','"Mag.Atk.Bns."+29','Magic Damage +3',}},
    sub="Umbra Strap",
    ammo="Sapience Orb",
    head="Amalric Coif",
    body="Hagondes Coat +1",
    hands="Helios Gloves",
    legs="Geo. Pants +1",
    feet="Regal Pumps +1",
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Ethereal Earring",
    left_ring="Weather. Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},
}

sets['Melee'] = set_combine(sets.precast['General'], {ring1="Rajas Ring"})

sets.midcast['General'] = sets.precast['General']

sets.precast['Elemental Magic'] = set_combine(sets.precast['General'], {})

sets.midcast['Low'] = {}
sets.midcast['Mid'] = {}
sets.midcast['High'] = {}

sets.midcast['Low']['Elemental Magic'] = {
    main={ name="Grioavolr", augments={'Magic burst mdg.+1%','INT+13','Mag. Acc.+17','"Mag.Atk.Bns."+29','Magic Damage +3',}},
    sub="Niobid Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Conserve MP"+2','INT+10','Mag. Acc.+13',}},
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. crit. hit dmg. +5%','INT+10','Mag. Acc.+11','"Mag.Atk.Bns."+13',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Drain" and "Aspir" potency +6','Mag. Acc.+10','"Mag.Atk.Bns."+14',}},
    neck="Eddy Necklace",
    waist="Sekhmet Corset",
    left_ear="Barkaro. Earring",
    right_ear="Crematio Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+7','"Mag.Atk.Bns."+10',}},
}

sets.midcast['Mid']['Elemental Magic'] = sets.midcast['Low']['Elemental Magic']

sets.midcast['High']['Elemental Magic'] = sets.midcast['Low']['Elemental Magic']

sets.midcast['Low']['Elemental Magic MB'] = set_combine(sets.midcast['Low']['Elemental Magic'],{
    neck="Mizu. Kubikazari"})
sets.midcast['Mid']['Elemental Magic MB'] = set_combine(sets.midcast['Mid']['Elemental Magic'],{
    neck="Mizu. Kubikazari"})
sets.midcast['High']['Elemental Magic MB'] = set_combine(sets.midcast['High']['Elemental Magic'],{
    neck="Mizu. Kubikazari"})

sets['lowMpNuke'] = {body="Seidr Cotehardie"}

sets['Myrkr'] = sets.precast['General']
sets['Flash Nova'] = sets.midcast['High']['Elemental Magic']
sets['Shining Strike'] = sets.midcast['High']['Elemental Magic']
sets['Seraph Strike'] = sets.midcast['High']['Elemental Magic']

sets['Luopan_DT'] = {
    main="Solstice",
    sub="Genbu's Shield",
    hands="Geo. Mitaines +1",
    waist="Isa Belt",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
}

sets.precast['Enhancing Magic'] = sets.precast['General']

sets.midcast['Enhancing Magic'] = set_combine(sets.precast['General'],{head="Umuthi hat"})


sets.precast['Geomancy'] = sets.precast['General']

sets.midcast['Geomancy'] = set_combine(sets.precast['General'],{
    main="Solstice",
    sub="Genbu's Shield",
    head="Azimuth Hood",
    hands="Geo. Mitaines +1",
    legs="Bagua Pants",
    feet="Azimuth Gaiters +1",
    back="Lifestream Cape"})

sets.midcast['Indi'] = set_combine(sets.midcast['Geomancy'],{
        back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
    })

sets.precast['Stoneskin'] = set_combine(sets.precast['Enhancing Magic'], {head="Umuthi hat"})

sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'], {head="Umuthi hat"})

sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",head="Amalric Coif",waist="Emphatikos Rope"})


sets.midcast['Low']['Drain'] = set_combine(sets.midcast['Low']['Elemental Magic'], {head="Geomancy Galero",body="Geo. Tunic +1"})
sets.midcast['Mid']['Drain'] = sets.midcast['Mid']['Drain']
sets.midcast['High']['Drain'] = sets.midcast['High']['Drain']

sets.midcast['Enfeebling Magic'] =set_combine(sets.midcast['High']['Elemental Magic'], {ring1="Weather. Ring"})

sets['Trust'] = sets['Town']

sets.precast['Impact'] = set_combine(sets.precast['General'], {head=empty,body="Twilight Cloak"})

sets.midcast['Impact'] = sets.precast['Impact']

sets.precast['CureSet'] = sets.precast['General']

sets.midcast['CureSet'] = set_combine(sets.precast['General'],{sub="Sors Shield",legs="Gyve Trousers"})

sets.precast['Life Cycle'] = {
        body="Geo. Tunic +1",
        back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
    }

sets.precast['Bolster'] = {body="Bagua Tunic"}

sets.precast['Radial Arcana'] = {feet="Bagua Sandals"}