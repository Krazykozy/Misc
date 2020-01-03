function get_sets()

   TPThresh = 0
   PrintToChat = false

   magicalRagePacts = S
   {
      'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust',
      'Judgement Bolt','Searing Light','Howling Moon','Ruinous Omen',
      'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
      'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
      'Thunderspark','Meteorite','Nether Blast',
      'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall',
      'Thunderstorm', 'Holy Mist','Lunar Bay','Night Terror', 'Zantetsuken',
      'Level ? Holy'
   }
   
   sets['Idle'] =
   {
      main="Nirvana",
      sub="Vox Grip",
      ammo="Seraphicaller",
      head="Con. Horn +1",
      neck="Caller's Pendant",
      ear1="Caller's Earring",
      ear2="Gifted Earring",
      body="Hagondes Coat +1",
      hands="Glyphic Bracers +1",
      ring1="Evoker's Ring",
      ring2="Sangoma Ring",
      back="Conveyance Cape",
      waist="Moepapa Stone",
      legs="Nares Trews",
      feet="Herald's Gaiters"
   }
   
   sets['Moonshade'] =
   {
      ear2="Moonshade Earring"
   }
   
   sets['SpiritIdle'] = set_combine(sets['Idle'],
   {
      sub="Vox Grip",
      head="Con. Horn +1",
      neck="Caller's Pendant",
      ear1="Andoaa Earring",
      ear2="Smn. Earring",
      body="Call. Doublet +2",
      hands="Glyphic Bracers +1",
      back="Conveyance Cape",
      waist="Cimmerian Sash",
      legs="Glyphic Spats +1",
      feet="Mdk. Crackows +1"
   })
   
   sets['AVIdle'] = set_combine(sets['Idle'],
   {
      body="Hagondes Coat +1",
      hands="Regimen Mittens",
      back="Samanisi Cape",
      waist="Moepapa Stone",
      legs="Nares Trews",
      feet="Con. Pigaches +1"
   })
   
   sets['AVFight'] = set_combine(sets['Idle'],
   {
      head="Hagondes Hat",
      body="Glyphic Doublet +1",
      hands="Regimen Mittens",
      back="Samanisi Cape",
      waist="Moepapa Stone",
      legs="Con. Spats +1",
      feet="Mdk. Crackows +1"
   })
   
   sets['AVHighACC'] = set_combine(sets['AVFight'],
   {
      body="Hagondes Coat +1",
      hands="Glyphic Bracers +1"
   })
   
   sets['AVRecast'] =
   {
      head="Con. Horn +1",
      ear1="Caller's Earring",
      ear2="Gifted Earring",
      body="Glyphic Doublet +1",
      hands="Con. Bracers +1",
      back="Tiresias' Cape",
      waist="Diabolos's Rope",
      legs="Glyphic Spats +1",
      feet="Glyph. Pigaches +1"
   }
   
   sets['AVSkill'] = 
   {
      sub="Vox Grip",
      head="Con. Horn +1",
      neck="Caller's Pendant",
      ear1="Andoaa Earring",
      ear2="Smn. Earring",
      body="Call. Doublet +2",
      hands="Glyphic Bracers +1",
      ring2="Fervor Ring",
      back="Conveyance Cape",
      waist="Cimmerian Sash",
      legs="Ngen Seraweels",
      feet="Mdk. Crackows +1"
   }
   
   sets['AVMACC'] = set_combine(sets['AVSkill'],
   {
      hands="Regimen Mittens",
      back="Samanisi Cape",
      legs="Glyphic Spats +1",
      feet="Artsieq Boots"
   })
   
   sets['AVMagicHighACC'] = set_combine(sets['AVSkill'],
   {
      head="Glyphic Horn +1",
      ear2="Esper Earring",
      hands="Regimen Mittens",
      back="Samanisi Cape",
      waist="Caller's Sash",
      legs="Glyphic Spats +1",
      feet="Hagondes Sabots"
   })
   
   sets['AVMagical'] = set_combine(sets['AVSkill'],
   {
      head="Glyphic Horn +1",
      neck="Eidolon Pendant",
      ear2="Esper Earring",
      body="Con. Doublet +1",
      hands="Hagondes Cuffs",
      back="Tiresias' Cape",
      waist="Caller's Sash",
      legs="Ngen Seraweels",
      feet="Hagondes Sabots"
   })
   
   sets['AVPhysical'] = set_combine(sets['AVSkill'],
   {
      neck="Sacrifice Torque",
      ear2="Esper Earring",
      body="Con. Doublet +1",
      hands="Spurrina Gages",
      waist="Mujin Obi",
      legs="Ngen Seraweels",
      feet="Con. Pigaches +1"
   })
   
   sets['IfritHybrid'] = set_combine(sets['AVMagical'],
   {
      legs="Ngen Seraweels"
   })
   
   sets['Elemental Siphon'] = set_combine(sets['AVSkill'],
   {
      back="Conveyance Cape",
      feet="Caller's Pgch. +2"
   })
   
   sets['Mana Cede'] =
   {
      hands="Call. Bracers +2"
   }
   
   sets['Astral Flow'] =
   {
      head="Glyphic Horn +1"
   }
   
   sets['FastCast'] =
   {
      head="Nahtirah Hat",
      ear1="Loquac. Earring",
      hands="Carbuncle's Cuffs",
      ring1="Veneficium Ring",
      back="Swith Cape",
      waist="Witful Belt",
      legs="Artsieq Hose",
      feet="Chelona Boots"
   }
   
   sets['EleMagic'] = 
   {
      head="Buremte Hat",
      neck="Eddy Necklace",
      ear1="Crematio Earring",
      ear2="Hecate's Earring",
      body="Hagondes Coat +1",
      hands="Otomi Gloves",
      ring1="Snow Ring",
      ring2="Sangoma Ring",
      back="Toro Cape",
      waist="Sekhmet Corset",
      legs="Hagondes Pants",
      feet="Umbani Boots"
   }
   
   sets['CurePot'] =
   {
      head="Nahtirah Hat",
      body="Heka's Kalasiris",
      hands="Weath. Cuffs +1",
      ring2="Ephedra Ring",
      back="Oretania's Cape",      
      legs="Nares Trews"
   }
   
   sets['Fucho'] = set_combine(sets['Idle'],
   {
      waist="Fucho-no-Obi"
   })
   
   sets['MaxMP'] = set_combine(sets['Idle'],
   {
      head="Glyphic Horn +1",
      neck="Eddy Necklace",
      ear1="Caller's Earring",
      ear2="Gifted Earring",
      body="Con. Doublet +1",
      hands="Spurrina Gages",
      ring1="Evoker's Ring",
      ring2="Sangoma Ring",
      back="Conveyance Cape",
      waist="Mujin Obi",
      legs="Nares Trews",
      feet="Glyph. Pigaches +1"
   })
   
   sets['Rock Crusher'] = sets['EleMagic']
   sets['Earth Crusher'] = sets['EleMagic']
   sets['Starburst'] = sets['EleMagic']
   sets['Sunburst'] = sets['EleMagic']
   sets['Cataclysm'] = sets['EleMagic']
   sets['Garland of Bliss'] = sets['EleMagic']
   sets['Myrkr'] = sets['MaxMP']
   
   sets['AVOut'] = sets['AVFight']
   sets['AVMagic'] = sets['AVMagical']
   
   sets['Inferno'] = sets['AVMagic']
   sets['Punch'] = sets['AVPhysical']
   sets['Fire II'] = sets['AVMagic']
   sets['Burning Strike'] = sets['IfritHybrid']
   sets['Double Punch'] = sets['AVPhysical']
   sets['Fire IV'] = sets['AVMagic']
   sets['Flaming Crush'] = sets['IfritHybrid']
   sets['Meteor Strike'] = sets['AVMagic']
   
   sets['Crimson Howl'] = sets['AVSkill']
   sets['Inferno Howl'] = sets['AVSkill']
   
   
   sets['Diamond Dust'] = sets['AVMagic']
   sets['Axe Kick'] = sets['AVPhysical']
   sets['Blizzard II'] = sets['AVMagic']
   sets['Double Slap'] = sets['AVPhysical']
   sets['Blizzard IV'] = sets['AVMagic']
   sets['Rush'] = sets['AVPhysical']
   sets['Heavenly Strike'] = sets['AVMagic']
   
   sets['Frost Armor'] = sets['AVSkill']
   sets['Sleepga'] = sets['AVMACC']
   sets['Diamond Storm'] = sets['AVMACC']
   
   
   sets['Aerial Blast'] = sets['AVMagic']
   sets['Claw'] = sets['AVPhysical']
   sets['Aero II'] = sets['AVMagic']
   sets['Aero IV'] = sets['AVMagic']
   sets['Predator Claws'] = sets['AVPhysical']
   sets['Wind Blade'] = sets['AVMagic']
   
   sets['Aerial Armor'] = sets['AVSkill']
   sets['Whispering Wing'] = sets['AVSkill']
   sets['Hastega'] = sets['AVSkill']
   sets['Fleet Wind'] = sets['AVSkill']
   
   
   sets['Earthen Fury'] = sets['AVMagic']
   sets['Rock Throw'] = sets['AVPhysical']
   sets['Stone II'] = sets['AVMagic']
   sets['Rock Buster'] = sets['AVPhysical']
   sets['Megalith Throw'] = sets['AVPhysical']
   sets['Stone IV'] = sets['AVMagic']
   sets['Mountain Buster'] = sets['AVPhysical']
   sets['Geocrush'] = sets['AVMagic']
   
   sets['Earthen Ward'] = sets['AVSkill']
   sets['Earthen Armor'] = sets['AVSkill']
   
   
   sets['Judgment Bolt'] = sets['AVMagic']
   sets['Shock Strike'] = sets['AVPhysical']
   sets['Thunder II'] = sets['AVMagic']
   sets['Thunderspark'] = sets['AVMagic']
   sets['Thunder IV'] = sets['AVMagic']
   sets['Chaotic Strike'] = sets['AVPhysical']
   sets['Thunderstorm'] = sets['AVMagic']
   
   sets['Rolling Thunder'] = sets['AVSkill']
   sets['Lightning Armor'] = sets['AVSkill']
   sets['Shock Squall'] = sets['AVMACC']
   
   
   sets['Tidal Wave'] = sets['AVMagic']
   sets['Barracuda Dive'] = sets['AVPhysical']
   sets['Water II'] = sets['AVMagic']
   sets['Tail Whip'] = sets['AVPhysical']
   sets['Water IV'] = sets['AVMagic']
   sets['Spinning Dive'] = sets['AVPhysical']
   sets['Grand Fall'] = sets['AVMagic']
   
   sets['Slowga'] = sets['AVMACC']
   sets['Spring Water'] = sets['AVSkill']
   sets['Tidal Roar'] = sets['AVMACC']
   
   
   sets['Searing Light'] = sets['AVMagic']
   sets['Poison Nails'] = sets['AVPhysical']
   sets['Meteorite'] = sets['AVMagic']
   sets['Holy Mist'] = sets['AVMagic']
   
   sets['Healing Ruby'] = sets['AVSkill']
   sets['Shining Ruby'] = sets['AVSkill']
   sets['Glittering Ruby'] = sets['AVSkill']
   sets['Healing Ruby II'] = sets['AVSkill']
   sets['Soothing Ruby'] = sets['AVSkill']
   
   
   sets['Howling Moon'] = sets['AVMagic']
   sets['Moonlit Charge'] = sets['AVPhysical']
   sets['Crescent Fang'] = sets['AVPhysical']
   sets['Eclipse Bite'] = sets['AVPhysical']
   sets['Lunar Bay'] = sets['AVMagic']
   
   sets['Lunar Cry'] = sets['AVMACC']
   sets['Lunar Roar'] = sets['AVMACC']
   sets['Ecliptic Growl'] = sets['AVSkill']
   sets['Ecliptic Howl'] = sets['AVSkill']
   sets['Heavenward Howl'] = sets['AVSkill']
   
   
   sets['Ruinous Omen'] = sets['AVMagic']
   sets['Camisado'] = sets['AVPhysical']
   sets['Nether Blast'] = sets['AVMagic']
   sets['Night Terror'] = sets['AVMagic']
   
   sets['Somnolence'] = sets['AVMagic']
   sets['Nightmare'] = sets['AVMACC']
   sets['Ultimate Terror'] = sets['AVMACC']
   sets['Noctoshield'] = sets['AVSkill']
   sets['Dream Shroud'] = sets['AVSkill']
   sets['Pavor Nocturnus'] = sets['AVMACC']
   
   
   sets['Regal Scratch'] = sets['AVPhysical']
   sets['Mewing Lullaby'] = sets['AVMACC']
   sets['Eerie Eye'] = sets['AVMACC']
   sets['Level ? Holy'] = sets['AVMagic']
   
   sets['Raise II'] = sets['AVSkill']
   sets['Reraise II'] = sets['AVSkill']
   
   
   sets['Zantetsuken'] = sets['AVMagic']
   sets['Perfect Defense'] = sets['AVSkill']
   
   --Helpers
   Helpers = {}
   
   Helpers['Crimson Howl'] = {}
   Helpers['Crimson Howl'].Duration = '4:20'
   Helpers['Crimson Howl'].Message = 'ATT +11.3%'
   
   Helpers['Inferno Howl'] = {}
   Helpers['Inferno Howl'].Duration = '4:20'
   Helpers['Inferno Howl'].Message = 'Enfire +45'
   
   
   Helpers['Frost Armor'] = {}
   Helpers['Frost Armor'].Duration = '6:20'
   Helpers['Frost Armor'].Message = 'Ice Spikes'
   
   Helpers['Aerial Armor'] = {}
   Helpers['Aerial Armor'].Duration = '15:00'
   Helpers['Aerial Armor'].Message = '3~4 Shadows'
   
   Helpers['Hastega'] = {}
   Helpers['Hastega'].Duration = '6:20'
   Helpers['Hastega'].Message = 'Haste +153/1024'
   
   Helpers['Fleet Wind'] = {}
   Helpers['Fleet Wind'].Duration = '5:20'
   Helpers['Fleet Wind'].Message = 'Movement speed +25%'
   
   
   Helpers['Earthen Ward'] = {}
   Helpers['Earthen Ward'].Func = EarthenWard
   Helpers['Earthen Ward'].Duration = '15:00'
   
   Helpers['Earthen Armor'] = {}
   Helpers['Earthen Armor'].Duration = '4:20'
   Helpers['Earthen Armor'].Message = 'Mitigate a severe attack'
   
   
   Helpers['Rolling Thunder'] = {}
   Helpers['Rolling Thunder'].Duration = '5:20'
   Helpers['Rolling Thunder'].Message = 'Enthunder'
   
   Helpers['Lightning Armor'] = {}
   Helpers['Lightning Armor'].Duration = '6:20'
   Helpers['Lightning Armor'].Message = 'Shock Spikes'
   
   
   Helpers['Lunar Cry'] = {}
   Helpers['Lunar Cry'].Func = LunarCry
   
   Helpers['Ecliptic Growl'] = {}
   Helpers['Ecliptic Growl'].Func = EclipticGrowl
   Helpers['Ecliptic Growl'].Duration = '6:20'
   
   Helpers['Ecliptic Howl'] = {}
   Helpers['Ecliptic Howl'].Func = EclipticHowl
   Helpers['Ecliptic Howl'].Duration = '6:20'
   
   Helpers['Heavenward Howl'] = {}
   Helpers['Heavenward Howl'].Func = HeavenwardHowl
   Helpers['Heavenward Howl'].Duration = '4:20'
   
   
   Helpers['Dream Shroud'] = {}
   Helpers['Dream Shroud'].Func = DreamShroud
   Helpers['Dream Shroud'].Duration = '6:20'
   
   Helpers['Noctoshield'] = {}
   Helpers['Noctoshield'].Duration = '6:20'
   Helpers['Noctoshield'].Message = 'Phalanx +13'
   
   
   Helpers['Shining Ruby'] = {}
   Helpers['Shining Ruby'].Duration = '6:20'
   Helpers['Shining Ruby'].Message = 'DEF+ 9.76%, MDT- 3.9%'
   
   Helpers['Glittering Ruby'] = {}
   Helpers['Glittering Ruby'].Duration = '3:40'
   Helpers['Glittering Ruby'].Message = 'Random stat+'
   
   
   Helpers['Perfect Defense'] = {}
   Helpers['Perfect Defense'].Func = PerfectDefense
