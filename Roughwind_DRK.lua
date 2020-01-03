-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
 
                            --**** READ ME ****--
                             
-- THESE ARE UNIQUE FEATURES TO THIS LUA, IF YOU DO NOT LIKE THEM FEEL FREE TO EDIT ------------
 
     
                            --**** JOB ABILITY ***__
                         
-- If you have DS/NV on AND under 1k tp you will swap weapon to misanthropy and use duration helm for 4:30 drain3
-- If you are over 1k tp you will still swap to higher drain set, but not swap your weapon
-- SOULEATER will lock souleater helm for its duration, feel free to customize this for your SE gear in sets.
-- Both on with 8k+hp, Souleater and BLOODWEAPON will force a change to Daconmania (best weapon when both are up)
-- Arcane circle will force founder's body into your melee sets for the killer effects bonus
 
                            --**** Utility items ****---
                             
-- cast a spell when silenced (try to) and it will instead use an echo drop
-- Will alert in party chat when your doomed, and swap to doom set and try to use a holy water
-- if you /nin it will alert for common ninjitsu when your low
-- If SLEPT will equip frenzy helmet when your engaged, can change to torque also for same effect
-- will use adolin body when in correct towns for +25% mov
-- accounts for reieve neck you chose, while in a reive (never tested)
                 
                            --**** GEAR SPECIFIC ****--
                             
-- Lugra is used at night, lugra+moonshade for corresponding ws
-- add ws you want on moonshade earring to have your LEFT EAR be moonshade when under 2800tp else it will fall back to normal
-- when your hp drops BELOW 700 you will equip a special -dt set
-- auto equips correct Fotia Obi if day == spell.
 
 
                            --**** SETS ****--
                             
                            -- scythe atm is under constructions
                            -- omen too
                            -- acc set lacks 2 stp atm
                             
-- has an enmity toggle for casting stun/abs tp
-- You must manually cycle melee sets, you can add more to line 56 which says : for example adding a "Lib" set would look like
-- state.OffenseMode:options('Rag', 'RagACC', 'RagQA', 'Apoc', 'ApocACC', "Omen", "Lib")
 
-------------------------------------------------------------------------------------------------------------------
include('no_interruptions.lua') 
include('spam_protection.lua')  
include('how_about_no.lua') 
 
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
 
-- Load and initialize the include file.
    include('Mote-Include.lua')
end
 
include('Include/AugmentedGear.lua')
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('ACC', 'STP', 'DA', 'DAeva', 'Defencefight', "Liberator")
    state.HybridMode:options ('Reraise') 
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Enmity')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
 
    select_default_macro_book()
	set_lockstyle()
end
 
-- Elements for skillchain names
    skillchain_elements = {}
    skillchain_elements.Light = S{'Light','Fire','Wind','Lightning'}
    skillchain_elements.Darkness = S{'Dark','Ice','Earth','Water'}
    skillchain_elements.Fusion = S{'Light','Fire'}
    skillchain_elements.Fragmentation = S{'Wind','Lightning'}
    skillchain_elements.Distortion = S{'Ice','Water'}
    skillchain_elements.Gravitation = S{'Dark','Earth'}
    skillchain_elements.Transfixion = S{'Light'}
    skillchain_elements.Compression = S{'Dark'}
    skillchain_elements.Liquification = S{'Fire'}
    skillchain_elements.Induration = S{'Ice'}
    skillchain_elements.Detonation = S{'Wind'}
    skillchain_elements.Scission = S{'Earth'}
    skillchain_elements.Impaction = S{'Lightning'}
    skillchain_elements.Reverberation = S{'Water'}
 
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------
-- Precast Sets
 
-- add here to the ws list those you want moonshade on when less than 3000tp
    moonshade_WS = S{"Resolution", "Torcleaver", "Cross Reaper", "Quietus", "Entropy", "Insurgency", "Savage Blade", "Vorpal Blade", "Requiescat", "Sanguine Blade"}
 
