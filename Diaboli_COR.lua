-------------------------------------------------------------------------------------------------------------------
-- (Original: Motenten / Modified: Arislan)
-------------------------------------------------------------------------------------------------------------------

--[[    Custom Features:

QuickDraw Selector  Cycle through available primary and secondary shot types, and trigger with a single macro
Haste Detection     Detects current magic haste level and equips corresponding engaged set to ptimize delay reduction (automatic)
Haste Mode          Toggles between Haste II and Haste I recieved, used by Haste Detection [WinKey-H]
Capacity Pts. Mode  Capacity Points Mode Toggle [WinKey-C]
Reive Detection     Automatically equips Reive bonus gear
Auto. Lockstyle     Automatically locks specified equipset on file load
--]]


-------------------------------------------------------------------------------------------------------------------

--[[

Custom commands:

gs c qd
Uses the currently configured shot on the target, with either <t> or <stnpc> depending on setting.

gs c qd t
Uses the currently configured shot on the target, but forces use of <t>.


Configuration commands:

gs c cycle mainqd
Cycles through the available steps to use as the primary shot when using one of the above commands.

gs c cycle altqd
Cycles through the available steps to use for alternating with the configured main shot.

gs c toggle usealtqd
Toggles whether or not to use an alternate shot.

gs c toggle selectqdtarget
Toggles whether or not to use <stnpc> (as opposed to <t>) when using a shot.

gs c toggle LuzafRing -- Toggles use of Luzaf Ring on and off


Offense mode is melee or ranged.  Used ranged offense mode if you are engaged
for ranged weaponskills, but not actually meleeing.

Weaponskill mode, if set to 'Normal', is handled separately for melee and ranged weaponskills.
--]]


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
mote_include_version = 2

-- Load and initialize the include file.
include('common_commands.lua')
include('AugmentedGear.lua')
include('Mote-Include.lua')
include('organizer-lib')
include('binds_melee.lua')

end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

-- QuickDraw Selector
state.Mainqd = M{['description']='Primary Shot', 'Earth Shot', 'Water Shot', 'Wind Shot', 'Fire Shot', 'Ice Shot', 'Thunder Shot'}
state.Altqd = M{['description']='Secondary Shot', 'Light Shot', 'Dark Shot'}
state.UseAltqd = M(false, 'Use Secondary Shot')
state.SelectqdTarget = M(false, 'Select Quick Draw Target')
state.IgnoreTargetting = M(false, 'Ignore Targetting')
state.HasteMode = M{['description']='Haste Mode', 'Haste I', 'Haste II'}

state.Currentqd = M{['description']='Current Quick Draw', 'Main', 'Alt'}

-- Whether to use Luzaf's Ring
state.LuzafRing = M(false, "Luzaf's Ring")

-- Whether a warning has been given for low ammo
state.warned = M(false)

define_roll_values()
determine_haste_group()

organizer_items = {'Trump Card Case', 'Trump Card', 'Chrono Bullet', 'Living Bullet', 'Animikii Bullet', 'Warp Ring', 'Dim. Ring (Mea)', 'Dim. Ring (Holla)'}

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('Normal', 'LowAcc', 'MidAcc', 'HighAcc', 'STP')
state.RangedMode:options('Normal', 'Acc')
state.WeaponskillMode:options('Normal', 'Acc')
state.CastingMode:options('Normal', 'Resistant')
state.IdleMode:options('Normal', 'DT')

gear.RAbullet = "Chrono Bullet"
gear.WSbullet = "Chrono Bullet"
gear.MAbullet = "Living Bullet"
gear.QDbullet = "Animikii Bullet"
options.ammo_warning_limit = 5

-- Additional local binds
send_command('bind !` input /ja "Double-up" <me>')
send_command ('bind @` gs c toggle LuzafRing')

-- send_command('bind ^- gs c cycleback mainqd')
-- send_command('bind ^= gs c cycle mainqd')
-- send_command('bind !- gs c cycle altqd')
-- send_command('bind != gs c cycleback altqd')
-- send_command('bind ^[ gs c toggle selectqdtarget')
-- send_command('bind ^] gs c toggle usealtqd')