end

function precast(spell,action)
   if string.find(spell.type,'BloodPact') then
      if buffactive['Astral Conduit'] then
         pet_midcast(spell)
      elseif sets[spell.english] then
         equip(sets['AVRecast'])
         if Helpers[spell.english] then
            if Helpers[spell.english].Func then
               Helpers[spell.english].Func(PrintToChat)      
            elseif Helpers[spell.english].Message then
               DurationMessage(spell.english, PrintToChat)
            end
         end
      end
   elseif string.find(spell.type,'SummonerPact') or string.find(spell.type,'Magic') then
      equip(sets['FastCast'])
   elseif sets[spell.english] then
      equip(sets[spell.english])
   end
   
end

function pet_midcast(spell, action)
   if spell.name == 'Perfect Defense' then
      equip(sets['Perfect Defense'])
      Helpers['Perfect Defense'].Func(PrintToChat)
   elseif spell.name == 'Zantetsuken' then
      equip(sets['Zantetsuken'])
   elseif string.find(spell.type,'BloodPact') then
      if magicalRagePacts:contains(spell.english) then
         if pet.tp < TPThresh then
            equip(set_combine(sets['AVMagic'],
            {
               legs="Caller's Spats +2"
            }))
         else
            equip(sets['AVMagic'])
         end
         add_to_chat(158, pet.name..' TP: '..tostring(pet.tp))
      elseif sets[spell.english] then
         equip(sets[spell.english])
      end
   elseif spell.type == 'BlackMagic' then
      equip(sets['AVMagic'])
   end
