-- ** I Use Some of Motenten's Functions ** **Original Skeleton of this file courtesy of Flippant, overhauled by Krazykozy** --
-- Last Updated: 12/04/2016 10:28 AM *Almace Afterglowed* --
include('spam_protection.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"TP","LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is TP. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	WeaponIndex = 1
	WeaponArray = {"Almace","Colada","Club","Vampirism"} -- Default TP Set Is Almace. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Refresh","Goldsmithing","Fishing","HELM","D2Ring","Camera"} -- Default Idle Set Is Movement --
	Armor = 'None'
	target_distance = 8 -- Set Default Distance Here --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="ChantduCygne", SC2="Berserk", SC3="HeadButt"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	PhysicalBlueMagic = S{
			'Asuran Claws','Bludgeon','Body Slam','Feather Storm','Mandibular Bite',
			'Queasyshroom','Power Attack','Ram Charge','Screwdriver','Sickle Slash',
			'Smite of Rage','Spinal Cleave','Spiral Spin','Terror Touch'}

	PhysicalBlueMagic_STR = S{
			'Battle Dance','Bloodrake','Blinding Fulgor','Death Scissors','Delta Thrust','Dimensional Death','Empty Thrash',
			'Glutinous Dart','Heavy Strike','Paralyzing Triad','Quadrastrike','Rail Cannon','Uppercut','Saurian Slide','Searing Tempest',
			'Sinker Drill','Tourbillion','Vertical Cleave','Whirl of Rage'}

	PhysicalBlueMagic_DEX = S{
			'Amorphic Spikes','Anvil Lightning','Barbed Crescent','Blinding Fulgor','Claw Cyclone','Disseverment','Foot Kick',
			'Frenetic Rip','Glutinous Dart','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Rail Cannon','Seedspray',
			'Sinker Drill','Sudden Lunge','Thrashing Assault','Vanity Dive'}

	PhysicalBlueMagic_VIT = S{
			'Cannonball','Delta Thrust','Entomb','Glutinous Dart','Grand Slam','Quad. Continuum','Saurian Slide',
			'Sinker Drill','Sprout Smack','Sweeping Gouge','Thermal Pulse'}

	PhysicalBlueMagic_AGI = S{
			'Benthic Typhoon','Blinding Fulgor','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb','Palling Salvo','Silent Storm',
			'Sudden Lunge','Wild Oats'}

	MagicalBlueMagic = S{
			'Acrid Stream','Anvil Lightning','Blinding Fulgor','Dark Orb','Diffusion Ray','Droning Whirlwind','Embalming Earth','Entomb',
			'Evryone. Grudge','Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer','Palling Salvo','Regurgitation','Rending Deluge',
			'Scouring Spate','Searing Tempest','Silent Storm','Spectral Floe','Subduction','Tem. Upheaval','Tenebral Crush','Thermal Pulse',
			'Water Bomb'}

	BlueMagic_Accuracy = S{
			'1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
			'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
			'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
			'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
			'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
			'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
			'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
			'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'}

	BlueMagic_Breath = S{
			'Bad Breath','Flying Hip Press','Final Sting','Frost Breath','Heat Breath','Magnetite Cloud','Poison Breath','Radiant Breath',
			'Self Destruct','Thunder Breath','Wind Breath'}

	BlueMagic_Buff = S{
			'Battery Charge','Barrier Tusk','Carcharian Verve','Cocoon','Diamondhide','Erratic Flutter','Metallic Body','Magic Barrier','Mighty Guard',
			'Occultation','Orcish Counterstance','Nat. Meditation','Plasma Charge','Pyric Bulwark','Reactor Cool','Winds of Promyvion'}

	BlueMagic_Diffusion = S{
			'Amplification','Battery Charge','Cocoon','Exuviation','Erratic Flutter','Feather Barrier','Harden Shell','Memento Mori',
			'Metallic Body',"Mighty Guard",'Nat. Meditation','Plasma Charge','Reactor Cool','Refueling','Saline Coat','Warm-Up','Zephyr Mantle'}

	BlueMagic_Healing = S{
			'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind','Wild Carrot'}

	BlueMagic_Stun = S{
			'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift','Thunderbolt','Whirl of Rage'}

	BlueMagic_Unbridled = S{
			'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve','Cesspool','Cruel Joke',
			'Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Polar Roar','Pyric Bulwark','Tearing Gust',
			'Thunderbolt','Tourbillion'}

	-- Idle/Town Sets --
	sets.Idle = {}

	sets.Idle.Regen = {
			ammo="Staunch Tathlum",
			head="Oce. Headpiece +1",
			neck="Wiglen Gorget",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Jhakri Robe +1",
			hands="Serpentes Cuffs",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back="Xucau Mantle",
			waist="Fucho-no-Obi",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Serpentes Sabots"}
	sets.Idle.Regen.Almace = set_combine(sets.Idle.Regen,{
			main="Almace",
			sub={ name="Colada", augments={'"Dbl.Atk."+2','DEX+4','Accuracy+25','Attack+11','DMG:+18',}},})
	sets.Idle.Regen.Colada = set_combine(sets.Idle.Regen,{
			main={ name="Colada", augments={'STR+3','Mag. Acc.+16','"Mag.Atk.Bns."+25','DMG:+15',}},
			sub={ name="Colada", augments={'Accuracy+2','Mag. Acc.+17','"Mag.Atk.Bns."+25',}},})
	sets.Idle.Regen.Club = set_combine(sets.Idle.Regen,{
            main="Eosuchus Club",
            sub="Genmei Shield"})
	sets.Idle.Regen.Vampirism = set_combine(sets.Idle.Regen,{
			main={ name="Vampirism", augments={'STR+10','INT+10','"Occult Acumen"+10','DMG:+15',}},
			sub={ name="Vampirism", augments={'STR+8','INT+9','"Occult Acumen"+8','DMG:+14',}},})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Xucau Mantle",
			waist="Flume Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})
	sets.Idle.Movement.Almace = set_combine(sets.Idle.Movement,{
			main="Almace",
			sub={ name="Colada", augments={'"Dbl.Atk."+2','DEX+4','Accuracy+25','Attack+11','DMG:+18',}},})
	sets.Idle.Movement.Colada = set_combine(sets.Idle.Movement,{
			main={ name="Colada", augments={'STR+3','Mag. Acc.+16','"Mag.Atk.Bns."+25','DMG:+15',}},
			sub={ name="Colada", augments={'Accuracy+2','Mag. Acc.+17','"Mag.Atk.Bns."+25',}},})
	sets.Idle.Movement.Club = set_combine(sets.Idle.Movement,{
            main="Eosuchus Club",
            sub="Genmei Shield"})
	sets.Idle.Movement.Vampirism = set_combine(sets.Idle.Movement,{
			main={ name="Vampirism", augments={'STR+10','INT+10','"Occult Acumen"+10','DMG:+15',}},
			sub={ name="Vampirism", augments={'STR+8','INT+9','"Occult Acumen"+8','DMG:+14',}},})

	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head="Rawhide Mask",
			neck="Wiglen Gorget",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Jhakri Robe +1",
			hands="Serpentes Cuffs",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back="Xucau Mantle",
			waist="Fucho-no-Obi",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Serpentes Sabots"})
	sets.Idle.Refresh.Almace = set_combine(sets.Idle.Refresh,{
			main="Almace",
			sub={ name="Colada", augments={'"Dbl.Atk."+2','DEX+4','Accuracy+25','Attack+11','DMG:+18',}},})
	sets.Idle.Refresh.Colada = set_combine(sets.Idle.Refresh,{
			main={ name="Colada", augments={'STR+3','Mag. Acc.+16','"Mag.Atk.Bns."+25','DMG:+15',}},
			sub={ name="Colada", augments={'Accuracy+2','Mag. Acc.+17','"Mag.Atk.Bns."+25',}},})
	sets.Idle.Refresh.Club = set_combine(sets.Idle.Refresh,{
            main="Eosuchus Club",
            sub="Genmei Shield"})
	sets.Idle.Refresh.Vampirism = set_combine(sets.Idle.Refresh,{
			main={ name="Vampirism", augments={'STR+10','INT+10','"Occult Acumen"+10','DMG:+15',}},
			sub={ name="Vampirism", augments={'STR+8','INT+9','"Occult Acumen"+8','DMG:+14',}},})
	sets.Resting = set_combine(sets.Idle.Regen,{
			left_ear="Sanative Earring",
			right_ear="Relaxing Earring",
			legs="Lengo Pants"})

	sets.Idle.Camera = set_combine(sets.Idle.Movement,{
			range="Soultrapper 2000",
			ammo="Blank Soulplate",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Xucau Mantle",})
			
	sets.Idle.D2Ring = set_combine(sets.Idle.Movement,{
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring",
			waist="Flume Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})	

	sets.Idle.CpRing = set_combine(sets.Idle.Movement,{
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},			
			left_ring="Trizek Ring",
			right_ring="Capacity Ring",
			waist="Flume Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})
			
	sets.Idle.Learn = set_combine(sets.Idle.Movement,{
			ammo="Mavi Tathlum",
			head="Luhlaza Keffiyeh +1",
			neck="Incanter's Torque",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body="Assim. Jubbah +2",
			hands="Assimilator's Bazubands +1",
			back="Cornflower Cape",
			waist="Flume Belt +1",
			legs="Hashishin Tayt +1",
			feet="Luhlaza Charuqs +1"})
	
	sets.Idle.Goldsmithing = set_combine(sets.Idle.Movement,{
			ammo="Staunch Tathlum",
			head="Shaded Spectacles",
			neck="Goldsmith's Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Goldsmith's Smock",
			hands="Goldsmith's Cuffs",
			left_ring="Orvail Ring",
			right_ring="Craftmaster's Ring",
			back="",
			waist="Goldsmith's Belt",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})			
	sets.Idle.Goldsmithing.Almace = set_combine(sets.Idle.Goldsmithing,{
			main="Almace",
			sub="Toreutic Ecu"})
	sets.Idle.Goldsmithing.Colada = set_combine(sets.Idle.Goldsmithing,{
			main={ name="Colada", augments={'STR+3','Mag. Acc.+16','"Mag.Atk.Bns."+25','DMG:+15',}},
			sub="Toreutic Ecu"})
	sets.Idle.Goldsmithing.Club = set_combine(sets.Idle.Goldsmithing,{
            main="Eosuchus Club",
            sub="Toreutic Ecu"})
	sets.Idle.Goldsmithing.Vampirism = set_combine(sets.Idle.Goldsmithing,{
            main="Vampirism",
			sub="Toreutic Ecu"})
	sets.Resting = set_combine(sets.Idle.Regen,{
			left_ear="Sanative Earring",
			right_ear="Relaxing Earring",
			legs="Lengo Pants"})
			
	sets.Idle.Fishing = set_combine(sets.Idle.Movement,{
			range="Ebisu Fishing Rod",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Fisher's Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			left_ring="Puffin Ring",
			right_ring="Noddy Ring",
			back="Xucau Mantle",
			waist="Flume Belt +1",
			legs="Angler's Hose",
			feet="Waders"})
	sets.Idle.Fishing.Almace = set_combine(sets.Idle.Fishing,{
			main="Almace",
			sub="Toreutic Ecu"})
	sets.Idle.Fishing.Colada = set_combine(sets.Idle.Fishing,{
			main={ name="Colada", augments={'STR+3','Mag. Acc.+16','"Mag.Atk.Bns."+25','DMG:+15',}},
			sub="Toreutic Ecu"})
	sets.Idle.Fishing.Club = set_combine(sets.Idle.Fishing,{
            main="Nibiru Club",
			sub="Toreutic Ecu"})
	sets.Idle.Fishing.Vampirism = set_combine(sets.Idle.Fishing,{
            main="Vampirism",
			sub="Toreutic Ecu"})
	sets.Resting = set_combine(sets.Idle.Regen,{
			left_ear="Sanative Earring",
			right_ear="Relaxing Earring",
			legs="Lengo Pants"})

	sets.Idle.HELM = set_combine(sets.Idle.Movement,{
			ammo="Staunch Tathlum",
			head="",
			neck="Field Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Trench Tunic",
			hands="Worker Gloves",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Xucau Mantle",
			waist="Field Rope",
			legs="Dredger Hose",
			feet="Worker Boots"})
	sets.Idle.HELM.Almace = set_combine(sets.Idle.HELM,{
			main="Almace",
			sub="Toreutic Ecu"})
	sets.Idle.HELM.Colada = set_combine(sets.Idle.HELM,{
			main={ name="Colada", augments={'STR+3','Mag. Acc.+16','"Mag.Atk.Bns."+25','DMG:+15',}},
			sub="Toreutic Ecu"})
	sets.Idle.HELM.Club = set_combine(sets.Idle.HELM,{
            main="Nibiru Club",
			sub="Toreutic Ecu"})
	sets.Idle.HELM.Vampirism = set_combine(sets.Idle.HELM,{
            main="Vampirism",
			sub="Toreutic Ecu"})
	sets.Resting = set_combine(sets.Idle.Regen,{
			left_ear="Sanative Earring",
			right_ear="Relaxing Earring",
			legs="Lengo Pants"})

	-- TP Sets --
	sets.TP = {}
			
	-- Almace TP Sets --
	sets.TP.Almace = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.TP.Almace.LowACC = set_combine(sets.TP.Almace,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.Almace.MidACC = set_combine(sets.TP.Almace.LowACC,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.Almace.HighACC = set_combine(sets.TP.Almace.MidACC,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})

	-- March x2 + Haste + Samba --
	sets.TP.Almace.MidHaste = set_combine(sets.TP.Almace.MidHaste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Almace.LowACC.MidHaste = set_combine(sets.TP.Almace.MidHaste,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Almace.MidACC.MidHaste = set_combine(sets.TP.Almace.MidHaste,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Almace.HighACC.MidHaste = set_combine(sets.TP.Almace.MidACC.MidHaste,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})
			
	-- March x2 + (Embrava or Haste) --
	sets.TP.Almace.HighHaste = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.TP.Almace.LowACC.HighHaste = set_combine(sets.TP.Almace.HighHaste,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Almace.MidACC.HighHaste = set_combine(sets.TP.Almace.HighHaste,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Almace.HighACC.HighHaste = set_combine(sets.TP.Almace.MidACC.HighHaste,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})		

	-- Colada TP Sets --
	sets.TP.Colada = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.TP.Colada.LowACC = set_combine(sets.TP.Colada,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.Colada.MidACC = set_combine(sets.TP.Colada.LowACC,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.Colada.HighACC = set_combine(sets.TP.Colada.MidACC,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})

	-- March x2 + Haste + Samba --
	sets.TP.Colada.MidHaste = set_combine(sets.TP.Colada.MidHaste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Colada.LowACC.MidHaste = set_combine(sets.TP.Colada.MidHaste,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Colada.MidACC.MidHaste = set_combine(sets.TP.Colada.MidHaste,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Colada.HighACC.MidHaste = set_combine(sets.TP.Colada.MidACC.MidHaste,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})
			
	-- March x2 + (Embrava or Haste) --
	sets.TP.Colada.HighHaste = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.TP.Colada.LowACC.HighHaste = set_combine(sets.TP.Colada.HighHaste,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Colada.MidACC.HighHaste = set_combine(sets.TP.Colada.HighHaste,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Colada.HighACC.HighHaste = set_combine(sets.TP.Colada.MidACC.HighHaste,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})

	-- Club TP Sets --
	sets.TP.Club = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.TP.Club.LowACC = set_combine(sets.TP.Club,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.Club.MidACC = set_combine(sets.TP.Club.LowACC,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.Club.HighACC = set_combine(sets.TP.Club.MidACC,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})

	-- March x2 + Haste + Samba --
	sets.TP.Club.MidHaste = set_combine(sets.TP.Club.MidHaste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Club.LowACC.MidHaste = set_combine(sets.TP.Club.MidHaste,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Club.MidACC.MidHaste = set_combine(sets.TP.Club.MidHaste,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Club.HighACC.MidHaste = set_combine(sets.TP.Club.MidACC.MidHaste,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})
			
	-- March x2 + (Embrava or Haste) --
	sets.TP.Club.HighHaste = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.TP.Club.LowACC.HighHaste = set_combine(sets.TP.Club.HighHaste,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Club.MidACC.HighHaste = set_combine(sets.TP.Club.HighHaste,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Club.HighACC.HighHaste = set_combine(sets.TP.Club.MidACC.HighHaste,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})

	-- Vampirism TP Sets --
	sets.TP.Vampirism = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.TP.Vampirism.LowACC = set_combine(sets.TP.Vampirism,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.Vampirism.MidACC = set_combine(sets.TP.Vampirism.LowACC,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.Vampirism.HighACC = set_combine(sets.TP.Vampirism.MidACC,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})

	-- March x2 + Haste + Samba --
	sets.TP.Vampirism.MidHaste = set_combine(sets.TP.Vampirism.MidHaste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Vampirism.LowACC.MidHaste = set_combine(sets.TP.Vampirism.MidHaste,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Vampirism.MidACC.MidHaste = set_combine(sets.TP.Vampirism.MidHaste,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Vampirism.HighACC.MidHaste = set_combine(sets.TP.Vampirism.MidACC.MidHaste,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})
			
	-- March x2 + (Embrava or Haste) --
	sets.TP.Vampirism.HighHaste = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.TP.Vampirism.LowACC.HighHaste = set_combine(sets.TP.Vampirism.HighHaste,{
			ammo="Ginsen",
			head="Ayanmo Zucchetto +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Vampirism.MidACC.HighHaste = set_combine(sets.TP.Vampirism.HighHaste,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Vampirism.HighACC.HighHaste = set_combine(sets.TP.Vampirism.MidACC.HighHaste,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},
			neck="Subtlety Spec.",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})
			
	sets.TP.Learn = set_combine(sets.TP,{
			ammo="Mavi Tathlum",
			head="Luhlaza Keffiyeh +1",
			neck="Incanter's Torque",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body="Assim. Jubbah +2",
			hands="Assimilator's Bazubands +1",
			left_ring="Hetairoi Ring",
			right_ring="Chirich Ring",
			back="Cornflower Cape",
			waist="Olseni Belt",
			legs="Hashishin Tayt +1",
			feet="Luhlaza Charuqs +1"})
			
	-- DT/MDT Sets --
	sets.DT = {
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Mollusca Mantle",
			waist="Flume Belt +1",
			legs="Ayanmo Cosciales +1",
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},}

	sets.MDT = set_combine(sets.DT,{
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			left_ear="Sanare Earring",
			right_ear="Etiolation Earring",
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Mollusca Mantle",
			legs="Ayanmo Cosciales +1",
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.DT,{
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Hybrid.LowACC = set_combine(sets.TP.Hybrid,{
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			neck="Subtlety Spectacles",
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			ammo="Honed Tathlum",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Ayanmo Corazza +1",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- WS Base Set --
	sets.WS = {
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.WS.LowACC = set_combine(sets.WS,{
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.WS.MidACC = set_combine(sets.WS.LowACC,{
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			ammo="Honed Tathlum",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			right_ear="Telos Earring",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},})
			
	-- WS Sets --
	sets.WS["Vorpal Blade"] = {
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Vulcan's Pearl",
			body="Abnoba Kaftan",
			hands={ name="Herculean Gloves", augments={'Accuracy+16','Crit. hit damage +4%','STR+9','Attack+14',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.WS["Vorpal Blade"].LowACC = set_combine(sets.WS["Vorpal Blade"],{
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Vulcan's Pearl",
			hands={ name="Herculean Gloves", augments={'Accuracy+16','Crit. hit damage +4%','STR+9','Attack+14',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.WS["Vorpal Blade"].MidACC = set_combine(sets.WS["Vorpal Blade"].LowACC,{
			ammo="Floestone",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			waist="Fotia Belt"})
	sets.WS["Vorpal Blade"].HighACC = set_combine(sets.WS["Vorpal Blade"].MidACC,{
			ammo="Honed Tathlum",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			body="Assim. Jubbah +2",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	sets.WS["Savage Blade"] = {
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},
}
	sets.WS["Savage Blade"].LowACC = set_combine(sets.WS["Savage Blade"],{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Savage Blade"].LowACC,{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Savage Blade"].MidACC,{
			ammo="Honed Tathlum",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})			
			
	sets.WS["Chant du Cygne"] = {
			ammo="Jukukik Feather",
			head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body="Abnoba Kaftan",
			hands={ name="Herculean Gloves", augments={'Accuracy+16 Attack+16','Crit. hit damage +3%','DEX+7','Attack+15',}},
			left_ring="Begrudging Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Crit.hit rate+10',}},
			waist="Grunfeld Rope",
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.WS["Chant du Cygne"].LowACC = set_combine(sets.WS["Chant du Cygne"],{
			ammo="Jukukik Feather",
			head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			hands={ name="Herculean Gloves", augments={'Accuracy+16 Attack+16','Crit. hit damage +3%','DEX+7','Attack+15',}},
			left_ring="Begrudging Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Crit.hit rate+10',}},
			waist="Grunfeld Rope",
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"].LowACC,{
			ammo="Falcon Eye",
			neck="Fotia Gorget",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+2','DEX+13',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Crit.hit rate+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{
			ammo="Honed Tathlum",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Mache Earring",
			right_ear="Mache Earring",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Crit.hit rate+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})			
			
	sets.WS["Sanguine Blade"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"}
	sets.WS["Sanguine Blade"].LowACC = set_combine(sets.WS["Sanguine Blade"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Sanguine Blade"].MidACC = set_combine(sets.WS["Sanguine Blade"].LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Sanguine Blade"].HighACC = set_combine(sets.WS["Sanguine Blade"].MidACC,{
			ammo="Honed Tathlum",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})

	sets.WS.Requiescat = {
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Vulcan's Pearl",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"}
	sets.WS.Requiescat.LowACC = set_combine(sets.WS.Requiescat,{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Vulcan's Pearl",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat.LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{
			ammo="Honed Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})

	sets.WS.Expiacion = {
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS.Expiacion.LowACC = set_combine(sets.WS.Expiacion,{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS.Expiacion.MidACC = set_combine(sets.WS.Expiacion.LowACC,{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS.Expiacion.HighACC = set_combine(sets.WS.Expiacion.MidACC,{
			ammo="Honed Tathlum",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})

	sets.WS["Realmrazer"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"}
	sets.WS["Realmrazer"].LowACC = set_combine(sets.WS["Realmrazer"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Realmrazer"].MidACC = set_combine(sets.WS["Realmrazer"].LowACC,{
			ammo="Falcon Eye",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			waist="Fotia Belt"})
	sets.WS["Realmrazer"].HighACC = set_combine(sets.WS["Realmrazer"].MidACC,{
			ammo="Honed Tathlum",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			body={ name="Rawhide Vest", augments={'DEX+10','STR+7','INT+7',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},})			
			
	sets.WS["True Strike"] = {
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +2",
			hands={ name="Herculean Gloves", augments={'Attack+26','Weapon skill damage +2%','DEX+7','Accuracy+10',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS["True Strike"].LowACC = set_combine(sets.WS["True Strike"],{
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			hands={ name="Herculean Gloves", augments={'Attack+26','Weapon skill damage +2%','DEX+7','Accuracy+10',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Attack+18','Weapon skill damage +3%','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS["True Strike"].MidACC = set_combine(sets.WS["True Strike"].LowACC,{
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},})
	sets.WS["True Strike"].HighACC = set_combine(sets.WS["True Strike"].MidACC,{
			ammo="Honed Tathlum",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			body="Assim. Jubbah +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})			
			
	sets.WS["Judgment"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"}
	sets.WS["Judgment"].LowACC = set_combine(sets.WS["Judgment"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Judgment"].MidACC = set_combine(sets.WS["Judgment"].LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Judgment"].HighACC = set_combine(sets.WS["Judgment"].MidACC,{
			ammo="Honed Tathlum",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})			
			
	sets.WS["Black Halo"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"}
	sets.WS["Black Halo"].LowACC = set_combine(sets.WS["Black Halo"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Black Halo"].MidACC = set_combine(sets.WS["Black Halo"].LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Black Halo"].HighACC = set_combine(sets.WS["Black Halo"].MidACC,{
			ammo="Honed Tathlum",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})

	sets.WS["Flash Nova"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"}
	sets.WS["Flash Nova"].LowACC = set_combine(sets.WS["Flash Nova"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Flash Nova"].MidACC = set_combine(sets.WS["Flash Nova"].LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
	sets.WS["Flash Nova"].HighACC = set_combine(sets.WS["Flash Nova"].MidACC,{
			ammo="Honed Tathlum",
			head="Jhakri Coronal +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})

	-- Enmity Set --
	sets.Enmity = {
			ammo="Iron Gobbet",
			right_ear="Trux Earring",
			neck="Unmoving Collar",
			waist="Chaac Belt",
			right_ear="Trux Earring",
			left_ring="Petrov Ring",
			right_ring="Eihwaz Ring",
			back="Mollusca Mantle",}
			
	-- JA Sets --
	sets.JA = {}
	sets.JA.Provoke = set_combine(sets.Enmity,{})
	sets.JA['Azure Lore'] = {hands="Luhlaza Bazubands +1"}
	sets.JA.Diffusion = {feet="Luhlaza Charuqs +1"}
	sets.JA.Assimilation = {legs="Luhlaza Shalwar +1"}
	sets.JA.Enchainment = {body="Luhlaza Jubbah +1"}
	sets.JA.Convergence = {head="Luhlaza Keffiyeh +1"}
	sets.JA.Efflux = {legs="Hashishin Tayt +1"}
	sets.JA['Chain Affinity'] = {head="Hashishin Kavuk +1"}
	sets.JA['Burst Affinity'] = {head="Hashishin Basmak +1"}
	sets.JA.Convert = {			
			ammo="Sapience Orb",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Etiolation Earring",
			right_ear="Ethereal Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','"Dual Wield"+4','DEX+5','Accuracy+15',}},
			hands="Umuthi Gloves",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Mollusca Mantle",
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}}

	sets.JA.Lunge = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Shiva Ring +1",
			right_ring="Fenrir Ring +1",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +1"}

	-- Waltz Set --
	sets.Waltz = {
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Unmoving Collar",
			body={ name="Rawhide Vest", augments={'DEX+10','STR+7','INT+7',}},
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			left_ring="Asklepian Ring",
			right_ring="Valseur's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Chaac Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body="Hashishin Mintan +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			waist="Witful Belt",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},}

	-- Precast BlueMagic --
	sets.Precast.BlueMagic = {
			ammo="Impatiens",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body="Hashishin Mintan +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			waist="Witful Belt",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},}

	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = {
			ammo="Impatients",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Magoraga Beads",
			body="Passion Jacket",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			waist="Witful Belt",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},}		
			
	-- Midcast Base Set --
	sets.Midcast = set_combine(sets.Precast.FastCast,{
			ammo="Mavi Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Shiva Ring +1",
			right_ring="Sangoma Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Luhlaza Charuqs +1"})

	sets.Midcast.Utsusemi = {
			ammo="Impatients",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Magoraga Beads",
			body="Passion Jacket",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			waist="Witful Belt",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},}		
			
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
			ammo="Mavi Tathlum",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body="Hashishin Mintan +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			waist="Olympus Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Luhlaza Charuqs +1"})

	-- Healing Magic Base Set --
	sets.Midcast['Healing Magic'] = {
			ammo="Hydrocera",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body="Vrikodara Jupon",
			hands={ name="Telchine Gloves", augments={'DEF+10','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			waist="Bishop's Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}			
			
	-- Enhancing Magic Base Set --
	sets.Midcast['Enhancing Magic'] = {
			ammo="Hydrocera",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body={ name="Telchine Chas.", augments={'"Mag.Atk.Bns."+17','"Fast Cast"+4','MND+10',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Perimede Cape",
			waist="Olympus Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Jhakri Pigaches +1"}

	-- Barspell Base Set --
	sets.Midcast.Barspell = {
			ammo="Hydrocera",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body={ name="Telchine Chas.", augments={'"Mag.Atk.Bns."+17','"Fast Cast"+4','MND+10',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Perimede Cape",
			waist="Olympus Sash",
			legs="Shedir Seraweels",
			feet="Jhakri Pigaches +1"}
						
	-- Aquaveil Set --
	sets.Midcast.Aquaveil = {
			ammo="Hydrocera",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body={ name="Telchine Chas.", augments={'"Mag.Atk.Bns."+17','"Fast Cast"+4','MND+10',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Perimede Cape",
			waist="Olympus Sash",
			legs="Shedir Seraweels",
			feet="Jhakri Pigaches +1"}		
			
	-- Refresh Set --
	sets.Midcast.Refresh = {
			ammo="Hydrocera",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body={ name="Telchine Chas.", augments={'"Mag.Atk.Bns."+17','"Fast Cast"+4','MND+10',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Perimede Cape",
			waist="Olympus Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Jhakri Pigaches +1"}		

	-- Refresh Self Set --
	sets.Midcast.Refreshself = {
			ammo="Hydrocera",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body={ name="Telchine Chas.", augments={'"Mag.Atk.Bns."+17','"Fast Cast"+4','MND+10',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Perimede Cape",
			waist="Gishdubar Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Jhakri Pigaches +1"}	
			
	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Precast.FastCast,{
			ammo="Hydrocera",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Stone Gorget",
			left_ear="Earthcry Earring",
			right_ear="Andoaa Earring",
			body={ name="Telchine Chas.", augments={'"Mag.Atk.Bns."+17','"Fast Cast"+4','MND+10',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Perimede Cape",
			waist="Siegel Sash",
			legs="Shedir Seraweels",
			feet="Jhakri Pigaches +1"})
			
	-- Enfeebling Magic Base Set --
	sets.Midcast['Enfeebling Magic'] = {
			ammo="Hydrocera",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			left_ear="Dignitary's Earring",
			right_ear="Andoaa Earring",
			neck="Incanter's Torque",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Luminary Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Incanter's Torque",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Stikini Ring",
			right_ring="Evanescence Ring",
			back="Perimede Cape",
			waist="Latria Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Jhakri Pigaches +1"}
			
	-- Elemental Magic Base Set --
	sets.Midcast['Elemental Magic'] = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +1"}

	-- For Cure Spells & The Listed Healing Blue Magic --
	sets.Midcast.Cure = set_combine(sets.Precast.FastCast,{
			ammo="Hydrocera",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body="Vrikodara Jupon",
			hands={ name="Telchine Gloves", augments={'DEF+10','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Solemnity Cape",
			waist="Luminary Sash",
			legs="Gyve Trousers",
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})

	sets.Midcast.SelfCure = set_combine(sets.Precast.FastCast,{
			ammo="Hydrocera",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body="Vrikodara Jupon",
			hands={ name="Telchine Gloves", augments={'DEF+10','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Solemnity Cape",
			waist="Gishdubar Sash",
			legs="Gyve Trousers",
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})			
			
	-- For The Listed Physical Type Blue Magic --
	sets.Midcast.PhysicalBlueMagic = {
			ammo="Mavi Tathlum",
			head="Luhlaza Keffiyeh +1",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Cornflower Cape",
			waist="Latria Belt",
			legs="Hashishin Tayt +1",
			feet="Luhlaza Charuqs +1"}

	-- Blue Magic STR Set --
	sets.Midcast.PhysicalBlueMagic_STR = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Incanter's Torque",
			left_ear="Vulcan's Pearl",
			right_ear="Vulcan's Pearl",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back="Cornflower Cape",
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- Blue Magic STR/DEX Set --
	sets.Midcast.PhysicalBlueMagic_DEX = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ammo="Expeditious Pinion",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Incanter's Torque",
			left_ear="Mache Earring",
			right_ear="Mache Earring",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- Blue Magic STR/VIT Set --
	sets.Midcast.PhysicalBlueMagic_VIT = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ammo="Iron Gobbet",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Incanter's Torque",
			left_ear="Terra's Pearl",
			right_ear="Vulcan's Pearl",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Titan Ring +1",
			right_ring="Titan Ring +1",
			back="Cornflower Cape",
			waist="Latria Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- Blue Magic STR/AGI Set --
	sets.Midcast.PhysicalBlueMagic_AGI = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ammo="Expeditious Pinion",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','Accuracy+12',}},
			neck="Incanter's Torque",
			left_ear="Infused Earring",
			right_ear="Breeze Pearl",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Garuda Ring",
			back="Cornflower Cape",
			waist="Latria Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','Crit. hit damage +2%','STR+4','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- For The Listed Magical Type Blue Magic --
	sets.Midcast.MagicalBlueMagic = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Luminary Sash",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +1"}

	-- Magic Accuracy For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Accuracy = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Luminary Sash",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +1"}

	-- Stun Set For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Stun = {
			ammo="Pemphredo Tathlum",
			head="Luhlaza Keffiyeh +1",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Eschan Stone",
			back="Cornflower Cape",
			legs="Hashishin Tayt +1",
			feet="Luhlaza Charuqs +1"}

	-- Buff Set For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Buff = {
			ammo="Mavi Tathlum",
			head="Luhlaza Keffiyeh +1",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Latria Belt",
			back="Cornflower Cape",
			legs="Hashishin Tayt +1",
			feet="Luhlaza Charuqs +1"}

	-- Breath Set For The Listed Blue Magic --
	sets.Midcast.BlueMagic_Breath = {
			ammo="Pemphredo Tathlum",
			head="Luhlaza Keffiyeh +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Assim. Jubbah +2",
			hands="Jhakri Cuffs +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Cornflower Cape",
			waist="Yamabuki-no-Obi",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Luhlaza Charuqs +1"}

	-- BlueMagic Base Set For Any Non Listed Blue Magic --
	sets.Midcast.BlueMagic = {
			ammo="Mavi Tathlum",
			head="Jhakri Coronal +1",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Yamabuki-no-Obi",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"}

	-- Occultation --		
	sets.Midcast.Occultation = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Mavi Tathlum",
			head="Luhlaza Keffiyeh +1",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Latria Belt",
			back="Cornflower Cape",
			legs="Hashishin Tayt +1",
			feet="Luhlaza Charuqs +1"})	
			
	-- Sudden Lunge --
	sets.Midcast['Sudden Lunge'] = set_combine(sets.Midcast.PhysicalBlueMagic_AGI,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Assim. Jubbah +2",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Luminary Sash",
			back="Cornflower Cape",
			legs="Hashishin Tayt +1",
			feet="Jhakri Pigaches +1"})			
			
	-- Magic Hammer --
	sets.Midcast['Magic Hammer'] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Hydrocera",
			head="Jhakri Coronal +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Luminary Sash",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +1"})
			
	-- Charged Whisker --
	sets.Midcast['Charged Whisker'] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Yamabuki-no-Obi",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})

	-- Subduction --
	sets.Midcast['Subduction'] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Yamabuki-no-Obi",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
			
	-- Tenebral Crush --
	sets.Midcast['Tenebral Crush'] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Yamabuki-no-Obi",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})

	-- Spectral Floe --
	sets.Midcast['Spectral Floe'] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body="Jhakri Robe +1",
			hands="Jhakri Cuffs +1",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist="Yamabuki-no-Obi",
			legs="Jhakri Slops +1",
			feet="Jhakri Pigaches +1"})
			
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
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif BlueMagic_Unbridled:contains(spell.english) and not buffactive['Unbridled Learning'] then
		if windower.ffxi.get_ability_recasts()[81] < 1 and not buffactive.amnesia and not buffactive.charm then -- Auto Use Unbridled Learning When You Cast One of The Unbridled Spells.
			cancel_spell()
			send_command('input /ja "Unbridled Learning" <me>;wait 1.5;input /ma "'..spell.english..'" '..spell.target.name)
		end
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if check_ready(spell) then
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
				if spell.english == "Chant du Cygne" and player.tp > 2999 then
				equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
				end
				if spell.english == "Vorpal Blade" and player.tp > 2999 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Requiescat" and player.tp > 2999 then
				equipSet = set_combine(equipSet,{left_ear="Crematio Earring"})
				end
				if spell.english == "Expiacion" and player.tp > 2999 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Savage Blade" and player.tp > 2999 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
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
			if string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.Utsusemi)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "Waltz" then
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif (string.find(spell.english,'Cur') or spell.english == "Magic Fruit" or spell.english == "Restoral" or spell.english == "Healing Breeze") and spell.english ~= "Cursna" then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
		elseif string.find(spell.english,'Refresh') then
			if spell.target.name == player.name then
				equipSet = equipSet.Refreshself
			else
				equipSet = equipSet.Refresh
			end
		elseif (string.find(spell.english,'Cur') or BlueMagic_Healing:contains(spell.english)) and spell.english ~= "Cursna" then
			if string.find(spell.english,'Cure') or BlueMagic_Healing:contains(spell.english) then
				equipSet = equipSet.Cure
			elseif string.find(spell.english,'Cura') then
				equipSet = equipSet.Curaga
			end
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(sets.Midcast['Enhancing Magic'],{right_ring="Sheltered Ring"})
			end
		elseif string.find(spell.english,'Barfire') or string.find(spell.english,'Barblizzard') or string.find(spell.english,'Baraero') or string.find(spell.english,'Barstone') or string.find(spell.english,'Barthunder') or string.find(spell.english,'Barwater') then
			if spell.target.name == player.name then
				equipSet = set_combine(sets.Midcast.Barspell)
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{waist='Hachirin-No-Obi'})
			end
		elseif PhysicalBlueMagic:contains(spell.english) or PhysicalBlueMagic_STR:contains(spell.english) or PhysicalBlueMagic_DEX:contains(spell.english) or PhysicalBlueMagic_VIT:contains(spell.english) or PhysicalBlueMagic_AGI:contains(spell.english) then
			if PhysicalBlueMagic_STR:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_STR
			elseif PhysicalBlueMagic_DEX:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_DEX
			elseif PhysicalBlueMagic_VIT:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_VIT
			elseif PhysicalBlueMagic_AGI:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_AGI
			elseif PhysicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic
			end
			if buffactive['Chain Affinity'] then
				equipSet = set_combine(equipSet,{head="Hashishin Kavuk +1",legs="Assim. Charuqs +1"})
			end
			if buffactive.Efflux then
				equipSet = set_combine(equipSet,{legs="Hashishin Tayt +1"})
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Occultation" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Occultation" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Charged Whisker" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Charged Whisker" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Subduction" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Subduction" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Magic Hammer" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Magic Hammer" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Tenebral Crush" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Tenebral Crush" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Sudden Lunge" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Sudden Lunge" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Spectral Floe" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Spectral Floe" then
				equipSet = equipSet[spell.name]
			end
			if buffactive['Burst Affinity'] then
				equipSet = set_combine(equipSet,{head="Hashishin Basmak",legs="Assimilator's Shalwar +1"})
			end
			if buffactive.Convergence then
				equipSet = set_combine(equipSet,{head="Luhlaza Keffiyeh +1"})
			end
		elseif BlueMagic_Accuracy:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Accuracy
		elseif BlueMagic_Stun:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Stun
		elseif BlueMagic_Buff:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Buff
		elseif BlueMagic_Diffusion:contains(spell.english) and buffactive.Diffusion then
			equipSet = set_combine(equipSet,{feet="Luhlaza Charuqs +1"})
		elseif BlueMagic_Breath:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Breath
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
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
	if spam_protection_off(spell)then
		if not spell.interrupted then
			if spell.type == "WeaponSkill" then
				send_command('wait 0.2;gs c TP')
			elseif spell.english == "Warding Circle" then -- Warding Circle Countdown --
				send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
			end
		end
		status_change(player.status)
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
		if buffactive.Curse and Doom then
			equipSet = set_combine(equipSet,{left_ring='Purity Ring'})
		end	
		if (buffactive.Embrava and (buffactive.Haste or buffactive.March) and buffactive['Haste Samba']) or (buffactive.March == 2 and buffactive.Haste and buffactive['Haste Samba']) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if (buffactive.Embrava and (buffactive.Haste or buffactive.March or buffactive['Haste Samba'])) or (buffactive.March == 1 and buffactive.Haste and buffactive['Haste Samba'] and equipSet["MidHaste"]) or (buffactive.March == 2 and (buffactive.Haste or buffactive['Haste Samba'])) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if (buffactive.Haste and buffactive.March == 2) and (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste))) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive.Embrava and (buffactive.Haste or buffactive.March) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if (buffactive.March == 1 and buffactive.Haste and buffactive["Haste Samba"]) or (buffactive.March == 2) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		equip(equipSet)
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

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Fotia Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
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
	if player.sub_job == 'WAR' then
		set_macro_page(1, 16)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 17)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 16)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 16)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 15)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 17)
	else
		set_macro_page(1, 15)
	end
end