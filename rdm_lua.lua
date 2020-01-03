 
function get_sets()
        idleSet = "Idle"
        restingSet = "Resting"
        magicacc= 0    
        contador = 0
 
 
        send_command('input /macro book 12;')
       
		sets['Lightning'] = {waist="Hachirin-no-Obi"}
        sets['Ice'] = {waist="Hachirin-no-Obi"}
        sets['Water'] = {waist="Hachirin-no-Obi"}
        sets['Fire'] = {waist="Hachirin-no-Obi"}
        sets['Earth'] = {waist="Hachirin-no-Obi"}
        sets['Wind'] = {waist="Hachirin-no-Obi"}
        sets['Light'] = {waist="Hachirin-no-Obi"}
        sets['Dark'] = {waist="Hachirin-no-Obi"}
		sets['acc'] ={legs="Mes'yohi slacks"}
 
 
        sets['Idle'] = {main="Bolelabunga",sub="Beatific shield +1",range="Phulax bow",head="Vitivation Chapeau +1",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Moonshade Earring",body="Gendewitha Bliaut +1",hands="Serpentes Cuffs",ring2="Defending Ring", left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -6%',}},back="Mecisto. Mantle",waist="Fucho-no-obi",legs="Nares Trews",feet="Serpentes Sabots"}
 
        sets['DT'] =  {main = "Nehushtan",sub = "Beatific shield +1", range="Phulax bow", head = "Hagondes hat +1", neck = "Wiglen gorget", ear1 = "Ethereal Earring", ear2 = "Sanare Earring", body = "Gendewitha Bliaut +1", hands = "Gendewitha gages +1",left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -6%',}}, ring2 = "Defending Ring", waist = "Flume Belt +1", legs = "Vitivation tights +1", feet = "Hagondes sabots +1", back = "Shadow mantle"}
 
        sets['Runaway'] = {main = "Nehushtan",sub = "Beatific shield +1", range="Phulax bow", head = "Hagondes hat +1", neck = "Wiglen gorget", ear1 = "Ethereal Earring", ear2 = "Sanare Earring", body = "Gendewitha Bliaut +1", hands = "Gendewitha gages +1",left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -6%',}}, ring2 = "Defending Ring", waist = "Flume Belt +1", legs = "Blood cuisses", feet = "Hagondes sabots +1", back = "Umbra Cape"}
       
        sets['MDT'] = {main = "Nehushtan",sub = "Beatific shield +1", range="Phulax Bow", head = "Gende. Caubeen +1", neck = "Warder's Charm", ear1 = "Ethereal Earring", ear2 = "Sanare Earring", body = "Gendewitha Bliaut +1", hands ="Gendewitha gages +1", ring1 = "Shadow Ring", ring2 = "Defending Ring", waist = "Slipor sash", legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Mag. Acc.+22',}}, feet = "Hagondes sabots +1", back = "Engulfer cape +1"}
 
        sets['BolelabungaSet'] = {main="Bolelabunga",sub="Beatific Shield +1"}
        sets['oneirosSet'] = {main="Bolelabunga",sub="Beatific Shield +1"}
 
       
        sets['preMAB'] = {ammo="Impatiens",
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Dalmatica",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",
        back="Ogapepo Cape +1",waist="Witful Belt",legs="Artsieq hose",feet="Chelona boots +1", neck="Orunmila's Torque",ear1="Enchanter earring +1",ring2="Veneficium Ring"}
 
        sets['MABACC'] = {main="Venabulum",sub="Mephitis grip",range="Aureole",head="Lethargy chappel +1",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Gwati Earring",body="Helios Jacket",hands="Hagondes cuffs +1",ring1="Sangoma Ring",ring2="Weatherspoon Ring",back="Refraction Cape",waist="Yamabuki-no-obi",legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Mag. Acc.+22',}},feet="Helios boots"}
       
        sets['MABFULL'] = {main="Venabulum",sub="Zuuxowu grip",ammo="Ghastly tathlum",head="Helios Band",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",body="Helios Jacket", hands={ name="Helios Gloves", augments={'"Mag.Atk.Bns."+25','"Occult Acumen"+9','INT+2 MND+2',}},ring1="Shiva Ring +1",ring2="Shiva Ring +1",back="Toro Cape",waist="Yamabuki-no-obi",legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+17',}},feet="Helios boots"}
       
        sets['MAGICALWS'] = {main="Venabulum",sub="Zuuxowu grip",ammo="Ghastly tathlum",head="Hagondes Hat +1",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",body="Helios Jacket",hands="Otomi gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",back="Toro Cape",waist="Yamabuki-no-obi",legs="Hagondes Pants +1",feet="Helios boots"}
       
        sets['Spikes'] = {main="Venabulum",sub="Wizzan grip",ammo="Ghastly tathlum",head="Hagondes Hat +1",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",body="Helios Jacket",hands="Otomi gloves",ring1="Strendu Ring",ring2="Shiva Ring",back="Toro Cape",waist="Yamabuki-no-obi",legs="Vitivation tights +1",feet="Helios boots"}
       
        sets['MAB'] = {main="Venabulum",sub="Zuuxowu grip",range="Aureole",head="Lethargy chappel +1",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",body="Helios Jacket",hands="Otomi Gloves",ring2="Shiva Ring +1",ring1="Weatherspoon ring",back="Refraction Cape",waist="Yamabuki-no-obi",legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Mag. Acc.+22',}},feet="Helios boots"}
 
        sets['Precast'] = {ammo="Impatiens",
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Dalmatica",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",
        back="Ogapepo Cape +1",waist="Witful Belt",legs="Artsieq hose",feet="Chelona boots +1", neck="Orunmila's Torque",ear1="Enchanter earring +1",ring2="Veneficium Ring"}
 
        sets['PreEnhance'] = {ammo="Impatiens",
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Dalmatica",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",
        back="Ogapepo Cape +1",waist="Witful Belt",legs="Artsieq hose",feet="Chelona boots +1", neck="Orunmila's Torque",ear1="Enchanter earring +1",ring2="Veneficium Ring"}
 
        sets['Enhancing'] = {main = "Arendsi Fleuret",sub = "Thuellaic ecu +1",ammo="Hasty pinion +1",head = "Befouled crown",neck = "Colossus's Torque",ear1 = "Augment. Earring",ear2 = "Andoaa Earring",
        body = "Vitivation Tabard +1",hands="Vitivation Gloves +1",back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +5','Enha.mag. skill +4','Mag. Acc.+4','Enh. Mag. eff. dur. +18'}}, waist = "Olympus sash",legs = "Shedir seraweels", feet = "Lethargy Houseaux +1", ring1="Prolix Ring", ring2="Weatherspoon Ring"}
 
       
        sets['Drain'] = set_combine(sets['MAB'], {waist="Fucho-no-obi"})
 
        sets['Chainspell'] = set_combine(sets['DT'], {body="Vitivation Tabard +1"})
       
              
         
        sets['Saboteur'] = {hands="Lethargy Gantherots +1"}
       
         sets['Composure'] =  {head="Lethargy chappel +1",body="Lethargy Sayon +1",hands="Lethargy Gantherots +1",
        legs="Lethargy fuseau +1",feet="Lethargy Houseaux +1",ammo="Hasty pinion +1", main="Bihkah sword +1", sub="Thuellaic ecu +1",
        ear2="Loquacious Earring", ring1="Prolix Ring",ring2="Weatherspoon Ring", waist="Phos Belt +1", neck="Orunmila's Torque",back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +5','Enha.mag. skill +4','Mag. Acc.+4','Enh. Mag. eff. dur. +18'}},ear1="Enchanter earring +1"}
 
        sets['Stun'] = {main="Marin Staff",sub="Arbuda grip",ammo="Hasty pinion +1", head="Atrophy Chapeau +1",neck="Orunmila's Torque",ear1 = "Enchanter Earring +1",  ear2 = "Gwati Earring",body="Helios Jacket",hands="Gende. Gages +1",ring1="Weatherspoon Ring",ring2="Sangoma Ring",back="Swith Cape +1",waist="Phos Belt +1",legs="Artsieq Hose",feet="Chelona boots +1"}
 
        sets['Stoneskin'] = set_combine(sets['Enhancing'], {ammo = "Hasty pinion +1", sub="Thuellaic ecu +1", ear1 = "Earthcry earring", ear2="Loquacious Earring",head = "Befouled crown", ear2 = "Loquac. Earring",  neck = "Stone gorget", back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +5','Enha.mag. skill +4','Mag. Acc.+4','Enh. Mag. eff. dur. +18'}}, ring2="Weatherspoon Ring", hands ="Stone Mufflers", waist = "Siegel Sash", legs = "Shedir Seraweels"})
       
        sets['Prestone'] = set_combine(sets['PreEnhance'], {ring1="Weatherspoon Ring"})
       
        sets['Aquaveil'] = set_combine(sets['Enhancing'],  {legs = "Shedir Seraweels",  waist = "Emphatikos rope"})
       
        sets['Duration'] = set_combine(sets['Enhancing'], {back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +5','Enha.mag. skill +4','Mag. Acc.+4','Enh. Mag. eff. dur. +18'}},feet="Lethargy Houseaux +1", hands="Atrophy gloves +1"})
       
        sets['Haste'] = {ammo="Hasty pinion +1", main="Bihkah sword +1", sub="Thuellaic ecu +1",
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Vitivation Tabard +1",ring1="Prolix Ring",
        waist="Witful Belt",legs="Artsieq hose", neck="Orunmila's Torque",ear1="Enchanter earring +1",ring2="Weatherspoon Ring", back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +5','Enha.mag. skill +4','Mag. Acc.+4','Enh. Mag. eff. dur. +18'}},feet="Lethargy Houseaux +1", hands="Atrophy gloves +1"}
       
        sets['Resting']= {head="Vitivation Chapeau +1", main = "Boonwell Staff", sub = "Oneiros grip", body = "Chelona blazer", ammo = "Mana Ampulla", back = "Vita cape", hands = "Nares cuffs", neck= "Eidolon pendant", feet = "Chelona boots +1", ring1 = "Star ring", ring2 = "Angha ring", ear1 = "Relaxing Earring", ear2 = "Antivenom Earring",  waist = "Austerity Belt"}
       
        sets['Refresh'] =  {legs="Lethargy fuseau +1", ammo="Hasty pinion +1", main="Bihkah sword +1", sub="Thuellaic ecu +1",
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Vitivation Tabard +1",ring1="Prolix Ring",
        waist="Phos Belt +1", neck="Orunmila's Torque",ear1="Enchanter earring +1",ring2="Weatherspoon Ring", back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +5','Enha.mag. skill +4','Mag. Acc.+4','Enh. Mag. eff. dur. +18'}},feet="Lethargy Houseaux +1", hands="Atrophy gloves +1"}
       
        sets['Prenf'] = set_combine(sets['Precast'], {ring1="Weatherspoon Ring"})      
       
        sets['FULLACC'] = {main = "Twebuliij",sub = "Mephitis Grip", head = "Artsieq hat", ear1 = "Enchanter Earring +1",  ear2 = "Gwati Earring",body="Lethargy Sayon +1", hands = "Lethargy Gantherots +1", ring1 = "Weatherspoon Ring", ring2 = "Sangoma Ring", waist = "Ovate rope", back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+9',}}, range = "Aureole", neck = "Weike Torque", legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Mag. Acc.+22',}}, feet = "Vitivation Boots +1"}
       
       
        sets['Enfeebling'] = {main = "Twebuliij",sub = "Mephitis grip", head = "Befouled crown", ear1 = "Enchanter Earring +1",  ear2 = "Gwati Earring" ,body="Lethargy Sayon +1", hands = "Lethargy Gantherots +1", ring1 = "Weatherspoon Ring", ring2 = "Sangoma Ring", waist = "Ovate rope", back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+9',}}, range = "Aureole", neck = "Weike Torque", legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Mag. Acc.+22',}}, feet = "Vitivation Boots +1"}
       
        sets['EnfeeblingINT'] = {main = "Twebuliij",sub = "Mephitis grip", head = "Befouled crown", ear1 = "Enchanter Earring +1",  ear2 = "Gwati Earring" ,body="Lethargy Sayon +1", hands = "Lethargy Gantherots +1", ring1 = "Weatherspoon Ring", ring2 = "Sangoma Ring", waist = "Ovate rope",back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+9',}}, range = "Aureole", neck = "Weike Torque", legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Mag. Acc.+22',}}, feet = "Vitivation Boots +1"}
       
        sets['FULLMND'] = {main = "Twebuliij",sub = "Achaq Grip", head = "Befouled crown", ear1 = "Aredan Earring",  ear2 = "Lifestorm Earring",body="Lethargy Sayon +1", hands = "Vitivation Gloves +1", ring1 = "Leviathan ring +1", ring2 = "Leviathan ring +1", waist = "Cascade belt", back = "Refraction Cape", ammo = "Quartz Tathlum +1", neck = "Imbodla necklace", legs = "Mes'yohi slacks", feet = "Uk'uxkaj boots"}
       
       
        sets['WS'] = {head = "Vitivation Chapeau +1", ear1 = "Aredan Earring",  ear2 = "Lifestorm Earring",body="Vitivation Tabard +1", hands = "Vitivation Gloves +1", ring1 = "Leviathan ring +1", ring2 = "Leviathan ring +1", waist = "Cascade belt", back = "Refraction Cape", ammo = "Quartz Tathlum +1", neck = "Imbodla necklace", legs = "Atrophy Tights +1", feet = "Uk'uxkaj boots"}
       
        sets['FULLINT'] = {main = "Venabulum",sub = "Wizzan Grip", head = "Befouled crown", ear1 = "Psystorm Earring",  ear2 = "Aredan Earring",body="Lethargy Sayon +1", hands = "Otomi Gloves", ring1 = "Shiva Ring +1", ring2 = "Shiva Ring +1", waist = "Wanion Belt", back = "Refraction Cape", range = "Aureole", neck = "Imbodla necklace", legs = "Mes'yohi slacks", feet = "Uk'uxkaj boots"}
       
        sets['HYBRIDINT'] = {main = "Twebuliij",sub = "Mephitis grip", head = "Befouled crown", ear1 = "Psystorm Earring",  ear2 = "Lifestorm Earring", body="Lethargy Sayon +1", hands = "Lethargy Gantherots +1", ring1 = "Weatherspoon Ring", ring2 = "Sangoma Ring", waist = "Yamabuki-no-obi", back = "Refraction Cape", range = "Aureole", neck = "Imbodla necklace", legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Mag. Acc.+22',}}, feet = "Vitivation Boots +1"}
       
        sets['HYBRIDMND'] = {main = "Twebuliij",sub = "Mephitis Grip", head = "Befouled crown", ear1 = "Psystorm Earring",  ear2 = "Lifestorm Earring",body="Lethargy Sayon +1", hands = "Lethargy Gantherots +1", ring1 = "Globidonta Ring", ring2 = "Leviathan ring +1", waist = "Ovate rope",back = "Refraction Cape", ammo = "Quartz Tathlum +1",  neck = "Imbodla necklace", legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Mag. Acc.+22',}}, feet = "Vitivation Boots +1"}
       
       
               
               
       
        sets['Impact'] = {main="Venabulum",sub="Zuuxowu grip",ammo="Ghastly tathlum",neck="Eddy Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",body="Twilight Cloak", hands={ name="Helios Gloves", augments={'"Mag.Atk.Bns."+25','"Occult Acumen"+9','INT+2 MND+2',}},ring1="Shiva Ring +1",ring2="Shiva Ring +1",back="Toro Cape",waist="Yamabuki-no-obi",legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+17',}},feet="Helios boots"}
       
       
 
        sets['PreCureSet'] = {ammo="Impatiens",
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Dalmatica",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",
        back="Ogapepo Cape +1",waist="Witful Belt",legs="Artsieq hose",feet="Chelona boots +1", neck="Orunmila's Torque",ear1="Enchanter earring +1",ring2="Veneficium Ring"}
 
        sets['CureSet'] = {main="Tamaxchi",sub="Matamata shield +1",ammo = "Quartz Tathlum +1",head="Gende. Caubeen +1",neck="Colossus's Torque",ear1 = "Lifestorm Earring", ear2 = "Beatific Earring",body="Vitivation Tabard +1",hands="Revealer's mitts",ring1 = "Sirona's Ring", ring2 = "Haoma's ring",back="Vates Cape +1",legs="Atrophy Tights +1",feet="Rubeus boots", waist="Bishop's sash"}
		

       
        sets['Curaga'] = {main="Tamaxchi",sub="Matamata shield +1",ammo = "Quartz Tathlum +1",head="Gende. Caubeen +1",neck="Imbodla necklace",ear1 = "Lifestorm Earring", ear2 = "Aredan Earring",body="Vitivation Tabard +1",hands="Revealer's mitts",ring1 = "Leviathan ring +1", ring2 = "Leviathan Ring +1",back="Pahtli Cape",legs="Atrophy Tights +1",feet="Uk'uxkaj boots", waist="Cascade Belt"}
       
        sets['CureArc'] = {main="Sanus Ensis",sub="Genbu's Shield",ammo = "Quartz Tathlum +1",head="Gende. Caubeen +1",neck="Phalaina locket",ear1 = "Roundel Earring", ear2 ="Beatific Earring",body="Vitivation Tabard +1",hands="Buremte Gloves",ring1 = "Sirona's Ring", ring2 = "Haoma's ring",back="Vates Cape +1",legs="Atrophy Tights +1",feet="Rubeus boots", waist="Chuq'aba belt"}
 
        sets['Regen'] = set_combine(sets['Haste'], {main="Bolelabunga",sub="Thuellaic ecu +1", waist="Phos belt +1"})
       
        sets['Enspells'] = set_combine(sets['Enhancing'], {main="Egeking",back="Ghostfyre cape"})
       
        sets['Phalanx'] = set_combine(sets['Enhancing'], {main="Egeking"})
       
        sets['Hastecast'] = {ammo="Hasty pinion +1",main="Bihkah sword +1", sub="Thuellaic ecu +1",
        head="Atrophy Chapeau +1",ear2="Loquacious Earring",
        body="Vitivation Tabard +1",hands="Gendewitha Gages +1",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Phos Belt +1",legs="Artsieq hose",feet="Chelona Boots +1", neck="Orunmila's Torque",ear1="Enchanter earring +1",ring2="Weatherspoon Ring"}
       
end
 
function precast(spell,action)
	if spell.type == 'JobAbility' then
		if sets[spell.english] then
			equip(sets[spell.english])
		end
	elseif spell.type == 'WeaponSkill' then
		if spell.target.distance > 10 or player.tp < 900 then
			cancel_spell()
			return
		end

		windower.add_to_chat(050, '['..spell.name..'] '..spell.target.name..' <'..player.tp..'%>')
		if spell.english == "Sanguine Blade" then
			equip(sets['MAGICALWS'])
		else
			equip(sets['WS'])
		end
	elseif spell.type == 'WhiteMagic' then
		if string.find(spell.english,'Cur') then
			equip(sets['PreCureSet'])                                      
		else
			if spell.english == 'Stoneskin' then
				equip(sets['Prestone'])
			elseif spell.skill == 'Enhancing Magic' then
				equip(sets['PreEnhance'])
			elseif spell.skill == 'Enfeebling Magic' then
				equip(sets['Prenf'])
			else
				equip(sets['Precast'])
			end
		end
	elseif spell.type == 'BlackMagic' then
		if spell.english == 'Impact' then
			equip(sets['Impact'])
		elseif spell.english == 'Stun' then
			equip(sets['Stun'])
		elseif spell.skill == 'Enfeebling Magic' then
			equip(sets['Prenf'])
		elseif spell.skill == 'Elemental Magic' then
			equip(sets['preMAB'])
		else
			equip(sets['Precast'])
		end
	elseif spell.type == 'Ninjutsu' then
		equip(sets['Hastecast'])
	end
end
 
function midcast(spell,action)
	if spell.type == 'WhiteMagic' then
		if spell.english:startswith('Cure') then
			if spell.target.type == 'SELF' then
				equip(sets['CureArc'])
			else
				equip(sets['CureSet'])
			end
		elseif spell.english:startswith('Cura') then
			equip(sets['Curaga'])
		else
			if buffactive['Composure'] and spell.target.type == 'PLAYER' then
				if spell.skill == 'Enhancing Magic' then
					if spell.english:startswith('Haste') then
						equip(sets['Composure'])
					elseif spell.english:find('Regen') then
						equip(sets['Composure'])
					elseif spell.english:find('Flurry') then
						equip(sets['Composure'])
					elseif spell.english:startswith('Refresh') then
						equip(sets['Composure'])
					else
						equip(sets['Enhancing'])
					end
				else
					equip(sets['Hastecast'])
				end 
			
			else
				if spell.skill == 'Enhancing Magic' then
					if spell.english == 'Stoneskin' then
						equip(sets['Stoneskin'])
					elseif spell.english:find('Regen') then
						equip(sets['Regen'])
					elseif spell.english:find('Phalanx') then
						equip(sets['Phalanx'])
					elseif spell.english:find('En') then
						equip(sets['Enspells'])
					elseif spell.english:find('Aquaveil') then
						equip(sets['Aquaveil'])
					elseif spell.english:find('Refresh') then
						equip(sets['Refresh'])
					elseif spell.english:find('Haste') or spell.english:find('Flurry') then
						equip(sets['Haste'])
					else
						equip(sets['Enhancing'])
					end
				elseif spell.english:find('Dia') then
					equip(sets['FULLMND'])
				elseif spell.skill == 'Enfeebling Magic' then
					if magicacc == 0 then
						if spell.element == world.day_element then
							equip(set_combine(sets['Enfeebling'], {legs="Mes'yohi slacks"}))
						else
							equip(sets['Enfeebling'])
						end
					elseif magicacc == 1 then
						equip(sets['HYBRIDMND'])
						if spell.element == world.day_element then
							equip(set_combine(sets['HYBRIDMND'], {legs="Mes'yohi slacks"}))
						else
							equip(sets['HYBRIDMND'])
						end
					elseif magicacc == 2 then
						equip(sets['FULLMND'])
					elseif magicacc == 3 then
						if spell.element == world.day_element then
							equip(set_combine(sets['FULLACC'], {legs="Mes'yohi slacks"}))
						else
							equip(sets['FULLACC'])
						end
					end
				else
					equip(sets['Stun'])
				end
			end
		end
	elseif spell.english:startswith('Utsu') then
		equip(sets['Hastecast'])
	elseif spell.type == 'BlackMagic' then
		if spell.english == 'Impact' then
			equip(sets['Impact'])
		elseif string.find(spell.english,'Spikes') then
			equip(sets['Spikes'])
		elseif spell.english == 'Stun' then
			equip(sets['Stun'])
		elseif spell.english:sub(-5) == 'helix' or spell.english == 'Kaustra' then
			equip(sets['MAB'])
		elseif spell.english == 'Drain' or spell.english == 'Drain II' or spell.english == 'Aspir' or spell.english == 'Aspir II' then
			equip(sets['Drain'])
		elseif spell.skill == 'Enfeebling Magic'  and magicacc == 0 and spell.element == world.day_element then
			equip(set_combine(sets['EnfeeblingINT'], {legs="Mes'yohi slacks"}))
		elseif spell.skill == 'Enfeebling Magic'  and magicacc == 3 and spell.element == world.day_element then
			equip(set_combine(sets['FULLACC'], {legs="Mes'yohi slacks"}))
		elseif spell.skill == 'Enfeebling Magic'  and magicacc == 1 and spell.element == world.day_element then
			equip(set_combine(sets['HYBRIDINT'], {legs="Mes'yohi slacks"}))
		elseif spell.skill == 'Enfeebling Magic'  and magicacc == 0 then
			equip(sets['EnfeeblingINT'])
		elseif spell.skill == 'Enfeebling Magic'  and magicacc == 2 then
			equip(sets['FULLINT'])
		elseif spell.skill == 'Enfeebling Magic'  and magicacc == 3  then
			equip(sets['FULLACC'])
		elseif spell.skill == 'Enfeebling Magic'  and magicacc == 1 then
			equip(sets['HYBRIDINT'])
		elseif spell.skill == 'Elemental Magic' and (magicacc == 0 or magicacc == 3) then
			equip(sets['MABACC'])
		elseif spell.skill == 'Elemental Magic'  and magicacc == 1 then
			equip(sets['MAB'])
		elseif spell.skill == 'Elemental Magic'  and magicacc == 2 then
			equip(sets['MABFULL'])
		end
	end
	if spell.element == world.weather_element or spell.element == world.day_element or
		(spell.element == 'Lightning' and buffactive['Thunderstorm']) or
		(spell.element == 'Ice' and buffactive['Hailstorm']) or
		(spell.element == 'Water' and buffactive['Rainstorm']) or
		(spell.element == 'Fire' and buffactive['Firestorm']) or
		(spell.element == 'Earth' and buffactive['Sandstorm']) or
		(spell.element == 'Wind' and buffactive['Windstorm']) or
		(spell.element == 'Light' and buffactive['Aurorastorm']) or
		(spell.element == 'Dark' and buffactive['Voidstorm'])  then

		if spell.skill == 'Elemental Magic' and spell.english:sub(-5) ~= 'helix' then
			equip(sets[spell.element])
		elseif string.find(spell.english,'Cure') then
			equip({back="Twilight Cape", main="Chatoyant Staff", sub="Achaq grip",ear1="Roundel Earring"},sets[spell.element])
		end
	end
end
 
function aftercast(spell,action)
	arcaniz_sch_idle()
	
	if not spell.interrupted then
        if spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@wait 55;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@wait 85;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        elseif spell.english == 'Break' or spell.english == 'Breakga' then
            send_command('@wait 25;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        end
    end
end
 
function status_change(new,old)
	arcaniz_sch_idle()
end
 
function buff_change(buff,gain_or_loss)
	if buff == 'Encumbered' and not gain_or_loss then
		arcaniz_sch_idle()
		windower.add_to_chat(050,"Encumbered status lost.")
	end
end

function arcaniz_sch_idle()
	if player.status == 'Resting' then
		equip(sets['Resting'])
	else
		--windower.add_to_chat(050,"Bolelabunga idle")
		equip(sets['Idle'],sets['BolelabungaSet'])
	end
	if world.area == 'Nyzul Isle' or world.area == 'Alzadaal Undersea Ruins' or world.area == 'Zhayolm Remnants' or world.area == 'Arrapago Remnants' or world.area == 'Bhaflau Remnants' or world.area == 'Silver Sea Remnants' then
		equip({ring2 = "Balrahn's Ring", back= "Umbra Cape"})
	end
	if contador == 1 then
		equip(sets['DT'])
		end
		if contador == 2 then
		equip(sets['MDT'])
	end
end
 
 
 
function self_command(command)
	if command == 'c7' then -- PDT Toggle --
		equip(sets['DT'])
		add_to_chat(158,'PDT Set: [on]')
	elseif command == 'c6' then -- PDT Toggle --
		equip(sets['MDT'])
		contador = 2
		add_to_chat(158,'MDT 100% IDLE: [on]')
	elseif command == 'c8' then -- PDT Toggle --
		equip(sets['Runaway'])
		add_to_chat(158,'Runaway Set: [on]')
	elseif command == 'aumenta' then -- PDT Toggle --
		contador = 0
		add_to_chat(158,'REFRESH: IDLE [on]')
	elseif command == 'reduce' then -- PDT Toggle --
		contador = 1
		add_to_chat(158,'PDT 100% IDLE: [on]')
		equip(sets['DT'])
	elseif command == "magicacc1" then
		magicacc = 1
		add_to_chat(158,'MAGIC ACCURACY: [LV1 HYBRID]')
	elseif command == "magicacc2" then
		magicacc = 2
		add_to_chat(158,'MAGIC ACCURACY: [LV2 FULL POTENCY]')
	elseif command == "magicacc0" then
		magicacc = 0
		add_to_chat(158,'MAGIC ACCURACY: [LV0 FULL ACC]')
	elseif command == "magicacc3" then
		magicacc = 3
		add_to_chat(158,'MAGIC ACCURACY: [LV alpha]')
	end
end