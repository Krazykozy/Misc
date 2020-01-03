--Gearswap file for Corsair (FFXI)
--Highly recommend reviewing gearsets and replacing with personal items.

function get_sets()

 	--Job Ability Sets--
		
		sets.JA = {}
		
		sets.JA['Random Deal'] = {head="Lanun tricorne +1",body="Lanun Frac +1",feet="Lanun bottes +1"}
		sets.JA['Wild Card'] = {head="Lanun tricorne +1",body="Lanun Frac +1",feet="Lanun bottes +1"}
		sets.JA['Snake Eye'] = {head="Lanun tricorne +1",body="Lanun Frac +1",legs="Lanun Culottes",feet="Lanun bottes +1"}
		sets.JA['Fold'] = {head="Lanun Tricorne +1",body="Lanun Frac +1", hands="Lanun Gants",feet="Lanun bottes +1"}
		sets.JA['Phantom Roll'] = {head="Lanun tricorne +1",body="Lanun Frac +1",hands="Nvrch. gants +2",ring2="Barataria Ring",
									back="Gunslinger's Cape"}
		sets.JA['Tactician\'s Roll'] = {head="Lanun tricorne +1",body="Nvrch. Frac +2",hands="Nvrch. gants +2",ring2="Barataria Ring"}
		sets.JA['Courser\'s Roll'] = {head="Lanun Tricorne +1",body="Lanun Frac +1",hands="Nvrch. gants +2",feet="Nvrch. bottes +2",ring2="Barataria Ring"}
		sets.JA['Blitzer\'s Roll'] = {head="Nvrch. tricorne +2",body="Lanun Frac +1",hands="Nvrch. gants +2",ring2="Barataria Ring"}
		
		--Luzaf Ring index for Self_Command toggle--
		sets.Luz = {}
		sets.Luz.index = {'Off','On'}
		Luz_Index = 1
		
		sets.Luz.Off = {ring1="Acumen Ring"}
		sets.Luz.On = {ring1="Luzaf's Ring"}
		
		--Melee TP sets--	
		
		sets.TP = {}
		sets.TP.index = {'Reg','Acc','DT'}
		TP_Index = 1
		
		sets.TP.Reg = {
					 head="Whirlpool Mask", neck="Asperity necklace", ear1="Suppanomimi", ear2="Brutal Earring",
					 body="Qaaxo Harness", hands="Umuthi Gloves", ring1="Rajas Ring", ring2="Epona's ring",
					 back="Atheling mantle", waist="Cetl belt", legs="Ighwa Trousers", feet="Qaaxo Leggings"}
							
						
		sets.TP.Acc = {
					 head="Whirlpool mask", neck="Ej Necklace", ear1="Dudgeon earring", ear2="Heartseeker earring",	
					 body="Karmesin Vest", hands="Umuthi Gloves", ring1="Epona's ring", ring2="Rajas ring",
					 back="Atheling mantle", waist="Anguinus Belt", legs="Ighwa Trousers", feet="Lanun bottes +1"}
								
								
		sets.TP.DT = {
					head="Lithelimb Cap", neck="Twilight torque", ear1="Bladeborn Earring", ear2="Steelflash Earring",
					body="Lanun Frac +1", hands="Umuthi Gloves", ring1="Defending ring", ring2="Patricius Ring",
					back="Mollusca mantle", waist="Flume belt", legs="Kaabnax Trousers", feet="Lanun bottes +1"}
		
		--Snapshot Set--
		sets.Snapshot = {}
							 
		sets.Snapshot =  {ammo="Eminent Bullet",
					  hands="Lanun gants",back="Navarch's mantle",waist="Impulse belt",legs="Nahtirah trousers",feet="Iuitl gaiters +1"}
		
		
		--Ranged TP Sets--
		sets.RA = {}
		sets.RA.index = {'Reg','Acc'}
		
		RA_Index = 1
		sets.RA.Reg = {
				   head="Lanun Tricorne +1", neck="Ocachi gorget", ear1="Moonshade Earring", ear2="Volley earring",
				   body="Lak. frac +1", hands="Sigyn's bazubands", ring1="Rajas Ring", ring2="Longshot Ring",
				   back="Gunslinger's cape", waist="Elanid belt", legs="Nahtirah trousers", feet="Iuitl Gaiters +1"}
								  
		sets.RA.Acc = {
					head="Laksamana's hat", neck="Ej Necklace", ear1="Volley earring", ear2="Clearview earring",				  
					body="Lak. frac +1", hands="Sigyn's bazubands", ring1="Longshot Ring", ring2="Hajduk ring",
					back="Gunslinger's cape", waist="Elanid belt", legs="Thur. tights +1", feet="Iuitl Gaiters +1"}						   
								   
		--Melee WS Sets--
		
		sets.Requi = {}
		sets.Requi.index = {'Reg','Acc'}
		Requi_Index = 1
		
		sets.Requi.Reg = {
				   head="Whirlpool mask", neck="Breeze Gorget", ear1="Moonshade Earring", ear2="Brutal Earring",
				   body="Qaaxo harness", hands="Buremte Gloves", ring1="Epona's ring", ring2="Aquasoul ring",
				   back="Atheling mantle", waist="Breeze belt", legs="Quiahuiz trousers", feet="Qaaxo Leggings"}
								  
		sets.Requi.Acc = set_combine(sets.Requi.Reg,{ear1="Bladeborn earring", 
				   ear2="Steelflash earring",body="Manibozho jerkin", legs="Manibozho brais"})
		
		
		sets.Exen = {}
		sets.Exen.index = {'Reg','Acc'}
		Exen_Index = 1
		
		sets.Exen.Reg = set_combine(sets.TP.Reg,{neck="Breeze Gorget",ring1="Stormsoul Ring",ring2="Stormsoul Ring",waist="Breeze Belt"})
		
		sets.Exen.Acc = set_combine(sets.TP.Acc,{neck="Breeze Gorget",waist="Breeze Belt"})						
		
		
		--Ranged WS Sets--
								   
		sets.LSalute = {}
		sets.LSalute.index = {'Reg','Acc'}
		LSalute_Index = 1
		
		sets.LSalute.Reg = {ammo="Eminent Bullet",
	  				    head="Pixie Hairpin +1", neck="Stoicheion medal", ear1="Moonshade Earring", ear2="Friomisi earring",		        
						body="Lanun frac +1", hands="Iuitl Wristbands +1", ring1="Fenrir ring +1", ring2="Archon ring",
					    back="Gunslinger's cape", waist="Aquiline belt", legs="Lak. Trews +1", feet="Lanun bottes +1"}
		
		sets.LSalute.Acc = set_combine(sets.LSalute.Reg,{ring1="Sangoma Ring"})
					
						
		sets.WFire = {}
		sets.WFire.index = {'Reg','Acc'}
		WFire_Index = 1
		
		sets.WFire.Reg = {ammo="Eminent Bullet",
					     head="Lanun tricorne +1", neck="Stoicheion medal", ear1="Novio earring", ear2="Friomisi earring",				    
						 body="Lanun frac +1", hands="Buremte Gloves", ring1="Acumen ring", ring2="Stormsoul ring",
					     back="Gunslinger's cape", waist="Elanid belt", legs="Lak. trews +1", feet="Lanun bottes +1"}

        sets.WFire.Acc = {ammo="Eminent Bullet",
					      head="Lanun tricorne +1", neck="Stoicheion medal", ear1="Novio earring", ear2="Friomisi earring",				       
						  body="Lanun frac +1", hands="Buremte Gloves", ring1="Acumen ring", ring2="Sangoma ring",
					      back="Gunslinger's cape", waist="Elanid belt", legs="Lak. trews +1", feet="Lanun bottes +1"}
		

		sets.LastS = {}
		sets.LastS.index = {'Reg','Acc'}
		LastS_Index = 1
		
		sets.LastS.Reg = {ammo="Eminent Bullet",
						head="Lanun Tricorne +1",neck="Light Gorget",ear1="Moonshade Earring",ear2="Volley Earring",
						body="Lanun Frac +1",hands="Sigyn's Bazubands",ring1="Stormsoul Ring",ring2="Stormsoul Ring",
						back="Gunslinger's Cape",waist="Light Belt",legs="Lanun Culottes",feet="Iuitl gaiters +1"}
		
		sets.LastS.Acc = set_combine(sets.LastS.Reg,{ring1="Longshot Ring",legs="Thur. Tights +1"})
		
		sets.QD = {}
		sets.QD.index = {'Reg','MAcc'}
		
		QD_Index = 1
		
		sets.QD.Reg = {ammo="Animikii Bullet",
					 head="Thaumas Hat",neck="Stoicheion medal",ear1="Novio earring",ear2="Friomisi earring",
					 body="Lanun Frac +1",hands="Nvrch. gants +2",ring1="Acumen ring",ring2="Fenrir ring +1",					      
					 back="Gunslinger's cape",waist="Aquiline belt",legs="Lak. trews +1", feet="Nvrch. bottes +2"}
									  
		sets.QD.MAcc = set_combine(sets.QD.Reg,{ring2="Sangoma Ring",feet="Nvrch. bottes +2"})
		