if player.sub_job == 'DNC' then
send_command('bind ^, input /ja "Spectral Jig" <me>')
send_command('unbind ^.')

elseif player.sub_job == "RDM" or player.sub_job == "WHM" then
send_command('bind ^, input /ma "Sneak" <stpc>')
send_command('bind ^. input /ma "Invisible" <stpc>')

else
send_command('bind ^, input /item "Silent Oil" <me>')
send_command('bind ^. input /item "Prism Powder" <me>')
end

send_command('bind @h gs c cycle HasteMode')

select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
send_command('unbind ^`')
send_command('unbind !`')
send_command('unbind @`')
send_command('unbind ^-')
send_command('unbind ^=')
send_command('unbind !-')
send_command('unbind !=')
send_command('unbind ^[')
send_command('unbind ^]')
send_command('unbind ^,')
send_command('unbind @h')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

--------------------------------------
-- PRECAST SETS
--------------------------------------

sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
sets.precast.JA['Snake Eye'] = {legs="Lanun Culottes +1"}
sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
sets.precast.JA['Fold'] = {hands="Lanun Gants +1"}

sets.TripleShot = {body="Chasseur's Frac +1"}

sets.precast.CorsairRoll = {
--range="Compensator",
head="Lanun Tricorne +1",
body="Lanun Frac +1",
hands="Chasseur's Gants +1",
legs="Desultor Tassets",
feet=HercFeet.DT,
neck="Regal Necklace",
left_ear="Etiolation Earring",
right_ear="Genmei Earring",
left_ring="Luzaf's Ring",
waist="Flume Belt +1",
back="Camulus's Mantle",
}

sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes"})
sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})

sets.precast.LuzafRing = {left_ring="Luzaf's Ring"}
sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}

sets.precast.CorsairShot = {}

sets.precast.Waltz = {} -- CHR and VIT

sets.precast.Waltz['Healing Waltz'] = {}

sets.precast.FC = {
head="Carmine Mask", --12
body=TaeonBody.FC, --8
hands="Leyline Gloves", --7
feet="Carmine Greaves +1", --8
neck="Baetyl Pendant", --4
left_ear="Enchanter Earring +1", --2
right_ear="Loquacious Earring", --2
left_ring="Kishar Ring", --4
right_ring="Weatherspoon Ring", --5
}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

-------------------------------------------------------------------------------
-- RANGED ATTACK SETS
-------------------------------------------------------------------------------

sets.precast.RA = {
ammo=gear.RAbullet,
head=TaeonHead.Snap, --9
body="Pursuer's Doublet", --6
hands="Carmine Finger Gauntlets +1", --7
legs="Laksa. Trews +3", --15
feet="Meg. Jam. +2", --10
back=CORCape.Snap, --10
waist="Impulse Belt", --3
} -- 10% Gifts

sets.precast.RA2 = {
ammo=gear.RAbullet,
head="Aurore Beret +1", --5
body="Pursuer's Doublet", --6
hands="Carmine Finger Gauntlets +1", --7
legs="Adhemar Kecks", --9
feet="Meg. Jam. +2", --8
back="Navarch's Mantle", --6
waist="Impulse Belt", --3
} -- 10% Gifts

sets.midcast.RA = {
ammo=gear.RAbullet, 
head="Meghanada Visor +1",
body="Meg. Cuirie +1",
hands="Meg. Gloves +2",
legs="Meg. Chausses +1",
feet="Meg. Jam. +2",
neck="Iskur Gorget",
left_ear="Telos Earring",
right_ear="Enervating Earring",
left_ring="Ilabrat Ring",
right_ring="Petrov Ring",
back=CORCape.RAWSD,
waist="Reiki Yotai",
}

sets.midcast.RA.Acc = set_combine(sets.midcast.RA, {
ammo=gear.RAbullet,
head="Meghanada Visor +1",
body="Meg. Cuirie +1",
hands="Meg. Gloves +2",
legs="Meg. Chausses +1",
feet="Meg. Jam. +2",
neck="Iskur Gorget",
left_ear="Telos Earring",
right_ear="Enervating Earring",
left_ring="Cacoethic Ring +1",
right_ring="Dingir Ring",
back=CORCape.RAWSD,
waist="Eschan Stone",
})

