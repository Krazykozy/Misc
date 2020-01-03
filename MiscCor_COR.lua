function pretarget(spell,action)
    if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
    elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
        cancel_spell()
        send_command('Aggressor')
    elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged') then -- Cancel Ranged Attack or WS If You Are Out Of Range --
        cancel_spell()
        add_to_chat(123, spell.name..' Canceled: [Out of Range]')
        return
    elseif spell.type == "Waltz" then
        refine_waltz(spell,action)
    end
end

function precast(spell,action)
    if check_ready(spell) then
        if spell.type == "WeaponSkill" then
            equipSet = sets.WS
            if equipSet[spell.english] then
                equipSet = equipSet[spell.english]
            end
            if SA and equipSet["SA"] then
                equipSet = equipSet["SA"]
            end
            if TA and equipSet["TA"] then
                equipSet = equipSet["TA"]
            end
            if equipSet[AccArray[AccIndex]] then
                equipSet = equipSet[AccArray[AccIndex]]
            end
            if spell.english == "Evisceration" and player.tp > 2941 then 
                equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
            end
            if spell.english == "Mandalic Stab" and player.tp > 2941 then 
                equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
            end
            if spell.english == "Rudra's Storm" and player.tp > 2941 then 
                equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
            end
            if spell.english == "Dancing Edge" and player.tp > 2941 then 
                equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
            end
            equip(equipSet)
        elseif spell.type=="JobAbility" then
            if sets.JA[spell.english] then
                equip(sets.JA[spell.english])
            end
            if spell.english=="Sneak Attack" then
                SA = true
            end
            if spell.english=="Trick Attack" then
                TA = true
            end
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
    if spell.english == 'Ranged' then
        equip(sets.RA)
    elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
        if string.find(spell.english,'Utsusemi') then
            if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
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
    if spam_protection_off(spell) then
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
    if player.equipment.range ~= 'empty' then
        disable('range','ammo')
    else
        enable('range','ammo')
    end
    if Armor == 'DT' then
        equip(sets.DT)
    elseif Armor == 'DeathDT' then
        equip(sets.DeathDT)
    elseif Armor == 'EVA' then
        equip(sets.Evasion)
    elseif new == 'Engaged' then
        equipSet = sets.TP
        if Armor == 'Hybrid' and equipSet["Hybrid"] then
            equipSet = equipSet["Hybrid"]
        end
        if equipSet[AccArray[AccIndex]] then
            equipSet = equipSet[AccArray[AccIndex]]
        end
        if (buffactive.Embrava and (buffactive.Haste or buffactive.March or buffactive["Honor March"]) and buffactive['Geo-Haste'] and buffactive['Mighty Guard']) or (buffactive.March == 2 and buffactive.Haste and buffactive['Geo-Haste']) and equipSet["HighHaste"] then
            equipSet = equipSet["HighHaste"]
        end
        if (buffactive.Embrava and (buffactive.Haste or buffactive.March or buffactive['Geo-Haste'] and buffactive['Mighty Guard'])) or (buffactive.March == 1 and buffactive.Haste and buffactive['Geo-Haste'] and equipSet["MidHaste"]) or (buffactive.March == 2 and (buffactive.Haste or buffactive['Geo-Haste'])) and equipSet["MidHaste"] then
            equipSet = equipSet["MidHaste"]
        end
        if (buffactive.Haste and buffactive.March == 2) and (buffactive.Embrava and (buffactive.March == 2 or buffactive["Honor March"] or (buffactive.March and buffactive.Haste and buffactive['Mighty Guard']))) and equipSet["HighHaste"] then
            equipSet = equipSet["HighHaste"]
        end
        if buffactive.Embrava and (buffactive.Haste or buffactive.March or buffactive["Honor March"] and buffactive['Mighty Guard']) and equipSet["HighHaste"] then
            equipSet = equipSet["HighHaste"]
        end
        if (buffactive.March == 1 and buffactive.Haste and buffactive["Geo-Haste"] and buffactive['Mighty Guard']) or (buffactive.March == 2 or buffactive["Honor March"]) and equipSet["MidHaste"] then
            equipSet = equipSet["MidHaste"]
        end
        if SA then
            equipSet = set_combine(equipSet,sets.JA["Sneak Attack"])
        end
        if TA then
            equipSet = set_combine(equipSet,sets.JA["Trick Attack"])
        end
        if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
            equipSet = set_combine(equipSet,sets.TP.Rancor)
        end
        if TH == 'ON' then -- Use TH Toggle To Lock Full TH Set --
            equipSet = set_combine(equipSet,sets.TP.TH)
        end
        if buffactive.Curse and Doom then
            equipSet = set_combine(equipSet,{left_ring='Purity Ring'})
        end
        equip(equipSet)
    else
        equipSet = sets.Idle
        if equipSet[IdleArray[IdleIndex]] then
            equipSet = equipSet[IdleArray[IdleIndex]]
        end
        if equipSet[WeaponArray[WeaponIndex]] then
            equipSet = equipSet[WeaponArray[WeaponIndex]]
        end
        equip(equipSet)
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
    elseif buff == "perfect defense" then -- PD Timer --
        if gain then
            send_command('timers create "Perfect Defense" 57 down')
        else
            send_command('timers delete "Perfect Defense"')
            add_to_chat(123,'PD: [OFF]')
        end
    elseif buff == 'Berserk' and not gain then
        add_to_chat(123,'Berserk: [OFF]')
    elseif buff == 'aggressor' and not gain then
        add_to_chat(123,'Aggressor: [OFF]')
        end
        if buff == "sneak attack" then
        SA = gain
    elseif buff == "trick attack" then
        TA = gain
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
        status_change(player.status)
        add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
    elseif command == 'C17' then -- Sub Weapon Toggle --
        WeaponIndex = (WeaponIndex % #WeaponArray) + 1
        add_to_chat(158,'Sub Weapon: '..WeaponArray[WeaponIndex])
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
    elseif command == 'C9' then -- Full TH Set Toggle --
        if TH == 'ON' then
            TH = 'OFF'
            add_to_chat(123,'Full TH Set: [Unlocked]')
        else
            TH = 'ON'
            add_to_chat(158,'Full TH Set: [Locked]')
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
    elseif command == 'C3' then -- Evasion Toggle --
        if Armor == 'EVA' then
            Armor = 'None'
            add_to_chat(123,'Evasion Set: [Unlocked]')
        else
            Armor = 'EVA'
            add_to_chat(158,'Evasion Set: [Locked]')
        end
        status_change(player.status)
    elseif command == 'C16' then -- Rancor Toggle --
        if Rancor == 'ON' then
            Rancor = 'OFF'
            add_to_chat(123,'Rancor: [OFF]')
        else
            Rancor = 'ON'
            add_to_chat(158,'Rancor: [ON]')
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
    elseif command == 'TP' then
        add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
    elseif command:match('^SC%d$') then
        send_command('//' .. sc_map[command])
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
    local waltzID

    local missingHP

    if spell.target.type == "SELF" then
        missingHP = player.max_hp - player.hp
    elseif spell.target.isallymember then
        local target = find_player_in_alliance(spell.target.name)
        local est_max_hp = target.hp / (target.hpp/100)
        missingHP = math.floor(est_max_hp - target.hp)
    end

    if missingHP ~= nil then
        if player.sub_job == 'DNC' then
            if missingHP < 50 and spell.target.name == player.name then
                add_to_chat(123,'Full HP!')
                cancel_spell()
                return
            elseif missingHP < 200 then
                newWaltz = 'Curing Waltz'
                waltzID = 190
            elseif missingHP < 400 then
                newWaltz = 'Curing Waltz II'
                waltzID = 191
            else
                newWaltz = 'Curing Waltz III'
                waltzID = 192
            end
        else
            return
        end
    end

    local waltzTPCost = {['Curing Waltz'] = 200, ['Curing Waltz II'] = 350, ['Curing Waltz III'] = 500, ['Curing Waltz IV'] = 650, ['Curing Waltz V'] = 800}
    local tpCost = waltzTPCost[newWaltz]

    local downgrade

    if player.tp < tpCost and not buffactive.trance then

        if player.tp < 200 then
            add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
            cancel_spell()
            return
        elseif player.tp < 350 then
            newWaltz = 'Curing Waltz'
        elseif player.tp < 500 then
            newWaltz = 'Curing Waltz II'
        elseif player.tp < 650 then
            newWaltz = 'Curing Waltz III'
        elseif player.tp < 800 then
            newWaltz = 'Curing Waltz IV'
        end

        downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
    end

    if newWaltz ~= spell.english then
        send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
        if downgrade then
            add_to_chat(158, downgrade)
        end
        cancel_spell()
        return
    end

    if missingHP > 0 then
        add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
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
        set_macro_page(1, 6)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 7)
    else
        set_macro_page(1, 8)
    end
end