--Separate from QD index--
        sets.QD.Pre = {ammo="Animikii Bullet",
					 head="Thaumas Hat",neck="Stoicheion medal",ear1="Novio earring",ear2="Friomisi earring",
					 body="Mirke wardecors",hands="Nvrch. gants +2",ring1="Acumen ring",ring2="Fenrir ring +1",					      
					 back="Gunslinger's cape",waist="Aquiline belt",legs="Lak. trews +1", feet="Nvrch. bottes +2"}	
	
		sets.QD.LightShot = set_combine(sets.QD.Reg,{head="Laksamana Hat +1"})
		
		
--Copy and pasted set from Snprphnx_SCH example--	
	--Obis--
		sets.Obi = {}
		sets.Obi.Fire = {waist='Karin Obi',ring2='Zodiac Ring'}
		sets.Obi.Earth = {waist='Dorin Obi',ring2='Zodiac Ring'}
		sets.Obi.Water = {waist='Suirin Obi',ring2='Zodiac Ring'}
		sets.Obi.Wind = {waist='Furin Obi',ring2='Zodiac Ring'}
		sets.Obi.Ice = {waist='Hyorin Obi',ring2='Zodiac Ring'}
		sets.Obi.Thunder = {waist='Rairin Obi',ring2='Zodiac Ring'}
		sets.Obi.Light = {waist='Korin Obi',ring2='Zodiac Ring'}
		sets.Obi.Dark = {waist='Anrin Obi',ring2='Zodiac Ring'}
