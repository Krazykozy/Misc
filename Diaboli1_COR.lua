organizer_items = {}
sets['HighAcc'] = T{}
sets['MidAcc'] = T{}
sets['LowAcc'] = T{}

--Melee TP
sets['LowAcc']['Standard'] = {
	main="Fettering Blade", 
	range="Molybdosis", 
	ammo=empty, 
	head={ name="Herculean Helm", augments={'Accuracy+26','"Triple Atk."+1',}},
	neck="Clotharius Torque", 
	ear1="Bladeborn Earring", 
	ear2="Steelflash Earring", 
	body={ name="Herculean Vest", augments={'Accuracy+22 Attack+22','"Counter"+1','DEX+2','Attack+3',}},
	hands={ name="Herculean Gloves", augments={'Accuracy+13 Attack+13','DEX+6','Accuracy+12','Attack+5',}}, 
	ring1="Epona's Ring", 
	ring2="Rajas Ring",
	back="Agema Cape", 
	waist="Sailfi Belt +1", 
	leg="Meg. Chausses +1", 
	feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','Crit.hit rate+1','Accuracy+8',}}
}

sets['LowAcc']['DT'] = {
	main="Fettering Blade", 
	range="Holliday", 
	ammo=empty, 
	head="Meghanada Visor +1", 
	neck="Loricate Torque +1", 
	ear1="Etiolation Earring", 
	ear2="Enervating Earring",
	body="Meg. Cuirie +1", 
	hands="Meg. Gloves +1", 
	ring1="Dark Ring", 
	ring2="Defending Ring", 
	back="Solemnity Cape", 
	waist="Commodore Belt", 
	legs="Meg. Chausses +1",
	feet="Meg. Jam. +1"
}

--Store TP Ranged
sets['MidAcc']['Standard'] = {
	main="Fettering Blade", 
	range="Molybdosis", 
	ammo=empty, 
	head={ name="Herculean Helm", augments={'Accuracy+26','"Triple Atk."+1',}},
	neck="Clotharius Torque", 
	ear1="Bladeborn Earring", 
	ear2="Steelflash Earring", 
	body={ name="Herculean Vest", augments={'Accuracy+22 Attack+22','"Counter"+1','DEX+2','Attack+3',}},
	hands={ name="Herculean Gloves", augments={'Accuracy+13 Attack+13','DEX+6','Accuracy+12','Attack+5',}}, 
	ring1="Epona's Ring", 
	ring2="Rajas Ring",
	back="Agema Cape", 
	waist="Sailfi Belt +1", 
	leg="Meg. Chausses +1", 
	feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','Crit.hit rate+1','Accuracy+8',}}
}

sets['MidAcc']['DT'] = sets['LowAcc']['DT']				
						
--Full Acc Set					
sets['HighAcc']['Standard'] = {
	main="Fettering Blade", 
	range="Holliday", 
	ammo=empty, 
	head="Meghanada Visor +1", 
	neck="Iqabi Necklace", 
	ear1="Digni. Earring", 
	ear2="Steelflash Earring",
	body="Meghanada Cuirie", 
	hands="Meg. Gloves +1", 
	ring1="Mars's Ring", 
	ring2="Rajas Ring", 
	back="Agema Cape", 
	waist="Dynamic Belt +1", 
	legs="Meg. Chuasses +1",
	feet="Meg. Jam. +1"
}

sets['HighAcc']['DT'] = sets['LowAcc']['DT']								

--Shooting
sets['Snapshot'] = {
	ammo="Divine Bullet",
	head="Chass. Tricorne +1", 
	neck="Marked Gorget", 
	ear1="Volley Earring", 
	ear2="Enervating Earring",
	body="Meg. Cuirie +1", 
	hands="Meg. Gloves +1", 
	ring1="Bellona's Ring", 
	ring2="Apate Ring", 
	back="Gunslinger's Cape", 
	waist="Commodore Belt", 
	legs="Meg. Chausses +1",
	feet="Meg. Jam. +1"
}

--JAs					
sets['Phantom Roll'] = {
	range="Compensator",
	head="Lanun Tricorne +1",
	body="Meg. Cuirie +1",
	hands="Chasseur's Gants +1",
	legs="Desultor Tassets",
	feet=HercFeet.DT,
	neck="Regal Necklace",
	left_ear="Etiolation Earring",
	right_ear="Genmei Earring",
	left_ring="Luzaf's Ring",
	right_ring="Barataria Ring",
	waist="Flume Belt +1",
	back="Camulus's Mantle",
}

