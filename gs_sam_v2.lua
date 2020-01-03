--Gearswap file for Samurai(FFXI) by meh(01/Zerowone/ERC8D)

--Gearset advice and TP layout approach advised by Bismarck.Keityan
--Also thanks to Lakshmi.Jassik for crunching out TP returns because I am lazy. 

--Highly recommend reviewing gearsets and replacing with personal items.

--Also recommend changing key bind keys since everyone's keyboard and play style are different. ^ = CTRL, != ALT.

function get_sets()

--KeyBinds for toggle commands found in self_command function
--F9-(Standard) TPset1,TPset2, TPset3, TPset4
--F10-(Accuracy) TPAcc1, TPAcc2
--F11-(Melee Accuracy WS) Standard,Accuracy,
--F12-(DT) Melee Hybrid, MDEF


--ALT+F10 -(Ranged TP) Reg, Acc, HiAcc
--ALT+F11-(Ranged WS) Reg, Acc, HiAcc
--ALT+F12- Turtle+Kite(Danzo+PDT set)&(Danzo+MDT set)

	send_command('bind f9 gs c toggle TP set')
	send_command('bind f10 gs c toggle Acc set')
	send_command('bind f11 gs c toggle WeaponSkill sets')
	send_command('bind f12 gs c toggle DT set')

	send_command('bind !f10 gs c toggle RA set')
	send_command('bind !f11 gs c toggle RA WS sets')
	send_command('bind !f12 gs c toggle DTKite set')

--CTR+F9 (Reverse or of TP Toggle List on F9)
	send_command('bind ^f9 gs c toggle dTP set')	
	
--CTRL+F12 -(Fillmode Toggle)
	send_command('bind ^f12 input //fillmode')

-- Windower Keybinds for Job Abilities.	
--ctrl+` = Hasso
--alt+` = Seigan

	send_command('bind ^` input /ja Hasso <me>')
	send_command('bind !` input /ja Seigan <me>')

function file_unload()
	
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')

	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')
	
	send_command('unbind ^`')
	send_command('unbind !`')
	
	send_command('unbind ^f9')
	send_command('unbind ^f12')

end
	
--Job Ability sets for Precast and Midcast Functions--
	
sets.JA = {}
		sets.JA['Meikyo Shisui'] = {feet="Sakonji Sune-Ate +1"}
		sets.JA['Third Eye'] = {legs="Sakonji Haidate +1"}
		sets.JA['Hasso'] = {hands="Wakido Kote +1"}
		sets.JA['Meditate'] = {head="Wakido Kabuto +1",hands="Sakonji Kote"}
		sets.JA['Shikikoyo'] = {legs="Sakonji Haidate +1"}
		sets.JA['Blade Bash'] = {hands="Sakonji Kote"}
		sets.JA['Sengikori'] = {feet="Unkai Sune-Ate +2"}
		sets.JA['Sekkanoki'] = {hands="Unkai Kote +2"}
		sets.JA['Seigan'] = {legs="Sakonji Haidate +1"}


--TP Sets--

--As Monday 06/16/14 TP values will have to be slightly adjusted due to new TP UI.

-- Anahera Blade = 494 Delay (if using Lentus Grip = 518.7 Delay). Ideal to have 52-53 STP in gear to 4 hit

-- Tsurumaru & Kogarasumaru = 450 Delay (if using Lentus Grip = 472.5 Delay)

-- Tsurumaru : With Ionis ideal to have + 49 STP in gear
-- Kogarasumaru: Ideal to have +36 STP in gear to 5 hit

-- Amanomurakumo & Masamune = 437 Delay (if using Lentus Grip = 458.85)	

-- Amanomurakumo: Ideal to have +44 STP in gear to 5 hit
-- Masamune: Ideal to have +44 STP in gear to 5 hit

--Range and Ammo slots do not need to be defined as long as the user preferred weapon and ammo are already equipped--
--Assuming user is using either Cibitshavore Path C or Yoichinoyumi as ranged weapon--

sets.TP = {}
sets.TP.index = {'TP1','TP2','TP3','TP4','Acc1','Acc2','PDT','MDT','DTK','MDK'}
TP_Index = 1