end		
		
		
		
		
		--Precast Rules--
function precast(spell)
	
	if spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	end
	
	if spell.type == 'CorsairRoll' then
		equip(sets.JA['Phantom Roll'])
	end
	
	if spell.english == "Blitzer's Roll" then
		equip(sets.JA['Blitzer\'s Roll'])
	end
	
	if spell.english == "Tactician's Roll" then
		equip(sets.JA['Tactician\'s Roll'])
	end
	
	if spell.english == "Courser's Roll" then
		equip(sets.JA['Courser\'s Roll'])
	end
	
	if spell.type == 'CorsairShot' then
		equip(sets.QD.Pre)
		if spell.element == world.weather_element or spell.element == world.day_element then
			equip(sets.Obi[spell.element])
		end
	end
	
	if spell.name == "Ranged" then
			equip(sets.Snapshot)
	end

	if spell.english == "Double-Up" then
		equip(sets.JA['Phantom Roll'])
	end
			
	if spell.english == 'Requiescat' then
		equip(sets.Requi[sets.Requi.index[Requi_Index]])
	end
			
	if spell.english == "Exenterator" then
		equip(sets.Exen[sets.Exen.index[Exen_Index]])
	end
			
	if spell.english == 'Last Stand' then
		equip(sets.LastS[sets.LastS.index[LastS_Index]])
					
	end
			
	if spell.english == 'Leaden Salute' then
		equip(sets.LSalute[sets.LSalute.index[LSalute_Index]])
			if spell.element == world.weather_element or spell.element == world.day_element then
						equip(sets.Obi[spell.element])
			end
	end
			
	if spell.english == 'Wildfire' then
		equip(sets.WFire[sets.WFire.index[WFire_Index]])
			if spell.element == world.weather_element or spell.element == world.day_element then
						equip(sets.Obi[spell.element])
			end
	end
end		
				
--Midcast Functions--
--Mirror's Precast to ensure desired effects are applied--		
		