end

function midcast(spell,action)
   if spell.skill == 'Elemental Magic' then
      equip(sets['EleMagic'])
   elseif spell.skill == 'Healing Magic' then
      equip(sets['CurePot'])
   end
end

function idle()
   if pet.isvalid then
      if string.find(pet.name, 'Spirit') then
         equip(sets['SpiritIdle'])
      else
         if pet.status == 'Idle' then
            equip(sets['AVIdle'])
         elseif pet.status == 'Engaged' then
            equip(sets['AVOut'])
         end
      end
   elseif player.mpp < 40 then
      equip(sets['Fucho'])
      add_to_chat(158, 'Fucho Equipped')
   else
      equip(sets['Idle'])
   end
   
   if(player.status == 'Engaged') then
      add_to_chat(158, 'Moonshade')
      equip(sets['Moonshade'])
   end
end

function pet_aftercast(spell, action)
   if buffactive['Astral Conduit'] then
   else
      idle()
   end
end

function aftercast(spell,action)
   if buffactive['Astral Conduit'] then
   else
      idle()
   end
end

function pet_change(pet,gain)
   idle()
   if gain then
      HasPet = true
   else
   HasPet = false
   end
end

function status_change(new,old)
   idle()
end

function pet_status_change(new, old)
   idle()
end