sets['Random Deal'] = {body="Lanun Frac +1"}
sets['Wild Card'] = {feet="Lanun Bottes +1"}
sets['Running'] = set_combine(sets['HighAcc']['DT'], {feet="Hermes' Sandals"})

sets['Quick Draw'] = {
	main="Fettering Blade", 
	range="Molybdosis", 
	ammo="Animikii Bullet", 
	head="Lak. Hat +1", 
	neck="Marked Gorget", 
	ear1="Friomisi Earring", 
	ear2="Novio Earring",
	body="Samnuha Coat", 
	hands={ name="Herculean Gloves", augments={'Mag. Acc.+23','Enmity-7','STR+7','"Mag.Atk.Bns."+15',}}, 
	ring1="Weather. Ring", 
	ring2="Sangoma Ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}, 
	waist="Aquiline Belt", 
	legs="Meg. Chausses +1",
	feet="Chass. Bottes +1"
}
					
sets['Quick Draw Acc'] = sets['Quick Draw']					

--WS Sets
sets["WS"] = {
	head="Meghanada Visor +1", 
	neck="Fotia Gorget", 
	ear1="Bladeborn Earring", 
	ear2="Steelflash Earring", 
	body="Meghanada Cuirie", 
	hands="Meg. Gloves +1", 
	ring1="Apate Ring",
	ring2="Rajas Ring", 
	back="Agema Cape", 
	waist="Fotia Belt", 
	legs="Meg. Chausses +1", 
	feet="Meg. Jam. +1"
}

sets['Exenterator'] = sets['WS']
sets['Evisceration'] = sets['WS']
sets['Savage Blade'] = sets['WS']				
				
sets["Last Stand"] = {
	ammo="Divine Bullet", 
	head="Meghanada Visor +1", 
	neck="Fotia Gorget", 
	ear1="Enervating Earring", 
	ear2="Volley Earring", 
	body="Meg. Cuirie +1", 
	hands="Meg. Gloves +1", 
	ring1="Bellona's Ring",
	ring2="Apate Ring", 
	back="Gunslinger's Cape", 
	waist="Fotia Belt", 
	legs="Nahtirah Trousers", 
	feet="Meg. Jam. +1"
}
				
sets['Wildfire'] = {
	ammo="Bullet", 
	head="Lak. Hat +1", 
	neck="Marked Gorget", 
	ear1="Friomisi Earring", 
	ear2="Novio Earring",
	body="Samnuha Coat", 
	hands={ name="Herculean Gloves", augments={'Mag. Acc.+23','Enmity-7','STR+7','"Mag.Atk.Bns."+15',}}, 
	ring1="Weather. Ring", 
	ring2="Sangoma Ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}, 
	waist="Aquiline Belt", 
	legs="Meg. Chausses +1",
	feet="Chass. Bottes +1"
}
						
sets['Leaden Salute'] = sets['Wildfire']

--Utility
sets['Encumbrance'] = {main="Fettering Blade", range="Holliday", ammo="Divine Bullet", head="Meghanada Visor +1", neck="Twilight Torque", ear1="Etiolation Earring", ear2="Enervating Earring",
						body="Mehanada Cuirie", hands="Meg. Gloves +1", ring1="Dark Ring", ring2="Defending Ring", back="Shadow Mantle", waist="Commodore Belt", legs="Meg. Chausses +1",
						feet="Meg. Jam. +1"}

sets['Precast'] = {
	head={ name="Herculean Helm", augments={'Accuracy+26','"Triple Atk."+1',}}, 
	neck="Orunmila's Torque", 
	ear1="Etiolation Earring", 
	ear2="Loquac. Earring", 
	body="Samnuha Coat", 
	hands="Leyline Gloves", 
	ring1="Weather. Ring", 
	ring2="Prolix Ring", 
	back="Agema Cape", 
	waist="Sailfi Belt +1", 
	legs="Meg. Chausses +1",
	feet="Meg. Jam. +1"
}
					
sets['doom'] = {ring1="Purity Ring",ring2="Saida Ring"}
sets['Death'] =	set_combine(sets['HighAcc']['DT'], {ring1="Shadow Ring", ring2='Eihwaz Ring'})					