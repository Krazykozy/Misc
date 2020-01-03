-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Refresh","Movement","Goldsmithing","Fishing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Refresh --
	Armor = 'None'
	StunIndex = 0
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	target_distance = 7 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Helix'}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "Composure", SC2 = "Stun", SC3 = "Chainspell"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = {
			main="Emissary",
			sub="Genmei Shield",
			ammo="Homiliary",
			head="Vitivation Chapeau +1",
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
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			ammo="Sapience Orb",
			head="Lithelimb Cap",
			neck="Loricate Torque +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Emet Harness +1",
			hands="Umuthi Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Merlinic Crackows", augments={'Potency of "Cure" effect received+1%','STR+14','Damage taken-2%','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},})
	sets.Resting = set_combine(sets.Idle.Refresh,{
			left_ear="Sanative Earring",
			right_ear="Relaxing Earring"})

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
			feet="Serpentes Sabots"}	

	sets.Idle.Fishing = {
			main="Emissary",
			sub="Genmei Shield",
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
			main="Bolelabunga",
			sub="Genmei Shield",
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
			main="Bolelabunga",
			sub="Genmei Shield",
			ammo="Sapience Orb",
			head="Gende. Caubeen +1",
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body="Emet Harness +1",
			hands="Umuthi Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet={ name="Merlinic Crackows", augments={'Potency of "Cure" effect received+1%','STR+14','Damage taken-2%','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},}

	sets.Sublimation = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Hydrocera",
			head="Vitivation Chapeau +1",
			neck="Dualism Collar",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Serpentes Cuffs",
			left_ring="Petrov Ring",
			right_ring="Meridian Ring",
			back="Gigant Mantle",
			waist="Forest Sash",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Serpentes Sabots"}
	
	-- Precast Sets --
	sets.Precast = {}

	-- FastCast Set --
	sets.Precast.FastCast = {
			main="Emissary",
			sub="Culminus",
			ammo="Impatiens",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body="Vitivation Tabard +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}			

	-- Elemental Staves --
	sets.Precast.Thunder = {main="Emissary",sub="Culminus"}
	sets.Precast.Water = {main="Emissary",sub="Culminus"}
	sets.Precast.Fire = {main="Emissary",sub="Culminus"}
	sets.Precast.Ice = {main="Emissary",sub="Culminus"}
	sets.Precast.Wind = {main="Emissary",sub="Culminus"}
	sets.Precast.Earth = {main="Emissary",sub="Culminus"}
	sets.Precast.Light = {main="Emissary",sub="Culminus"}
	sets.Precast.Dark = {main="Emissary",sub="Culminus"}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = {
			main="Emissary",
			sub="Culminus",
			ammo="Impatiens",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body="Vitivation Tabard +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			back="Perimede Cape",
			waist="Siegel Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}
	
	-- Precast Cure Set --
	sets.Precast.Cure = {
			main="Emissary",
			sub="Culminus",
			ammo="Impatiens",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Midcast Base Set --
	sets.Midcast = {}	
	
	-- Haste Set --
	sets.Midcast.Haste = {
			main="Emissary",
			sub="Culminus",
			ammo="Sapience Orb",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Incanter's Torque",
			left_ear="Loquacious Earring",
			body="Vitivation Tabard +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			back="Estoqueur's Cape",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}

	-- Cure Set --
	sets.Midcast.Cure = {
			main="Serenity",
			sub="Benthos Grip",
			ammo="Hydrocera",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Nodens Gorget",
			right_ear="Mendicant's Earring",
			left_ear="Loquacious Earring",
			body="Vrikodara Jupon",
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Bishop's Sash",
			legs="Atrophy Tights +1",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Curaga Set --
	sets.Midcast.Curaga = {
			main="Serenity",
			sub="Benthos Grip",
			ammo="Hydrocera",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Nodens Gorget",
			right_ear="Mendicant's Earring",
			left_ear="Loquacious Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Bishop's Sash",
			legs="Atrophy Tights +1",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
			main="Exemplar",
			sub="Benthos Grip",
			ammo="Hydrocera",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Vitivation Tabard +1",
			hands="Vitivation Gloves +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Estoqueur's Cape",
			waist="Olympus Sash",
			legs="Atrophy Tights +1",
			feet="Lethargy Houseaux"}
			
	-- Stoneskin --
	sets.Midcast.Stoneskin = {
			main="Exemplar",
			sub="Benthos Grip",
			ammo="Hydrocera",
			head="Befouled Crown",
			neck="Nodens Gorget",
			left_ear="Earthcry Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Siegel Sash",
			back="Fi Follet Cape +1",
			legs="Shedir Seraweels",
			feet="Lethargy Houseaux"}

	-- Refresh --
	sets.Midcast.Refresh = {
			main="Exemplar",
			sub="Benthos Grip",
			ammo="Hydrocera",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Vitivation Tabard +1",
			hands="Vitivation Gloves +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Estoqueur's Cape",
			waist="Olympus Sash",
			legs="Lethargy Fuseau",
			feet="Inspirited Boots"}

	-- Regen Sets --
	sets.Midcast['Regen'] = {	
			main="Bolelabunga",
			sub="Culminus",
			ammo="Hydrocera",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands="Vitivation Gloves +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Estoqueur's Cape",
			waist="Olympus Sash",
			legs="Atrophy Tights +1",
			feet="Lethargy Houseaux"}

	sets.Midcast['Regen II'] = {	
			main="Bolelabunga",
			sub="Culminus",
			ammo="Hydrocera",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands="Vitivation Gloves +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Estoqueur's Cape",
			waist="Olympus Sash",
			legs="Atrophy Tights +1",
			feet="Lethargy Houseaux"}
			
	-- Banish Set --
	sets.Midcast.Banish = {	
			ammo="Hydrocera",
			head="Welkin Crown",
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Fenian Ring",
			back="Ghostfyre Cape",
			waist="Bishop's Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}
			
	-- Flash Set --
	sets.Midcast.Flash = {	
			ammo="Hydrocera",
			head="Welkin Crown",
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Aurist's Cloak +1",
			waist="Bishop's Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}

	-- Cursna --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			ammo="Hydrocera",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			right_ear="Beatific Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Aurist's Cloak +1",
			waist="Bishop's Sash",
			legs="Bokwus Slops",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},})

	-- Stun Sets --
	sets.Midcast.Stun = {			
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Culminus",
			ammo="Pemphredo Tathlum",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Shango Robe",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Archon Ring",
			right_ring="Evanescence Ring",
			back="Perimede Cape",
			waist="Eschan Stone",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			back="Perimede Cape"})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	sets.Midcast['Drain'] = {
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Culminus",
			ammo="Pemphredo Tathlum",
			head="Appetence Crown",
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Excelsis Ring",
			right_ring="Evanescence Ring",
			back="Perimede Cape",
			waist="Fucho-no-Obi",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Drain" and "Aspir" potency +9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast['Drain'].MidACC = set_combine(sets.Midcast['Drain'],{
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Genmei Shield",
			range="Pemphredo Tathlum",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Drain" and "Aspir" potency +9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
			back="Aurist's Cloak +1"})
	sets.Midcast['Drain'].HighACC = set_combine(sets.Midcast['Drain'].MidACC,{})	

	sets.Midcast['Aspir'] = {
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Culminus",
			ammo="Pemphredo Tathlum",
			head="Appetence Crown",
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Excelsis Ring",
			right_ring="Evanescence Ring",
			back="Perimede Cape",
			waist="Fucho-no-Obi",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Drain" and "Aspir" potency +9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast['Aspir'].MidACC = set_combine(sets.Midcast['Aspir'],{
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Genmei Shield",
			range="Pemphredo Tathlum",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Drain" and "Aspir" potency +9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
			back="Aurist's Cloak +1"})
	sets.Midcast['Aspir'].HighACC = set_combine(sets.Midcast['Aspir'].MidACC,{})

	sets.Midcast['Dispel'] = {
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Culminus",
			ammo="Pemphredo Tathlum",
			head="Appetence Crown",
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Evanescence Ring",
			back="Perimede Cape",
			waist="Eschan Stone",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast['Dispel'].MidACC = set_combine(sets.Midcast['Dispel'],{
			main="Marin Staff",
			range="Pemphredo Tathlum",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			back="Aurist's Cloak +1"})
	sets.Midcast['Dispel'].HighACC = set_combine(sets.Midcast['Dispel'].MidACC,{})
	
	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Culminus",
			ammo="Pemphredo Tathlum",
			head="Appetence Crown",
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Archon Ring",
			right_ring="Evanescence Ring",
			back="Perimede Cape",
			waist="Eschan Stone",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{
			main="Marin Staff",
			range="Pemphredo Tathlum",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			back="Aurist's Cloak +1"})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{
			back="Aurist's Cloak +1"})

	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {
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
			back="Toro Cape",
			waist="Refoccilation Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			back="Toro Cape"})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{
			range="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			waist="Eschan Stone",
			back="Aurist's Cloak +1",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},})

	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {	
			main="Grioavolr",
			sub="Benthos Grip",
			ammo="Hydrocera",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body={ name="Vanya Robe", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Aurist's Cloak +1",
			waist="Luminary Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{
			back="Aurist's Cloak +1",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Vitivation Boots +1"})
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{
			back="Ghostfyre Cape",
			feet="Vitivation Boots +1"})

	-- Helix Sets --
	sets.Midcast.Helix = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Merlinic Hood",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Toro Cape",
			waist="Eschan Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast.Helix.MidACC = set_combine(sets.Midcast.Helix,{
			hands="Jhakri Cuffs +2",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},})
	sets.Midcast.Helix.HighACC = set_combine(sets.Midcast.Helix.MidACC,{
			head="Merlinic Hood",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",
			back="Aurist's Cloak +1",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},})							
			
	-- Impact --
	sets.Midcast.Impact = {
			main="Grioavolr",
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Twilight Cloak",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Toro Cape",
			waist="Refoccilation Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast.Impact.MidACC = set_combine(sets.Midcast.Impact,{
			waist="Eschan Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			back="Toro Cape",
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},})
	sets.Midcast.Impact.HighACC = set_combine(sets.Midcast.Impact.MidACC,{
			neck="Sanctity Necklace",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			hands="Jhakri Cuffs +2",
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",
			back="Aurist's Cloak +1",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},})

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
	sets.JA["Chainspell"] = {body="Vitivation Tabard +1"}
	sets.JA["Saboteur"] = {hands="Lethargy Gantherots +1"}
	sets.JA["Composure"] = {
			head="Lethargy Chappel",
			body="Lethargy Sayon +1",
			hands="Lethargy Gantherots +1",
			legs="Lethargy Fuseau",
			feet="Lethargy Houseaux"}

	-- Melee Set --
	sets.Melee = {
			
	-- Almace Melee Sets --
	sets.Melee.Almace = {
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.Melee.Almace.MidACC = set_combine(sets.Melee.Almace,{
			ammo="Falcon Eye",
			head="Ayanmo Zucchetto +2",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.Melee.Almace.HighACC = set_combine(sets.Melee.Almace.MidACC,{
			ammo="Falcon Eye",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
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

	-- WS Base Set --
	sets.WS = {
			ammo="Cheruski Needle",
			head="Buremte Hat",
			neck="Asperity Necklace",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Espial Gambison",
			hands="Buremte Gloves",
			left_ring="Ramuh Ring +1",
			right_ring="Cho'j Band",
			back="Bleating Mantle",
			waist="Caudata Belt",
			legs="Espial Hose",
			feet="Espial Socks"}
	
	sets.WS["Chant du Cygne"] = {
			ammo="Jukukik Feather",
			head="Lithelimb Cap",
			neck="Light Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Espial Gambison",
			hands="Buremte Gloves",
			left_ring="Ramuh Ring +1",
			right_ring="Cho'j Band",
			back="Bleating Mantle",
			waist="Caudata Belt",
			legs="Espial Hose",
			feet="Espial Socks"}
	
	sets.WS.Requiescat = {
			ammo="Cheruski Needle",
			head="Lithelimb Cap",
			neck="Shadow Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Espial Gambison",
			hands="Buremte Gloves",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Aurist's Cloak +1",
			waist="Shadow Belt",
			legs="Mes'yohi Slacks",
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},}
	
	sets.WS["Knights of Round"] = {}
	sets.WS.Exenterator = {}
	sets.WS.Evisceration = {}
	
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
			elseif spell.english == "Stun" then
				if buffactive.Composure then -- Cancel Composure When You Cast Stun --
					cast_delay(0.2)
					send_command('cancel Composure')
				end
				equip(sets.Precast.FastCast)
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
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
		end
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
		if string.find(spell.english,'Cure') then
			equipSet = equipSet.Cure
		elseif string.find(spell.english,'Cura') then
			equipSet = equipSet.Curaga
		elseif string.find(spell.english,'Refresh') then
			equipSet = equipSet.Refresh
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(sets.Midcast['Enhancing Magic'],{right_ring="Sheltered Ring"})
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif spell.english == "Phalanx II" then -- Aug'd Vitivation Gloves +1 For Phalanx II --
			equipSet = set_combine(equipSet,{hands="Vitivation Gloves +1"})
		elseif spell.english == "Dia III" or spell.english == "Slow II" then -- Aug'd Vitivation Chapeau +1 For Dia III or Slow II --
			equipSet = set_combine(equipSet,{
			main="Grioavolr",
			sub="Enki Strap",
			range="Pemphredo Tathlum",
			head="Vitivation Chapeau +1",
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Lethargy Sayon +1",
			hands="Lethargy Gantherots +1",
			left_ring="Globidonta Ring",
			right_ring="Sangoma Ring",
			back="Aurist's Cloak +1",
			waist="Refoccilation Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})
		elseif spell.english == "Paralyze II" then -- Aug'd Vitivation Boots +1 For Paralyze II --
			equipSet = set_combine(equipSet,{ 
			main="Grioavolr",
			sub="Enki Strap",
			range="Pemphredo Tathlum",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Lethargy Sayon +1",
			hands="Lethargy Gantherots +1",
			left_ring="Globidonta Ring",
			right_ring="Sangoma Ring",
			back="Aurist's Cloak +1",
			waist="Refoccilation Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet="Vitivation Boots +1"})
		elseif spell.english == "Bio III" then -- Aug'd Vitivation Tights For Blind II or Bio III --
			equipSet = set_combine(equipSet,{legs="Vitivation Tights"})
		elseif spell.english == "Blind II" then -- Aug'd Vitivation Tights For Blind II or Bio III --
			equipSet = set_combine(equipSet,{
			main="Grioavolr",
			sub="Enki Strap",
			range="Pemphredo Tathlum",
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Hermetic Earring",
			right_ear="Gwati Earring",
			body="Lethargy Sayon +1",
			hands="Lethargy Gantherots +1",
			left_ring="Globidonta Ring",
			right_ring="Sangoma Ring",
			back="Aurist's Cloak +1",
			waist="Refoccilation Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet.Haste,{left_ring="Fenian Ring"})
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7; cancel Copy Image*')
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
	if Armor == 'DT' then
		equip(sets.DT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equip(sets.Melee)
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
	elseif command == 'C2' then -- Stun Toggle --
		if StunIndex == 1 then
			StunIndex = 0
			add_to_chat(123,'Stun Set: [Unlocked]')
		else
			StunIndex = 1
			add_to_chat(158,'Stun Set: [Locked]')
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
	if player.sub_job == 'WHM' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 14)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 13)
	else
		set_macro_page(1, 13)
	end
end