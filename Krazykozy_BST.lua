-- ** I Use Some of Motenten's Functions ** --
-- Last Updated: 05/03/14 6:50 AM ** --

function get_sets()
	AccIndex = 1
	AccArray = {"TP","LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	JugIndex = 1
	JugArray = {"Spicy Broth"} -- Add More Jugs Here --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","D2Ring","CpRing"} -- Default Idle Set Is Movement --
	PetIndex = 1
	PetArray = {"Haste","DT","ACC"} -- Default Pet TP Set Is Haste --
	Armor = 'None'
	Twilight = 'None'
	Pet = 'OFF' -- Set Default Pet Set ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	--WS Properties
	wsProperty = T{}
	--Level 1s
	wsProperty['Transfixion'] = T{'Light'}
	wsProperty['Compression'] = T{'Dark'}
	wsProperty['Liquefaction'] = T{'Fire'}
	wsProperty['Scission'] = T{'Earth'}
	wsProperty['Reverberation'] = T{'Water'}
	wsProperty['Detonation'] = T{'Wind'}
	wsProperty['Induration'] = T{'Ice'}
	wsProperty['Impaction'] = T{'Lightning'}
	--Level 2s
	wsProperty['Gravitation'] = T{'Dark','Earth'}
	wsProperty['Distortion'] = T{'Water','Ice'}
	wsProperty['Fusion'] = T{'Fire','Light'}
	wsProperty['Fragmentation'] = T{'Wind','Lightning'}
	--Level 3s
	wsProperty['Darkness'] = T{'Dark','Earth','Water','Ice'}
	wsProperty['Light'] = T{'Light','Fire','Wind','Lightning'}		
	
	sc_map = {SC1="Ruinator", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			main="Kerehcatl",
			sub="Izizoeksi",
			head="Oce. Headpiece +1",
			neck="Wiglen Gorget",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body="Kumarbi's Akar",
			hands="Umuthi Gloves",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Muscle Belt +1",
			legs="Iuitl Tights +1",
			feet="Skd. Jambeaux +1"}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head="Lithelimb Cap",
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			body="Emet Harness +1",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Flume Belt +1",
			legs="Iuitl Tights +1",
			feet="Skd. Jambeaux +1"})

	sets.Idle.D2Ring = {
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring"}			

	sets.Idle.CpRing = {
			left_ring="Trizek Ring",
			right_ring="Capacity Ring"}			
			
	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- TP Sets --
	sets.TP = {
			main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
			ammo="Seething Bomblet +1",
			head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
			neck="Combatant's Torque",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body={ name="Herculean Vest", augments={'Crit. hit damage +4%','DEX+10','Accuracy+11','Attack+13',}},
			hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Canny Cape",
			waist="Reiki Yotai",
			legs="Meghanada Chausses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},}
	sets.TP.LowACC = set_combine(sets.TP,{
			ammo="Seething Bomblet +1",
			head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Crit. hit damage +4%','DEX+10','Accuracy+11','Attack+13',}},
			hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Lupine Cape",
			waist="Kentarch Belt +1",	
			legs="Meghanada Chausses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})
	sets.TP.MidACC = set_combine(sets.TP.LowACC,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Crit. hit damage +4%','DEX+10','Accuracy+11','Attack+13',}},
			hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			waist="Kentarch Belt +1",
			back="Lupine Cape",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Ramuh Ring +1",
			right_ring="Cacoethic Ring +1",
			waist="Olseni Belt",
			back="Grounded Mantle +1",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})

	-- March x2 + Haste + Samba --
	sets.TP.HighHaste = set_combine(sets.TP.MidHaste,{
			ammo="Seething Bomblet +1",
			head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
			left_ear="Suppanomimi",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Crit. hit damage +4%','DEX+10','Accuracy+11','Attack+13',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			waist="Windbuffet Belt +1",
			back="Lupine Cape",
			legs="Meghanada Chausses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})
	sets.TP.LowACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Seething Bomblet +1",
			head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Crit. hit damage +4%','DEX+10','Accuracy+11','Attack+13',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			waist="Kentarch Belt +1",
			back="Lupine Cape",
			legs="Meghanada Chausses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Seething Bomblet +1",
			neck="Combatant's Torque",
			left_ear="Suppanomimi",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Crit. hit damage +4%','DEX+10','Accuracy+11','Attack+13',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Lupine Cape",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Ramuh Ring +1",
			right_ring="Cacoethic Ring +1",
			waist="Olseni Belt",
			back="Grounded Mantle +1",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})

	sets.TP.Pet = {}
	-- Pet Haste --
	sets.TP.Pet.Haste = {
			main="Kerehcatl",
			sub="Izizoeksi",
			head={ name="Valorous Mask", augments={'Pet: Attack+26 Pet: Rng.Atk.+26','Pet: Haste+4','Pet: CHR+8','Pet: Accuracy+14 Pet: Rng. Acc.+14',}},
			neck="Ferine Necklace",
			body="Ankusa Jackcoat",
			hands={ name="Acro Gauntlets", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: Crit.hit rate +3','Pet: Haste+2',}},
			waist="Incarnation Sash",
			legs={ name="Valor. Hose", augments={'Pet: Mag. Acc.+21','Pet: Haste+5','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+6 Pet: Rng.Atk.+6',}},
			feet="Emicho Gambieras"}

	-- Pet DT --
	sets.TP.Pet.DT = set_combine(sets.TP.Pet.Haste,{
			main="Kerehcatl",
			sub="Izizoeksi",
			head="Anwig Salade",
			neck="Ferine Necklace",
			body="Ankusa Jackcoat",
			hands={ name="Acro Gauntlets", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: Crit.hit rate +3','Pet: Haste+2',}},
			waist="Incarnation Sash",
			legs={ name="Valor. Hose", augments={'Pet: Mag. Acc.+21','Pet: Haste+5','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+6 Pet: Rng.Atk.+6',}},
			feet="Emicho Gambieras"})

	-- Pet ACC --
	sets.TP.Pet.ACC = set_combine(sets.TP.Pet.Haste,{
			main="Kerehcatl",
			sub="Izizoeksi",
			head={ name="Valorous Mask", augments={'Pet: Attack+26 Pet: Rng.Atk.+26','Pet: Haste+4','Pet: CHR+8','Pet: Accuracy+14 Pet: Rng. Acc.+14',}},
			neck="Ferine Necklace",
			body="Ankusa Jackcoat",
			hands={ name="Acro Gauntlets", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: Crit.hit rate +3','Pet: Haste+2',}},
			waist="Incarnation Sash",
			legs={ name="Valor. Hose", augments={'Pet: Mag. Acc.+21','Pet: Haste+5','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+6 Pet: Rng.Atk.+6',}},
			feet="Emicho Gambieras"})

	-- DT/MDT Sets --
	sets.DT = {
			head="Iuitl Headgear +1",
			neck="Loricate Torque +1",
			left_ear="Black Earring",
			right_ear="Darkness Earring",
			body="Iuitl Vest +1",
			hands="Iuitl Wristbands +1",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back="Shadow Mantle",
			waist="Engraved Belt",
			legs="Iuitl Tights +1",
			feet="Iuitl Gaiters +1"}

	sets.MDT = set_combine(sets.DT,{
			ammo="Demonry Stone",
			left_ear="Merman's Earring",
			right_ear="Sanare Earring",
			body="Nocturnus Mail",
			left_ring="Shadow Ring",
			back="Engulfer Cape",
			waist="Engraved Belt"})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.DT,{
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			left_ear="Heartseeker Earring",
			right_ear="Dudgeon Earring",
			body="Mes. Haubergeon",
			left_ring="Patricius Ring",
			back="Mollusca Mantle"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			waist="Hurch'lan Sash",
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			neck="Subtlety Spectacles",
			hands="Buremte Gloves",
			back="Letalis Mantle"})

	-- WS Base Set --
	sets.WS = {
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.WS.MidACC = set_combine(sets.WS,{
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			head="Sukeroku Hachimaki",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})

	-- WS Sets --

	-- Mistral Axe Sets --	
	sets.WS["Mistral Axe"] = {
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.WS["Mistral Axe"].MidACC = set_combine(sets.WS["Mistral Axe"],{
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})
	sets.WS["Mistral Axe"].HighACC = set_combine(sets.WS["Mistral Axe"].MidACC,{
			head="Sukeroku Hachimaki",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})	
	
	-- Calamity Sets --	
	sets.WS.Calamity = {
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.WS.Calamity.MidACC = set_combine(sets.WS.Calamity,{
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})
	sets.WS.Calamity.HighACC = set_combine(sets.WS.Calamity.MidACC,{
			head="Sukeroku Hachimaki",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})	
	
	-- Rampage Sets --	
	sets.WS.Rampage = {
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.WS.Rampage.MidACC = set_combine(sets.WS.Rampage,{
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})
	sets.WS.Rampage.HighACC = set_combine(sets.WS.Rampage.MidACC,{
			head="Sukeroku Hachimaki",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})	
	
	-- Ruinator Sets --
	sets.WS.Ruinator = {
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.WS.Ruinator.MidACC = set_combine(sets.WS.Ruinator,{
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+27','Crit.hit rate+1','STR+14','Attack+14',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})
	sets.WS.Ruinator.HighACC = set_combine(sets.WS.Ruinator.MidACC,{
			head="Sukeroku Hachimaki",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			back="Letalis Mantle",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},})
			
	sets.WS.Onslaught = {}

	sets.WS.Cloudsplitter = {}

	sets.WS["Primal Rend"] = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA["Reward"] = {main="Mdomo Axe",body="Ankusa Jackcoat",legs="Ankusa Trousers",feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.JA["Charm"] = {body="Ankusa Jackcoat",hands="Ankusa Gloves",legs="Ankusa Trousers"}
	sets.JA["Tame"] = {}
	sets.JA["Familiar"] = {}
	sets.JA["Call Beast"] = {body="Ankusa Jackcoat",hands="Ankusa Gloves",feet="Emicho Gambieras"}
	sets.JA["Feral Howl"] = {body="Ankusa Jackcoat"}
	sets.JA["Bestial Loyalty"] = {body="Ankusa Jackcoat",hands="Ankusa Gloves",feet="Emicho Gambieras"}
	sets.JA["Killer Instinct"] = {}

	sets.Pet = {}
	sets.Pet.Sic = {hands="Frn. Manoplas +2"}
	sets.Pet.Ready = {hands="Frn. Manoplas +2"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatients",
			head={ name="Herculean Helm", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','Attack+14',}},
			neck="Orunmila's Torque",
			body="Taeon Tabard",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			left_ring="Prolix Ring",
			right_ring="Lebeche Ring",
			waist="Ninurta's Sash",
			feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+2','DEX+1','Accuracy+11','Attack+9',}},}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.DT,{})
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
			end
				if spell.english == "Mistral Axe" and player.tp > 2999 then -- Equip Vulcan's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Calamity" and player.tp > 2999 then -- Equip Vulcan's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Rampage" and player.tp > 2999 then -- Equip Vulcan's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Ruinator" and player.tp > 2999 then -- Equip Vulcan's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then -- Cancel Utsusemi If You Have 3+ Shadows Up --
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
				return
			else
				equip(sets.Precast.FastCast)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	elseif spell.type == "PetCommand" then
		equip(sets.Pet[spell.english])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then -- Cancel Copy Image 1 & 2 For Utsusemi: Ichi --
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then -- Cancel Sneak --
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
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'DT' then
		equip(sets.DT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if (buffactive.Embrava and (buffactive.Haste or buffactive.March) and buffactive['Haste Samba']) or (buffactive.March == 2 and buffactive.Haste and buffactive['Haste Samba']) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if player.mp >= 100 then
			equipSet = set_combine(equipSet,{left_ring='Oneiros Ring'})
		end
		if player.hp < 300 then
			equipSet = set_combine(equipSet,{body='Twilight Mail',head='Twilight Helm'})
		end
		if player.hp > 300 then
			equipSet = set_combine(equipSet,sets.TP)
		end
		equip(equipSet)
	else
		equip(sets.Idle[IdleArray[IdleIndex]])
	end
	if Pet == 'ON' then -- Use Pet Toggle For Pet TP Set --
		equip(sets.TP.Pet[PetArray[PetIndex]])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() and not pet_midaction() then
		status_change(player.status)
	end
end

function pet_midcast(spell,action)
	status_change(player.status)
end

function pet_aftercast(spell,action)
	status_change(player.status)
end

function pet_change(pet,gain)
	status_change(player.status)
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C17' then -- Pet TP Set Toggle --
		PetIndex = (PetIndex % #PetArray) + 1
		add_to_chat(158,'Pet TP Set: ' .. PetArray[PetIndex])
		status_change(player.status)
	elseif command == 'C10' then -- Jug Toggle --
		JugIndex = (JugIndex % #JugArray) + 1
		add_to_chat(158,'Jug: ' .. JugArray[JugIndex])
		sets.JA['Call Beast'].ammo = JugArray[JugIndex]
		status_change(player.status)
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
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
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Pet Toggle --
		if Pet == 'ON' then
			Pet = 'OFF'
			add_to_chat(123,'Pet Set: [Unlocked]')
		else
			Pet = 'ON'
			add_to_chat(158,'Pet Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 'Twilight'
			add_to_chat(158,'Twilight Set: [locked]')
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
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
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
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
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
		set_macro_page(1, 20)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 20)
	else
		set_macro_page(1, 20)
	end
end