-------------------------------------------------------------------------------
-- QUICK DRAW SETS
-------------------------------------------------------------------------------

sets.midcast.CorsairShot = {
ammo=gear.QDbullet,
head={ name="Blood Mask", augments={'Mag. Acc.+4','Water resistance+7','"Quick Draw" ability delay -5',}},
body={ name="Herculean Vest", augments={'VIT+5','"Store TP"+7','Quadruple Attack +2','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
hands="Schutzen Mittens",
legs="Chas. Culottes +1",
feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
neck="Iskur Gorget",
waist="Kentarch Belt +1",
left_ear="Telos Earring",
right_ear="Enervating Earring",
left_ring="Ilabrat Ring",
right_ring="Petrov Ring",
back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

-- sets.midcast.CorsairShot = {
-- ammo=gear.QDbullet,
-- head="Blood Mask",
-- body="Samnuha Coat",
-- hands="Carmine Fin. Ga. +1",
-- legs=HercLegs.MAB,
-- feet=HercFeet.MAB,
-- neck="Sanctity Necklace",
-- left_ear="Friomisi Earring",
-- right_ear="Novio Earring",
-- left_ring="Shiva Ring +1",
-- right_ring="Shiva Ring +1",
-- back="Gunslinger's Cape",
-- waist="Eschan Stone",
-- }

sets.midcast.CorsairShot['Light Shot'] = set_combine(sets.midcast.CorsairShot, {
head="Blood Mask",
body="Mummu Jacket +1",
hands="Mummu Wrists +1",
legs="Mummu Kecks +1",
feet=HercFeet.MAB,
neck="Sanctity Necklace",
waist="Eschan Stone",
left_ear="Gwati Earring",
right_ear="Digni. Earring",
left_ring="Kishar Ring",
right_ring="Weather. Ring",
back=CORCape.MAB,
})

sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']

-------------------------------------------------------------------------------
-- Weaponskill Sets
-------------------------------------------------------------------------------

-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
ammo=gear.WSbullet,
head="Meghanada Visor +1",
body="Meg. Cuirie +1",
hands="Meg. Gloves +2",
legs="Meg. Chausses +1",
feet="Meg. Jam. +2",
neck="Fotia Gorget",
left_ear="Moonshade Earring",
right_ear="Ishvara Earring",
left_ring="Ilabrat Ring",
right_ring="Epona's Ring",
back=CORCape.MAB,
waist="Fotia Belt",
}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


-------------------------------------------------------------------------------
-- RANGED WEAPON SKILLS
-------------------------------------------------------------------------------

sets.precast.WS['Leaden Salute'] =  {
ammo=gear.MAbullet,
head="Pixie Hairpin +1",
body="Laksa. Frac +3",
hands="Carmine Fin. Ga. +1",
legs=HercLegs.MAB,
feet=HercFeet.MAB,
neck="Sanctity Necklace",
waist="Svelt. Gouriz +1",
left_ear="Moonshade Earring",
right_ear="Friomisi Earring",
left_ring="Archon Ring",
right_ring="Dingir Ring",
back=CORCape.MAB,
}

sets.precast.WS['Leaden Salute'].HighAcc = {
ammo=gear.MAbullet,
head="Pixie Hairpin +1",
body="Laksa. Frac +3",
hands="Carmine Fin. Ga. +1",
legs=HercLegs.MAB,
feet=HercFeet.MAB,
neck="Sanctity Necklace",
waist="Eschan Stone",
left_ear="Moonshade Earring",
right_ear="Digni. Earring",
left_ring="Archon Ring",
right_ring="Dingir Ring",
back=CORCape.MAB,
}

sets.precast.WS['Leaden Salute'].FullTP = {right_ear="Novio Earring"}


sets.precast.WS['Wildfire'] = {
ammo=gear.MAbullet,
head="Pixie Hairpin +1",
body="Laksa. Frac +3",
hands="Carmine Fin. Ga. +1",
legs=HercLegs.MAB,
feet=HercFeet.MAB,
neck="Sanctity Necklace",
waist="Eschan Stone",
left_ear="Moonshade Earring",
right_ear="Friomisi Earring",
left_ring="Archon Ring",
right_ring="Dingir Ring",
back=CORCape.MAB,
}

sets.precast.WS['Last Stand'] = {
ammo=gear.WSbullet,
head=HercHead.RAWSD,
body="Laksa. Frac +3",
hands="Meg. Gloves +2",
legs=HercLegs.RAWSD,
feet=HercFeet.RAWSD,
neck="Fotia Gorget",
left_ear="Moonshade Earring",
right_ear="Ishvara Earring",
left_ring="Regal Ring",
right_ring="Dingir Ring",
waist="Fotia Belt",
back=CORCape.RAWSD,
}

sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {
ammo=gear.WSbullet,
})



-------------------------------------------------------------------------------
-- MELEE WEAPON SKILLS
-------------------------------------------------------------------------------

sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
head="Lilitu Headpiece",
body=HercBody.TA,
hands="Meg. Gloves +2",
legs="Samnuha Tights",
feet=HercFeet.DEXWSD,
neck="Caro Necklace",
waist="Grunfeld Rope",
left_ear="Moonshade Earring",
right_ear="Ishvara Earring",
left_ring="Ilabrat Ring",
right_ring="Ramuh Ring +1",
back=CORCape.MTP,
})

sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
head=HercHead.STRWSD,
body="Laksa. Frac +3",
hands="Meg. Gloves +2",
legs=HercLegs.STRWSD,
feet=HercFeet.STRWSD,
neck="Caro Necklace",
waist="Prosilio Belt +1",
left_ear="Moonshade Earring",
right_ear="Ishvara Earring",
left_ring="Rufescent Ring",
right_ring="Regal Ring",
back=CORCape.MWSD,
})

sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})

sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
head="Meghanada Visor +1",
body="Meg. Cuirie +1",
hands="Meg. Gloves +2",
legs="Meg. Chausses +1",
feet="Carmine Greaves +1",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear="Moonshade Earring",
right_ear="Ishvara Earring",
left_ring="Rufescent Ring",
right_ring="Epona's Ring",
back=CORCape.MAB,
}) 

sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS['Requiescat'], {})

-------------------------------------------------------------------------------
-- MIDCAST SETS
-------------------------------------------------------------------------------

sets.midcast.FastRecast = {
left_ear="Loquacious Earring",
right_ear="Etiolation Earring",
}

sets.midcast.Cure = {
neck="Incanter's Torque",
left_ear="Roundel Earring",
right_ear="Mendi. Earring",
left_ring="Lebeche Ring",
right_ring="Haoma's Ring",
waist="Bishop's Sash",
}   

sets.midcast.Utsusemi = {
waist="Ninurta's Sash",
}