--65 STP
sets.TP.TP1 = {head="Sakonji Kabuto +1",neck="Ganesha's Mala",ear1="Tripudio Earring",ear2="Brutal Earring",
	       body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
	       back="Takaha Mantle",waist="Goading Belt",legs="Wakido Haidate +1",feet="Otronif Boots +1"}

--58 STP				
sets.TP.TP2 = set_combine(sets.TP.TP1,{waist="Windbuffet Belt"})

--53 STP
sets.TP.TP3 = set_combine(sets.TP.TP2,{feet={"Otronif Boots +1",augments={"DA +2"}}})

--47 STP
sets.TP.TP4 = set_combine(sets.TP.TP3,{ear1="Trux Earring"})

--37 STP
sets.TP.Acc1 = {head="Yaoyotl Helm",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
	        body="Mes'yohi Haubergeon",hands="Wakido Kote +1",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Takaha Mantle",waist="Dynamic Belt +1",legs={"Otronif Brais +1",augments={"Accuracy +8"}},
		feet="Wakido Sune-Ate +1"}

--21 STP				 
sets.TP.Acc2 = set_combine(sets.TP.Acc1,{ring1="Mars's Ring",ring2="Patricius Ring",legs="Xaddi Cuisses"})				


sets.TP.PDT = {head="Lithelimb Cap",neck="Agitator's Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
	       body="Otronif Harness +1",hands="Wakido Kote +1",ring1="Defending Ring",ring2="Patricius Ring",
	       back="Shadow Mantle",waist="Flume Belt",legs="Xaddi Cuisses",feet="Otronif Boots +1"}

sets.TP.MDT = {head="Lithelimb Cap",neck="Twilight Torque",ear1="Sanare Earring",ear2="Mujin Stud",
	       body="Otronif Harness +1",hands="Wakido Kote +1",ring1="Defending Ring",ring2="Shadow Ring",
	       back="Engulfer Cape",belt="Flume Belt",legs="Otronif Brais +1",feet="Otronif Boots +1"}

sets.TP.DTK = set_combine(sets.TP.PDT,{feet="Danzo Sune-Ate"})

sets.TP.MDK = set_combine(sets.TP.MDT,{feet="Danzo Sune-Ate"})

--Range TP--
sets.Utility = {}
 
sets.Utility.Snapshot = {head="Zha'Go's Barbut",neck="Iqabi Necklace",ear1="Clearview Earring",ear2="Matanki Earring",
	     body="Nuevo Coselete",hands="Unkai Kote +2",ring1="Hajduk Ring +1",ring2="Hajduk Ring +1",
	     back="Jaeger Mantle",waist="Buccaneer's Belt",legs="Mustela Brais",feet="Wakido Sune-Ate +1"}

sets.RA = {}
sets.RA.index = {'Reg','Acc','HiAcc'}
RA_Index = 1

sets.RA.Reg = {head="Sakonji Kabuto +1",neck="Iqabi Necklace",ear1="Clearview Earring",ear2="Matanki Earring",
	       body="Kyujutsugi",hands="Unkai Kote +2",ring1="Rajas Ring",ring2="Hajduk Ring +1",	
	       back="Thall Mantle",waist="Buccaneer's Belt",legs="Wakido Haidate",feet="Wakido Sune-Ate +1"}

sets.RA.Acc = set_combine(sets.RA.Reg,{ring1="Hajduk Ring +1",legs="Wakido Haidate +1"})

sets.RA.HiAcc = set_combine(sets.RA.Acc,{hands="Buremte Gloves",back="Jaeger Mantle",legs="Aetosaur Trousers +1"})


--Weaponskill Sets--

--As of Monday 06/16/14, the Majority of Great Katana Weaponskills are modified by STR
sets.WS = {}
sets.WS.index = {'Reg','Acc'}
WS_Index = 1

