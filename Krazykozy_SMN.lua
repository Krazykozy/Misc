-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	IdleIndex = 1
	IdleArray = {"Movement","Refresh","Goldsmithing","Fishing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Kiting = 'OFF' -- Set Default Avatar/Sublimation Kiting Set ON or OFF Here --
	ElementalStaff = 'ON' -- Set Default Precast Elemental Staff ON or OFF Here --
	target_distance = 8 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "Garuda", SC2 = "Ramuh", SC3 = "Fenrir"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	Cities = S{
			"Ru'lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
			"Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
			"Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
			"Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
			"Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
			"Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham"}

	Avatars = S{
			"Ramuh","Garuda","Alexander","Fenrir","Titan","Shiva","Ifrit","Diabolos",
			"Leviathan","Carbuncle","Odin"}

	-- Use The Following Spirit Spells Again To Trigger Auto Elemental Siphon --
	Spirits = S{
			"Fire Spirit","Ice Spirit","Air Spirit","Earth Spirit","Thunder Spirit",
			"Water Spirit","Light Spirit","Dark Spirit"}

	SpiritPacts = S{
			"FireSpirit","IceSpirit","AirSpirit","EarthSpirit","ThunderSpirit",
			"WaterSpirit","LightSpirit","DarkSpirit"}

	MagicalRagePacts = S{
			'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgement Bolt',
			'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
			'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
			'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
			'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
			'Holy Mist','Searing Light','Howling Moon','Ruinous Omen','Lunar Bay','Night Terror'}

	-- The Following BPs Can Be Triggered By Using The Avatar Spells Again --
	-- Can Replace Whatever BPs You Like For Each Listed Avatars --
	BloodPactWard = {
			Garuda = "Fleet Wind", Ifrit = "Inferno Howl", Fenrir = "Ecliptic Growl", 
			Titan = "Earthen Armor", Leviathan = "Spring Water", Carbuncle = "Soothing Ruby", 
			Diabolos = "Noctoshield"}

	DebuffBloodPactWard = S{
			'Diamond Storm','Sleepga','Slowga','Tidal Roar','Nightmare','Pavor Nocturnus',
			'Ultimate Terror','Somnolence','Lunar Cry','Lunar Roar'}

	durations = {}
	durations['Earthen Armor'] = 232
	durations['Shining Ruby'] = 340
	durations['Dream Shroud'] = 352
	durations['Noctoshield'] = 352
	durations['Inferno Howl'] = 232
	durations['Hastega'] = 352

	timer_icons = {}
	-- 00054 for stoneskin, or 00299 for Titan
	timer_icons['Earthen Armor'] = 'spells/00299.png'
	-- 00043 for protect, or 00296 for Carby
	timer_icons['Shining Ruby'] = 'spells/00043.png'
	-- 00304 for Diabolos
	timer_icons['Dream Shroud'] = 'spells/00304.png'
	-- 00106 for phalanx, or 00304 for Diabolos
	timer_icons['Noctoshield'] = 'spells/00106.png'
	-- 00100 for enfire, or 00298 for Ifrit
	timer_icons['Inferno Howl'] = 'spells/00298.png'
	-- 00358 for hastega, or 00301 for Garuda
	timer_icons['Hastega'] = 'spells/00358.png'

	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = {
			main="Owleyes",
			sub="Genbu's Shield",
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
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Cure" potency +2%',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','Mag. Acc.+26',}},
			feet="Herald's Gaiters"})
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
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic burst dmg.+11%','Mag. Acc.+10','"Mag.Atk.Bns."+4',}},
			feet="Herald's Gaiters"}			
			
	sets.Idle.Fishing = {
			main="Lathi",
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
			ammo="Seraphicaller",
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
			main="Tamaxchi",
			sub="Genbu's Shield",
			head={ name="Gende. Caubeen +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Cure" potency +2%',}},
			neck="Loricate Torque +1",
			body="Gendewitha Bliaut",
			hands="Gendewitha Gages",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Slipor Sash",
			legs="Bokwus Slops",
			feet="Gende. Galoshes"}

	sets.Sublimation = {
			main="Owleyes",
			sub="Genbu's Shield",
			ammo="Oreiad's Tathlum",
			head="Wivre Hairpin",
			neck="Dualism Collar",
			left_ear="Bloodgem Earring",
			right_ear="Loquac. Earring",
			body="Gendewitha Bliaut",
			hands="Serpentes Cuffs",
			left_ring="K'ayres Ring",
			right_ring="Meridian Ring",
			back="Gigant Mantle",
			waist="Forest Sash",
			legs="Nares Trews",
			feet="Serpentes Sabots"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
			sub="Enki Strap",
			ammo="Seraphicaller",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+3','"Fast Cast"+5','MND+2','"Mag.Atk.Bns."+12',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}

	-- Precast BloodPact --
	sets.Precast.BloodPact = {}

	-- Elemental Staves --
	sets.Precast.Thunder = {main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},}
	sets.Precast.Water = {main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},}
	sets.Precast.Fire = {main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},}
	sets.Precast.Ice = {main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},}
	sets.Precast.Wind = {main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},}
	sets.Precast.Earth = {main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},}
	sets.Precast.Light = {main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},}
	sets.Precast.Dark = {main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},}

	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Cure Set --
	sets.Precast.Cure = {
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+4','INT+12','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+3','"Fast Cast"+5','MND+2','"Mag.Atk.Bns."+12',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Haste Set --
	sets.Midcast.Haste = {
			main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
			sub="Enki Strap",
			ammo="Seraphicaller",
			head={ name="Merlinic Hood", augments={'"Fast Cast"+4','AGI+1','Mag. Acc.+15',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body="Shango Robe",
			hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+3','"Fast Cast"+5','MND+2','"Mag.Atk.Bns."+12',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Merlinic Crackows", augments={'Accuracy+1','"Fast Cast"+4','INT+10','"Mag.Atk.Bns."+10',}},}

	-- Cure Set --
	sets.Midcast.Cure = {
			main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
			sub="Enki Strap",
			ammo="Seraphicaller",
			head="Marduk's Tiara +1",
			neck="Incanter's Torque",
			left_ear="Lifestorm Earring",
			right_ear="Beatific Earring",
			body="Vrikodara Jupon",
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Sirona's Ring",
			right_ring="Haoma's Ring",
			back="Tempered Cape",
			waist="Bishop's Sash",
			legs="Nabu's Shalwar",
			feet="Rubeus Boots"}

	-- Curaga Set --
	sets.Midcast.Curaga = {
			main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
			sub="Enki Strap",
			ammo="Seraphicaller",
			head="Nahtirah Hat",
			neck="Nuna Gorget +1",
			left_ear="Lifestorm Earring",
			right_ear="Loquac. Earring",
			body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			hands={ name="Telchine Gloves", augments={'Mag. Acc+3','"Cure" potency +7%','"Regen" potency+1',}},
			left_ring="Aquasoul Ring",
			right_ring="Karka Ring",
			back="Perimede Cape",
			waist="Pythia Sash +1",
			legs="Hagondes Pants",
			feet="Hagondes Sabots"}

	-- Enhancing Magic Set --
	sets.Midcast['Enhancing Magic'] = {
			head="Nabu's Tiara",
			left_ear="Augment. Earring",
			right_ear="Andoaa Earring",
			neck="Incanter's Torque",
			body="Manasa Chasuble",
			hands="Ayao's Gages",
			left_ring="Kishar Ring",
			right_ring="Veneficium Ring",
			waist="Olympus Sash",
			legs="Portent Pants",
			feet="Rubeus Boots"}

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Avatars Sets
	sets.Avatars = {
			main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
			sub="Oneiros Grip",
			ammo="Seraphicaller",
			head="Caller's Horn +2",
			neck="Caller's Pendant",
			body="Caller's Doublet +2",
			hands="Adhara Gages",
			left_ring="Evoker's Ring",
			right_ring="Defending Ring",
			waist="Hierarch belt",
			legs="Nares Trews",
			feet="Caller's Pgch. +2"}
	sets.Avatars['Carbuncle'] = set_combine(sets.Avatars,{hands="Carbuncle Mitts"})
	sets.Avatars['Diabolos'] = set_combine(sets.Avatars,{waist="Diabolos's Rope"})

	-- Avatar's Favor Set --
	sets.Favor = set_combine(sets.Avatars,{})

	-- Spirits Set --
	sets.Spirits = set_combine(sets.Avatars,{})

	sets.Midcast.Pet = {}
	-- Normal BloodPactWard/PD Set --
	sets.Midcast.Pet.BloodPactWard = {
			main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
			ammo="Seraphicaller",
			head="Con. Horn +1",
			neck="Caller's Pendant",
			right_ear="Smn. Earring",
			body="Anhur Robe",
			hands="Smn. Bracers +2",
			left_ring="Evoker's Ring",
			right_ring="Fervor Ring",
			back="Conveyance Cape",
			waist="Cimmerian Sash",
			legs="Marduk's Shalwar +1",
			feet="Mdk. Crackows +1"}

	-- Magic Accuracy BloodPactWard Set --
	sets.Midcast.Pet.BloodPactWard_MACC = set_combine(sets.Midcast.Pet.BloodPactWard,{
			legs="Smn. Spats +2",
			feet="Caller's Pgch. +2"})

	-- Physical BloodPactRage Set --
	sets.Midcast.Pet.PhysicalBloodPactRage = {
			main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
			sub="Vox Grip",
			ammo="Seraphicaller",
			head="Con. Horn +1",
			neck="Caller's Pendant",
			left_ear="Esper Earring",
			body="Con. Doublet +1",
			hands="Smn. Bracers +2",
			left_ring="Evoker's Ring",
			right_ring="Fervor Ring",
			back="Tiresias' Cape",
			waist="Diabolos's Rope",
			legs="Con. Spats +1",
			feet="Con. Pigaches +1"}

	-- Magical BloodPactRage Set --
	sets.Midcast.Pet.MagicalBloodPactRage = set_combine(sets.Midcast.Pet.PhysicalBloodPactRage,{
			head="Bokwus Circlet",
			legs="Caller's Spats +2",
			feet="Hagondes Sabots"})

	-- Shock Squall Set --
	sets.Midcast.Pet['Shock Squall'] = {
			main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
			sub="Vox Grip",
			ammo="Seraphicaller",
			head="Con. Horn +1",
			neck="Caller's Pendant",
			right_ear="Smn. Earring",
			body="Call. Doublet +2",
			hands="Smn. Bracers +2",
			left_ring="Evoker's Ring",
			right_ring="Fervor Ring",
			back="Tiresias' Cape",
			legs="Con. Spats +1",
			feet="Smn. Pigaches +2"}

	-- JA Sets --
	sets.JA = {}
	sets.JA['Mana Cede'] = {hands="Call. Bracers +2"}
	sets.JA['Elemental Siphon'] = set_combine(sets.Midcast.Pet.BloodPactWard,{feet="Caller's Pgch. +2"})
	sets.JA['Astral Flow'] = {head="Smn. Horn +2"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- WS Base Set --
	sets.WS = {}
	sets.WS.Shattersoul = {}
	sets.WS.Myrkr = {
			ammo="Pemphredo Tathlum",
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			neck="Sanctity Necklace",
			left_ear="Moonshade Earring",
			right_ear="Etiolation Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Toro Cape",
			waist="Refoccilation Stone",
			legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			feet="Jhakri Pigaches +2"}
	sets.WS["Garland of Bliss"] = {}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "SummonerPact" or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif spell.english == 'Shiva' and pet.isvalid then -- Change Shiva Spell To Sleepga When Shiva Is Present --
		cancel_spell()
		send_command('input /pet "Sleepga" <t>')
	elseif spell.english == 'Ramuh' and pet.isvalid then -- Change Ramuh Spell To Shock Squall When Ramuh Is Present --
		cancel_spell()
		send_command('input /pet "Shock Squall" <t>')
	elseif Avatars:contains(spell.english) and pet.isvalid then
		cancel_spell()
		send_command('input /pet "'..BloodPactWard[pet.name]..'" <me>;wait 5;Release')
	elseif Spirits:contains(spell.english) and pet.isvalid then
		cancel_spell()
		send_command('ElementalSiphon;wait 1;Release')
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
	elseif spell.type == "SummonerPact" then
		if (Avatars:contains(spell.english) or Spirits:contains(spell.english)) then
			if Cities:contains(world.area) then
				cancel_spell()
				add_to_chat(123,'Unable To Summon Pacts In Town')
				return
			else
				if buffactive.silence then -- Cancel SummoningMagic If You Are Silenced --
					cancel_spell()
					add_to_chat(123, spell.name..' Canceled: [Silenced]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			end
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then
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
	elseif string.find(spell.type,'BloodPact') then
		equip(sets.Precast.BloodPact)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and ElementalStaff == 'ON' then
		equip(sets.Precast[spell.element])
		end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif string.find(spell.english,'Cure') then
			equipSet = equipSet.Cure
		elseif string.find(spell.english,'Cura') then
			equipSet = equipSet.Curaga
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
	if not string.find(spell.type,'BloodPact') and not Avatars:contains(spell.english) and not Spirits:contains(spell.english) then
		status_change(player.status)
	elseif spell.english == "Sleepga" and not spell.interrupted then -- Sleepga Countdown --
		send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
	end
end

function status_change(new,old)
	if Armor == 'DT' then
		equip(sets.DT)
	elseif pet.isvalid then
		if SpiritPacts:contains(pet.name) then
			equip(sets.Spirits)
		elseif buffactive["Avatar's Favor"] then
			equip(sets.Favor)
		else
			equip(sets.Avatars)
			if sets.Avatars[pet.name] then
				equip(sets.Avatars[pet.name])
			end
		end
		if Kiting == 'ON' then
			equip({feet="Herald's Gaiters"})
		end
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
		if Kiting == 'ON' then
			equip({feet="Herald's Gaiters"})
		end
	elseif new == 'Engaged' then
		equip(sets.Melee)
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
	end
	if not midaction() then
		status_change(player.status)
	end
end

function pet_midcast(spell)
	if spell.english == 'Perfect Defense' then
		equip(sets.Midcast.Pet.BloodPactWard)
	elseif spell.type == 'BloodPactWard' then
		if DebuffBloodPactWard:contains(spell.english) then
			equip(sets.Midcast.Pet.BloodPactWard_MACC)
		elseif sets.Midcast.Pet[spell.english] then
			equip(sets.Midcast.Pet[spell.english])
		else
			equip(sets.Midcast.Pet.BloodPactWard)
		end
	elseif spell.type == 'BloodPactRage' then
		if MagicalRagePacts:contains(spell.english) then
			equip(sets.Midcast.Pet.MagicalBloodPactRage)
		else
			equip(sets.Midcast.Pet.PhysicalBloodPactRage)
		end
	end
end

function pet_aftercast(spell)
	if not spell.interrupted then
		-- Create custom timers for ward pacts.
		if durations[spell.english] then
			local timer_cmd = 'timers c "'..spell.english..'" '..tostring(durations[spell.english])..' down'

			if timer_icons[spell.english] then
				timer_cmd = timer_cmd..' '..timer_icons[spell.english]
			end

			send_command(timer_cmd)
		end
	end
	status_change(player.status)
end

function pet_change(pet,gain)
	status_change(player.status)
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Kiting Toggle --
		if Kiting == 'ON' then
			Kiting = 'OFF'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Kiting = 'ON'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C7' then
		if Armor == 'DT' then -- DT Toggle --
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
		set_macro_page(1, 15)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 15)
	elseif player.sub_job == 'SCH' then
		set_macro_page(3, 15)
	else
		set_macro_page(1, 15)
	end
end