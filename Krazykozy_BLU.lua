-- Last Updated: 01.03.2020 *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --

include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"TP","LowACC","MidACC","HighACC"} -- 4 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is TP. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	WeaponIndex = 1
	WeaponArray = {"Tizona","Sequence","Club"} -- Default TP Set Is Tizona. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Town","Running","Refresh","Goldsmithing","Fishing","HELM","D2Ring","Camera"} -- Default Idle Set Is Town --
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

	PhysicalBlueMagicSTR = S{
			'Battle Dance','Bloodrake','Blinding Fulgor','Death Scissors','Delta Thrust','Dimensional Death','Empty Thrash',
			'Glutinous Dart','Heavy Strike','Paralyzing Triad','Quadrastrike','Rail Cannon','Uppercut','Saurian Slide','Searing Tempest',
			'Tourbillion','Vertical Cleave','Whirl of Rage'}

	PhysicalBlueMagicDEX = S{
			'Amorphic Spikes','Barbed Crescent','Blinding Fulgor','Claw Cyclone','Disseverment','Foot Kick',
			'Frenetic Rip','Glutinous Dart','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Rail Cannon','Seedspray',
			'Sinker Drill','Sudden Lunge','Thrashing Assault','Vanity Dive'}

	PhysicalBlueMagicVIT = S{
			'Cannonball','Delta Thrust','Entomb','Glutinous Dart','Grand Slam','Quad. Continuum','Saurian Slide',
			'Sinker Drill','Sprout Smack','Sweeping Gouge','Thermal Pulse'}

	PhysicalBlueMagicAGI = S{
			'Benthic Typhoon','Blinding Fulgor','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb','Palling Salvo','Silent Storm',
			'Sudden Lunge','Wild Oats'}

	MagicalBlueMagic = S{
			'Acrid Stream','Anvil Lightning','Blinding Fulgor','Dark Orb','Diffusion Ray','Droning Whirlwind','Embalming Earth','Entomb',
			'Evryone. Grudge','Firespit','Foul Waters','Gates of Hades','Leafstorm','Magic Hammer','Palling Salvo','Regurgitation','Rending Deluge',
			'Scouring Spate','Searing Tempest','Silent Storm','Spectral Floe','Subduction','Tem. Upheaval','Tenebral Crush','Thermal Pulse',
			'Water Bomb'}

	BlueMagicAccuracy = S{
			'1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
			'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
			'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
			'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
			'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
			'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
			'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
			'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'}

	BlueMagicBreath = S{
			'Bad Breath','Flying Hip Press','Final Sting','Frost Breath','Heat Breath','Magnetite Cloud','Poison Breath','Radiant Breath',
			'Self Destruct','Thunder Breath','Wind Breath'}

	BlueMagicBuff = S{
			'Battery Charge','Barrier Tusk','Carcharian Verve','Cocoon','Diamondhide','Erratic Flutter','Metallic Body','Magic Barrier','Mighty Guard',
			'Occultation','Orcish Counterstance','Nat. Meditation','Plasma Charge','Pyric Bulwark','Reactor Cool','Winds of Promyvion'}

	BlueMagicDiffusion = S{
			'Amplification','Battery Charge','Cocoon','Exuviation','Erratic Flutter','Feather Barrier','Harden Shell','Memento Mori',
			'Metallic Body','Mighty Guard','Nat. Meditation','Plasma Charge','Reactor Cool','Refueling','Saline Coat','Warm-Up','Zephyr Mantle'}

	BlueMagicHealing = S{
			'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind','Wild Carrot'}

	BlueMagicStun = S{
			'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift','Thunderbolt','Whirl of Rage'}

	BlueMagicUnbridled = S{
			'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve','Cesspool','Cruel Joke',
			'Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Polar Roar','Pyric Bulwark','Tearing Gust',
			'Thunderbolt','Tourbillion'}

	-- Idle/Town Sets --
	sets.Idle = {}

	sets.Idle.Town = {
			ammo="Staunch Tathlum",
			head={ name="Telchine Cap", augments={'Mag. Evasion+24','"Regen"+2','Enh. Mag. eff. dur. +10',}},
			body="Jhakri Robe +2",
			hands={ name="Herculean Gloves", augments={'Weapon skill damage +1%','Pet: Mag. Acc.+20','"Refresh"+1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Crit.hit rate+2','Pet: DEX+11','"Refresh"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
			neck="Bathy Choker +1",
			--neck="Mirage Stole +2",
			waist="Fucho-no-Obi",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			left_ring="Paguroidea Ring",
			right_ring="Karieyh Ring +1",
			back="Moonbeam Cape",}
	sets.Idle.Town.Tizona = set_combine(sets.Idle.Town,{
			main="Tizona",
            sub="Sequence"})
	sets.Idle.Town.Sequence = set_combine(sets.Idle.Town,{
			main="Sequence",
			sub="Almace",})
	sets.Idle.Town.Club = set_combine(sets.Idle.Town,{
            main="Eosuchus Club",
            sub="Genmei Shield"})

	sets.Idle.Running = set_combine(sets.Idle.Town,{
			ammo="Staunch Tathlum",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			neck="Loricate Torque +1",
			--neck="Mirage Stole +2",
			waist="Flume Belt +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			left_ring="Ayanmo Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",})
	sets.Idle.Running.Tizona = set_combine(sets.Idle.Running,{
			main="Tizona",
            sub="Sequence"})
	sets.Idle.Running.Sequence = set_combine(sets.Idle.Running,{
			main="Sequence",
			sub="Almace",})
	sets.Idle.Running.Club = set_combine(sets.Idle.Running,{
            main="Eosuchus Club",
            sub="Genmei Shield"})

	sets.Idle.Refresh = set_combine(sets.Idle.Town,{
			ammo="Staunch Tathlum",
			head={ name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}},
			body="Jhakri Robe +2",
			hands={ name="Herculean Gloves", augments={'Weapon skill damage +1%','Pet: Mag. Acc.+20','"Refresh"+1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
			legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
			feet={ name="Herculean Boots", augments={'Crit.hit rate+2','Pet: DEX+11','"Refresh"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
			neck="Bathy Choker +1",
			--neck="Mirage Stole +2",
			waist="Fucho-no-Obi",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back="Moonbeam Cape",})
	sets.Idle.Refresh.Tizona = set_combine(sets.Idle.Refresh,{
			main="Tizona",
            sub="Sequence"})
	sets.Idle.Refresh.Sequence = set_combine(sets.Idle.Refresh,{
			main="Sequence",
			sub="Almace",})
	sets.Idle.Refresh.Club = set_combine(sets.Idle.Refresh,{
            main="Eosuchus Club",
            sub="Genmei Shield"})

	sets.Idle.Camera = set_combine(sets.Idle.Running,{
			range="Soultrapper",
			ammo="Blank Soulplate",
			head="Ayanmo Zucchetto +2",
			body="Ayanmo Corazza +2",
			hands="Assim. Bazubands +3",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			left_ring="Ayanmo Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",})
			
	sets.Idle.D2Ring = set_combine(sets.Idle.Town,{
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring"})	
			
	sets.Idle.Learn = set_combine(sets.Idle.Running,{
			ammo="Mavi Tathlum",
			head="Luh. Keffiyeh +2",
			neck="Incanter's Torque",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body="Assim. Jubbah +3",
			hands="Assim. Bazubands +3",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			waist="Flume Belt +1",
			legs="Hashishin Tayt +1",
			feet={ name="Luhlaza Charuqs +2", augments={'Enhances "Diffusion" effect',}},})
	
	sets.Idle.Goldsmithing = set_combine(sets.Idle.Town,{
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
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},})

	sets.Resting = set_combine(sets.Idle.Refresh,{
			left_ear="Sanative Earring",
			right_ear="Relaxing Earring",})
			
	sets.Idle.Fishing = set_combine(sets.Idle.Running,{
			range="Ebisu Fishing Rod",
            ammo="",
			head="Ayanmo Zucchetto +2",
			neck="Fisher's Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
            left_ring="Puffin Ring",
            right_ring="Seagull Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs="Angler's Hose",
			feet="Waders"})
	sets.Idle.Fishing.Tizona = set_combine(sets.Idle.Fishing,{
			main="Tizona",
			sub="Toreutic Scutum"})
	sets.Idle.Fishing.Sequence = set_combine(sets.Idle.Fishing,{
			main={ name="Sequence", augments={'STR+3','Mag. Acc.+16','"Mag.Atk.Bns."+25','DMG:+15',}},
			sub="Toreutic Scutum"})
	sets.Idle.Fishing.Club = set_combine(sets.Idle.Fishing,{
            main="Nibiru Club",
			sub="Toreutic Scutum"})
	sets.Idle.Fishing.Vampirism = set_combine(sets.Idle.Fishing,{
            main="Vampirism",
			sub="Toreutic Scutum"})

	sets.Idle.HELM = set_combine(sets.Idle.Town,{
            body="Worker Tunica",
            hands="Worker Gloves",
            legs="Worker Hose",
            feet="Worker Boots",
            neck="Field Torque",
            waist="Field Rope",})
	sets.Idle.HELM.Tizona = set_combine(sets.Idle.HELM,{
			main="Tizona",
			sub="Toreutic Scutum"})
	sets.Idle.HELM.Sequence = set_combine(sets.Idle.HELM,{
			main={ name="Sequence", augments={'STR+3','Mag. Acc.+16','"Mag.Atk.Bns."+25','DMG:+15',}},
			sub="Toreutic Scutum"})
	sets.Idle.HELM.Club = set_combine(sets.Idle.HELM,{
            main="Nibiru Club",
			sub="Toreutic Scutum"})
	sets.Idle.HELM.Vampirism = set_combine(sets.Idle.HELM,{
            main="Vampirism",
			sub="Toreutic Scutum"})

	-- TP Sets --
	sets.TP = {}
			
	-- Tizona TP Sets --
	sets.TP.Tizona = {
			ammo="Ginsen",
			head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	sets.TP.Tizona.LowACC = set_combine(sets.TP.Tizona,{
			head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Tizona.MidACC = set_combine(sets.TP.Tizona.LowACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Assim. Charuqs +3",
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Tizona.HighACC = set_combine(sets.TP.Tizona.MidACC,{
			ammo="Falcon Eye",
			head="Malignance Chapeau",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Assim. Charuqs +3",
			neck="Mirage Stole +2",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})

	-- March x2 + Haste + Samba --
	sets.TP.Tizona.MidHaste = set_combine(sets.TP.Tizona.MidHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			left_ring="Petrov Ring",
			right_ring="Ilabrat Ring",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",})
	sets.TP.Tizona.LowACC.MidHaste = set_combine(sets.TP.Tizona.MidHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			waist="Windbuffet Belt +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Tizona.MidACC.MidHaste = set_combine(sets.TP.Tizona.MidHaste,{
			ammo="Falcon Eye",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",})
	sets.TP.Tizona.HighACC.MidHaste = set_combine(sets.TP.Tizona.MidACC.MidHaste,{
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
			
	-- March x2 + (Embrava or Haste) --
	sets.TP.Tizona.HighHaste = {
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			left_ring="Petrov Ring",
			right_ring="Ilabrat Ring",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",}
	sets.TP.Tizona.LowACC.HighHaste = set_combine(sets.TP.Tizona.HighHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",})
	sets.TP.Tizona.MidACC.HighHaste = set_combine(sets.TP.Tizona.HighHaste,{
			ammo="Falcon Eye",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",})
	sets.TP.Tizona.HighACC.HighHaste = set_combine(sets.TP.Tizona.MidACC.HighHaste,{
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Olseni Belt",})		

	-- Sequence TP Sets --
	sets.TP.Sequence = {
			ammo="Ginsen",
			head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	sets.TP.Sequence.LowACC = set_combine(sets.TP.Sequence,{
			ammo="Ginsen",
			head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Sequence.MidACC = set_combine(sets.TP.Sequence.LowACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Assim. Charuqs +3",
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Sequence.HighACC = set_combine(sets.TP.Sequence.MidACC,{
			ammo="Falcon Eye",
			head="Malignance Chapeau",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Assim. Charuqs +3",
			neck="Mirage Stole +2",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})

	-- March x2 + Haste + Samba --
	sets.TP.Sequence.MidHaste = set_combine(sets.TP.Sequence.MidHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			left_ring="Petrov Ring",
			right_ring="Ilabrat Ring",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",})
	sets.TP.Sequence.LowACC.MidHaste = set_combine(sets.TP.Sequence.MidHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			waist="Windbuffet Belt +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Sequence.MidACC.MidHaste = set_combine(sets.TP.Sequence.MidHaste,{
			ammo="Falcon Eye",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",})
	sets.TP.Sequence.HighACC.MidHaste = set_combine(sets.TP.Sequence.MidACC.MidHaste,{
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
			
	-- March x2 + (Embrava or Haste) --
	sets.TP.Sequence.HighHaste = {
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			left_ring="Petrov Ring",
			right_ring="Ilabrat Ring",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",}
	sets.TP.Sequence.LowACC.HighHaste = set_combine(sets.TP.Sequence.HighHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",})
	sets.TP.Sequence.MidACC.HighHaste = set_combine(sets.TP.Sequence.HighHaste,{
			ammo="Falcon Eye",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",})
	sets.TP.Sequence.HighACC.HighHaste = set_combine(sets.TP.Sequence.MidACC.HighHaste,{
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Olseni Belt",})
			
	-- Club TP Sets --
	sets.TP.Club = {
			ammo="Ginsen",
			head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},}
	sets.TP.Club.LowACC = set_combine(sets.TP.Club,{
			ammo="Ginsen",
			head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Club.MidACC = set_combine(sets.TP.Club.LowACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Assim. Charuqs +3",
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Digni. Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Club.HighACC = set_combine(sets.TP.Club.MidACC,{
			ammo="Falcon Eye",
			head="Malignance Chapeau",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Assim. Charuqs +3",
			neck="Mirage Stole +2",
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})

	-- March x2 + Haste + Samba --
	sets.TP.Club.MidHaste = set_combine(sets.TP.Club.MidHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			left_ring="Petrov Ring",
			right_ring="Ilabrat Ring",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",})
	sets.TP.Club.LowACC.MidHaste = set_combine(sets.TP.Club.MidHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			waist="Windbuffet Belt +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Club.MidACC.MidHaste = set_combine(sets.TP.Club.MidHaste,{
			ammo="Falcon Eye",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",})
	sets.TP.Club.HighACC.MidHaste = set_combine(sets.TP.Club.MidACC.MidHaste,{
			waist="Olseni Belt",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
			
	-- March x2 + (Embrava or Haste) --
	sets.TP.Club.HighHaste = {
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
			left_ring="Petrov Ring",
			right_ring="Ilabrat Ring",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",}
	sets.TP.Club.LowACC.HighHaste = set_combine(sets.TP.Club.HighHaste,{
			left_ear="Cessance Earring",
            right_ear="Suppanomimi",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",})
	sets.TP.Club.MidACC.HighHaste = set_combine(sets.TP.Club.HighHaste,{
			ammo="Falcon Eye",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",})
	sets.TP.Club.HighACC.HighHaste = set_combine(sets.TP.Club.MidACC.HighHaste,{
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Olseni Belt",})	
			
	sets.TP.Learn = set_combine(sets.TP,{
			ammo="Mavi Tathlum",
			head="Luh. Keffiyeh +3",
			neck="Incanter's Torque",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body="Assim. Jubbah +3",
			hands="Assim. Bazubands +3",
			left_ring="Hetairoi Ring",
			right_ring="Ilabrat Ring",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			waist="Olseni Belt",
			legs="Hashishin Tayt +1",
			feet={ name="Luhlaza Charuqs +3", augments={'Enhances "Diffusion" effect',}},})
			
	-- DT/DeathDT Sets --
	sets.DT = {
			ammo="Staunch Tathlum",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			left_ring="Ayanmo Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",}

	sets.DeathDT = set_combine(sets.DT,{
			ammo="Staunch Tathlum",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Sanare Earring",
			right_ear="Etiolation Earring",
			left_ring="Warden's Ring",
			right_ring="Eihwaz Ring",
			back="Moonbeam Cape",})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.DT,{
			ammo="Ginsen",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Hybrid.LowACC = set_combine(sets.TP.Hybrid,{
			ammo="Ginsen",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid.LowACC,{
			ammo="Ginsen",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			ammo="Ginsen",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Mirage Stole +2",
			waist="Reiki Yotai",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})

	-- WS Base Set --
	sets.WS = {
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS.LowACC = set_combine(sets.WS,{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS.MidACC = set_combine(sets.WS.LowACC,{
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			right_ear="Telos Earring",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},})
			
	-- WS Sets --

	-- Savage Blade --
	sets.WS["Savage Blade"] = {
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Caro Necklace",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},}
	sets.WS["Savage Blade"].LowACC = set_combine(sets.WS["Savage Blade"],{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Caro Necklace",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})
	sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Savage Blade"].LowACC,{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Savage Blade"].MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})			

	-- Expiacion --
	sets.WS.Expiacion = {
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Caro Necklace",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},}
	sets.WS.Expiacion.LowACC = set_combine(sets.WS.Expiacion,{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Caro Necklace",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})
	sets.WS.Expiacion.MidACC = set_combine(sets.WS.Expiacion.LowACC,{
			ammo="Floestone",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS.Expiacion.HighACC = set_combine(sets.WS.Expiacion.MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
			
	-- Chant du Cygne --
	sets.WS["Chant du Cygne"] = {
			ammo="Jukukik Feather",
			head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body="Abnoba Kaftan",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','Crit. hit damage +1%','DEX+14','Accuracy+9','Attack+13',}},
			left_ring="Begrudging Ring",
			right_ring="Ilabrat Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+16 Attack+16','Crit.hit rate+4','DEX+13','Accuracy+10','Attack+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+14 Attack+14','Crit. hit damage +3%','DEX+15','Attack+6',}},}
	sets.WS["Chant du Cygne"].LowACC = set_combine(sets.WS["Chant du Cygne"],{
			ammo="Jukukik Feather",
			head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','Crit. hit damage +1%','DEX+14','Accuracy+9','Attack+13',}},
			left_ring="Begrudging Ring",
			right_ring="Ilabrat Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+16 Attack+16','Crit.hit rate+4','DEX+13','Accuracy+10','Attack+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+14 Attack+14','Crit. hit damage +3%','DEX+15','Attack+6',}},})
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"].LowACC,{
			ammo="Falcon Eye",
			neck="Fotia Gorget",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','Crit. hit damage +1%','DEX+14','Accuracy+9','Attack+13',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			legs={ name="Herculean Trousers", augments={'Accuracy+16 Attack+16','Crit.hit rate+4','DEX+13','Accuracy+10','Attack+15',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+14 Attack+14','Crit. hit damage +3%','DEX+15','Attack+6',}},})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			left_ear="Mache Earring",
			right_ear="Mache Earring",
			body={ name="Herculean Vest", augments={'Accuracy+21 Attack+21','Crit. hit damage +1%','DEX+14','Accuracy+9','Attack+13',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			legs={ name="Herculean Trousers", augments={'Accuracy+16 Attack+16','Crit.hit rate+4','DEX+13','Accuracy+10','Attack+15',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})			

	-- Vorpal Blade --
	sets.WS["Vorpal Blade"] = {
			ammo="Floestone",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Vulcan's Pearl",
            body={ name="Herculean Vest", augments={'Accuracy+24','"Triple Atk."+3','STR+13','Attack+13',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+16','Crit. hit damage +4%','STR+9','Attack+14',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Crit.hit rate+1','STR+13','Attack+5',}},}
	sets.WS["Vorpal Blade"].LowACC = set_combine(sets.WS["Vorpal Blade"],{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Vulcan's Pearl",
			hands={ name="Herculean Gloves", augments={'Accuracy+16','Crit. hit damage +4%','STR+9','Attack+14',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Crit.hit rate+1','STR+13','Attack+5',}},})
	sets.WS["Vorpal Blade"].MidACC = set_combine(sets.WS["Vorpal Blade"].LowACC,{
			ammo="Floestone",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			waist="Fotia Belt"})
	sets.WS["Vorpal Blade"].HighACC = set_combine(sets.WS["Vorpal Blade"].MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
            body={ name="Herculean Vest", augments={'Accuracy+24','"Triple Atk."+3','STR+13','Attack+13',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+22 Attack+22','Crit.hit rate+1','STR+13','Attack+5',}},})			

	-- Flat Blade --
	sets.WS["Flat Blade"] = {
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
			neck="Caro Necklace",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"}
	sets.WS["Flat Blade"].LowACC = set_combine(sets.WS["Flat Blade"],{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
			neck="Caro Necklace",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS["Flat Blade"].MidACC = set_combine(sets.WS["Flat Blade"].LowACC,{
			ammo="Floestone",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS["Flat Blade"].HighACC = set_combine(sets.WS["Flat Blade"].MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
			
	-- Sanguine Blade --
	sets.WS["Sanguine Blade"] = {
			ammo="Hydrocera",
			head="Pixie Hairpin +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +3",
			hands="Regal Cuffs",
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Assim. Charuqs +3"}
	sets.WS["Sanguine Blade"].LowACC = set_combine(sets.WS["Sanguine Blade"],{
			ammo="Hydrocera",
			head="Pixie Hairpin +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +3",
			hands="Regal Cuffs",
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Assim. Charuqs +3"})
	sets.WS["Sanguine Blade"].MidACC = set_combine(sets.WS["Sanguine Blade"].LowACC,{
			ammo="Hydrocera",
			head="Pixie Hairpin +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +3",
			hands="Regal Cuffs",
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Assim. Charuqs +3"})
	sets.WS["Sanguine Blade"].HighACC = set_combine(sets.WS["Sanguine Blade"].MidACC,{
			ammo="Falcon Eye",
			head="Pixie Hairpin +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +3",
			hands="Regal Cuffs",
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Assim. Charuqs +3"})

	-- Requiescat --
	sets.WS.Requiescat = {
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS.Requiescat.LowACC = set_combine(sets.WS.Requiescat,{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat.LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{
			ammo="Falcon Eye",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})

	-- Realmrazer --
	sets.WS["Realmrazer"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS["Realmrazer"].LowACC = set_combine(sets.WS["Realmrazer"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS["Realmrazer"].MidACC = set_combine(sets.WS["Realmrazer"].LowACC,{
			ammo="Falcon Eye",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			waist="Fotia Belt"})
	sets.WS["Realmrazer"].HighACC = set_combine(sets.WS["Realmrazer"].MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			body={ name="Rawhide Vest", augments={'DEX+10','STR+7','INT+7',}},
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet="Jhakri Pigaches +2"})			

	-- True Strike --
	sets.WS["True Strike"] = {
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Assim. Jubbah +3",
			hands={ name="Herculean Gloves", augments={'Attack+26','Weapon skill damage +2%','DEX+7','Accuracy+10',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"}
	sets.WS["True Strike"].LowACC = set_combine(sets.WS["True Strike"],{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			hands={ name="Herculean Gloves", augments={'Attack+26','Weapon skill damage +2%','DEX+7','Accuracy+10',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS["True Strike"].MidACC = set_combine(sets.WS["True Strike"].LowACC,{
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
	sets.WS["True Strike"].HighACC = set_combine(sets.WS["True Strike"].MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			body="Assim. Jubbah +3",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})			

	-- Judgment --
	sets.WS["Judgment"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"}
	sets.WS["Judgment"].LowACC = set_combine(sets.WS["Judgment"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS["Judgment"].MidACC = set_combine(sets.WS["Judgment"].LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS["Judgment"].HighACC = set_combine(sets.WS["Judgment"].MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})			

	-- Black Halo --
	sets.WS["Black Halo"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','Weapon skill damage +2%','MND+10','Accuracy+11',}},}
	sets.WS["Black Halo"].LowACC = set_combine(sets.WS["Black Halo"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','Weapon skill damage +2%','MND+10','Accuracy+11',}},})
	sets.WS["Black Halo"].MidACC = set_combine(sets.WS["Black Halo"].LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS["Black Halo"].HighACC = set_combine(sets.WS["Black Halo"].MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})

	-- Flash Nova --
	sets.WS["Flash Nova"] = {
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"}
	sets.WS["Flash Nova"].LowACC = set_combine(sets.WS["Flash Nova"],{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS["Flash Nova"].MidACC = set_combine(sets.WS["Flash Nova"].LowACC,{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
	sets.WS["Flash Nova"].HighACC = set_combine(sets.WS["Flash Nova"].MidACC,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Fotia Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})

	-- Enmity Set --
	sets.Enmity = {
			ammo="Iron Gobbet",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			neck="Unmoving Collar +1",
			body="Emet Harness +1",
			hands="Aya. Manopolas +2",
			waist="Goading Belt",
			left_ring="Begrudging Ring",
			right_ring="Eihwaz Ring",
			back="Reiki Cloak",}
			
	-- JA Sets --
	sets.JA = {}
	sets.JA.Provoke = set_combine(sets.Enmity,{})
	sets.JA.Meditate = set_combine(sets.Enmity,{})
	sets.JA.Hasso = set_combine(sets.Enmity,{})
	sets.JA.Swordplay = set_combine(sets.Enmity,{})
	sets.JA.Vallation = set_combine(sets.Enmity,{})
	sets.JA.Lunge = set_combine(sets.Lunge,{})
	sets.JA.Pflug = set_combine(sets.Enmity,{})
	sets.JA.Lunge = set_combine(sets.Lunge,{})
	sets.JA.Pflug = set_combine(sets.Enmity,{})
	sets.JA.Valiance = set_combine(sets.Enmity,{})
	sets.JA.Sulpor = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Tellus = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Flabra = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Gelus = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Ignis = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Unda = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Tenebrae = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Lux = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA['Azure Lore'] = {hands={ name="Luh. Bazubands +2", augments={'Enhances "Azure Lore" effect',}},}
	sets.JA.Diffusion = {feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},}
	sets.JA.Enchainment = {body={ name="Luhlaza Jubbah +2", augments={'Enhances "Enchainment" effect',}},}
	sets.JA.Convergence = {head={ name="Luh. Keffiyeh +2", augments={'Enhances "Convergence" effect',}},}
	sets.JA.Efflux = {legs="Hashishin Tayt +1"}
	sets.JA['Chain Affinity'] = {head="Hashishin Kavuk +1",feet="Assim. Charuqs +3"}
	sets.JA['Burst Affinity'] = {Legs="Assim. Shalwar +3"}
	sets.JA.Convert = {			
			ammo="Sapience Orb",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Loricate Torque +1",
			left_ear="Etiolation Earring",
			right_ear="Ethereal Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands="Umuthi Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}}

	sets.JA.Lunge = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +2"}

	-- Waltz Set --
	sets.Waltz = {
			head="Jhakri Coronal +2",
			neck="Unmoving Collar +1",
			body="Passion Jacket",
            left_ear="Terra's Pearl",
            right_ear="Enchanter Earring +1",
			hands={ name="Herculean Gloves", augments={'Magic dmg. taken -4%','"Waltz" potency +10%','Damage taken-2%','Accuracy+9 Attack+9','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
			left_ring="Asklepian Ring",
			right_ring="Valseur's Ring",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Chaac Belt",
			feet={ name="Rawhide Boots", augments={'STR+10','Attack+15','"Store TP"+5',}},}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Pinga Tunic",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			waist="Witful Belt",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			legs="Pinga Pants",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},}

	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = {
			ammo="Impatients",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Magoraga Beads",
			body="Passion Jacket",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			waist="Witful Belt",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			legs="Pinga Pants",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},}		
			
	-- Midcast Base Set --
	sets.Midcast = set_combine(sets.Precast.FastCast,{
			ammo="Mavi Tathlum",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Sangoma Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Witful Belt",
			legs="Pinga Pants",
			feet={ name="Luhlaza Charuqs +2", augments={'Enhances "Diffusion" effect',}},})

	sets.Midcast.Utsusemi = {
			ammo="Impatients",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Magoraga Beads",
			body="Passion Jacket",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			waist="Witful Belt",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			legs="Pinga Pants",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},}		
			
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
			ammo="Mavi Tathlum",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Orunmila's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Pinga Tunic",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Olympus Sash",
			legs="Pinga Pants",
			feet={ name="Luhlaza Charuqs +2", augments={'Enhances "Diffusion" effect',}},})

	-- Healing Magic Base Set --
	sets.Midcast['Healing Magic'] = {
			ammo="Hydrocera",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body="Pinga Tunic",
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Bishop's Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}			
			
	-- Enhancing Magic Base Set --
	sets.Midcast['Enhancing Magic'] = {
			ammo="Hydrocera",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Olympus Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Jhakri Pigaches +2"}

	-- Barspell Base Set --
	sets.Midcast.Barspell = {
			ammo="Hydrocera",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Olympus Sash",
			legs="Shedir Seraweels",
			feet="Jhakri Pigaches +2"}

	-- Flash Set --		
	sets.Midcast.Flash = set_combine(sets.Enmity,{})
			
	-- Aquaveil Set --
	sets.Midcast.Aquaveil = {
			ammo="Hydrocera",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Olympus Sash",
			legs="Shedir Seraweels",
			feet="Jhakri Pigaches +2"}		

	-- Regen Sets --
	sets.Midcast.Regen = {	
			ammo="Hydrocera",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Bishop's Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}
			
	-- Refresh Set --
	sets.Midcast.Refresh = {
			ammo="Hydrocera",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Olympus Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Jhakri Pigaches +2"}		

	-- Refresh Self Set --
	sets.Midcast.Refreshself = {
			ammo="Hydrocera",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Gishdubar Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Jhakri Pigaches +2"}	
			
	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Precast.FastCast,{
			ammo="Hydrocera",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Stone Gorget",
			left_ear="Earthcry Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Siegel Sash",
			legs="Shedir Seraweels",
			feet="Jhakri Pigaches +2"})
			
	-- Enfeebling Magic Base Set --
	sets.Midcast['Enfeebling Magic'] = {
			ammo="Hydrocera",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			left_ear="Dignitary's Earring",
			right_ear="Andoaa Earring",
			neck="Incanter's Torque",
			body="Jhakri Robe +2",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Luminary Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Erra Pendant",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Evanescence Ring",
			back="Perimede Cape",
			waist="Luminary Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Jhakri Pigaches +2"}
			
	-- Elemental Magic Base Set --
	sets.Midcast['Elemental Magic'] = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +2"}

	-- For Cure Spells & The Listed Healing Blue Magic --
	sets.Midcast.Cure = set_combine(sets.Precast.FastCast,{
			ammo="Hydrocera",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Pinga Tunic",
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Luminary Sash",
			legs="Pinga Pants",
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})

	sets.Midcast.SelfCure = set_combine(sets.Precast.FastCast,{
			ammo="Hydrocera",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Pinga Tunic",
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Asklepian Ring",
			back={ name="Rosmerta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
			waist="Gishdubar Sash",
			legs="Pinga Pants",
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})			
			
	-- For The Listed Physical Type Blue Magic --
	sets.Midcast.PhysicalBlueMagic = {
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Regal Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			waist="Eschan Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}

	-- Blue Magic STR Set --
	sets.Midcast.PhysicalBlueMagicSTR = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Incanter's Torque",
			left_ear="Vulcan's Pearl",
			right_ear="Vulcan's Pearl",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			waist="Eschan Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})

	-- Blue Magic DEX Set --
	sets.Midcast.PhysicalBlueMagicDEX = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Incanter's Torque",
			left_ear="Mache Earring",
			right_ear="Mache Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
		    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Chaac Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})

	-- Blue Magic VIT Set --
	sets.Midcast.PhysicalBlueMagicVIT = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Incanter's Torque",
			left_ear="Terra's Pearl",
			right_ear="Vulcan's Pearl",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			waist="Eschan Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})

	-- Blue Magic AGI Set --
	sets.Midcast.PhysicalBlueMagicAGI = set_combine(sets.Midcast.PhysicalBlueMagic,{
			ammo="Falcon Eye",
			head="Jhakri Coronal +2",
			neck="Incanter's Torque",
			left_ear="Infused Earring",
			right_ear="Auster's Pearl",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			waist="Eschan Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})

	-- For The Listed Magical Type Blue Magic --
	sets.Midcast.MagicalBlueMagic = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Luminary Sash",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}

	-- Magic Accuracy For The Listed Blue Magic --
	sets.Midcast.BlueMagicAccuracy = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Erra Pendant",
			left_ear="Dignitary's Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Luminary Sash",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}

	-- Stun Set For The Listed Blue Magic --
	sets.Midcast.BlueMagicStun = {
			ammo="Pemphredo Tathlum",
			head="Assim. Keffiyeh +3",
			neck="Erra Pendant",
			left_ear="Dignitary's Earring",
			right_ear="Regal Earring",
			body="Assim. Jubbah +3",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Luminary Sash",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}

	-- Buff Set For The Listed Blue Magic --
	sets.Midcast.BlueMagicBuff = {
			ammo="Mavi Tathlum",
			head="Luh. Keffiyeh +2",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Regal Earring",
			body="Assim. Jubbah +3",
			hands={ name="Rawhide Gloves", augments={'Mag. Acc.+15','INT+7','MND+7',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Luminary Sash",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			legs="Hashishin Tayt +1",
			feet={ name="Luhlaza Charuqs +2", augments={'Enhances "Diffusion" effect',}},}

	-- Breath Set For The Listed Blue Magic --
	sets.Midcast.BlueMagicBreath = {
			ammo="Pemphredo Tathlum",
			head="Luh. Keffiyeh +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet={ name="Luhlaza Charuqs +2", augments={'Enhances "Diffusion" effect',}},}

	-- BlueMagic Base Set For Any Non Listed Blue Magic --
	sets.Midcast.BlueMagic = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Dignitary's Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Luminary Sash",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			legs="Assim. Shalwar +3",
			feet="Jhakri Pigaches +2"}
			
	-- Sudden Lunge --
	sets.Midcast['Sudden Lunge'] = set_combine(sets.Midcast.PhysicalBlueMagic_AGI,{
			ammo="Pemphredo Tathlum",
			head="Assim. Keffiyeh +3",
			neck="Erra Pendant",
			left_ear="Dignitary's Earring",
			right_ear="Regal Earring",
			body="Assim. Jubbah +3",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Luminary Sash",
			back={ name="Cornflower Cape", augments={'MP+20','DEX+4','Blue Magic skill +9',}},
			legs="Assim. Shalwar +3",
			feet="Aya. Gambieras +2",})			

	-- Fantod --
	sets.Midcast.Fantod = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Sapience Orb",
			head="Aya. Zucchetto +2",
			body="Emet Harness +1",
			hands="Assim. Bazu. +3",
            legs="Enif Cosciales",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			neck="Unmoving Collar +1",
			waist="Goading Belt",
			left_ring="Begrudging Ring",
			right_ring="Eihwaz Ring",
			back="Reiki Cloak",})
			
	-- Magic Hammer --
	sets.Midcast['Magic Hammer'] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Hydrocera",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Luminary Sash",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +2"})

	-- Subduction --
	sets.Midcast.Subduction = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Chaac Belt",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})

	-- Dream Flower --
	sets.Midcast["Dream Flower"] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Pixie Hairpin +1",
			neck="Erra Pendant",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})
			
	-- Tenebral Crush --
	sets.Midcast["Tenebral Crush"] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Pixie Hairpin +1",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})

	-- Anvil Lightning --
	sets.Midcast["Anvil Lightning"] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})			

	-- Geist Wall For The Listed Blue Magic --
	sets.Midcast["Geist Wall"] = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Erra Pendant",
			left_ear="Dignitary's Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Luminary Sash",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
			
	-- Spectral Floe --
	sets.Midcast["Spectral Floe"] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})

	-- Scouring Spate --
	sets.Midcast["Scouring Spate"] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})			
			
	-- Searing Tempest --
	sets.Midcast["Searing Tempest"] = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})			

	-- Entomb --
	sets.Midcast.Entomb = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			waist="Yamabuki-no-Obi",
			legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
			feet="Jhakri Pigaches +2"})	
			
	-- Yawn --
	sets.Midcast.Yawn = set_combine(sets.Midcast.MagicalBlueMagic,{
			ammo="Pemphredo Tathlum",
			head="Assim. Keffiyeh +3",
			neck="Sanctity Necklace",
			left_ear="Dignitary's Earring",
			right_ear="Regal Earring",
			body="Jhakri Robe +2",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Luminary Sash",
		    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
			legs="Assim. Shalwar +3",
			feet="Jhakri Pigaches +2"})	
			
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
	elseif BlueMagicUnbridled:contains(spell.english) and not buffactive['Unbridled Learning'] then
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
            equipSet = sets.WS
            if equipSet[spell.english] then
                equipSet = equipSet[spell.english]
            end
            if equipSet[AccArray[AccIndex]] then
                equipSet = equipSet[AccArray[AccIndex]]
            end
				if spell.english == "Chant du Cygne" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
				end
				if spell.english == "Vorpal Blade" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Requiescat" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Regal Earring"})
				end
				if spell.english == "Expiacion" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Savage Blade" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
            end
            equip(equipSet)
        elseif spell.type=="JobAbility" then
            if sets.JA[spell.english] then
                equip(sets.JA[spell.english])
            end
	elseif spell.type == "JobAbility" or spell.type == "Ward" or spell.type == "Effusion" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Rune" then
		equip(sets.Enmity)
		elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
            if string.find(spell.english,'Utsusemi') then
                if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                    cancel_spell()
                    add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
                    return
                else
                    equip(sets.Precast.Utsusemi)
                end
            else
                equip(sets.Precast.FastCast)
            end
        elseif spell.type == 'Step' then
            equip(sets.Step)
        elseif string.find(spell.type,'Flourish') then
            equip(sets.Flourish)
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
		elseif (string.find(spell.english,'Cur')) and spell.english ~= "Cursna" then
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
		elseif (string.find(spell.english,'Cur') or BlueMagicHealing:contains(spell.english)) and spell.english ~= "Cursna" then
			if string.find(spell.english,'Cure') or BlueMagicHealing:contains(spell.english) then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
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
		elseif PhysicalBlueMagic:contains(spell.english) or PhysicalBlueMagicSTR:contains(spell.english) or PhysicalBlueMagicDEX:contains(spell.english) or PhysicalBlueMagicVIT:contains(spell.english) or PhysicalBlueMagicAGI:contains(spell.english) then
			if PhysicalBlueMagicSTR:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagicSTR
			elseif PhysicalBlueMagicDEX:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagicDEX
			elseif PhysicalBlueMagicVIT:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagicVIT
			elseif PhysicalBlueMagicAGI:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagicAGI
			elseif PhysicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic
			end
			if buffactive['Chain Affinity'] then
				equipSet = set_combine(equipSet,{head="Hashishin Kavuk +1",right_ring="Mujin Band",feet="Assim. Charuqs +3"})
			end
			if buffactive.Efflux then
				equipSet = set_combine(equipSet,{legs="Hashishin Tayt +1"})
			end
		elseif BlueMagicBuff:contains(spell.english) or spell.english == "Occultation" or "Nat. Meditation" or "Cocoon" or "Metallic Body" or "Erratic Flutter" or "Carcharian Verve" or "Mighty Guard"then
			if BlueMagicBuff:contains(spell.english) then
				equipSet = equipSet.BlueMagicBuff
			elseif spell.english == "BlueMagicBuff" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Fantod" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Fantod" then
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
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Dream Flower" or "Sporific" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Dream Flower" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Tenebral Crush" or "Palling Salvo" or "Dream Flower" or "Absolute Terror" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Tenebral Crush" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Yawn" or "Sheep Song" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Yawn" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Geist Wall" or "Blank Gaze" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.BlueMagicAccuracy
			elseif spell.english == "Geist Wall" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Sudden Lunge" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Sudden Lunge" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Anvil Lightning" or "Charged Whisker"then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Anvil Lightning" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Spectral Floe" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Spectral Floe" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Searing Tempest" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Searing Tempest" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Entomb" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Entomb" then
				equipSet = equipSet[spell.name]
			end
		elseif MagicalBlueMagic:contains(spell.english) or spell.english == "Scouring Spate" then
			if MagicalBlueMagic:contains(spell.english) then
				equipSet = equipSet.MagicalBlueMagic
			elseif spell.english == "Scouring Spate" then
				equipSet = equipSet[spell.name]
			end
			if buffactive['Burst Affinity'] then
				equipSet = set_combine(equipSet[spell.name],{hands="Regal Cuffs",right_ring="Mujin Band",legs="Assim. Shalwar +3"})
			end
			if buffactive.Convergence then
				equipSet = set_combine(equipSet,{head="Luh. Keffiyeh +2"})
			end
		elseif BlueMagicAccuracy:contains(spell.english) then
			equipSet = equipSet.BlueMagicAccuracy
		elseif BlueMagicStun:contains(spell.english) then
			equipSet = equipSet.BlueMagicStun
		elseif BlueMagicBuff:contains(spell.english) then
			equipSet = equipSet.BlueMagicBuff
		elseif BlueMagicDiffusion:contains(spell.english) and buffactive.Diffusion then
			equipSet = set_combine(equipSet,{feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},})
		elseif BlueMagicBreath:contains(spell.english) then
			equipSet = equipSet.BlueMagicBreath
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
	elseif Armor == 'DeathDT' then
		equip(sets.DeathDT)
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
		if (buffactive['Mighty Guard'] and (buffactive.Haste or buffactive.March or buffactive["Honor March"]) and buffactive['Geo-Haste']) or (buffactive.March == 2 and buffactive.Haste and buffactive['Geo-Haste'] and buffactive['Mighty Guard']) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if (buffactive['Mighty Guard'] and (buffactive.Haste or buffactive.March or buffactive['Geo-Haste'])) or (buffactive.March == 1 or buffactive["Honor March"] and buffactive.Haste and buffactive['Geo-Haste'] and equipSet["MidHaste"]) or (buffactive.March == 2 and (buffactive.Haste or buffactive['Geo-Haste'] and buffactive['Mighty Guard'])) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if (buffactive['Mighty Guard'] and (buffactive.Haste and buffactive.March == 2 or buffactive["Honor March"]) and (buffactive.March == 2  or buffactive["Honor March"] and (buffactive.March and buffactive.Haste and buffactive['Mighty Guard']))) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive['Mighty Guard'] and (buffactive.Haste or buffactive.March and buffactive["Honor March"]) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if (buffactive.March == 1 and buffactive.Haste and buffactive["Geo-Haste"] and buffactive['Mighty Guard']) or (buffactive.March == 2 or buffactive["Honor March"] or buffactive['Mighty Guard']) and equipSet["MidHaste"] then
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
	elseif command == 'C15' then -- DeathDT Toggle --
		if Armor == 'DeathDT' then
			Armor = 'None'
			add_to_chat(123,'DeathDT Set: [Unlocked]')
		else
			Armor = 'DeathDT'
			add_to_chat(158,'DeathDT Set: [Locked]')
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
	elseif player.sub_job == 'RDM' then
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