-- sets.midcast['Dark Magic'] = {
-- ammo=gear.QDbullet,
-- head={ name="Herculean Helm", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','Magic burst mdg.+6%','MND+8','Mag. Acc.+9','"Mag.Atk.Bns."+14',}},
-- body="Pursuer's Doublet",
-- hands="Adhemar Wristbands",
-- legs="Chas. Culottes +1",
-- feet="Carmine Greaves +1",
-- neck="Iskur Gorget",
-- left_ear="Telos Earring",
-- right_ear="Enervating Earring",
-- left_ring="Petrov Ring",
-- right_ring="Chirich Ring",
-- back="Gunslinger's Cape",
-- waist="Oneiros Rope",       
-- }

-------------------------------------------------------------------------------
-- IDLE SETS
-------------------------------------------------------------------------------

-- Resting sets
sets.resting = {}

-- Idle sets
sets.idle = {
head=HercHead.DT, 
body="Emet Harness +1",
hands=HercHands.DT,
legs=HercLegs.DT,
feet=HercFeet.DT,
neck="Loricate Torque +1",
left_ear="Etiolation Earring",
right_ear="Genmei Earring",
left_ring="Defending Ring",
right_ring="Patricius Ring",
back="Moonbeam Cape",
waist="Flume Belt +1",
}

sets.idle.DT = set_combine (sets.idle, {
head=HercHead.DT, 
body="Emet Harness +1",
hands=HercHands.DT,
legs=HercLegs.DT,
feet=HercFeet.DT,
neck="Loricate Torque +1",
waist="Flume Belt +1",
left_ear="Etiolation Earring",
right_ear="Genmei Earring",
left_ring="Defending Ring",
right_ring="Patricius Ring",
back="Moonbeam Cape",
})

sets.idle.Town = set_combine(sets.idle, {
})


-- Defense sets
sets.defense.PDT = sets.idle.DT
sets.defense.MDT = sets.idle.DT

sets.Kiting = {legs="Carmine Cuisses +1"}

-------------------------------------------------------------------------------
-- ENGAGED SETS
-------------------------------------------------------------------------------

-- * DNC Subjob DW Trait: +15%
-- * NIN Subjob DW Trait: +25%

-- No Magic Haste (74% DW to cap) 49% needed /nin 59% /dnc
sets.engaged = {
head="Adhemar Bonnet +1",
body="Adhemar Jacket", --5
hands="Adhemar Wristbands +1",
legs="Samnuha Tights",
feet=HercFeet.TA,
neck="Iskur Gorget",
waist="Reiki Yotai", --7
left_ear="Telos Earring",
right_ear="Suppanomimi", --5
left_ring="Petrov Ring",
right_ring="Epona's Ring",
back=CORCape.MTP,
}

sets.engaged.LowAcc = set_combine(sets.engaged, {})

sets.engaged.MidAcc = set_combine(sets.engaged.LowAcc, {})

sets.engaged.STP = set_combine(sets.engaged, {
feet="Carmine Greaves +1",
neck="Iskur Gorget",
left_ear="Telos Earring",
right_ear="Cessance Earring",
left_ring="Ilabrat Ring",
right_ring="Epona's Ring",
waist="Kentarch Belt +1",
})

sets.engaged.HighAcc = set_combine(sets.engaged.MidAcc, {
head="Carmine Mask +1",
neck="Sanctity Necklace",
left_ear="Telos Earring",
right_ear="Digni. Earring",
body="Meg. Cuirie +1",
hands="Adhemar Wristbands +1",
left_ring="Ramuh Ring +1",
right_ring="Cacoethic Ring +1",
back=CORCape.MTP,
waist="Olseni Belt",
legs="Carmine Cuisses +1",
feet="Meg. Jam. +2"
})

-------------------------------------------------------------------------------
-- HIGH HASTE (15%)
-------------------------------------------------------------------------------
-- 15% Magic Haste (67% DW to cap) 42% as /nin 52% as /dnc
sets.engaged.LowHaste = sets.engaged

sets.engaged.LowAcc.LowHaste = set_combine(sets.engaged.LowHaste, {})

sets.engaged.MidAcc.LowHaste = set_combine(sets.engaged.LowHaste, {})

sets.engaged.HighAcc.LowHaste = sets.engaged.HighAcc

sets.engaged.STP.LowHaste = set_combine(sets.engaged.LowHaste, {
feet="Carmine Greaves +1",
neck="Iskur Gorget",
left_ear="Telos Earring",
right_ear="Cessance Earring",
left_ring="Ilabrat Ring",
right_ring="Epona's Ring",
waist="Kentarch Belt +1",
})

-------------------------------------------------------------------------------
-- HIGH HASTE (30%)
-------------------------------------------------------------------------------
-- 30% Magic Haste (56% DW to cap) 31% as /nin and 41% as /dnc
sets.engaged.MidHaste = sets.engaged 

sets.engaged.LowAcc.MidHaste = set_combine(sets.engaged.MidHaste, {})

sets.engaged.MidAcc.MidHaste = set_combine(sets.engaged.MidHaste, {})

sets.engaged.HighAcc.MidHaste = sets.engaged.HighAcc

sets.engaged.STP.MidHaste = set_combine(sets.engaged.MidHaste, {
feet="Carmine Greaves +1",
neck="Iskur Gorget",
left_ear="Telos Earring",
right_ear="Cessance Earring",
left_ring="Ilabrat Ring",
right_ring="Epona's Ring",
waist="Kentarch Belt +1",
})

-------------------------------------------------------------------------------
-- HIGH HASTE (35%)
-------------------------------------------------------------------------------
-- 35% Magic Haste (51% DW to cap) 26% as /nin and 36% as /dnc
sets.engaged.HighHaste = sets.engaged

sets.engaged.LowAcc.HighHaste = set_combine(sets.engaged.HighHaste, {})

sets.engaged.MidAcc.HighHaste = set_combine(sets.engaged.HighHaste, {})

sets.engaged.HighAcc.HighHaste = sets.engaged.HighAcc

sets.engaged.HighHaste.STP = set_combine(sets.engaged.HighHaste, {
feet="Carmine Greaves +1",
neck="Iskur Gorget",
left_ear="Telos Earring",
right_ear="Cessance Earring",
left_ring="Ilabrat Ring",
right_ring="Epona's Ring",
waist="Kentarch Belt +1",
})


-------------------------------------------------------------------------------
-- MAX HASTE (45%)
-------------------------------------------------------------------------------
-- 47% Magic Haste (36% DW to cap) 11% as /nin and 21% as /dnc
sets.engaged.MaxHaste = sets.engaged

sets.engaged.LowAcc.MaxHaste = set_combine(sets.engaged.MaxHaste, {})

sets.engaged.MidAcc.MaxHaste = set_combine(sets.engaged.MaxHaste, {})

sets.engaged.HighAcc.MaxHaste = sets.engaged.HighAcc

sets.engaged.STP.MaxHaste = set_combine(sets.engaged.MaxHaste, {
feet="Carmine Greaves +1",
neck="Iskur Gorget",
left_ear="Telos Earring",
right_ear="Cessance Earring",
left_ring="Ilabrat Ring",
right_ring="Epona's Ring",
waist="Kentarch Belt +1",
})

sets.Obi = {waist="Hachirin-no-Obi"}
sets.Reive = {neck="Arciela's Grace +1"}

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
-- Check that proper ammo is available if we're using ranged attacks or similar.
if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
do_bullet_checks(spell, spellMap, eventArgs)
end

-- gear sets
if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing.value then
equip(sets.precast.LuzafRing)
elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Resistant' then
classes.CustomClass = 'Acc'
elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
if sets.precast.FoldDoubleBust then
equip(sets.precast.FoldDoubleBust)
eventArgs.handled = true
end
end
end

function job_post_precast(spell, action, spellMap, eventArgs)
-- Equip obi if weather/day matches for WS/Quick Draw.
if spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
if spell.english == 'Leaden Salute' then
if world.weather_element == 'Dark' or world.day_element == 'Dark' then
equip(sets.Obi)
end
if player.tp > 2900 then
equip(sets.precast.WS['Leaden Salute'].FullTP)
end 
elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
equip(sets.Obi)
elseif spell.type == 'CorsairShot' and (spell.element == world.weather_element or spell.element == world.day_element) then
equip(sets.Obi)
end
end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
if spell.action_type == 'Ranged Attack' and buffactive['Triple Shot'] then
	equip(sets.TripleShot)
end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
if spell.type == 'CorsairRoll' and not spell.interrupted then
display_roll_info(spell)
end
end

function job_buff_change(buff,gain)
-- If we gain or lose any haste buffs, adjust which gear set we target.
if S{'haste', 'march', 'mighty guard', 'embrava', 'haste samba', 'geo-haste', 'indi-haste'}:contains(buff:lower()) then
determine_haste_group()
if not midaction() then
handle_equipping_gear(player.status)
end
end
if buffactive['Reive Mark'] then
equip(sets.Reive)
disable('neck')
else
enable('neck')
end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------


-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.

function job_update(cmdParams, eventArgs)
determine_haste_group()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.

function job_update(cmdParams, eventArgs)
determine_haste_group()
end

function get_custom_wsmode(spell, spellMap, default_wsmode)
if buffactive['Transcendancy'] then
return 'Brew'
end
end


-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
if newStatus == 'Engaged' and player.equipment.main == 'Chatoyant Staff' then
state.OffenseMode:set('Ranged')
end
end

-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)
if spell.type == 'CorsairShot' then
if state.IgnoreTargetting.value == true then
state.IgnoreTargetting:reset()
eventArgs.handled = true
end

