include('organizer-lib.lua')
include('how_about_no.lua')
include('no_interruptions.lua')
include('spam_protection.lua')
include('common_commands.lua')
include('spell_stack.lua')

spellAcc = I{'Low', 'Mid', 'mbd', 'High'}
accMode = I{'LowAcc','MidAcc','HighAcc','VeryLowAcc'}
weapons = I{'TP Bonus','Tizona/Almace', 'Tizona/Raetic','MAB', 'Blunt','Savage','Sequence','Vampirism','Lowdmg',}
tpThresh = 2000
spellSet = {}

blueMagicClassification = {
    ['Buffs'] = {
        ['Barrier Tusk'] = true,
        ['Regeneration'] = true,
        ['Mighty Guard'] = true,
        ['Carcharian Verve'] = true,
        --['Cocoon'] = true,
        ['Diamondhide'] = true,
       --['Erratic Flutter'] = true,
        ['Metallic Body'] = true,
        ['Magic Barrier'] = true,
        ['Mighty Guard'] = true,
        ['Occultation'] = true,
        ['Orcish Counterstance'] = true,
        ['Nat. Meditation'] = true,
        ['Plasma Charge'] = true,
        ['Pyric Bulwark'] = true,
        ['Reactor Cool'] = true,
        ['Winds of Promyvion'] = true,
    },
    ['Obi'] = {
        ['Acrid Stream'] = true,
        ['Atra. Libations'] = true,
        ['Molting Plumage'] = true,
        ['Anvil Lightning'] = true,
        ['Nectarous Deluge'] = true,
        ['Droning Whirlwind'] = true,
        ['Embalming Earth'] = true,
        ['Firespit'] = true,
        ['Silent Storm'] = true,
        ['Foul Waters'] = true,
        ['Gates of Hades'] = true,
        ['Leafstorm'] = true,
        ['Regurgitation'] = true,
        ['Rending Deluge'] = true,
        ['Scouring Spate'] = true,
        ['Searing Tempest'] = true,
        ['Silent Storm'] = true,
        ['Spectral Floe'] = true,
        ['Ice Break'] = true,
        ['Subduction'] = true,
        ['Tem. Upheaval'] = true,
        ['Thermal Pulse'] = true,
        ['Water Bomb'] = true,
        ['Dark Orb'] = true,
        ['Evryone. Grudge'] = true,
        ['Palling Salvo'] = true,
        ['Tenebral Crush'] = true,
        ['Magic Hammer'] = true,
        ['Blinding Fulgor'] = true,
        ['Diffusion Ray'] = true,
        ['Entomb'] = true,
    },


    ['Refresh'] = {
        ['Battery Charge'] = true,
    }, 
    ['FastCast'] = {
        ['Erratic Flutter'] = true,
        ['Cocoon']= true,
    },
    ['Skill'] = {
        ['Blood Drain'] = true,
        ['Blood Saber'] = true,
    },
    ['Magic Accuracy'] = {
        ['1000 Needles'] = true,
        ['Absolute Terror'] = true,
        ['Actinic Burst'] = true,
        ['Auroral Drape'] = true,
        ['Awful Eye' ] = true,
        ['Blistering Roar' ] = true,
        ['Chaotic Eye'] = true,
        ['Cimicine Discharge'] = true,
        ['Cold Wave'] = true,
        ['Digest'] = true,
        ['Corrosive Ooze'] = true,
        ['Demoralizing Roar'] = true,
        ['Dream Flower'] = true,
        ['Enervation'] = true,
        ['Feather Tickle'] = true,
        ['Filamented Hold'] = true,
        ['Frightful Roar'] = true,
        ['Geist Wall'] = true,
        ['Hecatomb Wave'] = true,
        ['Infrasonics'] = true,
        ['Jettatura'] = true,
        ['Light of Penance'] = true,
        ['Lowing'] = true,
        ['Mind Blast'] = true,
        ['Mortal Ray'] = true,
        ['MP Drainkiss'] = true,
        ['Osmosis'] = true,
        ['Reaving Wind'] = true,
        ['Sandspin'] = true,
        ['Sheep Song'] = true,
        ['Soporific'] = true,
        ['Sound Blast'] = true,
        ['Stinking Gas'] = true,
        ['Sub-zero Smash'] = true,
        ['Triumphant Roar'] = true,
        ['Venom Shell'] = true,
        ['Voracious Trunk'] = true,
        ['Yawn'] = true,
        ['Blood Drain'] = true,
        ['Blood Saber'] = true,
        ['Sandspray'] = true,
    },
    ['AddEffect'] = {
        ['Sudden Lunge'] = true,
        ['Tail Slap'] = true,
    },
    ['STR'] = {
        ['Battle Dance'] = true,
        ['Bloodrake'] = true,
        ['Death Scissors'] = true,
        ['Delta Thrust'] = true,
        ['Dimensional Death'] = true,
        ['Empty Thrash'] = true,
        ['Glutinous Dart'] = true,
        ['Heavy Strike'] = true,
        ['Paralyzing Triad'] = true,
        ['Quadrastrike'] = true,
        ['Rail Cannon'] = true,
        ['Uppercut'] = true,
        ['Saurian Slide'] = true,
        ['Searing Tempest'] = true,
        ['Sinker Drill'] = true,
        ['Tourbillion'] = true,
        ['Vertical Cleave'] = true,
        ['Whirl of Rage'] = true,
    },
    ['DEX'] = {
        ['Amorphic Spikes'] = true,
        ['Barbed Crescent'] = true,
        ['Claw Cyclone'] = true,
        ['Disseverment'] = true,
        ['Foot Kick'] = true,
        ['Frenetic Rip'] = true,
        ['Glutinous Dart'] = true,
        ['Goblin Rush'] = true,
        ['Hysteric Barrage'] = true,
        ['Paralyzing Triad'] = true,
        ['Rail Cannon'] = true,
        ['Seedspray'] = true,
        ['Sinker Drill'] = true,
        --['Sudden Lunge'] = true,
        ['Thrashing Assault'] = true,
        ['Vanity Dive'] = true,
    },
    ['VIT'] = {
        ['Cannonball'] = true,
        ['Delta Thrust'] = true,
        ['Glutinous Dart'] = true,
        ['Grand Slam'] = true,
        ['Quad. Continuum'] = true,
        ['Saurian Slide'] = true,
        ['Sinker Drill'] = true,
        ['Sprout Smack'] = true,
        ['Sweeping Gouge'] = true,
        ['Thermal Pulse'] = true,
        --['Tail Slap'] = true,
    },
    ['AGI'] = {
        ['Benthic Typhoon'] = true,
        ['Helldive'] = true,
        ['Hydro Shot'] = true,
        ['Jet Stream'] = true,
        ['Pinecone Bomb'] = true,
    
        ['Sudden Lunge'] = true,
        ['Wild Oats'] = true,
    },
    ['Enmity'] = {
        ['Fantod'] = true,
        ['Exuviation'] = true,
        ['Blank Gaze'] = true,
        ['Actinic Burst'] = true,
        ['Sandspray'] = true,
    },
    ['Physical'] = {
        ['Asuran Claws'] = true,
        ['Bludgeon'] = true,
        ['Body Slam'] = true,
        ['Feather Storm'] = true,
        ['Mandibular Bite'] = true,
        ['Queasyshroom'] = true,
        ['Power Attack'] = true,
        ['Ram Charge'] = true,
        ['Screwdriver'] = true,
        ['Sickle Slash'] = true,
        ['Smite of Rage'] = true,
        ['Spinal Cleave'] = true,
        ['Spiral Spin'] = true,
        ['Terror Touch'] = true,
    },


    ['MAB'] = {
        ['Acrid Stream'] = true,
        ['Atra. Libations'] = true,
        ['Molting Plumage'] = true,
        ['Anvil Lightning'] = true,
        ['Nectarous Deluge'] = true,
        ['Droning Whirlwind'] = true,
        ['Embalming Earth'] = true,
        ['Firespit'] = true,
        ['Silent Storm'] = true,
        ['Foul Waters'] = true,
        ['Gates of Hades'] = true,
        ['Leafstorm'] = true,
        ['Regurgitation'] = true,
        ['Rending Deluge'] = true,
        ['Scouring Spate'] = true,
        ['Searing Tempest'] = true,
        ['Silent Storm'] = true,
        ['Spectral Floe'] = true,
        ['Ice Break'] = true,
        ['Subduction'] = true,
        ['Tem. Upheaval'] = true,
        ['Thermal Pulse'] = true,
        ['Water Bomb'] = true,
    },
    ['MAB Dark'] = {
        ['Dark Orb'] = true,
        ['Evryone. Grudge'] = true,
        ['Palling Salvo'] = true,
        ['Tenebral Crush'] = true,
    },
    ['MAB Light'] = {
        ['Magic Hammer'] = true,
        ['Blinding Fulgor'] = true,
        ['Diffusion Ray'] = true,
    },
    ['MAB Earth'] = {
        ['Entomb'] = true,
    },
    ['Enf'] = {
        ['1000 Needles'] = true,
        ['Absolute Terror'] = true,
        ['Actinic Burst'] = true,
        ['Auroral Drape'] = true,
        ['Awful Eye' ] = true,
        ['Blistering Roar' ] = true,
        ['Chaotic Eye'] = true,
        ['Cimicine Discharge'] = true,
        ['Cold Wave'] = true,
        ['Digest'] = true,
        ['Corrosive Ooze'] = true,
        ['Demoralizing Roar'] = true,
        ['Dream Flower'] = true,
        ['Enervation'] = true,
        ['Feather Tickle'] = true,
        ['Filamented Hold'] = true,
        ['Frightful Roar'] = true,
        ['Geist Wall'] = true,
        ['Hecatomb Wave'] = true,
        ['Infrasonics'] = true,
        ['Jettatura'] = true,
        ['Light of Penance'] = true,
        ['Lowing'] = true,
        ['Mind Blast'] = true,
        ['Mortal Ray'] = true,
        ['MP Drainkiss'] = true,
        ['Osmosis'] = true,
        ['Reaving Wind'] = true,
        ['Sandspin'] = true,
        ['Sheep Song'] = true,
        ['Soporific'] = true,
        ['Sound Blast'] = true,
        ['Stinking Gas'] = true,
        ['Sub-zero Smash'] = true,
        ['Triumphant Roar'] = true,
        ['Venom Shell'] = true,
        ['Voracious Trunk'] = true,
        ['Yawn'] = true,
        ['Sandspray'] = true,
    },
    ['Stun'] = {
        ['Frypan'] = true,
        ['Temporal Shift'] = true,
    },
    ['Breath'] = {
        ['Bad Breath'] = true,
        ['Flying Hip Press'] = true,
        ['Final Sting'] = true,
        ['Frost Breath'] = true,
        ['Heat Breath'] = true,
        ['Magnetite Cloud'] = true,
        ['Poison Breath'] = true,
        ['Radiant Breath'] = true,
        ['Self Destruct'] = true,
        ['Thunder Breath'] = true,
        ['Wind Breath'] = true,
    },
    ['Healing'] = {
        ['Healing Breeze'] = true,
        ['Magic Fruit'] = true,
        ['Plenilune Embrace'] = true,
        ['Pollen'] = true,
        ['White Wind'] = true,
        ['Wild Carrot'] = true,
    },
    ['Diffusion'] = {
        ['Cocoon'] = true,
        ['Metallic Body'] = true,
        ['Refueling'] = true,
        ['Feather Barrier'] = true,
        ['Memento Mori'] = true,
        ['Zephyr Mantle'] = true,
        ['Warm-Up'] = true,
        ['Triumphant Roar'] = true,
        ['Amplification'] = true,
        ['Saline Coat'] = true,
        ['Reactor Cool'] = true,
        ['Plasma Charge'] = true,
        ['Animating Wail'] = true,
        ['Regeneration'] = true,
        ['Battery Charge'] = true,
        ['Magic Barrier'] = true,
        ['Occultation'] = true,
        ['Barrier Tusk'] = true,
        ['Harden Shell'] = true,
        ["Nat. Meditation"] = true,
        ['O. Counterstance'] = true,
        ['Carcharian Verve'] = true,
        ['Pyric Bulwark'] = true,
        ['Mighty Guard'] = true,
        ['Fantod'] = true,
        ['Exuviation'] = true,
        ['Blank Gaze'] = true,
        ['Actinic Burst'] = true,
        ['Sandspray'] = true,
        ['Erratic Flutter'] = true,
        ['Cocoon']= true,
        
    },
     
}


