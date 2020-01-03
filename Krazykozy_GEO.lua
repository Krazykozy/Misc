-- Last Updated: 01.03.2020 *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Running","Refresh","Geomancy","GeoDT","D2Ring","CpRing"} -- Default Idle Set Is Running --
	Armor = 'None'
	define_geomancy_values()
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "GeoTorpor", SC2 = "GeoLanguor", SC3 = "IndiFocus"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Helix'}

	Cities = S{
			"Ru'lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
			"Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
			"Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
			"Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
			"Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
			"Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham"}

	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = {
			main="Bolelabunga",
			sub="Genmei Shield",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
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
	sets.Idle.Running =  set_combine(sets.Idle.Refresh,{
			main="Bolelabunga",
			sub="Genmei Shield",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Befouled Crown",
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body="Mallquis Saio +2",
			hands="Bagua Mitaines +1",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Mag. Acc.+26',}},
			feet="Geo. Sandals +1"})
	sets.Idle.Geomancy =  set_combine(sets.Idle.Refresh,{
			main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
			sub="Genmei Shield",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Azimuth Hood +1",
			left_ear="Handler's Earring +1",
			right_ear="Rimeice Earring",
			neck="Loricate Torque +1",
		    body={ name="Telchine Chas.", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
			hands="Geo. Mitaines +2",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back={ name="Nantosuelta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}},
			waist="Fucho-no-Obi",
		    legs={ name="Telchine Braconi", augments={'Pet: Mag. Evasion+20','Pet: "Regen"+3','Pet: Damage taken -3%',}},
			feet={ name="Telchine Pigaches", augments={'Pet: "Regen"+3','Pet: Damage taken -3%',}},})
	sets.Idle.GeoDT =  set_combine(sets.Idle.Geomancy,{
			main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
			sub="Genmei Shield",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head={ name="Telchine Cap", augments={'Pet: Mag. Acc.+16','Pet: "Regen"+3','Pet: Damage taken -4%',}},
			body={ name="Telchine Chas.", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
			legs={ name="Telchine Braconi", augments={'Pet: Mag. Evasion+20','Pet: "Regen"+3','Pet: Damage taken -4%',}},
			feet={ name="Telchine Pigaches", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
			hands="Geo. Mitaines +2",
			neck="Loricate Torque +1",
			waist="Isa Belt",
			left_ear="Handler's Earring +1",
			right_ear="Rimeice Earring",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back={ name="Nantosuelta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}},})

	sets.Idle.D2Ring = set_combine(sets.Idle.Refresh,{
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring"})			

	sets.Idle.CpRing = set_combine(sets.Idle.Refresh,{
			left_ring="Trizek Ring",
			right_ring="Capacity Ring"})
			
	sets.Resting = set_combine(sets.Idle.Refresh,{left_ear="Sanative Earring",right_ear="Relaxing Earring",legs="Lengo Pants"})

	-- DT Set --
	sets.DT = {
			main="Bolelabunga",
			sub="Genmei Shield",
			head="Azimuth Hood +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			neck="Loricate Torque +1",
			body="Mallquis Saio +2",
			hands="Geo. Mitaines +2",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Fucho-no-Obi",
			legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Mag. Acc.+26',}},
			feet={ name="Merlinic Crackows", augments={'Potency of "Cure" effect received+1%','STR+14','Damage taken-2%','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},}

	sets.Sublimation = {
			main="Bolelabunga",
			sub="Genmei Shield",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Wivre Hairpin",
			neck="Dualism Collar",
			left_ear="Bloodgem Earring",
			right_ear="Loquac. Earring",
			body="Geo. Tunic +1",
			hands="Serpentes Cuffs",
			left_ring="K'ayres Ring",
			right_ring="Meridian Ring",
			back="Gigant Mantle",
			waist="Forest Sash",
			legs="Nares Trews",
			feet="Geo. Sandals +1"}

	sets.Precast = {}
	-- Fastcast Sets --
	sets.Precast.FastCast = {
			main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Shango Robe",
			hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+3','"Fast Cast"+5','MND+2','"Mag.Atk.Bns."+12',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs="Geomancy Pants +1",
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}

	-- Geomancy Precast
	sets.Precast.Geomancy = set_combine(sets.Precast.FastCast,{
			main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Azimuth Hood +1",
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Geo. Mitaines +2",
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			legs="Geomancy Pants +1",
			feet="Azimuth Gaiters +1"})
					
	-- Elemental Staves --
	sets.Precast.Thunder = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},sub="Genmei Shield"}
	sets.Precast.Water = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},sub="Genmei Shield"}
	sets.Precast.Fire = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},sub="Genmei Shield"}
	sets.Precast.Ice = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},sub="Genmei Shield"}
	sets.Precast.Wind = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},sub="Genmei Shield"}
	sets.Precast.Earth = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},sub="Genmei Shield"}
	sets.Precast.Light = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},sub="Genmei Shield"}
	sets.Precast.Dark = {main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},sub="Genmei Shield"}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Cure Set --
	sets.Precast.Cure = {
			main={ name="Serenity", augments={'MP+45','Enha.mag. skill +9','"Cure" potency +4%','"Cure" spellcasting time -8%',}},
			sub="Enki Strap",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
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
			legs="Geomancy Pants +1",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Geomancy Midcast
	sets.Midcast.Geomancy = {
			main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Azimuth Hood +1",
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Bagua Tunic +1",
			hands="Geo. Mitaines +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Luminary Sash",
			legs="Bagua Pants +1",
			feet="Azimuth Gaiters +1"}	
	
	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+3',}},
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Augment. Earring",
            right_ear="Enchanter Earring +1",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Jhakri Cuffs +2",
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Luminary Sash",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},})

	-- Regen Set --
	sets.Midcast.Regen = set_combine(sets.Precast.FastCast,{
			main="Bolelabunga",
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Perimede Cape",
			waist="Olympus Sash",
			legs="Academic's Pants +1",
			feet="Regal Pumps +1"})			

	-- Refresh Set --
	sets.Midcast.Refresh = set_combine(sets.Midcast['Enhancing Magic'],{			
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+3',}},
			sub="Genmei Shield",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Amalric Coif",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands="Bagua Mitaines +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Inspirited Boots"})	
			
	-- Cure Set --
	sets.Midcast.Cure = {
			main={ name="Serenity", augments={'MP+45','Enha.mag. skill +9','"Cure" potency +4%','"Cure" spellcasting time -8%',}},
			sub="Enki Strap",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Nodens Gorget",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body="Pinga Tunic",
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Bishop's Sash",
			legs="Gyve Trousers",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Curaga Set --
	sets.Midcast.Curaga = {
			main={ name="Serenity", augments={'MP+45','Enha.mag. skill +9','"Cure" potency +4%','"Cure" spellcasting time -8%',}},
			sub="Enki Strap",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Nodens Gorget",
			left_ear="Loquac. Earring",
			right_ear="Mendicant's Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Stikini Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Bishop's Sash",
			legs="Gyve Trousers",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},}

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+3',}},
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands="Bagua Mitaines +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Regal Pumps +1"}

	-- Stoneskin --
	sets.Midcast.Stoneskin = {
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+3',}},
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Befouled Crown",
			neck="Nodens Gorget",
			left_ear="Earthcry Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands="Bagua Mitaines +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Siegel Sash",
			back="Fi Follet Cape +1",
			legs="Shedir Seraweels",
			feet="Regal Pumps +1"}

	-- Aquaveil Set --
	sets.Midcast.Aquaveil = {
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+3',}},
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands="Regal Cuffs",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs="Shedir Seraweels",
			feet="Regal Pumps +1"}			

	-- Barspell Base Set --
	sets.Midcast.Barspell = {
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
		    body={ name="Telchine Chas.", augments={'Mag. Acc.+11','"Fast Cast"+4','"Regen" potency+2',}},
			hands="Bagua Mitaines +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Olympus Sash",
			legs="Shedir Seraweels",
			feet="Regal Pumps +1"}
			
	-- Cursna --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+3',}},
			sub="Culminus",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Incanter's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Aurist's Cloak +1",
			waist="Gishdubar Sash",
			legs="Academic's Pants +1",
			feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},})

	-- Storm Magic Sets --
	sets.Midcast.Storm = {
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+3',}},
			sub="Culminus",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Shango Robe",
			hands="Bagua Mitaines +1",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			waist="Olympus Sash",
			back="Fi Follet Cape +1",
			legs="Academic's Pants +1",
			feet="Pedagogy Loafers +1"}
			
	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {
			main="Grioavolr",
			sub="Enki Strap",
			range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
			head="Befouled Crown",
			neck="Incanter's Torque",
			left_ear="Dignitary's Earring",
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
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{
			hands="Regal Cuffs",
			feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},})			
			
	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Culminus",
			head="Appetence Crown",
			neck="Erra Pendant",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Archon Ring",
			right_ring="Evanescence Ring",
			back="Toro Cape",
			waist="Eschan Stone",
			legs="Azimuth Tights +1",
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back="Toro Cape",})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{
			hands="Regal Cuffs",
			back="Toro Cape",})

	-- Klimaform Sets --
	sets.Midcast.Klimaform = {
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+3',}},
			sub="Culminus",
			head="Appetence Crown",
			neck="Incanter's Torque",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Evanescence Ring",
			back="Toro Cape",
			waist="Eschan Stone",
			legs="Pedagogy Pants +1",
			feet="Arbatel Loafers +1"}
			
	-- Stun Sets --
	sets.Midcast.Stun = {
			main="Grioavolr",
			sub="Enki Strap",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Erra Pendant",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Evanescence Ring",
			back="Toro Cape",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{
			back="Toro Cape"})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{
			hands="Regal Cuffs",
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back="Toro Cape"})

	-- Drain Sets --
	sets.Midcast.Drain = {
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Culminus",
			head="Appetence Crown",
			neck="Erra Pendant",
			left_ear="Hirudinea Earring",
            right_ear="Enchanter Earring +1",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Excelsis Ring",
			right_ring="Evanescence Ring",
			back="Toro Cape",
			waist="Fucho-no-Obi",
			legs="Azimuth Tights +1",
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast.Drain.MidACC = set_combine(sets.Midcast.Drain,{
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back="Toro Cape"})
	sets.Midcast.Drain.HighACC = set_combine(sets.Midcast.Drain.MidACC,{
			hands="Regal Cuffs",
			back="Toro Cape"})			
			
	-- Aspir Sets --
	sets.Midcast.Aspir = {
			main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
			sub="Culminus",
			head="Appetence Crown",
			neck="Erra Pendant",
			left_ear="Hirudinea Earring",
            right_ear="Enchanter Earring +1",
			body="Shango Robe",
			hands="Jhakri Cuffs +2",
			left_ring="Excelsis Ring",
			right_ring="Evanescence Ring",
			back="Toro Cape",
			waist="Fucho-no-Obi",
			legs="Azimuth Tights +1",
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +11','INT+10','Mag. Acc.+1','"Mag.Atk.Bns."+13',}},}
	sets.Midcast.Aspir.MidACC = set_combine(sets.Midcast.Aspir,{
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back="Toro Cape"})
	sets.Midcast.Aspir.HighACC = set_combine(sets.Midcast.Aspir.MidACC,{
			hands="Regal Cuffs",
			back="Toro Cape"})	
			
	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {
			main="Grioavolr",
			sub="Enki Strap",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Barkarole Earring",
			right_ear="Regal Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Toro Cape",
			waist="Refoccilation Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{
			head="Jhakri Coronal +2",
			waist="Eschan Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			back="Toro Cape",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{
			head="Jhakri Coronal +2",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Regal Cuffs",
			waist="Eschan Stone",
			back="Toro Cape",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})			

	-- Helix Sets --
	sets.Midcast.Helix = {
			main="Grioavolr",
			sub="Enki Strap",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Taranus's Cape", augments={'INT+10','Mag. Acc+10 /Mag. Dmg.+10','"Mag.Atk.Bns."+10',}},
			waist="Eschan Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.Midcast.Helix.MidACC = set_combine(sets.Midcast.Helix,{
			hands="Jhakri Cuffs +2",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})	
	sets.Midcast.Helix.HighACC = set_combine(sets.Midcast.Helix.MidACC,{
			head="Jhakri Coronal +2",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			body="Shango Robe",
			hands="Regal Cuffs",
			waist="Eschan Stone",
			back="Aurist's Cloak +1",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})			
			
	-- Impact --
	sets.Midcast.Impact = {
			main="Grioavolr",
			sub="Enki Strap",
			neck="Sanctity Necklace",
			left_ear="Barkarole Earring",
			right_ear="Regal Earring",
			body="Twilight Cloak",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Toro Cape",
			waist="Refoccilation Stone",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.Midcast.Impact.MidACC = set_combine(sets.Midcast.Impact,{
			waist="Eschan Stone",
			legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+30','Magic Damage +15','MND+5','Mag. Acc.+14',}},
			back="Toro Cape",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})	
	sets.Midcast.Impact.HighACC = set_combine(sets.Midcast.Impact.MidACC,{
			neck="Sanctity Necklace",
			left_ear="Dignitary's Earring",
			right_ear="Gwati Earring",
			hands="Jhakri Cuffs +2",
			right_ring="Shiva Ring +1",
			waist="Eschan Stone",
			back="Toro Cape",
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
	sets.JA['Life Cycle'] = {body="Geo. Tunic +1"}
	sets.JA['Collimated Fervor'] = {head="Geomancy Galero +1"}
	sets.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.JA['Bolster'] = {body="Bagua Tunic +1"}
	sets.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines +1"}
	
	-- Melee Set --
	sets.Melee = {
			head="Jhakri Coronal +2",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Olseni Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}

	-- WS Base Set --
	sets.WS = {
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS.MidACC = set_combine(sets.WS,{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	
	sets.WS["Realmrazer"] = {
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS["Realmrazer"].MidACC = set_combine(sets.WS["Realmrazer"],{
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			waist="Fotia Belt"})
	sets.WS["Realmrazer"].HighACC = set_combine(sets.WS["Realmrazer"].MidACC,{
			left_ring="Rufescent Ring",
			right_ring="Epona's Ring",
			waist="Fotia Belt"})			
			
	sets.WS["True Strike"] = {
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS["True Strike"].MidACC = set_combine(sets.WS["True Strike"],{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS["True Strike"].HighACC = set_combine(sets.WS["True Strike"].MidACC,{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})			
			
	sets.WS["Judgment"] = {
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS["Judgment"].MidACC = set_combine(sets.WS["Judgment"],{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS["Judgment"].HighACC = set_combine(sets.WS["Judgment"].MidACC,{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})			
			
	sets.WS["Black Halo"] = {
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS["Black Halo"].MidACC = set_combine(sets.WS["Black Halo"],{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS["Black Halo"].HighACC = set_combine(sets.WS["Black Halo"].MidACC,{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})

	sets.WS["Flash Nova"] = {
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +19','Pet: Damage taken -3%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS["Flash Nova"].MidACC = set_combine(sets.WS["Flash Nova"],{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
	sets.WS["Flash Nova"].HighACC = set_combine(sets.WS["Flash Nova"].MidACC,{
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Rufescent Ring",
			right_ring="Stikini Ring",
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"})
			
	sets.WS.Shattersoul = {}
	
	    --Doom/Cursed Sets--
	sets.Doom = {
			left_ring="Purity Ring",
			right_ring="Defending Ring",
			waist="Gishdubar Sash",}
end

function pretarget(spell,action)
	if (string.find(spell.type,'Magic') or spell.type == "Ninjutsu" or spell.type == "Geomancy") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif string.find(spell.english,'Geo') and pet.isvalid then -- Change Any Geo Spells To Full Circle If You Have A Luopan Active --
		cancel_spell()
		send_command('input /ja "Full Circle" <me>')
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
			if string.find(spell.english,'Cur') then
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
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		elseif sets.WS[spell.english] then
			equip(sets.WS[spell.english])
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Geomancy" then
		if Cities:contains(world.area) then
			cancel_spell()
			add_to_chat(123,'Unable To Use Geomancy In Town')
			return
		else
			if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Geomancy If You Are Silenced or Out of Range --
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
				return
			else
				display_geomancy_info(spell)
				equip(sets.Precast.Geomancy)
			end
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
	if spell.type:endswith('Magic') or spell.type == 'Geomancy' or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if string.find(spell.english,'Cure') then
			equip(sets.Midcast.Cure)
		elseif string.find(spell.english,'Cura') then
			equip(sets.Midcast.Curaga)
		elseif string.find(spell.english,'Geo') or string.find(spell.english,'Indi') then
			equip(sets.Midcast.Geomancy)
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet.Haste,{left_ring="Fenian Ring"})
		elseif string.find(spell.english,'Barfire') or string.find(spell.english,'Barblizzard') or string.find(spell.english,'Baraero') or string.find(spell.english,'Barstone') or string.find(spell.english,'Barthunder') or string.find(spell.english,'Barwater') then
			if spell.target.name == player.name then
				equipSet = set_combine(sets.Midcast.Barspell)
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
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.english == "Sleep II" then-- Sleep II Countdown --
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
	if buff == 'weakness' then -- Weakness Timer --
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
	if command == 'C1' then -- Magic Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Magic Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Magic Burst Toggle --
		if Armor == 'MagicBurst' then
			Armor = 'None'
			add_to_chat(123,'Magic Burst Set: [Unlocked]')
		else
			Armor = 'MagicBurst'
			add_to_chat(158,'Magic Burst Set: '..AccArray[AccIndex])
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
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function define_geomancy_values()
	geomancy = {
		Frailty = {bonus="Defense -"},
		Torpor = {bonus="Evasion -"},
		Languor = {bonus="Magic Evasion -"},
		Focus = {bonus="Magic Accuracy +"},
		Malaise = {bonus="Magic Defense -"},
		Precision = {bonus="Accuracy +"},
		Refresh = {bonus="Refresh"},
		Fade = {bonus="Magic Attack -"},
		Wilt = {bonus="Attack -"},
		Vex = {bonus="Magic Accuracy -"},
		Slip = {bonus="Accuracy -"},
		Acumen = {bonus="Magic Attack"},
		Fend = {bonus="Magic Defense +"},
		Fury = {bonus="Attack +"},
		Attunement = {bonus="Magic Evasion +"},
		Voidance = {bonus="Evasion +"},
		Barrier = {bonus="Defense +"}
		}
end

function display_geomancy_info(spell)
	geoType=nil 
	string.gsub(spell.english.."-","-(.-)-",function(geo) geoType=geo end)
	geoInfo = geomancy[geoType]
	if geoInfo then
		add_to_chat(158, spell.english..' = '..tostring(geoInfo.bonus))
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
	-- Default macro set/book
	if player.sub_job == 'RDM' then
		set_macro_page(1, 11)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 11)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 11)
	else
		set_macro_page(1, 11)
	end
end