function midcast(spell,act)
	
	if spell.type == 'JobAbility' then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	end
	
	if spell.type == 'CorsairRoll' then
		equip(sets.JA['Phantom Roll'])
	end
	
	if spell.type == 'CorsairShot' then
		equip(sets.QD.Pre)
		if spell.element == world.weather_element or spell.element == world.day_element then
			equip(sets.Obi[spell.element])
		end
	end
	
	if spell.english == 'Light Shot' or spell.english == 'Dark Shot' then
			equip(sets.QD.LightShot)
		if spell.element == world.weather_element or spell.element == world.day_element then
			equip(sets.Obi[spell.element])
		end
	end
	
	if spell.name == "Ranged" then
			equip(sets.RA[sets.RA.index[RA_Index]])
	end
	
	if spell.english == "Double-Up" then
		equip(sets.JA['Phantom Roll'])
	end
			
	if spell.english == 'Requiescat' then
		equip(sets.Requi[sets.Requi.index[Requi_Index]])
	end
			
	if spell.english == "Exenterator" then
		equip(sets.Exen[sets.Exen.index[Exen_Index]])
	end
			
	if spell.english == 'Last Stand' then
		equip(sets.LastS[sets.LastS.index[LastS_Index]])
					
	end
			
	if spell.english == 'Leaden Salute' then
		equip(sets.LSalute[sets.LSalute.index[LSalute_Index]])
			if spell.element == world.weather_element or spell.element == world.day_element then
						equip(sets.Obi[spell.element])
			end
	end
			
	if spell.english == 'Wildfire' then
		equip(sets.WFire[sets.WFire.index[WFire_Index]])
			if spell.element == world.weather_element or spell.element == world.day_element then
						equip(sets.Obi[spell.element])
			end
	end
				
			
end
		
		
			
--Aftercast function, returns user to TP or QD Precast set after action is complete--
function aftercast(spell,act)
			
	if player.status == 'Engaged' then
				equip(sets.TP[sets.TP.index[TP_Index]])
		else
				equip(sets.JA['Phantom Roll'])
		end
	end
	
			
function status_change(new,old)
			
	if player.status == 'Engaged' then
			equip(sets.TP[sets.TP.index[TP_Index]])
		else
			equip(sets.JA['Phantom Roll'])
	end

end
			
	
		
function self_command(command)
		
			if command == 'toggle TP set' then
				TP_Index = TP_Index +1
				if TP_Index > #sets.TP.index then TP_Index = 1 end
				send_command('@input /echo >>> TP Set changed to '..sets.TP.index[TP_Index]..' ')
				equip(sets.TP[sets.TP.index[TP_Index]])
				
			elseif command == 'toggle RA set' then
				RA_Index = RA_Index +1
				if RA_Index > #sets.RA.index then RA_Index = 1 end
				send_command('@input /echo >>> Ranged TP Set changed to '..sets.RA.index[RA_Index]..' ')
				equip(sets.RA[sets.RA.index[RA_Index]])
	
		
	
			elseif command == 'toggle WS sets' then
				Requi_Index = Requi_Index +1
				if Requi_Index > #sets.Requi.index then Requi_Index = 1 end
				Exen_Index = Exen_Index +1
				if Exen_Index > #sets.Exen.index then Exen_Index = 1 end
				send_command('@input /echo >>> Melee WS sets changed to '..sets.Exen.index[Exen_Index]..' ')
				
			elseif command == 'toggle RWS set' then
				LastS_Index = LastS_Index +1
				if LastS_Index > #sets.LastS.index then LastS_Index = 1 end
				LSalute_Index = LSalute_Index +1
				if LSalute_Index > #sets.LSalute.index then LSalute_Index = 1 end
				WFire_Index = WFire_Index +1
				if WFire_Index > #sets.WFire.index then WFire_Index = 1 end
				send_command('@input /echo >>> Ranged WS sets changed to '..sets.WFire.index[WFire_Index]..' ')
				
			elseif command == 'toggle QD set' then
				QD_Index = QD_Index +1
				if QD_Index > #sets.QD.index then QD_Index = 1 end
				send_command('@input /echo >>> Quick Draw set changed to '..sets.QD.index[QD_Index]..' ')
				
			elseif command == 'toggle Luz' then
				Luz_Index = Luz_Index +1
				if Luz_Index > #sets.Luz.index then Luz_Index = 1 end
				send_command('@input /echo >>> Luzaf Ring: '..sets.Luz.index[Luz_Index]..' ')
				equip(sets.Luz[sets.Luz.index[Luz_Index]])
	
			end
			
		end