eventArgs.SelectNPCTargets = state.SelectqdTarget.value
end
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
local msg = ''

msg = msg .. '[ Offense/Ranged: '..state.OffenseMode.current..'/'..state.RangedMode.current .. ' ]'
msg = msg .. '[ WS: '..state.WeaponskillMode.current .. ' ]'

if state.DefenseMode.value ~= 'None' then
msg = msg .. '[ Defense: ' .. state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ' ]'
end

if state.Kiting.value then
msg = msg .. '[ Kiting Mode: ON ]'
end

msg = msg .. '[ ' .. state.HasteMode.value .. ' ]'

msg = msg .. '[ *'..state.Mainqd.current

if state.UseAltqd.value == true then
msg = msg .. '/'..state.Altqd.current
end

msg = msg .. '* ]'

add_to_chat(060, msg)

eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
if cmdParams[1] == 'qd' then
if cmdParams[2] == 't' then
state.IgnoreTargetting:set()
end

local doqd = ''
if state.UseAltqd.value == true then
doqd = state[state.Currentqd.current..'qd'].current
state.Currentqd:cycle()
else
doqd = state.Mainqd.current
end     

send_command('@input /ja "'..doqd..'" <t>')
end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()

-- Gearswap can't detect the difference between Haste I and Haste II
-- so use winkey-H to manually set Haste spell level.

