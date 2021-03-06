-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --
include('how_about_no.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Shooting/QD/TP/WS. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {'Movement', 'Regen'} -- Default Idle Set Is Movement --
	Armor = 'None'
	define_roll_values()
	warning = false
	Lock_Main = 'OFF' -- Set Default Lock Main Weapon ON or OFF Here --
	AutoGunWS = "Last Stand" -- Set Auto Gun WS Here --
	AutoMode = 'OFF' -- Set Default Auto RA/WS ON or OFF Here --
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	ammo_warning_limit = 10 -- Set Ammo Limit Check Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	ACC_Shots = S{"Light Shot","Dark Shot"}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1="CoursersRoll", SC2="DiaII", SC3="LightShot"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			head="Oce. Headpiece +1",
			neck="Bathy Choker +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
            body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
            hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Flume Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Crit.hit rate+2','Pet: DEX+11','"Refresh"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
            body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
            hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})

	-- QD Sets --
	sets.QD = {
			range="Molybdosis",
			ammo="Animikii Bullet",
			head="Chass. Tricorne",
			body={ name="Mirke Wardecors", augments={'"Mag.Atk.Bns."+4','"Quick Draw" ability delay -5',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			legs="Mummu Kecks +1",
			feet="Chasseur's Bottes",
			neck="Baetyl Pendant",
			waist="Eschan Stone",
			left_ear="Friomisi Earring",
			right_ear="Digni. Earring",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Gunslinger's Cape", augments={'Enmity-2','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -3','Weapon skill damage +4%',}},}
	sets.QD.MidACC = set_combine(sets.QD,{})
	sets.QD.HighACC = set_combine(sets.QD.MidACC,{})

	-- PDT/MDT Sets --
	sets.PDT = {
            head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
            hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
            back="Moonbeam Cape",
            waist="Flume Belt +1",
            legs="Mummu Kecks +1",
            feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},}

	sets.MDT = set_combine(sets.PDT,{
            head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
            hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
            back="Moonbeam Cape",
            waist="Flume Belt +1",
            legs="Mummu Kecks +1",
            feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})

	-- Roll Set --
	sets.Rolls = set_combine(sets.PDT,{
			range={ name="Compensator", augments={'DMG:+15','Rng.Atk.+15','"Mag.Atk.Bns."+15',}}, 
			head="Lanun Tricorne +1",
			hands="Chasseur's Gants +1",
			ring1="Luzaf's Ring",
			ring2="Barataria Ring"})

	-- Preshot --
	sets.Preshot = {
			waist="Yemaya Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet="Meghanada Jambeaux +1"}

	-- Shooting Base Set --
	sets.Midshot = {}

	-- Death Penalty Sets --
	sets.Midshot['Death Penalty'] = {}
	sets.Midshot['Death Penalty'].MidACC = set_combine(sets.Midshot['Death Penalty'],{})
	sets.Midshot['Death Penalty'].HighACC = set_combine(sets.Midshot['Death Penalty'].MidACC,{})

	-- Armageddon Sets --
	sets.Midshot.Armageddon = {}
	sets.Midshot.Armageddon.MidACC = set_combine(sets.Midshot.Armageddon,{})
	sets.Midshot.Armageddon.HighACC = set_combine(sets.Midshot.Armageddon.MidACC,{})

	-- Molybdosis Sets --
	sets.Midshot.Molybdosis = {}
	sets.Midshot.Molybdosis.MidACC = set_combine(sets.Midshot.Molybdosis,{})
	sets.Midshot.Molybdosis.HighACC = set_combine(sets.Midshot.Molybdosis.MidACC,{})

	-- Melee Sets --
	sets.Melee = {
			main="Fettering Blade",
			sub="Nusku Shield",
			range="Molybdosis",
			ammo="Eminent Bullet",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			waist="Reiki Yotai",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','AGI+8','Accuracy+15',}},
			back="Enuma Mantle",}
	sets.Melee.MidACC = set_combine(sets.Melee,{
			main="Fettering Blade",
			sub="Nusku Shield",
			range="Molybdosis",
			ammo="Eminent Bullet",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Enuma Mantle",
			waist="Reiki Yotai",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','AGI+8','Accuracy+15',}},})
	sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{
			main="Fettering Blade",
			sub="Nusku Shield",
			range="Molybdosis",
			ammo="Eminent Bullet",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Enuma Mantle",
			waist="Reiki Yotai",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','AGI+8','Accuracy+15',}},})

	-- WS Base Set --
	sets.WS = {
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			back="Enuma Mantle",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS.MidACC = set_combine(sets.WS,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})

	-- Savage Blade Set --
	sets.WS['Savage Blade'] = {
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			back="Enuma Mantle",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS['Savage Blade'].MidACC = set_combine(sets.WS['Savage Blade'],{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS['Savage Blade'].HighACC = set_combine(sets.WS['Savage Blade'].MidACC,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})

	-- Vorpal Blade Set --
	sets.WS['Vorpal Blade'] = {
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			back="Enuma Mantle",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS['Vorpal Blade'].MidACC = set_combine(sets.WS['Vorpal Blade'],{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS['Vorpal Blade'].HighACC = set_combine(sets.WS['Vorpal Blade'].MidACC,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})

	-- Requiescat Set --
	sets.WS.Requiescat = {
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			back="Enuma Mantle",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
            hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
			
	-- Last Stand Sets --
	sets.WS["Last Stand"] = {
			ammo="Eminent Bullet",
	        head="Meghanada Visor +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meghanada Cuirie +2",
			hands="Meghanada Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
			waist="Fotia Belt",
			back={ name="Gunslinger's Cape", augments={'Enmity-2','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -3','Weapon skill damage +4%',}},
			legs="Meghanada Chausses +1",
			feet="Meghanada Jambeaux +1"}
	sets.WS["Last Stand"].MidACC = set_combine(sets.WS["Last Stand"],{
            body="Meghanada Cuirie +2",
			hands="Meghanada Gloves +2",
			neck="Fotia Gorget",
			feet="Meghanada Jambeaux +1"})
	sets.WS["Last Stand"].HighACC = set_combine(sets.WS["Last Stand"].MidACC,{
	        head="Meghanada Visor +1",			
            body="Meghanada Cuirie +2",
			hands="Meghanada Gloves +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			legs="Meghanada Chausses +1",
			feet="Meghanada Jambeaux +1"})

	-- Wildfire Sets --
	sets.WS.Wildfire = {
			ammo="Eminent Bullet",
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Gunslinger's Cape", augments={'Enmity-2','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -3','Weapon skill damage +4%',}},
			waist="Eschan Stone",			
			legs="Mummu Kecks +1",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}
	sets.WS.Wildfire.MidACC = set_combine(sets.WS.Wildfire,{
			ammo="Eminent Bullet",
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",			
			legs="Mummu Kecks +1",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},})
	sets.WS.Wildfire.HighACC = set_combine(sets.WS.Wildfire.MidACC,{
			ammo="Eminent Bullet",
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",			
			legs="Mummu Kecks +1",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},})

	-- Leaden Salute Sets --
	sets.WS['Leaden Salute'] = {
			ammo="Eminent Bullet",
			head="Pixie Hairpin +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
			back={ name="Gunslinger's Cape", augments={'Enmity-2','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -3','Weapon skill damage +4%',}},
			waist="Eschan Stone",			
			legs="Mummu Kecks +1",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}
	sets.WS['Leaden Salute'].MidACC = set_combine(sets.WS['Leaden Salute'],{
			ammo="Eminent Bullet",
			head="Pixie Hairpin +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
			back={ name="Gunslinger's Cape", augments={'Enmity-2','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -3','Weapon skill damage +4%',}},
			waist="Eschan Stone",			
			legs="Mummu Kecks +1",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},})
	sets.WS['Leaden Salute'].HighACC = set_combine(sets.WS['Leaden Salute'].MidACC,{
			ammo="Eminent Bullet",
			head="Pixie Hairpin +1",
			neck="Sanctity Necklace",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Archon Ring",
			right_ring="Shiva Ring +1",
			back={ name="Gunslinger's Cape", augments={'Enmity-2','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -3','Weapon skill damage +4%',}},
			waist="Eschan Stone",			
			legs="Mummu Kecks +1",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},})

	-- Elemental Obi --
	sets.Obi = {}
	sets.Obi.Lightning = {waist='Hachirin-no-Obi'}
	sets.Obi.Water = {waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {waist='Hachirin-no-Obi'}
	sets.Obi.Wind = {waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {waist='Hachirin-no-Obi'}
	sets.Obi.Light = {waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {waist='Hachirin-no-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA["Random Deal"] = {body="Lanun Frac +1"}
	sets.JA.Fold = {hands="Lanun Gauntlets +1"}
	sets.JA["Snake Eye"] = {legs="Lanun Culottes +1"}
	sets.JA["Wild Card"] = {feet="Lanun Boots +1"}

	-- Waltz Set --
	sets.Waltz = {
            head="Mummu Bonnet +1",
            neck="Unmoving Collar +1",
            left_ear="Terra's Pearl",
            right_ear="Terra's Pearl",
            body="Passion Jacket",
            hands="Plunderer's Armlets +1",
            left_ring="Asklepian Ring",
            right_ring="Valseur's Ring",
            legs="Plunderer's Culottes +1",
            back="Moonbeam Cape",
            waist="Chaac Belt",
			feet={ name="Rawhide Boots", augments={'STR+10','Attack+15','"Store TP"+5',}},}

	sets.Precast = {}
	--Fastcast Set --
	sets.Precast.FastCast = {
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Lebeche Ring",
			right_ring="Kishar Ring",
			waist="Ninurta's Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Lebeche Ring",
			right_ring="Kishar Ring",
			waist="Ninurta's Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},})

	-- Cure Set --
	sets.Midcast.Cure = {
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Solemnity Cape",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},}
	
    --Doom/Cursed Sets--
    sets.Doom = {
            left_ring="Purity Ring",
            right_ring="Defending Ring",
            waist="Gishdubar Sash",}
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "CorsairRoll" and buffactive[spell.english] then -- Change Any Rolls To Double-Up When You Have A Roll Up --
		cancel_spell()
		send_command('doubleup')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ' .. player.tp)
	elseif spell.action_type == 'Ranged Attack' then
		if spell.target.distance > 24.9 then -- Cancel Ranged Attack If You Are Out Of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
			return
		else
			if AutoMode == 'ON' and not buffactive.amnesia then -- Auto WS/Triple Shot --
				if player.tp >= 1000 then
					cancel_spell()
					autoWS()
				elseif windower.ffxi.get_ability_recasts()[84] < 1 then
					cancel_spell()
					send_command('TripleShot')
				end
			end
		end
	elseif spell.type == 'WeaponSkill' and player.status == 'Engaged' then
		if spell.skill == 'Marksmanship' then
			if spell.target.distance > 16+target_distance then
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				return
			end
		else
			if spell.target.distance > target_distance then
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				return
			end
		end
	end
end

function precast(spell,action)
	if spell.action_type == 'Ranged Attack' or spell.type == "WeaponSkill" then
		if player.equipment.ammo == "Animikii Bullet" then -- Cancel Ranged Attack or WS If You Have Animikii Bullet Equipped --
			cancel_spell()
			add_to_chat(123, spell.name .. ' Canceled: [Animikii Bullet Equipped!]')
			return
		else
			local check_ammo
			local check_ammo_count = 1
			if spell.action_type == 'Ranged Attack' then
				check_ammo = player.equipment.ammo
				if player.equipment.ammo == 'empty' or player.inventory[check_ammo].count <= check_ammo_count then
					add_to_chat(123, spell.name..' Canceled: [Out of Ammo]')
					cancel_spell()
					return
				else
					equip(sets.Preshot,(buffactive["Triple Shot"] and {body="Chasseur's Frac +1"} or {}))
					if player.inventory[check_ammo].count <= ammo_warning_limit and player.inventory[check_ammo].count > 1 and not warning then
						add_to_chat(8, '***** [Low Ammo Warning!] *****')
						warning = true
					elseif player.inventory[check_ammo].count > ammo_warning_limit and warning then
						warning = false
					end
				end
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
					if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
						equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
					end
					if spell.english == "Last Stand" and (player.tp > 2990 or buffactive.Sekkanoki) then -- Equip Altdorf's Earring and Wilhelm's Earring When You Have 3000 TP or Sekkanoki For Last Stand --
						equipSet = set_combine(equipSet,{ear1="Altdorf's Earring",ear2="Wilhelm's Earring"})
					end
					equip(equipSet)
				end
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
			if spell.english == "Snake Eye" then -- Auto Double-Up After You Use Snake Eye --
				send_command('@wait 1;input /ja Double-Up <me>')
			end
		end
	elseif spell.type == "CorsairRoll" or spell.english == "Double-Up" then
		equip(sets.Rolls)
		if spell.english == "Tactician's Roll" then -- Change Tactician's Roll Equipment Here --
			equip({body="Chasseur's Frac +1"})
		elseif spell.english == "Caster's Roll" then -- Change Caster's Roll Equipment Here --
			equip({legs="Chas. Culottes +1"})
		elseif spell.english == "Courser's Roll" then -- Change Courser's Roll Equipment Here --
			equip({feet="Chass. Bottes +1"})
		elseif spell.english == "Blitzer's Roll" then -- Change Blitzer's Roll Equipment Here --
			equip({head="Chass. Tricorne +1"})
		elseif spell.english == "Allies' Roll" then -- Change Allies' Roll Equipment Here --
			equip({hands="Chasseur's Gants +1"})
		end
	elseif spell.type == "CorsairShot" then
		equipSet = sets.QD
		if ACC_Shots:contains(spell.english) then
			equipSet = sets.QD.HighACC
		else
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if not ACC_Shots:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' then -- Use Obi Toggle To Unlock Elemental Obi --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
		equip(equipSet)
	elseif spell.action_type == 'Magic' then
		if spell.english == 'Utsusemi: Ni' then
			if buffactive['Copy Image (3)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
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
end

function midcast(spell,action)
	if spell.action_type == 'Ranged Attack' then
		equipSet = sets.Midshot
		if equipSet[player.equipment.range] then
			equipSet = equipSet[player.equipment.range]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if bufactive["Triple Shot"] then
			equipSet = set_combine(equipSet,{body="Chasseur's Frac +1"})
		end
		equip(equipSet)
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			equip(sets.Midcast.Cure)
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equip(sets.Midcast.Stoneskin)
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
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
    if buffactive['doom'] then
        equip(sets['Doom'])
        end
	if spell.action_type == 'Ranged Attack' and AutoMode == 'ON' then
		autoRA()
	else
		status_change(player.status)
	end
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.type == 'CorsairRoll' then
			display_roll_info(spell)
		elseif spell.english == 'Light Shot' then -- Sleep Countdown --
			send_command('wait 50;input /echo '..spell.name..' Effect: [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..' Effect: [OFF]')
		end
	end
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.Melee
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
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
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
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
	elseif command == 'C17' then -- Lock Main Weapon Toggle --
		if Lock_Main == 'ON' then
			Lock_Main = 'OFF'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Lock_Main = 'ON'
			add_to_chat(158,'Main Weapon: [Locked]')
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
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'C2' then -- Auto RA/WS Toggle. *Don't Rely On This. It Isn't As Fast As Shooting Manually. It Is Mainly For AFK or When You Dualbox* --
		if AutoMode == 'ON' then
			AutoMode = 'OFF'
			add_to_chat(123,'Auto Mode: [OFF]')
		else
			AutoMode = 'ON'
			add_to_chat(158,'Auto Mode: [ON]')
		end
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	elseif Lock_Main == 'ON' then
		disable('main','sub')
	else
		enable('main','sub','ring1','ring2','back')
	end
end

function autoRA() -- Make Auto RA Delay Adjustment Here --
	local delay = '2.2'
	if spell.type == "WeaponSkill" then
		delay = '2.25'
	else
		if buffactive["Courser's Roll"] then
			delay = '0.7'
		elseif buffactive[581] then -- Flurry II --
			delay = '0.5'
		else
			delay = '1.05'
		end
	end
	send_command('@wait '..delay..'; input /ra <t>')
end

function autoWS()
	send_command('input /ws "'..AutoGunWS..'" <t>')
end

function define_roll_values()
	rolls = {
		CorsairsRoll	= {lucky=5, unlucky=9, bonus="Experience Points"},
		NinjaRoll		= {lucky=4, unlucky=8, bonus="Evasion"},
		HuntersRoll		= {lucky=4, unlucky=8, bonus="Accuracy"},
		ChaosRoll		= {lucky=4, unlucky=8, bonus="Attack"},
		MagussRoll		= {lucky=2, unlucky=6, bonus="Magic Defense"},
		HealersRoll		= {lucky=3, unlucky=7, bonus="Cure Potency Received"},
		PuppetRoll		= {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
		ChoralRoll		= {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
		MonksRoll		= {lucky=3, unlucky=7, bonus="Subtle Blow"},
		BeastRoll		= {lucky=4, unlucky=8, bonus="Pet Attack"},
		SamuraiRoll		= {lucky=2, unlucky=6, bonus="Store TP"},
		EvokersRoll		= {lucky=5, unlucky=9, bonus="Refresh"},
		RoguesRoll		= {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
		WarlocksRoll	= {lucky=4, unlucky=8, bonus="Magic Accuracy"},
		FightersRoll	= {lucky=5, unlucky=9, bonus="Double Attack Rate"},
		DrachenRoll		= {lucky=3, unlucky=7, bonus="Pet Accuracy"},
		GallantsRoll	= {lucky=3, unlucky=7, bonus="Defense"},
		WizardsRoll		= {lucky=5, unlucky=9, bonus="Magic Attack"},
		DancersRoll		= {lucky=3, unlucky=7, bonus="Regen"},
		ScholarsRoll	= {lucky=2, unlucky=6, bonus="Conserve MP"},
		BoltersRoll		= {lucky=3, unlucky=9, bonus="Movement Speed"},
		CastersRoll		= {lucky=2, unlucky=7, bonus="Fast Cast"},
		CoursersRoll	= {lucky=3, unlucky=9, bonus="Snapshot"},
		BlitzersRoll	= {lucky=4, unlucky=9, bonus="Attack Delay"},
		TacticiansRoll	= {lucky=5, unlucky=8, bonus="Regain"},
		AlliessRoll		= {lucky=3, unlucky=10, bonus="Skillchain Damage"},
		MisersRoll		= {lucky=5, unlucky=7, bonus="Save TP"},
		CompanionsRoll	= {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
		AvengersRoll	= {lucky=4, unlucky=8, bonus="Counter Rate"}
		}
end

function display_roll_info(spell)
	rollinfo = rolls[(string.gsub((string.gsub(spell.english, "%'+", "")), "%s+", ""))]
	if rollinfo then
		add_to_chat(158, spell.english..' = '..rollinfo.bonus..'. Lucky Roll is '..
		tostring(rollinfo.lucky)..', Unlucky Roll is '..tostring(rollinfo.unlucky)..'.')
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
			
	local missingHP = 0
	local targ

	if spell.target.type == "SELF" then
		targ = alliance[1][1]
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		targ = find_player_in_alliance(spell.target.name)
		local est_max_hp = targ.hp / (targ.hpp/100)
		missingHP = math.floor(est_max_hp - targ.hp)
	end

	if targ then
		if player.sub_job == 'DNC' then
			if missingHP < 40 then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
			else
				newWaltz = 'Curing Waltz III'
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20,['Curing Waltz II'] = 35,['Curing Waltz III'] = 50,['Curing Waltz IV'] = 65,['Curing Waltz V'] = 80}
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
		send_command('wait 0.03;input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(8, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(8,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
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
		set_macro_page(1, 12)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'DRG' then
		set_macro_page(1, 12)
	else
		set_macro_page(1, 12)
	end
end