function get_sets()
    tank = false
    standardMode = "Standard"
    learnmode="notlearning"
    PL = 'Fishataruru'

    send_command('input /macro book 19;')
    send_command('input /lockstyleset 19;')
    load_gear_file()
end

function precast(spell,action)
    if check_ready(spell) then
        if spell.type == 'Ninjutsu' then
            if spell.english == 'Utsusemi: Ichi' or spell.english == 'Utsusemi: Ni' then
                equip(sets['PreUtsuSet'])
            end

            if spell.type == 'JobAbility' and sets.precast[spell.english] then
                equip(sets[spell.english])
            end
        else
            if spell.type == 'WeaponSkill' then
            if spell.target.distance > 10 or player.tp < 900 then
                cancel_spell()
                return
            end

           spellSet = {}
            
            if sets[spell.english] then
                spellSet = sets[accMode:current()][spell.english]
            else
                spellSet = sets[accMode:current()]['WS']
            end
            
            if spell.type == 'WeaponSkill' and spell.english == 'Expiacion' then
                if weapons:current() == 'TP Bonus' then
                    tpThresh = 2000
                end
                
                if player.tp >= tpThresh then
                    --If you want you can also add the sets in the other file and use them here by doing this
                    --spellSet = set_combine(spellSet, sets['some new earring set you make'])
                    spellSet = set_combine(spellSet,
                    {
                        left_ear="Regal Earring",
                        windower.add_to_chat(050,"Quitando Moonshade tp set en: ["..weapons:current().."]")
                        
                    })
                else
                    spellSet = set_combine(spellSet,
                    {
                        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
                       
                        windower.add_to_chat(050,"Haciendo ws con Moonshade tp set en: ["..weapons:current().."]")
                    })
                end
            end
            
            equip(spellSet)

            if spell.type == 'WeaponSkill' and spell.english == 'Black Halo'  or spell.english == 'Savage Blade' then
                tpThresh = 3000 
                 if weapons:current() == 'Blunt' or weapons:current() == 'Savage'  then
                     tpThresh = 2000
                 end
                 
                 if player.tp >= tpThresh then
                     --If you want you can also add the sets in the other file and use them here by doing this
                     --spellSet = set_combine(spellSet, sets['some new earring set you make'])
                     spellSet = set_combine(spellSet,
                     {
                         left_ear="Ishvara Earring",
                         windower.add_to_chat(050,"Quitando Moonshade tp set en: ["..weapons:current().."]")
                         
                     })
                 else
                     spellSet = set_combine(spellSet,
                     {
                         left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
                        
                         windower.add_to_chat(050,"Haciendo ws con Moonshade tp set en: ["..weapons:current().."]")
                     })
                 end
             end
             
             equip(spellSet)

                windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
            elseif spell.type == 'JobAbility' then
                if sets.precast[spell.english] then
                    equip(sets.precast[spell.english])
                end
            elseif spell.type == 'WhiteMagic' then
                if string.find(spell.english,'Cure') then
                    equip(sets.precast['CureSet'])
                else
                    if spell.skill == 'Enhancing Magic' then
                        if sets.precast[spell.english] then
                            equip(sets.precast[spell.english])
                        else
                            equip(sets.precast['Enhancing Magic'])
                        end
                    else
                        equip(sets.precast['General'])
                    end
                end
            elseif spell.type == 'BlueMagic' then
                equip(sets.precast['Blue Magic'])
            elseif spell.type == 'Trust' then
                equip(sets.precast['General'])
            else
                equip(sets.precast['General'])
            end
        end

        spam_protection_on(spell)
    else
        cancel_spell()
    end