-- Haste (buffactive[33]) - 15%
-- Haste II (buffactive[33]) - 30%
-- Haste Samba - 5%/10%
-- Victory March +0/+3/+4/+5    9.4%/14%/15.6%/17.1%
-- Advancing March +0/+3/+4/+5  6.3%/10.9%/12.5%/14% 
-- Embrava - 30%
-- Mighty Guard (buffactive[604]) - 15%
-- Geo-Haste (buffactive[580]) - 40%

classes.CustomMeleeGroups:clear()

if state.HasteMode.value == 'Haste II' then
if(((buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604])) or
(buffactive[33] and (buffactive[580] or buffactive.embrava)) or
(buffactive.march == 2 and buffactive[604])) then
add_to_chat(215, '---------- <<<< | Magic Haste Level: 43% | >>>> ----------')
classes.CustomMeleeGroups:append('MaxHaste')
elseif ((buffactive[33] or buffactive.march == 2 or buffactive[580]) and buffactive['haste samba']) then
add_to_chat(004, '---------- <<<< | Magic Haste Level: 35% | >>>> ----------')
classes.CustomMeleeGroups:append('HighHaste')
elseif ((buffactive[580] or buffactive[33] or buffactive.march == 2) or
(buffactive.march == 1 and buffactive[604])) then
add_to_chat(008, '---------- <<<< | Magic Haste Level: 30% | >>>> ----------')
classes.CustomMeleeGroups:append('MidHaste')
elseif (buffactive.march == 1 or buffactive[604]) then
add_to_chat(007, '---------- <<<< | Magic Haste Level: 15% | >>>> ----------')
classes.CustomMeleeGroups:append('LowHaste')
end
else
if (buffactive[580] and ( buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604]) ) or
(buffactive.embrava and (buffactive.march or buffactive[33] or buffactive[604])) or
(buffactive.march == 2 and (buffactive[33] or buffactive[604])) or
(buffactive[33] and buffactive[604] and buffactive.march ) then
add_to_chat(215, '---------- <<<< | Magic Haste Level: 43% | >>>> ----------')
classes.CustomMeleeGroups:append('MaxHaste')
elseif ((buffactive[604] or buffactive[33]) and buffactive['haste samba'] and buffactive.march == 1) or
(buffactive.march == 2 and buffactive['haste samba']) or
(buffactive[580] and buffactive['haste samba'] ) then
add_to_chat(004, '---------- <<<< | Magic Haste Level: 35% | >>>> ----------')
classes.CustomMeleeGroups:append('HighHaste')
elseif (buffactive.march == 2 ) or
((buffactive[33] or buffactive[604]) and buffactive.march == 1 ) or  -- MG or haste + 1 march
(buffactive[580] ) or  -- geo haste
(buffactive[33] and buffactive[604]) then
add_to_chat(008, '---------- <<<< | Magic Haste Level: 30% | >>>> ----------')
classes.CustomMeleeGroups:append('MidHaste')
elseif buffactive[33] or buffactive[604] or buffactive.march == 1 then
add_to_chat(007, '---------- <<<< | Magic Haste Level: 15% | >>>> ----------')
classes.CustomMeleeGroups:append('LowHaste')
end
end
end