function buff_change(buff,gain_or_loss)
end

function DurationMessage(name, addToChat)
   local msg = name..': '..Helpers[name].Message
   if Helpers[name].Duration ~= nil then
      msg = msg..' duration: '..Helpers[name].Duration
   end
   if addToChat == true then
      windower.send_command('input /p '..msg)
   else
      add_to_chat(158, msg)
   end
end

function EclipticHowl(addToChat)
   local acc = math.floor((world.moon_pct / 100) * 26)
   if acc <= 0 then
      acc = 1
   elseif acc >= 26 then
      acc = 25
   end
   if addToChat == true then
      windower.send_command('input /p Ecliptic Howl: ACC+'..tostring(acc)..' EVD+'..tostring(26-acc)..' duration: '..Helpers['Ecliptic Howl'].Duration)
   else
      add_to_chat(158, 'Ecliptic Howl: ACC+'..tostring(acc)..' EVD+'..tostring(26-acc)..' duration: '..Helpers['Ecliptic Howl'].Duration)
   end
end

function LunarCry(addToChat)
   local acc = math.floor((world.moon_pct / 100) * 32)
   if acc <= 0 then
      acc = 1
   elseif acc >= 26 then
      acc = 25
   end
   if addToChat == true then
      windower.send_command('input /p Lunar Cry: ACC-'..tostring(acc)..' EVD-'..tostring(32-acc))
   else
      add_to_chat(158, 'Lunar Cry: ACC-'..tostring(acc)..' EVD-'..tostring(32-acc))
   end