-- Precast sets to enhance JAs
    sets.precast.JA['Diabolic Eye'] = {hands="Fall. Fin. Gaunt. +1"}
    sets.precast.JA['Arcane Circle'] = {feet="Ig. Sollerets +3"}
    sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +1"}
    sets.precast.JA['Souleater'] = {head="Ig. Burgonet +3"}
    sets.precast.JA['Weapon Bash'] = {hands="Ig. Gauntlets +3"}
	sets.precast.JA['Dark Seal'] = {head="Fall. Burgeonet +1"}
    sets.precast.JA['Last Resort'] = {back="Ankou's Mantle",feet="Fallen's Sollerets"}
    sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass"}
 
    sets.buff.Doom = {waist="Gishdubar sash",ring1="Purity Ring",ring2="Haoma's Ring"}
 
    Ankou={}
    Ankou.WSDSTR=   { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    Ankou.DA=       { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
    Ankou.WSDVIT=   { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}
    Ankou.ACC=      { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
    Ankou.FC=       { name="Ankou's Mantle", augments={'"Fast Cast"+10',}}
    Ankou.STP=      { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	Ankou.INT=		{ name="Ankou's Mantle", augments={'INT+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
-- Precast Sets
    sets.precast.FC = {
        ammo="Sapience Orb", --2
        head="Carmine Mask +1", --14
        neck="Voltsurge Torque", --4
        ear1="Loquacious Earring", --2
        ear2="Enchntr. Earring +1", --2
        body="Carm. Sc. Mail +1", --
        hands="Leyline Gloves", --8
        ring1="Weather. Ring", --5
        ring2="Kishar Ring", --2
        back=Ankou.FC, --10
        waist="Tempus fugit +1",
        legs="Eschite cuisses", --5
        feet={ name="Odyssean Greaves", augments={'Mag. Acc.+7','"Fast Cast"+6',}},} -- 8
        --65 FC
 
-- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.precast.FC,{})
 
    sets.midcast.Endark = {
        head="Ignominy Burgonet +1",
        neck="Erra Pendant",
        ear2="Dark Earring",
        ear1="Loquacious Earring",
        body="Carmine Scale Mail",
        hands="Fall. Fin. Gaunt. +1",
        left_ring="Stikini Ring",
        right_ring="Evanescence Ring",
        waist="Sailfi Belt +1",
        legs="Eschite cuisses",
        feet="Carmine Greaves +1",
        back="Niht Mantle",}
 
    sets.midcast['Endark II'] = set_combine(sets.midcast.Endark, {})
 
    -- has 3k hp
    sets.midcast['Dread Spikes'] = {
        ammo="Egoist's Tathlum",
        head="Ratri Sallet +1",
        body="Heathen's Cuirass +1",
        hands="Ratri Gadlings",
        legs="Ratri Cuisses +1",
        feet="Ratri Sollerets",
        neck="Sanctity necklace",
        waist="Tempus fugit+1",
        left_ear="Odnowa Earring +1",
        left_ring="",
        right_ring="Meridian Ring",
        back="Xucau Mantle",}
 
    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Ig. Burgonet +3",
        body="Carm. Sc. Mail +1",
        hands="Leyline gloves",
        legs="Eschite cuisses",
        feet="Carmine Greaves +1",
        neck="Sanctity necklace",
        waist="Eschan Stone",
        left_ear="Hecate's Earring",
        right_ear="Friomisi Earring",
        left_ring="Shiva Ring +1",
        right_ring="Shiva Ring +1",
        back=Ankou.FC,}
 
    sets.midcast['Enfeebling Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Carmine Mask +1",
        body="Ignominy Cuirass +3",
        hands="Leyline Gloves",
        legs="Eschite cuisses",
        feet="Carmine Greaves +1",
        neck="Sanctity necklace",
        waist="Casso Sash",
        left_ear="Enchntr. Earring +1",
        right_ear="Hermetic Earring",
        left_ring="Stikini Ring",
        right_ring="Stikini Ring",
        back=Ankou.FC,}
 
    sets.midcast.DarkMagic = {
        ammo="Pemphredo Tathlum",
        head="Ig. Burgonet +3",
        body="Carm. Sc. Mail +1",
        hands="Fall. Fin. Gaunt. +1",
        legs="Eschite cuisses",
        feet="Ratri Sollerets",
        neck="Erra Pendant",
        waist="Casso Sash",
        left_ear="Hermetic Earring",
        right_ear="Dark Earring",
        left_ring="Stikini Ring",
        right_ring="Evanescence Ring",
        back="Niht Mantle",}
         
    sets.midcast.Stun = set_combine(sets.midcast.DarkMagic, {
        head="Carmine Mask +1",
        hands="Leyline Gloves",
        waist="Eschan Stone",
        legs="Eschite cuisses",
        feet="Carmine Greaves +1",
        back=Ankou.FC})
 
    sets.midcast['Absorb-STR'] = {
        ammo="Pemphredo Tathlum",
        head="Ig. Burgonet +3",
        body="Carm. Sc. Mail +1",
        legs="Eschite cuisses",
        feet="Ratri Sollerets",
        neck="Erra Pendant",
        waist="Casso Sash",
        left_ear="Digni. Earring",
        right_ear="Enchntr. Earring +1",
		left_ring="Kishar Ring",
        right_ring="Evanescence Ring",
        hands="Pavor Gauntlets",
        back="Chuparrosa Mantle",}
         
    sets.midcast['Absorb-DEX'] = sets.midcast['Absorb-STR']
    sets.midcast['Absorb-VIT'] = sets.midcast['Absorb-STR']
    sets.midcast['Absorb-AGI'] = sets.midcast['Absorb-STR']
    sets.midcast['Absorb-INT'] = sets.midcast['Absorb-STR']
    sets.midcast['Absorb-MND'] = sets.midcast['Absorb-STR']
    sets.midcast['Absorb-CHR'] = sets.midcast['Absorb-STR']
    sets.midcast['Absorb-ACC'] = sets.midcast['Absorb-STR']
    sets.midcast['Absorb-Attri'] = sets.midcast['Absorb-STR']
    sets.midcast['Absorb-TP'] = sets.midcast['Absorb-STR']
 
    sets.midcast.Drain = {
        ammo="Pemphredo Tathlum",
        neck="Erra Pendant",
        left_ear="Digni. Earring",
        feet="Ratri Sollerets",
        head="Fall. Burgeonet +1",
        body="Carm. Sc. Mail +1",
        hands="Fall. Fin. Gaunt. +1",
        left_ring="Archon Ring",
        right_ring="Evanescence Ring",
        back="Niht Mantle",
        waist="Austerity belt +1",
        legs="Eschite cuisses",
		right_ear="Hirudinea Earring"}
 
    sets.midcast.Aspir = set_combine(sets.midcast.Drain, {})
     
     
    --toggle enmity so that all casting sets have +enmity for tanking
    sets.midcast.Stun.Enmity = set_combine(sets.Enmity, {})
    --sets.midcast['Absorb-DEX'].Enmity = set_combine(sets.Enmity, {})
    --sets.midcast['Absorb-VIT'].Enmity = set_combine(sets.Enmity, {})
    --sets.midcast['Absorb-AGI'].Enmity = set_combine(sets.Enmity, {})
    --sets.midcast['Absorb-INT'].Enmity = set_combine(sets.Enmity, {})
    --sets.midcast['Absorb-MND'].Enmity = set_combine(sets.Enmity, {})
    --sets.midcast['Absorb-CHR'].Enmity = set_combine(sets.Enmity, {})
    --sets.midcast['Absorb-ACC'].Enmity = set_combine(sets.Enmity, {})
    --sets.midcast['Absorb-Attri'].Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Absorb-TP'].Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Elemental Magic'].Enmity = set_combine(sets.Enmity, {})
    sets.midcast['Enfeebling Magic'].Enmity = set_combine(sets.Enmity, {})
 
-- Weaponskill sets
-- FOR ANY WS NOT DEFINED WILL USE BELOW
sets.precast.WS ={
        ammo="Seething Bomblet +1",
        head="Argosy Celata +1",
        body="Ignominy Cuirass +3",
        hands="Argosy Mufflers +1",
        legs="Argosy Breeches +1",
        feet="Argosy Sollerets +1",
        neck="Fotia Gorget",
        waist="Grunfeld rope",
        left_ear="Cessance earring",
        right_ear="Brutal earring",
        left_ring="Ifrit Ring +1",
        right_ring="Niqmaddu Ring",
        back=Ankou.WSDSTR}
         
-------------------------------------------------------------- SCYTHE -----------------------------------------------------------------------
-- Stat Modifier:   40% STR / 40% INT   fTP:    2.75
--Relic Aftermath: 10% Equipment Haste (+102/1024) AG 10% Ability
    sets.precast.WS['Catastrophe'] = {
        ammo="Knobkierrie",
        head=OdysHead.WSD,
        body="Ignominy Cuirass +3",
        hands=OdysHands.WSDSTR,
        legs=OdysLegs.WSDSTR,
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist="Metalsinger Belt",
        left_ear="Brutal earring",
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.WSDSTR}
 
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS['Catastrophe'], {
        head="Argosy Celata +1",
        hands=OdysHands.WSDSTR,
        legs=OdysLegs.WSDSTR,
        left_ear="Cessance earring",
        right_ear="Telos Earring",
        left_ring="Ramuh Ring +1",
        back=Ankou.WSDSTR})
 
-- Delivers a two-hit attack. Damage varies with TP.
-- Stat Modifier:   60% STR / 60% MND fTP:  2.0 4.0 7.0
    sets.precast.WS['Cross Reaper'] = {
        ammo="Knobkierrie",
        head="Ratri Sallet +1",
        body="Ignominy Cuirass +3",
        hands="Ratri Gadlings",
        legs="Ratri Cuisses +1",
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal earring",
        right_ear="Ishvara earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.WSDSTR}
 
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS['Cross Reaper'], {
        head="Ratri Sallet +1",
        body="Ignominy Cuirass +3",
        hands="Emicho Gauntlets",
        legs="Ratri Cuisses +1",
        left_ear="Cessance Earring",
        right_ear="Telos earring",
        left_ring="Regal Ring",})
 
-- Delivers a triple damage attack that ignores target's defense. Amount ignored varies with TP.
--Stat Modifier:    60% STR / 60% MND Defense ignored:  10% 30% 50% fTP:    3.0
    sets.precast.WS['Quietus'] = {
        ammo="Knobkierrie",
        head="Ratri Sallet +1",
        body="Ignominy Cuirass +3",
        hands="Ratri Gadlings",
        legs="Ratri Cuisses +1",
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist="Metalsinger Belt",
        left_ear="Brutal earring",
        right_ear="Ishvara earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.WSDSTR}
 
    sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS['Quietus'], {
        head=ValoHead.WSD,
        hands=OdysHands.WSDSTR,
        legs=OdysLegs.WSDSTR,
        right_ear="Telos Earring",
        left_ear="Cessance earring",})
 
-- Delivers a fourfold attack. Converts some of the damage into MP. Damage varies with TP.
-- Stat Modifier:   73~85% INT fTP: 0.75    1.25    2.0
-- This weaponskill has its fTP transferred across all hits, making Elemental 
-- Gorgets and Elemental Belts excellent neck and waist gear options.
    sets.precast.WS['Entropy'] = {
        ammo="Pemphredo Tathlum",
        head="Ratri Sallet +1",
        body="Ignominy Cuirass +3",
        hands="Ig. Gauntlets +3",
        legs="Ig. Flanchard +3",
        feet=ValoFeet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Cessance earring",
        right_ear="Brutal Earring",
        left_ring="Shiva Ring +1",
        right_ring="Shiva Ring +1",
        back=Ankou.INT}
 
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS['Entropy'], {
        legs="Sulevia's Cuisses +1",
        ammo="Seething Bomblet",
        head="Argosy Celata +1",
        back=Ankou.ACC})
 
--Delivers a fourfold attack. Damage varies with TP.
-- Stat Modifier:   20% STR / 20% INT fTP:  0.5 3.25    6.0
    sets.precast.WS['Insurgency'] = {
        ammo="Seething Bomblet",
        head="Argosy Celata +1",
        body="Ignominy Cuirass +3",
        hands="Argosy Mufflers +1",
        legs="Ig. Flanchard +3",
        feet="Argosy Sollerets +1",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Cessance earring",
        right_ear="Brutal earring",
        left_ring="Ifrit Ring +1",
        right_ring="Niqmaddu Ring",
        back=Ankou.DA}
 
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS['Insurgency'], {
        right_ear="Telos Earring",
        left_ring="Ramuh Ring +1",
        back=Ankou.ACC})
 