function define_roll_values()
rolls = {
["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
["Ninja Roll"]     = {lucky=4, unlucky=8, bonus="Evasion"},
["Hunter's Roll"]   = {lucky=4, unlucky=8, bonus="Accuracy"},
["Chaos Roll"]     = {lucky=4, unlucky=8, bonus="Attack"},
["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
["Healer's Roll"]   = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
["Drachen Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
["Choral Roll"]   = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
["Monk's Roll"]   = {lucky=3, unlucky=7, bonus="Subtle Blow"},
["Beast Roll"]     = {lucky=4, unlucky=8, bonus="Pet Attack"},
["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
["Evoker's Roll"]   = {lucky=5, unlucky=9, bonus="Refresh"},
["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
["Puppet Roll"]  = {lucky=3, unlucky=7, bonus="Pet Magic Attack/Accuracy"},
["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
["Wizard's Roll"]   = {lucky=5, unlucky=9, bonus="Magic Attack"},
["Dancer's Roll"]   = {lucky=3, unlucky=7, bonus="Regen"},
["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
["Naturalist's Roll"]      = {lucky=3, unlucky=7, bonus="Enh. Magic Duration"},
["Runeist's Roll"]     = {lucky=4, unlucky=8, bonus="Magic Evasion"},
["Bolter's Roll"]   = {lucky=3, unlucky=9, bonus="Movement Speed"},
["Caster's Roll"]   = {lucky=2, unlucky=7, bonus="Fast Cast"},
["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
["Allies' Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
}
end

function display_roll_info(spell)
rollinfo = rolls[spell.english]
local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

if rollinfo then
add_to_chat(104, '[ Lucky: '..tostring(rollinfo.lucky)..' / Unlucky: '..tostring(rollinfo.unlucky)..' ] '..spell.english..': '..rollinfo.bonus..' ('..rollsize..') ')
end
end


-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)
local bullet_name
local bullet_min_count = 1

if spell.type == 'WeaponSkill' then
if spell.skill == "Marksmanship" then
if spell.element == 'None' then
-- physical weaponskills
bullet_name = gear.WSbullet
else
-- magical weaponskills
bullet_name = gear.MAbullet
end
else
-- Ignore non-ranged weaponskills
return
end
elseif spell.type == 'CorsairShot' then
bullet_name = gear.QDbullet
elseif spell.action_type == 'Ranged Attack' then
bullet_name = gear.RAbullet
if buffactive['Triple Shot'] then
bullet_min_count = 3
end
end

local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]

-- If no ammo is available, give appropriate warning and end.
if not available_bullets then
if spell.type == 'CorsairShotShot' and player.equipment.ammo ~= 'empty' then
add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
return
elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
--          add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
return
else
add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
eventArgs.cancel = true
return
end
end

-- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
eventArgs.cancel = true
return
end

-- Low ammo warning.
if spell.type ~= 'CorsairShot' and state.warned.value == false
and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
local msg = '*****  LOW AMMO WARNING: '..bullet_name..' *****'
--local border = string.repeat("*", #msg)
local border = ""
for i = 1, #msg do
border = border .. "*"
end

add_to_chat(104, border)
add_to_chat(104, msg)
add_to_chat(104, border)

state.warned:set()
elseif available_bullets.count > options.ammo_warning_limit and state.warned then
state.warned:reset()
end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
if player.sub_job == 'DNC' then
set_macro_page(1, 12)
else
set_macro_page(1, 12)
end
end

function set_lockstyle()
send_command('wait 2; input /lockstyleset 1')
end
