function get_sets()



mataon = 0
magicT = "Normal"	
annulrun = 0
countmata = 0
enga = 0
kindofdelve = 0
killingmandy = 0
-- Debug mode - register packets
regpack = 1

accparsing = 0

-- Runes
Runes = S{"Lux", "Tenebrae", "Unda", "Flabra", "Gelus", "Ignis", "Tellus", "Sulpor"}

WeaponG = "Glanzfaust"
-- WS Auto-Boost list

--AccLvlSAcc = S{"Wopket", "Utkux", "Hyoscya", "Muyingwa", "Supernal Chapuli"}
--AccLvlHAcc = S{"Hurkan", "Azeman"}
--AccLvlFAcc = S{"Ircinraq"}

PDTTrigger = S{"Plague Swipe", "Dreadstorm", "Ripper Fang", "Chomp Rush", "Scythe Tail", "Cyclotail", "Delta Thrust", "Torpefying Charge", "Head Butt", "Tortoise Stomp", "Painful Whip", "Recoil Dive", "Gnash", "Deathgnash", "Seismic Tail", "Big Scissors", "Megascissors", "Drill Branch", "Pinecone Bomb", "Scorching Lash", "Wings of Woe", "Ravenous Wail", "Wings of Agony","Rending Talons", "Typhoean Rage", "Kaleidoscopic Fury", "Keraunos Quill", "Velkkan Ambush", "Coming Through"}
MDTTrigger = S{"Fulmination", "Thunderstrike", "Tourbillon", "Whirling Inferno", "Foul Breath", "Tarichutoxin", "Aqua Fortis", "Regurgitation", "Calcifying Mist", "Aqua Breath", "Earth Breath", "Tetsudo Tremor", "Palsynyxis", "Aqua Ball", "Leeching Current", "Seaspray", "Venom Shower", "Bubble Shower", "Marine Mayhem", "Tidal Guillotine", "Leafstorm", "Sulfurous Breath", "Lava Spit", "Gates of Hades", "Acheron Flame","Shrieking Gale"}
SleepTrigger = S{"Dream Flower"}
ParaTrigger = S{"Ululation", "Jungle Hoodoo"}
SlowTrigger = S{"Saurian Swamp"}
MEvaTrigger = S{"Saurian Slide"}
CharmTrigger = S{"Danse Macabre", "Frond Fatale", "Belly Dance"}


--- Qaaxo Leggings differentiation
TaeonWaltzHat = {name="Taeon Chapeau", augments={'Accuracy+17', '"Waltz" potency +4%', 'Weapon skill damage +3%'}}
	
TaeonFeetTP = {name="Taeon Boots", augments={'Accuracy+10', '"Triple Atk."+2', 'Crit. hit damage +3%'}}
--"Adhemar Jacket" = {name="Taeon Tabard", augments={'STR+2','Attack+25', '"Triple Atk."+2'}}
	