end

function EclipticGrowl(addToChat)
   local STRDEXVIT = math.floor((world.moon_pct / 100) * 9)
   if STRDEXVIT <= 0 then
      STRDEXVIT = 1
   elseif STRDEXVIT >= 8 then
      STRDEXVIT = 7
   end
   if addToChat == true then
      windower.send_command('input /p Ecliptic Growl: STR/DEX/VIT+'..tostring(STRDEXVIT)..' AGI/INT/MND/CHR+'..tostring(8-STRDEXVIT)..' duration: '..Helpers['Ecliptic Growl'].Duration)
   else
      add_to_chat(158, 'Ecliptic Growl: STR/DEX/VIT+'..tostring(STRDEXVIT)..' AGI/INT/MND/CHR+'..tostring(8-STRDEXVIT)..' duration: '..Helpers['Ecliptic Growl'].Duration)
   end
end

function HeavenwardHowl(addToChat)
   local Effect = 'Endrain'
   if world.moon_pct < 50 then
      Effect = 'Enaspir'
   end
   if addToChat == true then
      windower.send_command('input /p Heavenward Howl: '..tostring(Effect)..' duration: '..Helpers['Heavenward Howl'].Duration)
   else
      add_to_chat(158, 'Heavenward Howl: '..tostring(Effect)..' duration: '..Helpers['Heavenward Howl'].Duration)
   end