--Gear is just for example, can be and should be swapped with personal items.		
sets.WS.Reg = {head="Otomi helm",neck="Asperity Necklace",ear1="Brutal earring",ear2="Moonshade earring",
	       body="Sakonji Domaru +1",hands="Boor Bracelets",ring1="Rajas ring",ring2="Pyrosoul Ring",
	       back="Buquwik cape",waist="Windbuffet Belt",legs="Wakido haidate +1",feet="Ejekamal Boots"}
					
sets.WS.Acc = {head="Yaoyotl helm",neck="Iqabi Necklace",ear1="Brutal earring",ear2="Moonshade earring",
	       body="Sakonji Domaru +1",hands="Miki. Guantlets",ring1="Rajas ring",ring2="Pyrosoul Ring",
	       back="Takaha Mantle",waist="Anguinus Belt",legs="Miki. Cuisses",feet="Wakido Sune-Ate +1"}
		
--Tachi: Shoha--
sets.Shoha = {}
sets.Shoha.index = {'Reg','Acc'}
Shoha_Index = 1
	
sets.Shoha.Reg = {head="Otomi helm",neck="Ganesha's Mala",ear1="Brutal earring",ear2="Moonshade earring",
		  body="Mes'yohi Haubergeon",hands="Miki. Gauntlets",ring1="Pyrosoul Ring",ring2="Pyrosoul Ring",
		  back="Buquwik Cape",waist="Windbuffet belt",legs="Scuffler's Cosciales",feet="Ejekamal Boots"}
								  
sets.Shoha.Acc = {head="Yaoyotl helm",neck="Breeze Gorget",ear1="Brutal earring",ear2="Moonshade earring",
		  body="Mes'yohi Haubergeon",hands="Miki. Gauntlets",ring1="Candent Ring",ring2="Pyrosoul Ring",
		  back="Letalis Mantle",waist="Metalsinger Belt",legs="Miki. Cuisses",feet="Wakido Sune-Ate +1"}
		
--Tachi: Fudo--
		
sets.Fudo = {}
sets.Fudo.index = {'Reg','Acc'}
Fudo_Index = 1
	
sets.Fudo.Reg = {head="Otomi helm",neck="Light Gorget",ear1="Brutal earring",ear2="Moonshade earring",
	         body="Phorcys Korazin",hands="Miki. Gauntlets",ring1="Pyrosoul Ring",ring2="Pyrosoul Ring",
		 back="Buquwik cape",waist="Light belt",legs="Scuffler's Cosciales",feet="Ejekamal Boots"}
							   
sets.Fudo.Acc = {head="Yaoyotl helm",neck="Light Gorget",ear1="Brutal earring",ear2="Moonshade earring",
		 body="Mes'yohi Haubergeon",hands="Miki. Gauntlets",ring1="Candent Ring",ring2="Pyrosoul Ring",
		 back="Buquwik cape",waist="Light belt",legs="Miki. Cuisses",feet="Wakido Sune-Ate +1"}

--Tachi: Kaiten --

sets.Kaiten = {}
sets.Kaiten.index = {'Reg','Acc'}
Kaiten_Index = 1

sets.Kaiten.Reg = set_combine(sets.Fudo.Reg,{ear2="Vulcan's Pearl"})

sets.Kaiten.Acc = {head="Yaoyotl helm",neck="Light Gorget",ear1="Brutal earring",ear2="Moonshade earring",
		   body="Mes'yohi Haubergeon",hands="Miki. Gauntlets",ring1="Candent Ring",ring2="Pyrosoul Ring",
		   back="Buquwik cape",waist="Light belt",legs="Miki. Cuisses",feet="Wakido Sune-Ate +1"}
				 
--Apex Arrow--
--Range and Ammo slots do not need to be defined as long as the user preferred weapon and ammo are already equipped--

sets.Apex = {}
sets.Apex.index = {'Reg','Acc','HiAcc'}
Apex_Index = 1
		