-------------------------------------------------------------------- SWORD ---------------------------------------------------------------------------------
-- Stat Modifier:   50% MND / 30% STR   fTP:    2.75
-- dSTAT:   (pINT-mINT)*2
    sets.precast.WS['Sanguine Blade'] = {   
        ammo="Knobkierrie",
        head="Pixie Hairpin +1",
        body="Carm. Sc. Mail +1",
        hands="Leyline gloves",
        legs=ValoLegs.MAB,
        feet=OdysFeet.MACC,
        neck="Sanctity necklace",
        waist="Eschan Stone",
        left_ear="Moonshade Earring",
        right_ear="Ishvara Earring",
        left_ring="Acumen Ring",
        right_ring="Shiva Ring +1",
        back=Ankou.WSDSTR}
 
-- Delivers an aerial attack comprised of two hits. Damage varies with TP.
-- Stat Modifier:   50% MND / 50% STR          fTP: 4.0 10.25   13.75
    sets.precast.WS['Savage Blade'] = {
        ammo="Knobkierrie",
        head=OdysHead.WSD,
        body="Ignominy Cuirass +3",
        hands=OdysHands.WSDSTR,
        legs=OdysLegs.WSD,
        feet="Sulev. Leggings +1",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal earring",
        right_ear="Ishvara Earring",
        left_ring="Rufescent Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.WSDSTR}
         
-- Delivers a fivefold attack, non-elemental damage. Attack power varies with TP.
-- Stat Modifier:   73~85% MND
    sets.precast.WS['Requiescat'] = {
        ammo="Seething Bomblet",
        head="Argosy Celata +1",
        body="Ignominy Cuirass +3",
        hands="Argosy Mufflers +1",
        legs="Argosy Breeches +1",
        feet="Argosy Sollerets +1",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Cessance earring",
        right_ear="Telos earring",
        left_ring="Rufescent Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.DA}
 
-- Delivers a fourfold attack. Chance of critical hit varies with TP.
-- Stat Modifier:   60% STR fTP:    1.375
-- This weaponskill has its fTP transferred across all hits, making Elemental Gorgets 
-- and Elemental Belts excellent neck and waist gear options. 
    sets.precast.WS['Vorpal Blade'] = {
        ammo="Seething Bomblet",
        head="Argosy Celata +1",
        body="Ignominy Cuirass +3",
        hands="Argosy Mufflers +1",
        legs="Argosy Breeches +1",
        feet="Thereoid greaves",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Cessance earring",
        right_ear="Telos earring",
        left_ring="Begrudging Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.DA}
 
----------------------------------------------------------------- GREAT SWORD ---------------------------------------------------------------------------
-- Description: Deals triple damage. Damage varies with TP.
-- Stat Modifier:   80% VIT fTP:    4.75    7.5 10
    sets.precast.WS['Torcleaver'] = {
        ammo="Knobkierrie",
        head=OdysHead.WSD,
        body="Ignominy Cuirass +3",
        hands=OdysHands.WSDVITACC,
        legs=OdysLegs.WSD,
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Moonshade earring",
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.WSDVIT}
 
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS['Torcleaver'], {
        ammo="Knobkierrie",
        head=OdysHead.WSD,
        hands=OdysHands.WSDVITACC,
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        right_ear="Brutal earring",})
 
--Relic Aftermath: +5% Critical Hit Rate 15 acc
-- Stat Modifier:   40% STR / 40% VIT   fTP:    3.0
    sets.precast.WS['Scourge'] = {
        ammo="Knobkierrie",
        head=OdysHead.WSD,
        body="Ignominy Cuirass +3",
        hands=OdysHands.WSDVITACC,
        legs=OdysLegs.WSD,
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal earring",
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.WSDSTR}
 
    sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS['Scourge'], {
        hands=OdysHands.WSDSTR,
        legs=OdysLegs.WSD,
        waist="Grunfeld Rope",
        left_ear="Cessance earring",
        right_ear="Brutal earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",})
         
--Description:  Delivers a fivefold attack. Damage varies with TP.
--Stat Modifier:    73~85% STR fTP: 0.71875 1.5 2.25
-- This weaponskill has its fTP transferred across all hits, making
-- Elemental Gorgets and Elemental Belts excellent neck and waist gear options.
    sets.precast.WS['Resolution'] = {
        ammo="Seething Bomblet +1",
        head="Argosy Celata +1",
        body="Argosy Hauberk +1",
        hands="Argosy Mufflers +1",
        legs="Ig. Flanchard +3",
        feet="Argosy Sollerets +1",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Cessance earring",
        right_ear="Brutal earring",
        left_ring="Regal Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.DA}
 
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {
        hands=OdysHands.WSDSTR,
        left_ring="Ramuh Ring +1",
        back=Ankou.ACC})
 
-- Idle sets 
    sets.idle = {
        neck="Loricate Torque +1",
        ammo="Staunch Tathlum +1",
        ear2="Odnowa Earring +1",
        ear1="Genmei Earring",
        body="Lugra cloak +1",
        hands="Sulev. Gauntlets +2",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back="Solemnity Cape",
        waist="Flume belt +1",
        legs="Carmine cuisses +1",
        feet="Sulev. Leggings +2"}
         
    sets.idle.Town = {
        ammo="Staunch Tathlum +1",
        head="Ratri Sallet +1",
        body="Argosy Hauberk +1",
        hands="Argosy Mufflers +1",
        legs="Carmine Cuisses +1",
        feet="Argosy Sollerets +1",
        neck="Loricate Torque +1",
        waist="Ioskeha belt +1",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Moonlight Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.WSDSTR}
         
    sets.idle.Weak = {
        ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2",
        body="Ignominy Cuirass +3",
        hands="Sulev. Gauntlets +2",
        legs="Carmine Cuisses +1",
        feet="Sulev. Leggings +2",
        neck="Loricate torque +1",
        waist="Gishdubar Sash",
        left_ear="",
        right_ear="Odnowa Earring +1",
        left_ring="Defending Ring",
        right_ring="Meridian Ring",
        back="Solemnity Cape",}
 
    sets.resting = set_combine(sets.idle, {})
     
-- Defense sets
    sets.defense.PDT = {
        ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2",
        body="Sulevia's Plate. +1",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Loricate torque +1",
        waist="Flume belt",
        left_ear="Odnowa earring +1",
        right_ear="Genmei Earring",
        left_ring="Defending Ring",
        right_ring="Niqmaddu Ring",
        back="Solemnity Cape",}
         
    sets.defense.PDTLOWhp = {
        ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2",
        body="Sulevia's Plate. +1",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Loricate torque +1",
        waist="Tempus fugit +1",
        right_ear="Cessance earring",
        left_ear="Odnowa earring +1",
        left_ring="Defending Ring",
        right_ring="Niqmaddu Ring",
        back="Solemnity Cape",}
 
    sets.defense.Reraise = set_combine(sets.defense.PDT,{head="Twilight Helm",body="Twilight Mail",})
 
    sets.defense.MDT = set_combine(sets.defense.PDT,{
        back="Agema cape",})
 
-- Engaged sets
-- rag with 20 stp on ws, need 57 stp on tp /sam for 5 hit
-- 14 / 58  61/5
-- 1182 acc 61 stp 48 DA 
    sets.engaged.Liberator = {
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        hands={ name="Odyssean Gauntlets", augments={'"Dbl.Atk."+3','Pet: MND+4','Quadruple Attack +2','Accuracy+6 Attack+6','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
        legs=OdysLegs.STP,
        feet=ValoFeet.STP,
        neck="Combatant's torque",
        body=ValoBody.STP,
        waist="Ioskeha belt +1",
        right_ear="Cessance earring",
        left_ear="Telos earring",
        left_ring="Moonlight Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.STP}
 
-- 1256 61 stp 34 DA
    sets.engaged.ACC = {
        ammo="Ginsen",
        head="Argosy Celata +1",
        body=ValoBody.STP,
        hands="Emicho Gauntlets",
        legs=OdysLegs.STP,
        feet=ValoFeet.STP,
        neck="Combatant's torque",
        waist="Ioskeha belt +1",
        left_ear="Cessance earring",
        right_ear="Telos Earring",
        left_ring="Moonlight Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.ACC}

 
    sets.engaged.Defencefight = {
        ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2",
        body="Sulevia's Plate. +1",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Loricate torque +1",
        waist="Tempus fugit +1",
        right_ear="Telos Earring",
        left_ear="Cessance Earring",
        left_ring="Moonlight Ring",
        right_ring="Niqmaddu Ring",
        back=Ankou.ACC,}
         
-- for 4 hit ws/tp stp values : 5/81, 14/78 , 15/77 , 17/76 , 21/75
    sets.engaged.DAmeva1 = {
        ammo="Ginsen", --3
        head="Flam. Zucchetto +2", --7
        hands={ name="Odyssean Gauntlets", augments={'"Dbl.Atk."+3','Pet: MND+4','Quadruple Attack +2','Accuracy+6 Attack+6','Mag. Acc.+9 "Mag.Atk.Bns."+9',}}, --7
        legs="Ig. Flanchard +3", --11
        feet=ValoFeet, --12
        neck="Lissome Necklace", --8
        body=ValoBody.STP, --10
        waist="Ioskeha belt +1",
        right_ear="Telos Earring", --5
        left_ear="Cessance Earring", --3
        left_ring="Moonlight Ring", --5
        right_ring="Niqmaddu Ring",
        back=Ankou.ACC} --10
        -- stp 81
 
-- 5 hit: ws/tp stp value : 5/32 only       
    sets.engaged.STP = {
        ammo="Ginsen", --3
        head="Flam. Zucchetto +2", --7
        hands={ name="Odyssean Gauntlets", augments={'"Dbl.Atk."+3','Pet: MND+4','Quadruple Attack +2','Accuracy+6 Attack+6','Mag. Acc.+9 "Mag.Atk.Bns."+9',}}, --7
        legs=OdysLegs.STP, --11
        feet=ValoFeet.STP, --12
        neck="Combatant's torque", --8
        body=ValoBody.STP, --10
        waist="Ioskeha belt +1",
        right_ear="Telos Earring", --5
        left_ear="Cessance Earring", --3
        left_ring="Moonlight Ring", --5
        right_ring="Niqmaddu Ring",
        back=Ankou.ACC} --10
        -- stp 81
 
-- 5/32 ... 41 DA 4 TA 1248 acc  5 hit (4 hit is 77)
    sets.engaged.DA =  {
		ammo="Ginsen", --3
        head="Argosy Celata +1", --7
        hands="Argosy Mufflers +1", --7
        legs="Ig. Flanchard +3", --11
        feet=ValoFeet, --12
        neck="Lissome Necklace", --8
        body=ValoBody.STP, --10
        waist="Ioskeha belt +1",
        right_ear="Telos Earring", --5
        left_ear="Cessance Earring", --3
        left_ring="Moonlight Ring", --5
        right_ring="Niqmaddu Ring",
        back=Ankou.ACC}
         
    sets.engaged.DAeva = { -- not in use atm but break 1300
        ammo="Ginsen", --3
        head="Flam. Zucchetto +2", --7
        hands={ name="Odyssean Gauntlets", augments={'"Dbl.Atk."+3','Pet: MND+4','Quadruple Attack +2','Accuracy+6 Attack+6','Mag. Acc.+9 "Mag.Atk.Bns."+9',}}, --7
        legs="Ig. Flanchard +3", --11
        feet=ValoFeet, --12
        neck="Lissome Necklace", --8
        body=ValoBody.STP, --10
        waist="Ioskeha belt +1",
        right_ear="Telos Earring", --5
        left_ear="Cessance Earring", --3
        left_ring="Moonlight Ring", --5
        right_ring="Niqmaddu Ring",
        back=Ankou.ACC}
         
    sets.SEBW = {main="Dacnomania", head="Ignominy Burgonet +1"}
    sets.SE = {head="Ig. Burgonet +3"}
    sets.buff.Doom = {ring1="Purity Ring", ring2="Haoma's Ring", waist="Gishdubar Sash"} -- could use holy water rings also
     
end
 
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-no-Obi"})
        end
    end
    if S{"Torcleaver","Resolution","Catastrophe","Scourge","Cross Reaper"}:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
        equip({head="Gavialis Helm"})
    end
    if S{"Drain","Drain II","Drain III", "Aspir", "Aspir II", "Aspir III"}:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
        equip({waist="Hachirin-no-obi"})
    end
    
    if buffactive['Dark Seal'] and S{"Drain III","Absorb-STR","Absorb-DEX","Absorb-VIT","Absorb-ACC",}:contains(spell.english)then
        equip({head="Fall. Burgeonet +1"})
    end
end
 
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
            equip({ear2="Moonshade earring", ear1="Lugra Earring +1"})
        end
    end
    if spell.action_type=="Magic" and buffactive.Silence then
        eventArgs.cancel = true
        send_command('input /item "Echo Drops" <me>')
    end
    if spell.type=='WeaponSkill' then
        if moonshade_WS:contains(spell.english) and player.tp<2900 then
            equip({ear1="Moonshade Earring"})
        end
    end
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff:lower()=='terror' or buff:lower()=='petrification' or buff:lower()=='sleep' or buff:lower()=='stun' then
        if gain then
            equip(sets.defense.PDT)
        elseif not gain then 
            handle_equipping_gear(player.status)
        end
    end
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
    if buff:lower()=='sleep' then
        if gain and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque / frenzy When You Are Asleep
            equip({head="Frenzy Sallet"})
        elseif not gain then -- Take Berserker's off
            handle_equipping_gear(player.status)
        end
    end
    if buffactive['Reive Mark'] then
        equip(sets.Reive)
        disable('neck')
    else
        enable('neck')
    end
    if buffactive['Souleater'] then
        equip(sets.SE)
        disable('Head')
        --add_to_chat(100,'WARNING: SOUL EATER HEAD ON ONLY.')
    else
        enable('Head')
    end
    if buffactive['Blood Weapon'] and buffactive['Souleater'] and player.hp > 5000 then
        equip(sets.SEBW)
        disable('Head')
        --add_to_chat(100,'WARNING: SOUL EATER HEAD ON AND &&&& Dacnomania.')
    else
        enable('Head')
    end
    if buff == "doom" then
        if gain then           
            equip(sets.buff.Doom)
            send_command('@input /p Doomed please cursna.')
            send_command('@input /item "Holy Water" <me>')
            disable('ring1','ring2','waist')
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end
end
 
ninjaTools = {
        Utsusemi = S{"Shihei",},--"Shikanofuda" 
        Hojo = S{"Kaginawa",},--"Chonofuda"
        Migawari = S{"Mokujin",},
        Kakka = S{"Ryuno",},
        Tonko = S{"Shinobi-tabi",},
        Kurayami = S{"Sairui-Ran",},
        Raiton = S{"Hiraishin",},
        Hyoton = S{"Tsurara",},
        Monomi = S{"Sanjaku-Tenugui",},
    }
	
function precast(spell,action) 
		if check_ready(spell) then
				 spam_protection_on(spell) 
		else 
			cancel_spell() 
		end
end
  
function job_precast(spell, action, spellMap, eventArgs)
    if spell.type=="Ninjutsu" then check_tools(spell) end
end
 
function check_tools(spell)
    for prefix,tools in pairs(ninjaTools) do
        if spell.english:startswith(prefix) then
            for tool in tools:it() do
                if not player.inventory[tool] then
                    add_to_chat(100,'WARNING: You are out of '..tool..'.')
                elseif player.inventory[tool].count < 10 then
                    add_to_chat(100,'WARNING: You are low on '..tool..'. '..player.inventory[tool].count..' remaining.')
                end
            end
        end
    end
end
 
function customize_melee_set(meleeSet)
    if state.Buff.Sleep and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep
        meleeSet = set_combine(meleeSet,{head="Frenzy Sallet"})
    end
    if player.hp < 700 then
        meleeSet = set_combine(meleeSet, sets.engaged.Defencefight)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    if buffactive['Arcane Circle'] then
        meleeSet = set_combine(meleeSet, {body="Founder's Breastplate"})
    end
    return meleeSet
end
 
function customize_idle_set(idleSet)
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    if S{"Eastern Adoulin","Western Adoulin"}:contains(world.area) then
        idleSet = set_combine(idleSet,{body="Argosy Hauberk +1", head="Ratri Sallet +1"})
    end
    return idleSet
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
set_macro_page(3, 10)
end
function set_lockstyle()
	send_command('wait 4; input /lockstyleset 100')
end

function handle_ping() 
		if player.status ~= 'Resting' then 
		if doCures then 
		cure_process() 
		showArrayContents()
		handleSpareTime() 
			end 
		else 
		lastx = player.x 
		lasty = player.y 
		end 
end
