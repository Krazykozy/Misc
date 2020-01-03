-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.
    
    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
	
	send_command('input /macro book 1;wait .1;input /macro set 9')
	
	send_command('wait 1;input /lockstyleset 10')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
    
    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Mod')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')


    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
    gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind !- gs c cycle targetmode')

end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {hands="Plunderer's Armlets +1", waist="Chaac Belt", feet="Skulk. Poulaines +1"}
    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
    sets.Kiting = {feet="Trotter Boots"}

    sets.buff['Sneak Attack']
    head={ name="Meghanada Visor +1",
    body="Herculean Vest",
    hands="Meg. Gloves +1",
    legs="Lustratio Subligar",
    feet={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}},
    neck="Caro Necklace",
    waist="Wanion Belt",
    left_ear="Sherida Earring",
    right_ear="Mache Earring",
    left_ring="Ramuh Ring",
    right_ring="Labrat Ring",
    back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','AGI+10',}}}

    sets.buff['Trick Attack'] = {ammo="Yetshila",
    head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
    body="Meg. Cuirie +1",
    hands="Skulk. Armlets +1",
    legs="Darraigner's Brais",
    feet="Meg. Jam. +1",
    neck="Asperity Necklace",
    waist="Chaac Belt",
    left_ear="Enervating Earring",
    right_ear="Brutal Earring",
    left_ring="Garuda Ring",
    right_ring="Solemn Ring",
    back="Cavaros Mantle"}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter
	sets.precast.JA['Bully'] = sets.TreasureHunter
	
	
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {head="Raider's Bonnet +2"}
    sets.precast.JA['Accomplice'] = {head="Raider's Bonnet +2"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
    sets.precast.JA['Hide'] = {body="Pillager's Vest +2"}
    sets.precast.JA['Conspirator'] = {} -- {body="Raider's Vest +2"}
    sets.precast.JA['Steal'] = {head="Plunderer's Bonnet",hands="Pillager's Armlets +1",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}
    sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Whirlpool Mask",
        body="Passion Jacket",hands="Plunderer's Armlets +1",ring1="Valseur's Ring", ring2="Titan Ring",
        back="Iximulew Cape",waist="Chaac Belt",legs="Plunderer's Culottes +1",feet="Jute Boots +1"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {head="Haruspex Hat",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring",legs="Enif Cosciales"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    -- Ranged snapshot gear
    sets.precast.RA = {head="Aurore Beret",hands="Iuitl Wristbands",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.WS = {ammo="Falcon Eye",
        head="Pillager's Bonnet +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Mache Earring",
        body="Herculean Vest",hands="Herculean Gloves",ring1="Labrat Ring",ring2="Dingir Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Lustratio Subligar",feet="Meghanada jambeaux +1"}
    sets.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.WS['Exenterator'] = set_combine(sets.WS, {ammo="Seething Bomblet +1",ring2="Solemn Ring",legs="Meghanada Chausses +1",feet="Meghanada Jambeaux +1"})
    sets.WS['Exenterator'].Acc = set_combine(sets.WS['Exenterator'], {})
    sets.WS['Exenterator'].SA = set_combine(sets.WS['Exenterator'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})
    sets.WS['Exenterator'].TA = set_combine(sets.WS['Exenterator'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})
    sets.WS['Exenterator'].SATA = set_combine(sets.WS['Exenterator'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})

    sets.WS['Dancing Edge'] = set_combine(sets.WS, {body="Pillager's Vest +2"})
    sets.WS['Dancing Edge'].Acc = set_combine(sets.WS['Dancing Edge'], {})
    sets.WS['Dancing Edge'].SA = set_combine(sets.WS['Dancing Edge'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})
    sets.WS['Dancing Edge'].TA = set_combine(sets.WS['Dancing Edge'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})
    sets.WS['Dancing Edge'].SATA = set_combine(sets.WS['Dancing Edge'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})

    sets.WS['Evisceration'] = set_combine(sets.WS, {ammo="Yeshila",head="Pillager's Bonnet +2",neck="Rancor Collar",body="Abnoba Kaftan",legs="Darraigner Brais"})
    sets.WS['Evisceration'].Acc = set_combine(sets.WS['Evisceration'], {ammo="Honed Tathlum"})
    sets.WS['Evisceration'].SA = set_combine(sets.WS['Evisceration'], {})
    sets.WS['Evisceration'].TA = set_combine(sets.WS['Evisceration'], {})
    sets.WS['Evisceration'].SATA = set_combine(sets.WS['Evisceration'], {})

    sets.WS['Rudra\s Storm'] = set_combine(sets.WS, {neck="Caro Necklace",body="Pillager's Vest +2",neck="Caro Necklace",waist="Grunfeld Rope",ear2="Ishvara Earring"})
    sets.WS['Rudra\s Storm'].Acc = set_combine(sets.WS['Rudra\s Storm'],{})
    sets.WS['Rudra\s Storm'].SA = set_combine(sets.WS['Rudra\s Storm'], {head="Pillager's Bonnet +2",ammo="Yetshila"})
    sets.WS['Rudra\s Storm'].TA = set_combine(sets.WS['Rudra\s Storm'], {head="Pillager's Bonnet +2",ammo="Yetshila"})
    sets.WS['Rudra\s Storm'].SATA = set_combine(sets.WS['Rudra\s Storm'], {head="Pillager's Bonnet +2",ammo="Yetshila"})

    sets.WS['Shark Bite'] = set_combine(sets.WS, {})
    sets.WS['Shark Bite'].Acc = set_combine(sets.WS['Shark Bite'], {})
    sets.WS['Shark Bite'].SA = set_combine(sets.WS['Shark Bite'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})
    sets.WS['Shark Bite'].TA = set_combine(sets.WS['Shark Bite'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})
    sets.WS['Shark Bite'].SATA = set_combine(sets.WS['Shark Bite'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})

    sets.WS['Mandalic Stab'] = set_combine(sets.WS, {})
    sets.WS['Mandalic Stab'].Acc = set_combine(sets.WS['Mandalic Stab'], {})
    sets.WS['Mandalic Stab'].SA = set_combine(sets.WS['Mandalic Stab'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})
    sets.WS['Mandalic Stab'].TA = set_combine(sets.WS['Mandalic Stab'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})
    sets.WS['Mandalic Stab'].SATA = set_combine(sets.WS['Mandalic Stab'], {head="Pillager's Bonnet +2",ammo="Yetshila",legs="Darraigner's Brais"})

    sets.WS['Aeolian Edge'] = {ammo="Seething Bomblet +1",
        head="Pillager's Bonnet +2",neck="Deviant Necklace",ear1="Crematio Earring",ear2="Moonshade Earring",
        body="Wayfarer Robe",hands="Pillager's Armlets +1",ring1="Adoulin Ring",ring2="Diamond Ring",
        back="Toro Cape",waist="Fotia Belt",legs="Plunderer's Culottes +1",feet="Meghanada Jambeaux +1"}

    sets.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Whirlpool Mask",ear2="Loquacious Earring",
        body="Pillager's Vest +2",hands="Pillager's Armlets +1",
        back="Canny Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Whirlpool Mask",neck="Ej Necklace",ear2="Loquacious Earring",
        body="Pillager's Vest +2",hands="Pillager's Armlets +1",ring1="Beeline Ring",
        back="Canny Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    -- Ranged gear
    sets.midcast.RA = {
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Clearview Earring",ear2="Volley Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Hajduk Ring",
        back="Libeccio Mantle",waist="Aquiline Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.midcast.RA.Acc = {
        head="Pillager's Bonnet +2",neck="Ej Necklace",ear1="Clearview Earring",ear2="Volley Earring",
        body="Iuitl Vest",hands="Buremte Gloves",ring1="Beeline Ring",ring2="Hajduk Ring",
        back="Libeccio Mantle",waist="Aquiline Belt",legs="Thurandaut Tights +1",feet="Pillager's Poulaines +1"}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Ginsen",
        head="Meghanada Visor +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Solemnity Cape",waist="Chaac Belt",legs="Meghanada Chausses +1",feet="Jute Boots +1"}

    --sets.idle.Town = {main="Izhiikoh", sub="Sabebus",ammo="Thew Bomblet",
        --head="Pillager's Bonnet +2",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Pillager's Vest +2",hands="Pill. Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        --back="Shadow Mantle",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Skadi's Jambeaux +1"}

    --sets.idle.Weak = {ammo="Thew Bomblet",
       --head="Pillager's Bonnet +2",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
       --body="Pillager's Vest +2",hands="Pillager's Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
       --back="Shadow Mantle",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Skadi's Jambeaux +1"}


    -- Defense sets

    sets.defense.Evasion = {
        head="Pillager's Bonnet +2",neck="Ej Necklace",
        body="Qaaxo Harness",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Beeline Ring",
        back="Canny Cape",waist="Flume Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.PDT = {ammo="Ginsen",
        head="-Meghanada Visor +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Solemnity Cape",waist="Chaac Belt",legs="Samnuha Tights",feet="Jute Boots +1"}

    sets.defense.MDT = {ammo="Ginsen",
        head="-Meghanada Visor +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Meghanada Cuirie +1",hands="Meghanada Gloves +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Solemnity Cape",waist="Chaac Belt",legs="Samnuha Tights",feet="Jute Boots +1"}


    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
    sets.engaged = {ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
    --body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
    --body="Herculean Vest",
	body="Pillager's Vest +2",
	hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+25','"Triple Atk."+3','DEX+9',}},
    neck="Erudit. Necklace",waist="Windbuffet Belt +1",left_ear="Suppanomimi",
    right_ear="Brutal Earring",left_ring="Epona's Ring",right_ring="Petrov Ring",back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}}
    sets.engaged.Acc = {ammo="Honed Tathlum",
    head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
    --body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
    --body="Herculean Vest",
	body="Pillager's Vest +2",
	hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+25','"Triple Atk."+3','DEX+9',}},
    neck="Erudit. Necklace",waist="Windbuffet Belt +1",left_ear="Suppanomimi",
    right_ear="Brutal Earring",left_ring="Epona's Ring",right_ring="Petrov Ring",back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}}
        
    -- Mod set for trivial mobs (Skadi+1)
    --sets.engaged.Mod = {ammo="Thew Bomblet",
        --head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Skadi's Cuirie +1",hands="Pillager's Armlets +1",ring1="Petrov Ring",ring2="Epona's Ring",
        --back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Plunderer's Poulaines +1"}

    -- Mod set for trivial mobs (Thaumas)
    --sets.engaged.Mod2 = {ammo="Thew Bomblet",
        --head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        --body="Thaumas Coat",hands="Pillager's Armlets +1",ring1="Petrov Ring",ring2="Epona's Ring",
        --back="Atheling Mantle",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}

    sets.engaged.Evasion = {ammo="Thew Bomblet",
        head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Pillager's Armlets +1",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Canny Cape",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}
    sets.engaged.Acc.Evasion = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Pillager's Vest +2",hands="Pillager's Armlets +1",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Canny Cape",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}

    sets.engaged.PDT = {ammo="Thew Bomblet",
        head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Iuitl Vest",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Epona's Ring",
        back="Iximulew Cape",waist="Patentia Sash",legs="Iuitl Tights",feet="Qaaxo Leggings"}
    sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Iuitl Vest",hands="Pillager's Armlets +1",ring1="Defending Ring",ring2="Epona's Ring",
        back="Canny Cape",waist="Hurch'lan Sash",legs="Iuitl Tights",feet="Qaaxo Leggings"}

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
    -- If Feint is active, put that gear set on on top of regular gear.
    -- This includes overlaying SATA gear.
    check_buff('Feint', eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end

    return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()

    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end

    return idleSet
end


function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end

    return meleeSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
    
    msg = msg .. ', TH: ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end


-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end