end

function DreamShroud(addToChat)
   local currentTime = world.time
   if currentTime > 720 then
      currentTime = currentTime - 720
   end
   
   local MAB = math.floor(13 * currentTime/720)
   if MAB > 13 then
      MAB = 13
   elseif MAB < 1 then
      MAB = 1
   end
   
   if addToChat == true then
      windower.send_command('input /p Dream Shroud: MAB+'..tostring(MAB)..' MDB+'..tostring(14-MAB)..' duration: '..Helpers['Dream Shroud'].Duration)
   else
      add_to_chat(158, 'Dream Shroud: MAB+'..tostring(MAB)..' MDB+'..tostring(14-MAB)..' duration: '..Helpers['Dream Shroud'].Duration)
   end
end

function PerfectDefense(addToChat)
   local seconds = 30 + math.floor(windower.ffxi.get_player().skills.summoning_magic / 20)
   if addToChat == true then
      windower.send_command('input /p Perfect Defense duration: '..tostring(seconds)..' seconds.')
   else
      add_to_chat(158, 'Perfect Defense duration: '..tostring(seconds)..' seconds.')
   end
      
end

function EarthenWard(addToChat)
   local potency = 50 + (2 * windower.ffxi.get_player().main_job_level)
   if addToChat == true then
      windower.send_command('input /p Earthen Ward: '..tostring(potency)..' Stoneskin.'..' duration: '..Helpers['Earthen Ward'].Duration)
   else
      add_to_chat(158, 'Earthen Ward: '..tostring(potency)..' Stoneskin.'..' duration: '..Helpers['Earthen Ward'].Duration)
   end
end

function self_command(command)
   command = string.lower(command)
   if command == "test" then
   elseif command == "printtochat" then
      PrintToChat = not PrintToChat
   elseif command == "fenrir" then
      EclipticHowl(false)
      LunarCry(false)
      EclipticGrowl(false)
      HeavenwardHowl(false)
   elseif command == "diabolos" then
      DreamShroud(false)
   elseif command == "avfight" then
      sets['AVOut'] = sets['AVFight']
      add_to_chat(158, 'AVOut: AVFight')
      idle()
   elseif command == "avidle" then
      sets['AVOut'] = sets['AVIdle']
      add_to_chat(158, 'AVOut: AVIdle')
      idle()
   elseif command == "avhighacc" then
      sets['AVOut'] = sets['AVHighACC']
      add_to_chat(158, 'AVOut: AVHighACC')
      idle()
   elseif command == "avmagichighacc" then
      sets['AVMagic'] = sets['AVMagicHighACC']
      add_to_chat(158, 'AVMagic: AVMagicHighACC, TPThresh: 0')
      TPThresh = 0
      idle()
   elseif command == "avmagical" then
      sets['AVMagic'] = sets['AVMagical']
      add_to_chat(158, 'AVMagic: AVMagical, TPThresh: 180')
      TPThresh = 180
      idle()
   else
      
   end
end