sets.Apex.Reg = {head="Sakonji Kabuto +1",neck="Thunder Gorget",ear1="Moonshade Earring",ear2="Breeze Pearl",
		 body="Phorcys Korazin",hands="Unkai Kote +2",ring1="Stormsoul Ring",ring2="Stormsoul Ring",
		 back="Ik Cape",waist="Thunder Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
		
sets.Apex.Acc = {head="Sakonji Kabuto +1",neck="Iqabi Necklace",ear1="Clearview Earring",ear2="Matanki Earring",
		 body="Kyujutsugi",hands="Unkai Kote +2",ring1="Hajduk Ring +1",ring2="Stormsoul Ring",
		 back="Thall Mantle",waist="Buccaneer's Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
				 
sets.Apex.HiAcc =set_combine(sets.Apex.Acc,{hands="Buremte Gloves",ring2="Hajduk Ring +1",
		back="Jaeger Mantle",legs="Aetosaur Trousers +1"})				 
		
--Namas Arrow--
sets.Nama = {}
sets.Nama.index = {'Reg','Acc','HiAcc'}
Nama_Index = 1
		
sets.Nama.Reg = {head="Sakonji Kabuto +1",neck="Light Gorget",ear1="Vulcan's Pearl",ear2="Vulcan's Pearl",
		 body="Phorcys Korazin",hands="Unkai Kote +2",ring1="Rajas Ring",ring2="Pyrosoul Ring",
		 back="Buquwik Cape",waist="Light Gorget",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}
					
sets.Nama.Acc = {head="Sukeroku Hachimaki",neck="Iqabi Necklace",ear1="Clearview Earring",ear2="Matanki Earring",
		 body="Kyujutsugi",hands="Unkai Kote +2",ring1="Pyrosoul Ring",ring2="Hajduk Ring +1",
		 back="Thall Mantle",waist="Buccaneer's Belt",legs="Wakido Haidate +1",feet="Wakido Sune-Ate +1"}

sets.Nama.HiAcc = set_combine(sets.Nama.Acc,{hands="Buremte Gloves",ring1="Hajduk Ring +1",
		back="Jaeger Mantle",legs="Aetosaur Trousers +1"})
								
end

function precast(spell,act)
	if spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	end
	
	if spell.name == 'Ranged' then
		equip(sets.Utility.Snapshot)
	end

	if spell.type == 'WeaponSkill' then
		equip(sets.WS[sets.WS.index[WS_Index]])
	end
	
	if spell.english == "Tachi: Shoha" then
		equip(sets.Shoha[sets.Shoha.index[Shoha_Index]])
	end
	
	if spell.english == "Tachi: Fudo" then
		equip(sets.Fudo[sets.Fudo.index[Fudo_Index]])
 	end
	
	if spell.english == "Tachi: Kaiten" then
		equip(sets.Kaiten[sets.Kaiten.index[Kaiten_Index]])
	end	
		
	if spell.english == "Apex Arrow" then
		equip(sets.Apex[sets.Apex.index[Apex_Index]])
	end
	
	if spell.english == "Namas Arrow" then
		equip(sets.Nama[sets.Nama.index[Nama_Index]])
	end

	if buffactive['Meikyo Shisui'] and spell.type == 'WeaponSkill' then
		equip(sets.WS[sets.WS.index[WS_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Tachi: Shoha" then
		equip(sets.Shoha[sets.Shoha.index[Shoha_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Tachi: Fudo" then
		equip(sets.Fudo[sets.Fudo.index[Fudo_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Tachi: Kaiten" then
		equip(sets.Kaiten[sets.Kaiten.index[Kaiten_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Apex Arrow" then
		equip(sets.Apex[sets.Apex.index[Apex_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Namas Arrow" then
		equip(sets.Nama[sets.Nama.index[Nama_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Sekkanoki'] and spell.type == 'WeaponSkill' then
		equip(sets.WS[sets.WS.index[WS_Index]],sets.JA['Sekkanoki'])
	end

	if buffactive['Sekkanoki'] and spell.english == "Tachi: Shoha" then
		equip(sets.Shoha[sets.Shoha.index[Shoha_Index]],sets.JA['Sekkanoki'])
	end
	
	if buffactive['Sekkanoki'] and spell.english == "Tachi: Fudo" then
		equip(sets.Fudo[sets.Fudo.index[Fudo_Index]],sets.JA['Sekkanoki'])
	end

	if buffactive['Sekkanoki'] and spell.english == "Tachi: Kaiten" then
		equip(sets.Kaiten[sets.Kaiten.index[Kaiten_Index]],sets.JA['Sekkanoki'])
	end

	if buffactive['Sekkanoki'] and spell.english == "Apex Arrow" then
		equip(sets.Apex[sets.Apex.index[Apex_Index]],sets.JA['Sekkanoki'])
	end

	if buffactive['Sekkanoki'] and spell.english == "Namas Arrow" then
		equip(sets.Nama[sets.Nama.index[Nama_Index]],sets.JA['Sekkanoki'])
	end

	 if buffactive['Sengikori'] and spell.type == 'WeaponSkill' then
		equip(sets.WS[sets.WS.index[WS_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Tachi: Shoha" then
		equip(sets.Shoha[sets.Shoha.index[Shoha_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Tachi: Fudo" then
		equip(sets.Fudo[sets.Fudo.index[Fudo_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Tachi: Kaiten" then
		equip(sets.Kaiten[sets.Kaiten.index[Kaiten_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Apex Arrow" then
		equip(sets.Apex[sets.Apex.index[Apex_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Namas Arrow" then	
		equip(sets.Nama[sets.Nama.index[Nama_Index]],sets.JA['Sengikori'])
	end	

end	

--Due to speed of Gearswap there are times when gear will swap to the Aftercast conditions without a Midcast condition.
--This can on occasion cause the desired buffs to Weaponskills and Job Abilities to not occur.
--Midcast is a mirror of precast due to this--

function midcast(spell,act)
	if spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	end
	
	if spell.name == 'Ranged' then
		equip(sets.RA[sets.RA.index[RA_Index]])
	end
	
	if spell.type == 'WeaponSkill' then
		equip(sets.WS[sets.WS.index[WS_Index]])
	end
	
	if spell.english == "Tachi: Shoha" then
		equip(sets.Shoha[sets.Shoha.index[Shoha_Index]])
	end
	
	if spell.english == "Tachi: Fudo" then
		equip(sets.Fudo[sets.Fudo.index[Fudo_Index]])
 	end
	
	if spell.english == "Tachi: Kaiten" then
		equip(sets.Kaiten[sets.Kaiten.index[Kaiten_Index]])
	end	
		
	if spell.english == "Apex Arrow" then
		equip(sets.Apex[sets.Apex.index[Apex_Index]])
	end
	
	if spell.english == "Namas Arrow" then
		equip(sets.Nama[sets.Nama.index[Nama_Index]])
	end

	if buffactive['Meikyo Shisui'] and spell.type == 'WeaponSkill' then
		equip(sets.WS[sets.WS.index[WS_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Tachi: Shoha" then
		equip(sets.Shoha[sets.Shoha.index[Shoha_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Tachi: Fudo" then
		equip(sets.Fudo[sets.Fudo.index[Fudo_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Tachi: Kaiten" then
		equip(sets.Kaiten[sets.Kaiten.index[Kaiten_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Apex Arrow" then
		equip(sets.Apex[sets.Apex.index[Apex_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Meikyo Shisui'] and spell.english == "Namas Arrow" then
		equip(sets.Nama[sets.Nama.index[Nama_Index]],sets.JA['Meikyo Shisui'])
	end

	if buffactive['Sekkanoki'] and spell.type == 'WeaponSkill' then
		equip(sets.WS[sets.WS.index[WS_Index]],sets.JA['Sekkanoki'])
	end

	if buffactive['Sekkanoki'] and spell.english == "Tachi: Shoha" then
		equip(sets.Shoha[sets.Shoha.index[Shoha_Index]],sets.JA['Sekkanoki'])
	end
	
	if buffactive['Sekkanoki'] and spell.english == "Tachi: Fudo" then
		equip(sets.Fudo[sets.Fudo.index[Fudo_Index]],sets.JA['Sekkanoki'])
	end

	if buffactive['Sekkanoki'] and spell.english == "Tachi: Kaiten" then
		equip(sets.Kaiten[sets.Kaiten.index[Kaiten_Index]],sets.JA['Sekkanoki'])
	end

	if buffactive['Sekkanoki'] and spell.english == "Apex Arrow" then
		equip(sets.Apex[sets.Apex.index[Apex_Index]],sets.JA['Sekkanoki'])
	end

	if buffactive['Sekkanoki'] and spell.english == "Namas Arrow" then
		equip(sets.Nama[sets.Nama.index[Nama_Index]],sets.JA['Sekkanoki'])
	end

	 if buffactive['Sengikori'] and spell.type == 'WeaponSkill' then
		equip(sets.WS[sets.WS.index[WS_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Tachi: Shoha" then
		equip(sets.Shoha[sets.Shoha.index[Shoha_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Tachi: Fudo" then
		equip(sets.Fudo[sets.Fudo.index[Fudo_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Tachi: Kaiten" then
		equip(sets.Kaiten[sets.Kaiten.index[Kaiten_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Apex Arrow" then
		equip(sets.Apex[sets.Apex.index[Apex_Index]],sets.JA['Sengikori'])
	end

	 if buffactive['Sengikori'] and spell.english == "Namas Arrow" then	
		equip(sets.Nama[sets.Nama.index[Nama_Index]],sets.JA['Sengikori'])
	end	
end

function aftercast(spell,act)
	
	if player.status == 'Engaged' and buffactive['Sekkanoki'] then
		equip(sets.JA['Sekkanoki'])
	elseif player.status == 'Engaged' then 
		equip(sets.TP[sets.TP.index[TP_Index]])
	end

	if player.status == 'Engaged' and buffactive['Meikyo Shisui'] then
		equip(sets.JA['Meikyo Shisui'])
	elseif player.status == 'Engaged' then 
		equip(sets.TP[sets.TP.index[TP_Index]])
	end
	
	if player.status == 'Engaged' and buffactive['Sengikori'] then
		equip(sets.JA['Sengikori'])
	elseif player.status == 'Engaged' then 
		equip(sets.TP[sets.TP.index[TP_Index]])
	end	

	if player.status == 'Engaged' and (buffactive['Seigan'] or buffactive['Third Eye']) then
		equip(sets.JA['Seigan'])
	elseif player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_Index]])
	end
end

function buff_change(new)

	if buffactive['Sekkanoki'] then
		equip{hands="Unkai Kote +2"}
	end
	
	if buffactive['Meikyo Shisui'] then
		equip{feet="Sakonji Sune-Ate +1"}
	end
	
	if buffactive['Sengikori'] then
		equip{feet="Unkai Sune-Ate +2"}
	end
		
	if buffactive['Third Eye'] or buffactive['Seigan'] then
		equip{legs="Sakonji Haidate +1"}
	end
end


function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_Index]])
	end	

--Shouldn't really be needed but if it does arise that you have Sekkanoki active and a fodder mob dies before Weaponskill this will keep Unkai on.		
	if buffactive['Sekkanoki'] and new == 'Engaged' then
		equip{hands="Unkai Kote +2"}
	end
	
	if buffactive['Meikyo Shisui'] and new == 'Engaged' then
		equip{feet="Sakonji Sune-Ate +1"}
	end
	
	 if buffactive['Sengikori'] and new == 'Engaged' then
                equip{feet="Unkai Sune-Ate +2"}
        end

	if buffactive['Third Eye'] or buffactive['Seigan'] and new == 'Engaged' then
		equip{feet="Sakonji Haidate +1"}
	end    
end	


--Toggle Command functions--
--Gearswap direct command = //gs c toggle 'x' set
--Macro line = /console gs c toggle x set
--ex: console gs c toggle TP set  or //gs c toggle TP set
	

function self_command(command)

--Separate Toggles to allow user flexibility 

--Macro line: /console gs c toggle TP set
--Chat line: //gs c toggle TP set
--Toggles between TP1, TP2, TP3, TP4 sets

if command == 'toggle TP set' then
		if TP_Index < 4 then
		TP_Index = TP_Index +1
		else TP_Index = 1 end
		send_command('@ input /echo >>> TP Sets Changed to: '..sets.TP.index[TP_Index]..' ')
		equip(sets.TP[sets.TP.index[TP_Index]])
		
--Macro line: /console gs c toggle dTP set
--Chat line: //gs c toggle dTP set
--Toggles down the index from TP4,TP3,TP2,TP1		
elseif command == 'toggle dTP set' then
		if TP_index < 5 and TP_index > 1 then
		TP_index = TP_index -1
		else TP_index = 4 end
		send_command('@ input /echo >>> TP Sets Changed to: '..sets.TP.index[TP_Index]..' ')
		equip(sets.TP[sets.TP.index[TP_Index]])


--Macro line: /console gs c toggle Acc set
--Chat line: //gs c toggle Acc set
--Toggles between Acc1 and Acc2 sets.
	elseif command == 'toggle Acc set' then
		if TP_Index < 6 and TP_Index > 4 then
		TP_Index = TP_Index +1
		else TP_Index = 5 end
		send_command('@ input /echo >>> TP Sets Changed to: '..sets.TP.index[TP_Index]..' ')
		equip(sets.TP[sets.TP.index[TP_Index]])
		
--Macro line: /console gs c toggle DT set
--Chat line: //gs c toggle DT set		
--Toggles between PDT and MDT sets
	
	elseif command == 'toggle DT set' then
		if TP_Index < 8 and TP_Index > 6 then
		TP_Index = TP_Index +1 
		else TP_Index = 7 end
		send_command('@ input /echo >>> DT Set Changed to: '..sets.TP.index[TP_Index]..' ')
		equip(sets.TP[sets.TP.index[TP_Index]])
	
--Macro line: /console gs c toggle DTKite set
--Chat line: //gs c toggle DTKite set
--Toggles between the PDT/MDT Kite sets

	elseif command == 'toggle DTKite set' then
		if TP_Index < 10 and TP_Index > 8 then
		TP_Index = TP_Index +1
		else TP_Index = 9 end
		send_command('@ input /echo >>> DTKite Set Changed to: '..sets.TP.index[TP_Index]..' ')
		equip(sets.TP[sets.TP.index[TP_Index]])
--All Weaponskill sets are set to the "Reg" gear set by default, switching to "Acc" is hardly needed, but the option is nice to have.

--Macro line: /console gs c toggle WeaponSkill set
--Chat line: //gs c toggle WeaponSkill set
--Changes all Melee Weaponskill Indicies at once.
	elseif command == 'toggle WeaponSkill sets' then
		WS_Index = WS_Index +1
		if WS_Index > #sets.WS.index then WS_Index = 1 end
		Shoha_Index = Shoha_Index +1
		if Shoha_Index > #sets.Shoha.index then Shoha_Index = 1 end
		Fudo_Index = Fudo_Index +1
		if Fudo_Index > #sets.Fudo.index then Fudo_Index = 1 end
		Kaiten_Index = Kaiten_Index +1
		if Kaiten_Index > #sets.Kaiten.index then Kaiten_Index = 1 end
		send_command('@input /echo >>> All Melee WeaponSkill Sets Changed to: '..sets.WS.index[WS_Index]..' ')
	
--Macro line: /console gs c toggle RA WS sets
--Chat line: /gs c toggle RA WS sets
--Changes defined RA sets, assuming user will only be using Apex and Namas Arrow(s).


	elseif command == 'toggle RA WS sets' then
		Apex_Index = Apex_Index +1
		if Apex_Index > #sets.Apex.index then Apex_Index = 1 end
		Nama_Index = Nama_Index +1
		if Nama_Index > #sets.Nama.index then Nama_Index = 1 end
		send_command('@input /echo >>> All Ranged WS Sets Changed to: '..sets.Nama.index[Nama_Index]..' ')
		
	elseif command == 'toggle RA set' then
		RA_Index = RA_Index +1
		if RA_Index > #sets.RA.index then RA_Index = 1 end
		send_command('@input /echo >>> Ranged TP Set Changed to: '..sets.RA.index[RA_Index]..' ')
		end
	end