end

function midcast(spell,action)
    -- JA and WS are instant, skip them
    if spell.type == 'JobAbility' or spell.type == 'WeaponSkill' then
        return true
    end

    local equipSet = sets.precast['General']

    if spell.type == 'Ninjutsu' then
        if spell.english == 'Utsusemi: Ichi' then
            if buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                equipSet = sets['UtsuSet']
                send_command('wait 1.5;cancel 66;cancel 446;cancel 445;cancel 444;')
            end
        elseif spell.english == 'Utsusemi: Ni' then
            equipSet = sets['UtsuSet']
        elseif spell.type == 'Trust' then
            equipSet = sets['Trust']
        end
    elseif spell.skill == 'Blue Magic' then

        if blueMagicClassification['Buffs'][spell.english] then
            equipSet = sets.midcast['BlueMagicBuff']--Buffs

        elseif blueMagicClassification['Refresh'][spell.english] then
            equipSet = sets.midcast['BlueMagicrefresh']--refresh

        elseif blueMagicClassification['Skill'][spell.english] then
            equipSet = sets.midcast['BlueMagicskill']--refresh
            
        elseif blueMagicClassification['AddEffect'][spell.english] then
            equipSet = sets.midcast['AddEffect']--Additional effects

        elseif blueMagicClassification['FastCast'][spell.english] then
            equipSet = sets.midcast['FastCast']--Additional effects

        elseif blueMagicClassification['STR'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['PhysicalBlueMagic_STR']--STR spells

        elseif blueMagicClassification['DEX'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['PhysicalBlueMagic_DEX']--Dex Spells

        elseif blueMagicClassification['Enmity'][spell.english] then
            equipSet =  sets.precast['Provoke'] --ENMITY SETUP

        elseif blueMagicClassification['Physical'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['PhysicalBlueMagic']--Physical Spells

        elseif blueMagicClassification['VIT'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['PhysicalBlueMagic_VIT']--Vit Spells

        elseif blueMagicClassification['AGI'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['PhysicalBlueMagic_AGI']--AGI Spells

        elseif blueMagicClassification['MAB'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['BlueMAB']--MAB Spells
         

        elseif blueMagicClassification['MAB Dark'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['BlueMABD']--MAB Dark Spells
           
   

        elseif blueMagicClassification['MAB Light'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['BlueMABL']--MAB Light Spells
           
          

        elseif blueMagicClassification['MAB Earth'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['BlueMABE']--MAB Earth Spells
          

        elseif blueMagicClassification['Magic Accuracy'][spell.english] then
            equipSet = sets.midcast['BlueMagic_Accuracy']--Macc spells

        elseif blueMagicClassification['Stun'][spell.english] then
            equipSet = sets.midcast['BlueMagic_Stun']--Stun

        elseif blueMagicClassification['Breath'][spell.english] then
            equipSet = sets.midcast[spellAcc:current()]['BlueMagicBreath']--Breath Spells
        elseif blueMagicClassification['Healing'][spell.english] then
            if spell.target.type ==  'SELF' then
                equipSet = sets.midcast['BluSelf']
            else
                equipSet = sets.midcast['BlueHealing']
            end
        elseif spell.english == 'Restoral' then
            equipSet = sets.midcast['Restoral']
        end
       
		local weatherLevel = check_if_spell_is_obiable(spell)
        if weatherLevel > 1.00 then
            
            if  blueMagicClassification['Obi'][spell.english] and sets.Orpheus.waist and get_orpheus_damage_percent(spell) > weatherLevel then
            
            else
                
                equipSet = set_combine(equipSet, sets[spell.element])
               

            end
            
		end
       if blueMagicClassification['Diffusion'][spell.english] then

       equipSet = set_combine(equipSet, sets['FC'])


       elseif blueMagicClassification['Enf'][spell.english] then
        equipSet = set_combine(equipSet, sets['MCC'])
    end


    elseif spell.type == 'WhiteMagic' then
        if string.find(spell.english,'Cure') then
            if spell.target.type ==  'SELF' then
                equipSet = sets.midcast['BluSelf']
            else
                equipSet = sets.midcast['BlueHealing']
            end

        elseif spell.skill == 'Enhancing Magic' then
            if sets.midcast[spell.english] then
                equipSet = sets.midcast[spell.english]
            elseif spell.english == 'Haste' or spell.english == 'Invisible' or spell.english == 'Sneak' or spell.english:sub(-5) == 'storm' or spell.english:sub(-8) == 'storm II' or spell.english:sub(4) == 'Prot' or spell.english:sub(4) == 'Shel' or spell.english == 'Adloquium' or spell.english:sub(-6) == 'Animus' or spell.english == 'Blink' or spell.english == 'Refresh' then
                equipSet = sets.midcast['General']
            else
                equipSet = sets.midcast['Enhancing Magic']
            end
        end
    elseif spell.type == 'Trust' then
        equipSet = set_combine(equipSet, sets['Trust'])
    end

    if buffactive['doom'] then
        equipSet = set_combine(equipSet,sets['doom'])
        windower.add_to_chat(167,"DOOM SET ON")
    end

    if buffactive['Diffusion'] and blueMagicClassification['Diffusion'][spell.english] then
        equipSet = set_combine(equipSet, sets.midcast['Diffusion'])
    end

    if cpFarming == true then
        equipSet = set_combine(equipSet, {back="Mecisto. Mantle"})
    end

    equip(equipSet)
end

function aftercast(spell,action)
    if spam_protection_off(spell)then
        handle_idle()


    end
end

function status_change(new,old)
    if check_ready_status()then
        handle_idle()
    end
    
end

function buff_change(buff,gain_or_loss)
    if buff == 'doom' then
        equip(sets['doom'])
                end
    check_for_aftermath_timers(buff, gain_or_loss)
    check_for_weakness_timers(buff, gain_or_loss)
    notify_party_of_troublesome_debuffs(buff, gain_or_loss)
end

function handle_idle()
    equipSet = sets[accMode:current()][standardMode]
    if standardMode  == 'Standard' then
        if buffactive['Aftermath: Lv.3'] then
            equipSet = sets[accMode:current()]['StandardAM']
        else
            equipSet = sets[accMode:current()]['Standard']
        end
    end
	if player.equipment.main ~= sets[weapons:current()].main.name then
		equipSet = set_combine(equipSet, sets[weapons:current()])
		windower.add_to_chat(167,"Equipping "..weapons:current().." set")
	elseif sets[weapons:current()].sub and player.equipment.sub ~= sets[weapons:current()].sub.name then
		equipSet = set_combine(equipSet, sets[weapons:current()])
		windower.add_to_chat(167,"Equipping "..weapons:current().." set")
	end

    if player.status ~= 'Engaged' then
        if standardMode == 'DT' then
            equipSet = sets['DT']
        else
            if player.mpp <= 85 and player.mpp >= 31 then
                equipSet = sets['IdleHybrid']
            elseif player.mpp <= 30  or player.status == 'Resting' then
                equipSet = sets['Idle']
            else
                equipSet = set_combine(equipSet,sets['DT'], sets['Running'])
            end
        end
    end
    equip(equipSet)
end

function self_command(command)
    if command == 'Macc' or command == 'spellAcc' or command == 'trigger9' then
        spellAcc:next()
        if spellAcc:current() == 'mbd' then
            windower.add_to_chat(050,"Spell Accuracy [Magic Burst Mode]")
        else
            windower.add_to_chat(050,"Spell Accuracy ["..spellAcc:current().."]")
        end
    elseif command == 'azuredd' then
        windower.send_command('azuresets spellset default;')
        windower.add_to_chat(155,"Blue Mage set: DD")
    elseif command == 'azurestundd' then
        windower.send_command('azuresets spellset stunDD;')
        windower.add_to_chat(155,"Blue Mage set:Stun/DD")
    elseif command == 'azureeraseDD' then
        windower.send_command('azuresets spellset eraseDD;')
        windower.add_to_chat(155,"Blue Mage set:erase/DD")
    elseif command == 'azuremab' then
        windower.send_command('azuresets spellset mab;')
        windower.add_to_chat(155,"Blue Mage set: MAB")
    elseif command == 'azurevw1' then
        windower.send_command('azuresets spellset VW1;')
        windower.add_to_chat(155,"Blue Mage set: VW2")
    elseif command == 'azurevw2' then
        windower.send_command('azuresets spellset vw2;')
        windower.add_to_chat(155,"Blue Mage set: MAB")
    elseif command == 'th' then
        equip(sets['TH'])

        windower.add_to_chat(155,"TH: ON")
    elseif command == 'weapon' then
        weapons:next()
        windower.add_to_chat(167,"Using "..weapons:current())
        handle_idle()
    elseif command == 'cp' then
        if cpFarming == false then
            cpFarming = true
            windower.add_to_chat(050,"CP Farming [ON]")
        else
            cpFarming = false
            windower.add_to_chat(050,"CP Farming [OFF]")
        end
    elseif command == 'acc' or command == 'trigger5' then
        accMode:next()
        windower.add_to_chat(167,"Accuracy ["..accMode:current().."]")
    elseif command == 'learn' or command == 'trigger69' then
        if learnmode == 'notlearning' then
            equip(sets['Learn'])
            learnmode = 'learning'
            windower.add_to_chat(167,"Learn mode: ON")
            windower.send_command('gs disable all;')
        else
            learnmode = 'notlearning'
            windower.add_to_chat(167,"Learn mode: OFF")
            handle_idle()
            windower.send_command('gs enable all;')
        end
        handle_idle()
    elseif command == 'trigger2' or command == 'dt' then
        standardMode = 'DT'
        windower.add_to_chat(167,"DT Mode [ON]")
        handle_idle()
    elseif command == 'trigger23' or command == 'mdt' then
        standardMode = 'MDT'
        handle_idle()
        windower.add_to_chat(167,"MDT Mode [ON]")
    elseif command == 'dt_end' then
        standardMode = 'Standard'
        handle_idle()
        windower.add_to_chat(168,"TP Regular")
    elseif execute_common_command(command) then
        --done
    end
end

function handle_ping()
    return false
end
