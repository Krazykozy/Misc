-- Last Updated: 01.03.2020 *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('how_about_no.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Running","Refresh","Goldsmithing","Fishing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Running --
	Armor = 'None'
	StunIndex = 0
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	target_distance = 10 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Helix'}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "LightArts", SC2 = "Perpetuance", SC3 = "Accession"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Homiliary",
			head="Befouled Crown",
			neck="Bathy Choker +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Jhakri Robe +2",
			hands="Serpentes Cuffs",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Fucho-no-Obi",
			legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
			feet="Serpentes Sabots"}
	sets.Idle.Running = set_combine(sets.Idle.Refresh,{
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Staunch Tathlum",
			head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Cure" potency +2%',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body="Mallquis Saio +2",
			hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Mag. Acc.+26',}},
			feet="Herald's Gaiters"})
	sets.Resting = set_combine(sets.Idle.Refresh,{
			left_ear="Sanative Earring",
			right_ear="Relaxing Earring"})

	sets.Idle.Goldsmithing = set_combine(sets.Idle.Running,{
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
			legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Mag. Acc.+26',}},
			feet="Herald's Gaiters"})	

	sets.Idle.Fishing = {
			main="Grioavolr",
			sub="Enki Strap",
			range="Ebisu Fishing Rod",
			head="Lithelimb Cap",
			neck="Fisher's Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			left_ring="Puffin Ring",
			right_ring="Noddy Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Witful Belt",
			legs="Angler's Hose",
			feet="Waders"}

	sets.Idle.HELM = {
			main="Grioavolr",
			sub="Enki Strap",
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
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring"}			

	sets.Idle.CpRing = {
			left_ring="Trizek Ring",
			right_ring="Capacity Ring"}
			
	-- DT Set --
	sets.DT = {
			ammo="Staunch Tathlum",
			head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Cure" potency +2%',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body="Mallquis Saio +2",
			hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Lieutenant's Sash",
			legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Mag. Acc.+26',}},
			feet="Mallquis Clogs +1"}

	sets.Sublimation = {
			ammo="Homiliary",
			head="Academic's Moarterboard +1",
			neck="Sanctity Necklace",
			left_ear="Savant's Earring",
			right_ear="Etiolation Earring",
			body="Pedagogy Gown +1",
			hands="Serpentes Cuffs",
			left_ring="K'ayres Ring",
			right_ring="Meridian Ring",
			back="Gigant Mantle",
			waist="Fucho-no-Obi",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Serpentes Sabots"}

	sets.Precast = {}
	-- Fastcast Sets --
	sets.Precast.FastCast = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Impatiens",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Pinga Tunic",
			hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs="Pinga Pants",
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}

	sets.Precast.Idle = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Sapience Orb",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Pinga Tunic",
			hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs="Pinga Pants",
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}			
			
	-- Elemental Staves --
	sets.Precast.Thunder = {main="Grioavolr",sub="Enki Strap"}
	sets.Precast.Water = {main="Grioavolr",sub="Enki Strap"}
	sets.Precast.Fire = {main="Grioavolr",sub="Enki Strap"}
	sets.Precast.Ice = {main="Grioavolr",sub="Enki Strap"}
	sets.Precast.Wind = {main="Grioavolr",sub="Enki Strap"}
	sets.Precast.Earth = {main="Grioavolr",sub="Enki Strap"}
	sets.Precast.Light = {main="Grioavolr",sub="Enki Strap"}
	sets.Precast.Dark = {main="Grioavolr",sub="Enki Strap"}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Cure Set --
	sets.Precast.Cure = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Savant's Treatise",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs="Pinga Pants",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Sapience Orb",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body="Pedagogy Gown +1",
			hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+5','VIT+3','Mag. Acc.+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs="Academic's Pants +2",
			feet="Regal Pumps +1"})

	-- Regen Set --
	sets.Midcast.Regen = set_combine(sets.Precast.FastCast,{
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Sapience Orb",
			head="Arbatel Bonnet +1",
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Olympus Sash",
			legs="Academic's Pants +2",
			feet="Regal Pumps +1"})			

	-- Refresh Set --
	sets.Midcast.Refresh = set_combine(sets.Midcast['Enhancing Magic'],{			
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Savant's Treatise",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body="Pedagogy Gown +1",
			hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+5','VIT+3','Mag. Acc.+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs="Academic's Pants +2",
			feet="Regal Pumps +1"})	

	-- Refreshself Set --
	sets.Midcast.Refreshself = set_combine(sets.Midcast['Enhancing Magic'],{
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Savant's Treatise",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Andoaa Earring",
			body="Pedagogy Gown +1",
			hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+5','VIT+3','Mag. Acc.+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Gishdubar Sash",
			back="Fi Follet Cape +1",
			legs="Academic's Pants +2",
			feet="Inspirited Boots"})			

	-- Self Cure Set --
	sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Hydrocera",
			head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Cure" potency +2%',}},
			neck="Nodens Gorget",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body="Pinga Tunic",
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Bishop's Sash",
			legs="Pinga Pants",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},})
			
	-- Cure Set --
	sets.Midcast.Cure = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Hydrocera",
			head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Cure" potency +2%',}},
			neck="Nodens Gorget",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body="Pinga Tunic",
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Bishop's Sash",
			legs="Pinga Pants",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Curaga Set --
	sets.Midcast.Curaga = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Hydrocera",
			head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Cure" potency +2%',}},
			neck="Nodens Gorget",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Bishop's Sash",
			legs="Pinga Pants",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Savant's Treatise",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Pedagogy Gown +1",
			hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+5','VIT+3','Mag. Acc.+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs="Academic's Pants +2",
			feet="Regal Pumps +1"}

	-- Stoneskin --
	sets.Midcast.Stoneskin = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Hydrocera",
			head="Befouled Crown",
			neck="Nodens Gorget",
			left_ear="Earthcry Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+5','VIT+3','Mag. Acc.+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Siegel Sash",
			back="Fi Follet Cape +1",
			legs="Shedir Seraweels",
			feet="Regal Pumps +1"}

	-- Aquaveil Set --
	sets.Midcast.Aquaveil = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Savant's Treatise",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Pedagogy Gown +1",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs="Shedir Seraweels",
			feet="Regal Pumps +1"}			

	-- Barspell Base Set --
	sets.Midcast.Barspell = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Savant's Treatise",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Pedagogy Gown +1",
			hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+5','VIT+3','Mag. Acc.+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs="Shedir Seraweels",
			feet="Regal Pumps +1"}
			
	-- Cursna --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			main="Grioavolr",
			sub="Enki Strap",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Perimede Cape",
			waist="Gishdubar Sash",
			legs="Academic's Pants +2",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},})

	-- Storm Magic Sets --
	sets.Midcast.Storm = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Savant's Treatise",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Pedagogy Gown +1",
			hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+5','VIT+3','Mag. Acc.+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs="Academic's Pants +2",
			feet="Pedagogy Loafers +1"}
			
	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Hydrocera",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body={ name="Vanya Robe", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Rumination Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})			
			
	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Appetence Crown",
			neck="Erra Pendant",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Academic's Gown +1",
			hands="Regal Cuffs",
			left_ring="Archon Ring",
			right_ring="Evanescence Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Eschan Stone",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Jhakri Pigaches +2"}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},})

	-- Klimaform Sets --
	sets.Midcast.Klimaform = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Appetence Crown",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Academic's Gown +1",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Evanescence Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Eschan Stone",
			legs="Pedagogy Pants +1",
			feet="Arbatel Loafers +1"}
			
	-- Stun Sets --
	sets.Midcast.Stun = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Sapience Orb",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Erra Pendant",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Shango Robe",
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Evanescence Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Jhakri Pigaches +2"}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{
			back="Lugh's Cape"})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back="Lugh's Cape"})

	-- Drain Sets --
	sets.Midcast.Drain = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Appetence Crown",
			neck="Erra Pendant",
			left_ear="Hirudinea Earring",
            right_ear="Enchanter Earring +1",
			body="Academic's Gown +1",
			hands="Regal Cuffs",
			left_ring="Excelsis Ring",
			right_ring="Evanescence Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Fucho-no-Obi",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Drain" and "Aspir" potency +9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +2"}
	sets.Midcast.Drain.MidACC = set_combine(sets.Midcast.Drain,{
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back="Lugh's Cape"})
	sets.Midcast.Drain.HighACC = set_combine(sets.Midcast.Drain.MidACC,{
			back="Lugh's Cape"})			
			
	-- Aspir Sets --
	sets.Midcast.Aspir = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Appetence Crown",
			neck="Erra Pendant",
			left_ear="Hirudinea Earring",
            right_ear="Enchanter Earring +1",
			body="Academic's Gown +1",
			hands="Regal Cuffs",
			left_ring="Excelsis Ring",
			right_ring="Evanescence Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Fucho-no-Obi",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Drain" and "Aspir" potency +9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +2"}
	sets.Midcast.Aspir.MidACC = set_combine(sets.Midcast.Aspir,{
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back="Lugh's Cape"})
	sets.Midcast.Aspir.HighACC = set_combine(sets.Midcast.Aspir.MidACC,{
			back="Lugh's Cape"})	
			
	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Barkarole Earring",
			right_ear="Regal Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Lugh's Cape",
			waist="Refoccilation Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{
			head="Jhakri Coronal +2",
			waist="Eschan Stone",
			legs="Jhakri Slops +2",
			back="Lugh's Cape",
			feet="Jhakri Pigaches +2"})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{
			head="Jhakri Coronal +2",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Regal Cuffs",
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})			

	-- MB Sets --
	sets.Midcast.MB = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Barkarole Earring",
			right_ear="Regal Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Jhakri Cuffs +2",
			left_ring="Mujin Band",
			right_ring="Shiva Ring +1",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Refoccilation Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.Midcast.MB.MidACC = set_combine(sets.Midcast.MB,{
			head="Jhakri Coronal +2",
			waist="Eschan Stone",
			legs="Jhakri Slops +2",
			back="Lugh's Cape"})
	sets.Midcast.MB.HighACC = set_combine(sets.Midcast.MB.MidACC,{
			head="Jhakri Coronal +2",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Regal Cuffs",
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})	
			
	-- Helix Sets --
	sets.Midcast.Helix = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Refoccilation Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.Midcast.Helix.MidACC = set_combine(sets.Midcast.Helix,{
			head="Jhakri Coronal +2",
			waist="Eschan Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})	
	sets.Midcast.Helix.HighACC = set_combine(sets.Midcast.Helix.MidACC,{
			head="Jhakri Coronal +2",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Regal Cuffs",
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})			

	-- Impact --
	sets.Midcast.Impact = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			neck="Sanctity Necklace",
			left_ear="Barkarole Earring",
			right_ear="Regal Earring",
			body="Twilight Cloak",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Refoccilation Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.Midcast.Impact.MidACC = set_combine(sets.Midcast.Impact,{
			waist="Eschan Stone",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})	
	sets.Midcast.Impact.HighACC = set_combine(sets.Midcast.Impact.MidACC,{
			neck="Sanctity Necklace",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			hands="Regal Cuffs",
			waist="Eschan Stone",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})	

	-- Elemental Obi/Twilight Cape --
	sets.Obi = {}
	sets.Obi.Thunder = {waist='Hachirin-No-Obi'}
	sets.Obi.Water = {waist='Hachirin-No-Obi'}
	sets.Obi.Fire = {waist='Hachirin-No-Obi'}
	sets.Obi.Ice = {waist='Hachirin-No-Obi'}
	sets.Obi.Wind = {waist='Hachirin-No-Obi'}
	sets.Obi.Earth = {waist='Hachirin-No-Obi'}
	sets.Obi.Light = {waist='Hachirin-No-Obi'}
	sets.Obi.Dark = {waist='Hachirin-No-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA['Tabula Rasa'] = {legs="Pedagogy Pants +1"}
	sets.JA["Dark Arts"] = {body="Academic's Gown +1"}
	sets.JA["Light Arts"] = {legs="Academic's Pants +2"}
	sets.JA["Addendum: Black"] = {body="Arbatel Gown +1"}
	sets.JA["Addendum: White"] = {body="Arbatel Gown +1"}
	sets.JA["Enlightenment"] = {body="Pedagogy Gown +1"}	
	sets.JA["Equanimity"] = {hands="Pedagogy Bracers +1"}
	sets.JA["Tranquility"] = {hands="Pedagogy Bracers +1"}
	sets.JA["Accession"] = {head="Pedagogy Moarterboard +1"}
	sets.JA["Altruism"] = {head="Pedagogy Moarterboard +1"}
	sets.JA["Focalization"] = {head="Pedagogy Moarterboard +1"}
	sets.JA["Celerity"] = {feet="Pedagogy Loafers +1"}
	sets.JA["Alacrity"] = {feet="Pedagogy Loafers +1"}
	sets.JA["Penury"] = {legs="Arbatel Pants +1"}
	sets.JA["Rapture"] = {head="Arbatel Bonnet +1"}
	sets.JA["Perpetuance"] = {hands="Arbatel Bracers +1"}
	sets.JA["Parsimony"] = {legs="Arbatel Pants +1"}
	sets.JA["Ebullience"] = {head="Arbatel Bonnet +1"}
	sets.JA["Immanence"] = {hands="Arbatel Bracers +1"}
	
	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- WS Base Set --
	sets.WS = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Globidonta Ring",
			right_ring="Rufescent Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}

	-- Myrkr Sets --
	sets.WS.Myrkr = {			
			ammo="Pemphredo Tathlum",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Sanctity Necklace",
			left_ear="Moonshade Earring",
			right_ear="Etiolation Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Pedagogy Bracers +1",
			left_ring="Sangoma Ring",
			right_ring="Shiva Ring +1",
			back="Perimede Cape",
			waist="Yamabuke-no-Obi",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Arbatel Loafers +1"}

	-- Retribution Sets --
	sets.WS.Retribution = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Globidonta Ring",
			right_ring="Rufescent Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Latria Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS.Retribution.MidACC = set_combine(sets.WS.Retribution,{
			neck="Fotia Gorget",
			waist="Fotia Belt"})
	sets.WS.Retribution.HighACC = set_combine(sets.WS.Retribution.MidACC,{
			neck="Fotia Gorget",
			waist="Fotia Belt"})

	-- Omniscience Sets --
	sets.WS.Omniscience = {			
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Jhakri Robe +2",
			hands="Regal Cuffs",
			left_ring="Globidonta Ring",
			right_ring="Rufescent Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Latria Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS.Omniscience.MidACC = set_combine(sets.WS.Omniscience,{
			neck="Fotia Gorget",
			waist="Fotia Belt"})
	sets.WS.Omniscience.HighACC = set_combine(sets.WS.Omniscience.MidACC,{
			neck="Fotia Gorget",
			waist="Fotia Belt"})

	-- Shattersoul Sets --
	sets.WS.Shattersoul = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Globidonta Ring",
			right_ring="Rufescent Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Latria Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS.Shattersoul.MidACC = set_combine(sets.WS.Shattersoul,{
			neck="Fotia Gorget",
			waist="Fotia Belt"})
	sets.WS.Shattersoul.HighACC = set_combine(sets.WS.Shattersoul.MidACC,{
			neck="Fotia Gorget",
			waist="Fotia Belt"})
	
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
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
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
	if spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
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
	elseif spell.type == "WeaponSkill" then
				equip(sets.WS[spell.english])
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
		end
	if sets.Precast[spell.element] then
		equip(sets.Precast[spell.element])
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end	

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
			if string.find(spell.english,'Cure') then
				equipSet = equipSet.Cure
			elseif string.find(spell.english,'Cura') then
				equipSet = equipSet.Curaga
			end
		elseif string.find(spell.english,'Refresh') then
			if spell.target.name == player.name then
				equipSet = equipSet.Refreshself
			else
				equipSet = equipSet.Refresh
			end
		elseif (string.find(spell.english,'Cur') or spell.english == "Wild Carrot" or spell.english == "Healing Breeze") then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
		elseif string.find(spell.english,'Barfire') or string.find(spell.english,'Barblizzard') or string.find(spell.english,'Baraero') or string.find(spell.english,'Barstone') or string.find(spell.english,'Barthunder') or string.find(spell.english,'Barwater') then
			if spell.target.name == player.name then
				equipSet = set_combine(sets.Midcast.Barspell)
			end
		elseif string.find(spell.english,'Thunderstorm') or string.find(spell.english,'Aurorastorm') or string.find(spell.english,'Voidstorm') or string.find(spell.english,'Hailstorm') or string.find(spell.english,'Firestorm') or string.find(spell.english,'Windstorm') or string.find(spell.english,'Sandstorm') or string.find(spell.english,'Rainstorm') then
			if spell.target.name == player.name then
				equipSet = equipSet.Storm
			end
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(sets.Midcast['Enhancing Magic'],{right_ring="Sheltered Ring"})
			end
			if buffactive.Rapture then -- Equip Arbatel Bonnet +1 When Rapture Is Up For Curaga Spells --
				equipSet = set_combine(equipSet,{head="Arbatel Bonnet +1"})
			end
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
		elseif string.find(spell.english,'Regen') then -- Equip Arbatel Bonnet +1 For Regen Spells --
			equipSet = set_combine(equipSet,{head="Arbatel Bonnet +1"})
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet.Haste,{left_ring="Fenian Ring"})
		elseif spell.english == "Stun" and buffactive.Alacrity and world.weather_element == 'Thunder' then -- Equip Pedagogy Loafers +1 When Alacrity Is Up And Thunder Weather --
			equipSet = set_combine(equipSet,{feet="Pedagogy Loafers +1"})
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
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			if string.find(spell.english,'Noctohelix') or string.find(spell.english,'Geohelix') or string.find(spell.english,'Hydrohelix') or string.find(spell.english,'Anemohelix') or string.find(spell.english,'Pyrohelix') or string.find(spell.english,'Cryohelix') or string.find(spell.english,'Ionohelix') or string.find(spell.english,'Luminohelix') then
				equipSet = set_combine(equipset,sets.Midcast.Helix)
			end
			if (spell.skill == 'Elemental Magic' or string.find(spell.english,'Cur') or string.find(spell.english,'Bio') or string.find(spell.english,'Dia')) and not Non_Obi_Spells:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' then -- Use Obi Toggle To Equip Normal Waist Gear --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
	end
	if buffactive.Immanence and spell.skill == "Elemental Magic" then
		equipSet = set_combine(equipSet,{hands="Arbatel Bracers +1",left_ring="Mujin Band",back="Lugh's Cape"})
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	if buffactive.Perpetuance and spell.skill == "Enhancing Magic" then
		equipSet = set_combine(equipSet,{hands="Arbatel Bracers +1"})
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function aftercast(spell,action)
	if buffactive['doom'] then
		equip(sets['Doom'])
		end
	if not spell.interrupted then
		if spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if buffactive.Curse and Doom then
		equipSet = set_combine(equipSet,{left_ring='Purity Ring'})
	end
	if Armor == 'DT' then
		equip(sets.DT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equip(sets.Precast.Idle)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
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
	if command == 'C1' then -- Magic Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Magic Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Magic Burst Toggle --
		if Armor == 'MB' then
			Armor = 'None'
			add_to_chat(123,'MB Set: [Unlocked]')
		else
			Armor = 'MB'
			add_to_chat(158,'MB Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
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
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
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
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: [Current MP = ' .. player.mp .. ' | ' .. player.mpp .. '%] Using '..new_spell..' instead.')
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
	if player.sub_job == 'RDM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 19)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 19)
	end
end