HercHeadPDT =  {name="Herculean Helm", augments={'CHR+7', 'Accuracy+29','Phys. dmg. taken -4%'}}
HercHeadMAB =  {name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Phys. dmg. taken -2%','"Mag.Atk.Bns."+15'}}
HercBootMAB = { name="Herculean Boots", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Magic burst mdg.+4%','MND+2','Mag. Acc.+10','"Mag.Atk.Bns."+14'}}
HercBootAcc = { name="Herculean Boots", augments={'MND+9','Pet: STR+8','"Treasure Hunter"+2','Accuracy+18 Attack+18'}}
--"Herculean Trousers" = {name="Taeon Tights", augments={'"Mag. Atk. Bns."+17', '"Waltz" potency +2%'}}
	
TaeonWaltzFeet = {name="Taeon Boots", augments={'"Mag. Atk. Bns."+16', '"Waltz" potency +3%', '"Phalanx"+2'}}
TaeonWaltzBody = {name="Taeon Tabard", augments={'Mag. Acc.+14','"Mag. Atk. Bns."+14', '"Waltz" potency +5%', 'Weapon skill damage+2%'}}
TaeonWaltzLegs = {name="Taeon Tights", augments={'VIT+2', 'Attack+18', '"Waltz" potency +3%'}}


---- CAPES

AccCape = {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+2','"Dbl.Atk."+10'}}
LastCape = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+9','Weapon skill damage +10%'}}


Luzaf = "Luzaf's Ring"

-- Delve specific
Jagil = 0

-- Specific Elemental NMs
FireNM = S{"Ifrit Prime","Cerberus","Orthrus Seether","Tojil","Perdurable Raptor","Tax'et", "Achuka",  "Volatile Matamata", "Achuka"}
WaterNM = S{"Leviathan Prime","Dakuwaqa","Nerrivik", "Krabakarpo", "Divagating Jagil", "Tchakka", "Shimmering Tarichuk", "Faded Craklaw", "Divagating Jagil", "Ironbeak Inguza", "Tchakka"}
IceNM = S{"Shiva Prime","Aberrant Uragnite", "Utkux", "Kumhau"}
WindNM = S{"Garuda Prime","Aello", "Muyingwa", "Laevvid", "Unfettered Twitherym", "Supernal Chapuli", "Broxa", "Plaguevein Bats", "Hakawai", "Podarge"}
ThunderNM = S{"Ramuh Prime", "Khimaira", "Khrysokhimaira Elder", "Hurkan", "Tutewehiwehi", "Cailimh", "Sinaa", "Colkhab"}
EarthNM = S{"Titan Prime", "Resplendent Luckybug", "Wopket", "Yumcax", "Kurma", "Transcendent Scorpion", "Xag'Nar", "Morseiu", "Ircinraq", "Hyoscya", "Calydontis", "Cherti", "Mirka"}
LightNM = S{}
DarkNM = S{"Mastop", "Azeman"}

autoboost = 0	 -- Auto-Boost On by default
autoswap = 1

rollslist = S{
        "Corsair's Roll",
        "Ninja Roll",
        "Hunter's Roll",
        "Chaos Roll",
        "Magus's Roll",
        "Healer's Roll",
        "Puppet Roll",
        "Choral Roll",
        "Monk's Roll",
        "Beast Roll",
        "Samurai Roll",
        "Evoker's Roll",
        "Rogue's Roll",
        "Warlock's Roll",
        "Fighter's Roll",
        "Drachen Roll",
        "Gallant's Roll",
        "Wizard's Roll",
        "Dancer's Roll",
        "Scholar's Roll",
        "Bolter's Roll",
        "Caster's Roll",
        "Courser's Roll",
        "Blitzer's Roll",
        "Tactician's Roll",
        "Allies' Roll",
        "Miser's Roll",
        "Companion's Roll",
        "Avenger's Roll",
		"Runeist's Roll",
		"Naturalist's Roll",
    }
	
NoQDWS = S{"Leaden Salute", "Last Stand", "Wildfire", "Hot Shot", "Split Shot", "Slug Shot", "Numbling Shot"}
ShotsList = S{"Fire Shot", "Ice Shot", "Wind Shot", "Thunder Shot", "Water Shot", "Earth Shot"}
EleList = S{"Fire", "Ice", "Wind", "Thunder", "Water", "Earth"}

-- AUTOSET
	numberofautoset = 2
	autoset = {}
	-- Chakra
	autoset[1] = {}
	-- Focus
	autoset[2] = {}
		
-- JA Precast
	sets.precast = {}
	sets.precast['Triple Shot'] = {body="Chasseur's Frac +1", back=LastCape}
    sets.precast['Snake Eye'] = {legs="Lanun Culottes +1"}
    sets.precast['Wild Card'] = {feet="Lanun Bottes +1"}
    sets.precast['Random Deal'] = {body="Lanun Frac +1"}
	sets.precast['Double-Up'] = {body="Haruspex Coat", feet="Pursuer's Gaiters", back="Gunslinger's Cape",head="Lanun Tricorne",hands="Chasseur's Gants +1", ring1="Barataria Ring"}
    
    sets.precast.CorsairRoll = {body="Haruspex Coat", feet="Pursuer's Gaiters", back=LastCape,head="Lanun Tricorne",hands="Chasseur's Gants +1", ring1="Barataria Ring", ring2=Luzaf}
    
	sets.precast['Spectral Jig'] = sets.precast.CorsairRoll
	
    sets.precast["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chasseur's Culottes +1"})
    sets.precast["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chass. Gants +1"})

	sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}
    
    sets.precast.CorsairShot = {head="Blood Mask"}
	
	-- Subjob JA precast	
	
	sets.org = { item = "Trump Card", item2 = "Trump Card Case", item3="Dec. Bul. Pouch", item4="O. Bull. Pouch"} 
	
	sets.precast.Waltz = 
		{
		head =TaeonWaltzHat, body=TaeonWaltzBody, legs=TaeonWaltzLegs, feet=TaeonWaltzFeet, ring1="Valseur's Ring"
		}
		
	sets.precast.Provoke =
		{
		ammo="Iron Gobbet",
		neck="Invidia Torque",
		body="Arhat's Gi +1",
		back="Fravashi Mantle"
		}
	sets.precast['Flash'] = sets.precast.Provoke
	
	sets.precast.FC = {head="Carmine Mask +1", body="Foppish Tunica",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Prolix Ring", feet="Carmine Greaves", neck="Baetyl Pendant"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    sets.precast.RA = {ammo=RAbullet,
        head="Aurore Beret +1",
        body="Skopos Jerkin",hands="Lanun Gants", ring1="Haverton Ring",
        back="Navarch's Mantle",waist="Impulse Belt",legs="Chas. Culottes +1",feet="Adhemar Gamashes"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Pursuer's Beret",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Vollae Earring",
        body="Pursuer's Doublet",hands="Carmine Fin. Ga. +1",ring1="Garuda Ring +1",ring2="Garuda Ring +1",
        back=LastCape,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Pursuer's Gaiters"}


    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast['Evisceration'] = sets.precast.WS

    sets.precast['Exenterator'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

    sets.precast['Requiescat'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

    sets.precast['Last Stand'] = {ammo=WSbullet,
        head="Meghanada Visor +1",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Vollae Earring",
        body="Meg. Cuirie +1",hands="Meg. Gloves +1",ring1="Garuda Ring +1",ring2="Garuda Ring +1",
        back=LastCape,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +1"}

    sets.precast['Last Stand'].Acc = {ammo=WSbullet,
        head="Meghanada Visor +1",neck="Fotia Gorget",ear1="Clearview Earring",ear2="Vollae Earring",
        body="Pursuer's Doublet",hands="Meg. Gloves +1",ring1="Haverton Ring",ring2="Garuda Ring +1",
        back=LastCape,waist="Fotia Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +1"}

	sets.precast['Numbing Shot'] = sets.precast['Last Stand']
	sets.precast['Split Shot'] = sets.precast['Last Stand']
	sets.precast['Detonator'] = sets.precast['Last Stand']
	
    sets.precast['Wildfire'] = {ammo=MAbullet,
        head=HercHeadMAB,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Arvina Ringlet +1",ring2="Acumen Ring",
        back=LastCape,waist="Eschan Stone",legs="Herculean Trousers",feet=HercBootMAB}
	
	
	
    sets.precast['Wildfire'].Brew = sets.precast['Wildfire']
	sets.precast['Shining Blade'] = set_combine(sets.precast['Wildfire'], {ammo="Living Bullet"})
	sets.precast['Burning Blade'] = set_combine(sets.precast['Wildfire'], {ammo="Living Bullet"})
	sets.precast['Aeolian Edge'] = set_combine(sets.precast['Wildfire'], {ammo="Living Bullet"})
	
	sets.precast['Cyclone'] = set_combine(sets.precast['Wildfire'], {ammo="Living Bullet"})
    
    sets.precast['Leaden Salute'] = {ammo=MAbullet,
        head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Arvina Ringlet +1",ring2="Archon Ring",
        back=LastCape,waist=LeadenObi,legs="Herculean Trousers",feet=HercBootMAB}
	
	sets.precast['Savage Blade'] = {ammo=WSbullet,
        head="Meghanada Visor +1",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Vollae Earring",
        body="Meg. Cuirie +1",hands="Meg. Gloves +1",ring1="Ifrit Ring",ring2="Ifrit Ring +1",
        back="Vespid Mantle",waist="Prosilio Belt +1",legs="Meg. Chausses +1",feet="Meg. Jam. +1"}
		
    sets.precast['Requiescat'] = sets.precast['Savage Blade']
    
	sets.midcast = {}
	
	sets.midcast.ninjutsu = {
		ammo="Living Bullet",
        head=HercHeadMAB,
		neck="Baetyl Pendant",
		ear1="Friomisi Earring",
		ear2="Hecate's Earring",
        body="Samnuha Coat",
		hands="Leyline Gloves",
		ring1="Mujin Band",
		ring2="Locus Ring",
        back="Gunslinger's Cape",
		waist="Eschan Stone",
		legs="Herculean Trousers",
		feet=HercBootMAB}
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Whirlpool Mask",
        body="Iuitl Vest",hands="Iuitl Wristbands",
        legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
        
    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = {ammo=QDbullet,
        head=HercHeadMAB,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Arvina Ringlet +1",ring2="Acumen Ring",
        back="Gunslinger's Cape",waist="Eschan Stone",legs="Shned. Tights +1",feet="Chass. Bottes +1"}

    sets.midcast.CorsairShot.Acc = set_combine(sets.midcast.CorsairShot, {ring2="Locus Ring", ring1="Mujin Band"})
		
	sets.midcast.CorsairShot.TPShot = {ammo=QDbullet,
        head="Pursuer's Beret",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Pursuer's Doublet",hands="Schutzen Mittens",ring1="Garuda Ring +1",ring2="Etana Ring",
        back="Navarch's Mantle",waist="Eschan Stone",legs="Herculean Trousers",feet="Chass. Bottes +1"}

    sets.midcast['Light Shot'] = {ammo=QDbullet,
        head="Chass. Tricorne +1",neck="Waylayer's Scarf",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Samnuha Coat",hands="Floral Gauntlets",ring1="Arvina Ringlet +1",ring2="Etana Ring",
        back="Gunslinger's Cape",waist="Eschan Stone",legs="Meg. Chausses +1",feet="Chass. Bottes +1"}

    sets.midcast['Dark Shot'] = sets.midcast['Light Shot']
	sets.midcast['Dark Shot'].TPShot = sets.midcast['Light Shot']
	sets.midcast['Light Shot'].TPShot = sets.midcast['Light Shot']
	
	sets.midcast['Noctohelix'] = sets.midcast.CorsairShot
	
	sets.midcast['Fire Shot'] = {ammo=QDbullet,
        head=HercHeadMAB,neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Arvina Ringlet +1",ring2="Acumen Ring",
        back="Gunslinger's Cape",waist="Eschan Stone",legs="Shned. Tights +1",feet="Chass. Bottes +1"}
		
	sets.precast['Bio II'] = {ammo=QDbullet,
        head="Pursuer's Beret",neck="Ocachi Gorget",ear1="Steelflash Earring",ear2="Volley Earring",
        body="Pursuer's Doublet",hands="Adhemar Wristbands",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Tactical Mantle",waist="Oneiros Rope",legs="Chas. Culottes +1",feet="Adhemar Gamashes"}

	sets.midcast['Ice Shot'] = sets.midcast['Fire Shot']
    -- Ranged gear
    sets.midcast.RANorm = {ammo=RAbullet,
        head="Pursuer's Beret",neck="Iqabi necklace",ear1="Clearview Earring",ear2="Volley Earring",
        body="Pursuer's Doublet",hands="Meg. Gloves +1",ring1="Haverton Ring",ring2="Hajduk Ring",
        back=LastCape,waist="Impulse Belt",legs="Meg. Chausses +1",feet="Meg. Jam. +1"}
	sets.midcast.RA = sets.midcast.RANorm
	sets.midcast.RATS = {ammo=RAbullet,
        head="Pursuer's Beret",neck="Iqabi necklace",ear1="Clearview Earring",ear2="Volley Earring",
        body="Chasseur's Frac +1",hands="Meg. Gloves +1",ring1="Haverton Ring",ring2="Hajduk Ring",
        back="Gunslinger's Cape",waist="Eschan Stone",legs="Meg. Chausses +1",feet="Meg. Jam. +1"}
	

    sets.midcast.RAcc = {ammo=RAbullet,
        head="Meghanada Visor +1",neck="Iqabi necklace",ear1="Clearview Earring",ear2="Volley Earring",
        body="Meg Cuirie +1",hands="Meg. Gloves +1",ring1="Haverton Ring",ring2="Hajduk Ring",
        back=LastCape,waist="Eschan Stone",legs="Meg. Chausses +1",feet="Meg. Jam. +1"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {neck="Wiglen Gorget",ring1="Paguroidea Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets
    sets.idle = {ammo=RAbullet,
        head="Blood Mask",neck="Wiglen Gorget",ear1="Dawn Earring",ear2="Infused Earring",
        body="Mekosu. Harness",hands="Adhemar Wristbands",ring1="Paguroidea Ring",ring2="Roller's Ring",
        back="Mecisto. Mantle",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Meg. Jam. +1"}

    sets.idle.Town = {main="Surcouf's Jambiya",range="Eminent Gun",ammo=RAbullet,
        head="Blood Mask",neck="Wiglen Gorget",ear1="Dawn Earring",ear2="Infused Earring",
        body="Kheper Jacket",hands="Adhemar Wristbands",ring1="Paguroidea Ring",ring2="Paguroidea Ring",
        back="Mecisto. Mantle",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Meg. Jam. +1"}
	
	sets.aftercast = {}
	
	sets.aftercast.Idle = sets.idle
    
	sets.defense = {}
	
    -- Defense sets
    sets.defense.PDT = {
        head=HercHeadPDT,neck="Twilight Torque",ear1="Steelflash Earring",ear2="Heartseeker Earring",
        body="Emet Harness +1",hands="Umuthi Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Xucau Mantle",waist="Flume Belt +1",legs="Qaaxo Tights",feet="Lanun Bottes +1"}

    sets.defense.MDT = {
        head="Carmine Mask +1",neck="Warder's charm",ear1="Etiolation Earring",ear2="Merman's Earring",
        body="Carm. Scale Mail",hands="Floral Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape +1",waist="Windbuffet Belt",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}
		
	sets.defense.MEva = {
        head="Wayfarer Circlet",neck="Warder's charm",ear1="Etiolation Earring",ear2="Merman's Earring",
        body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Defending Ring",ring2="Shadow Ring",
        back="Fugacity Mantle +1",waist="Svelt. Gouriz +1",legs="Wayfarer Slops",feet="Wayfarer Clogs"}
    

    sets.Kiting = {feet="Hermes' Sandals"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
	sets.engaged = {}
	
    -- Normal melee group
    sets.engaged.Melee = {ammo=RAbullet,
        head="Carmine Mask +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Eabani Earring",
        body="Adhemar Jacket",hands="Herculean Gloves",ring1="Petrov Ring",ring2="Epona's Ring",
        back=AccCape,waist="Windbuffet Belt",legs="Samnuha Tights",feet=HercBootAcc}
    
    sets.engaged.Acc = {ammo=RAbullet,
        head="Carmine Mask +1",neck="Subtlety Spec.",ear1="Steelflash Earring",ear2="Heartseeker Earring",
        body="Adhemar Jacket",hands="Herculean Gloves",ring1="Etana Ring",ring2="Petrov Ring",
        back=AccCape,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=HercBootAcc}

    sets.engaged.Melee.DW = {ammo=RAbullet,
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="K'ayres Ring",ring2="Epona's Ring",
        back=AccCape,waist="Windbuffet Belt",legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
    
    sets.engaged.Acc.DW = {ammo=RAbullet,
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="K'ayres Ring",ring2="Epona's Ring",
        back=AccCape,waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Iuitl Gaiters +1"}
	
	sets.aftercast.TP = sets.engaged.Melee

    sets.engaged.Ranged = sets.precast.RA
	
	sets.reive = { neck = "Ygnas's Resolve +1" }
	
end