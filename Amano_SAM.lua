-- Last Updated: 06/14/14 4:35 PM EST **Advanced Version** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"Amanomurakumo","Polearm"} -- Default TP Set Is Amanomurakumo. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Seigan = 'ON' -- Set Default Seigan Set ON or OFF Here --
	Third_Eye = 'ON' -- Set Default Third Eye Set ON or OFF Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	target_distance = 6 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	okToCast = true
	nextAllowableCast = 0
	currentCast = ''

	sc_map = {SC1="TachiFudo", SC2="TachiRana", SC3="NamasArrow"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			head="Twilight Helm",
			neck="Wiglen Gorget",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			body="Kumarbi's Akar",
			hands="Otronif Gloves +1",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Takaha Mantle",
			waist="Cetl Belt",
			legs="Osmium Cuisses",
			feet="Danzo Sune-Ate"}
    sets.Idle.Regen.Amanomurakumo = set_combine(sets.Idle.Regen,{
            main="Amanomurakumo",
            sub="Bloodrain Strap",
            range="Cibitshavore",
            ammo="Tulfaire Arrow"})
	sets.Idle.Regen.Polearm = set_combine(sets.Idle.Regen,{
            main="Eminent Lance",
            sub="Duplus Grip",
            range="Cibitshavore",
            ammo="Tulfaire Arrow"})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head="Lithelimb Cap",
			neck="Wiglen Gorget",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			body="Kumarbi's Akar",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring"})
    sets.Idle.Movement.Amanomurakumo = set_combine(sets.Idle.Movement,{
            main="Amanomurakumo",
            sub="Duplus Grip",
            range="Cibitshavore",
            ammo="Tulfaire Arrow"})
    sets.Idle.Movement.Polearm = set_combine(sets.Idle.Movement,{
            main="Eminent Lance",
            sub="Duplus Grip",
            range="Cibitshavore",
            ammo="Tulfaire Arrow"})

	sets.Twilight = {head="Twilight Helm",neck="Twilight Torque",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

    -- Amanomurakumo(AM Down) TP Sets --
    sets.TP.Amanomurakumo = {
            main="Amanomurakumo",
			sub="Bloodrain Strap",
			range="Cibitshavore",
			ammo="Tulfaire Arrow",
			head="Sakonji Kabuto +1",
			neck="Ganesha's Mala",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			body="Sakonji Domaru +1",
			hands="Wakido Kote +1",
			ring1="Mars's Ring",
			ring2="Rajas Ring",
			back="Takaha Mantle",
			waist="Windbuffet Belt",
			legs="Wakido Haidate +1",
			feet="Otronif Boots +1"}
    sets.TP.Amanomurakumo.MidACC = set_combine(sets.TP.Amanomurakumo,{
			head="Yaoyotl Helm",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			ring1="Mars's Ring",
			back="Takaha Mantle",
			legs="Otronif Brais +1",
			feet="Wakido Sune-Ate +1"})
    sets.TP.Amanomurakumo.HighACC = set_combine(sets.TP.Amanomurakumo.MidACC,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			neck="Iqabi Necklace",
			body="Xaddi Mail",
			hands="Wakido Kote +1",
			ring1="Mars's Ring",
			ring2="Patricius Ring",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses"})

    -- Amanomurakumo(Ionis) TP Sets --
    sets.TP.Amanomurakumo.Ionis = set_combine(sets.TP.Amanomurakumo,{
            ear1="Tripudio Earring",
            back="Takaha Mantle"})
    sets.TP.Amanomurakumo.MidACC.Ionis = set_combine(sets.TP.Amanomurakumo.Ionis,{
            head="Yaoyotl Helm",
            neck="Iqabi Necklace",
            ear1="Steelflash Earring",
            ear2="Bladeborn Earring",
            waist="Dynamic Belt +1"})
    sets.TP.Amanomurakumo.HighACC.Ionis = set_combine(sets.TP.Amanomurakumo.MidACC.Ionis,{
            body="Mes. Haubergeon",
            ring1="Mars's Ring",
            legs="Xaddi Cuisses",
            feet="Sak. Sune-Ate +1"})
 
    -- Amanomurakumo(SAM Roll) TP Sets --
    sets.TP.Amanomurakumo.STP = set_combine(sets.TP.Amanomurakumo,{})
    sets.TP.Amanomurakumo.MidACC.STP = set_combine(sets.TP.Amanomurakumo.MidACC,{})
    sets.TP.Amanomurakumo.HighACC.STP = set_combine(sets.TP.Amanomurakumo.HighACC,{})
 
    -- Amanomurakumo(Ionis + SAM Roll) TP Sets --
    sets.TP.Amanomurakumo.Ionis.STP = set_combine(sets.TP.Amanomurakumo.Ionis,{
            ear1="Trux Earring",
            ear2="Brutal Earring"})
    sets.TP.Amanomurakumo.MidACC.Ionis.STP = set_combine(sets.TP.Amanomurakumo.Ionis.STP,{
            head="Yaoyotl Helm",
            neck="Iqabi Necklace",
            ear1="Steelflash Earring",
            ear2="Bladeborn Earring",
            ring1="Mars's Ring",
            back="Takaha Mantle",
            waist="Dynamic Belt +1"})
    sets.TP.Amanomurakumo.HighACC.Ionis.STP = set_combine(sets.TP.Amanomurakumo.MidACC.Ionis.STP,{
            legs="Xaddi Cuisses",
            body="Mes. Haubergeon",
            feet="Sak. Sune-Ate +1"})
			
    -- Amanomurakumo(AM Up) TP Sets --
    sets.TP.Amanomurakumo.AM = set_combine(sets.TP.Amanomurakumo,{})
    sets.TP.Amanomurakumo.MidACC.AM = set_combine(sets.TP.Amanomurakumo.AM,{})
    sets.TP.Amanomurakumo.HighACC.AM = set_combine(sets.TP.Amanomurakumo.MidACC.AM,{})
 
    -- Amanomurakumo(AM Down: Ionis) TP Sets --
    sets.TP.Amanomurakumo.Ionis =  set_combine(sets.TP.Amanomurakumo,{})
    sets.TP.Amanomurakumo.MidACC.Ionis = set_combine(sets.TP.Amanomurakumo.Ionis,{})
    sets.TP.Amanomurakumo.HighACC.Ionis = set_combine(sets.TP.Amanomurakumo.MidACC.Ionis,{})
 
    -- Amanomurakumo(AM Up: Ionis) TP Sets --
    sets.TP.Amanomurakumo.AM.Ionis =  set_combine(sets.TP.Amanomurakumo.AM,{})
    sets.TP.Amanomurakumo.MidACC.AM.Ionis = set_combine(sets.TP.Amanomurakumo.AM.Ionis,{})
    sets.TP.Amanomurakumo.HighACC.AM.Ionis = set_combine(sets.TP.Amanomurakumo.MidACC.AM.Ionis,{})
 
    -- Amanomurakumo(AM Down: SAM Roll) TP Sets --
    sets.TP.Amanomurakumo.STP = set_combine(sets.TP.Amanomurakumo,{})
    sets.TP.Amanomurakumo.MidACC.STP = set_combine(sets.TP.Amanomurakumo.MidACC,{})
    sets.TP.Amanomurakumo.HighACC.STP = set_combine(sets.TP.Amanomurakumo.HighACC,{})
 
    -- Amanomurakumo(AM Up: SAM Roll) TP Sets --
    sets.TP.Amanomurakumo.AM.STP = set_combine(sets.TP.Amanomurakumo.STP,{})
    sets.TP.Amanomurakumo.MidACC.AM.STP = set_combine(sets.TP.Amanomurakumo.MidACC.STP,{})
    sets.TP.Amanomurakumo.HighACC.AM.STP = set_combine(sets.TP.Amanomurakumo.HighACC.STP,{})
 
    -- Amanomurakumo(AM Down: Ionis + SAM Roll) TP Sets --
    sets.TP.Amanomurakumo.Ionis.STP = set_combine(sets.TP.Amanomurakumo.STP,{})
    sets.TP.Amanomurakumo.MidACC.Ionis.STP = set_combine(sets.TP.Amanomurakumo.MidACC.STP,{})
    sets.TP.Amanomurakumo.HighACC.Ionis.STP = set_combine(sets.TP.Amanomurakumo.HighACC.STP,{})
 
    -- Amanomurakumo(AM Up: Ionis + SAM Roll) TP Sets --
    sets.TP.Amanomurakumo.AM.Ionis.STP = set_combine(sets.TP.Amanomurakumo.AM.STP,{})
    sets.TP.Amanomurakumo.MidACC.AM.Ionis.STP = set_combine(sets.TP.Amanomurakumo.MidACC.AM.STP,{})
    sets.TP.Amanomurakumo.HighACC.AM.Ionis.STP = set_combine(sets.TP.Amanomurakumo.HighACC.AM.STP,{})			

	-- Polearm TP Sets --
    sets.TP.Polearm = {
			main="Eminent Lance",
			sub="Duplus Grip",
			range="Cibitshavore",
			ammo="Tulfaire Arrow",
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			body="Sakonji Domaru +1",
			hands="Wakido Kote +1",
			ring1="K'ayres Ring",
			ring2="Rajas Ring",
			back="Takaha Mantle",
			waist="Windbuffet Belt",
			legs="Otronif Brais +1",
			feet="Otronif Boots +1"}
    sets.TP.Polearm.MidACC = set_combine(sets.TP.Polearm,{
			head="Yaoyotl Helm",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			ring1="Mars's Ring",
			back="Takaha Mantle",
			legs="Otronif Brais +1",
			feet="Otronif Boots +1"})
    sets.TP.Polearm.HighACC = set_combine(sets.TP.Polearm.MidACC,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			neck="Iqabi Necklace",
			body="Xaddi Mail",
			hands="Wakido Kote +1",
			ring1="Mars's Ring",
			ring2="Patricius Ring",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses",
			feet="Wakido Sune-Ate +1"})
 
    -- Polearm(Ionis) TP Sets --
    sets.TP.Polearm.Ionis = set_combine(sets.TP.Polearm,{
            ear1="Tripudio Earring",
            back="Takaha Mantle"})
    sets.TP.Polearm.MidACC.Ionis = set_combine(sets.TP.Polearm.Ionis,{
			head="Yaoyotl Helm",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			ring1="Mars's Ring",
			back="Takaha Mantle",
			legs="Otronif Brais +1",
			feet="Otronif Boots +1"})
    sets.TP.Polearm.HighACC.Ionis = set_combine(sets.TP.Polearm.MidACC.Ionis,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			neck="Iqabi Necklace",
			body="Xaddi Mail",
			hands="Wakido Kote +1",
			ring1="Mars's Ring",
			ring2="Patricius Ring",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses",
			feet="Wakido Sune-Ate +1"})
 
    -- Polearm(SAM Roll) TP Sets --
    sets.TP.Polearm.STP = set_combine(sets.TP.Polearm,{})
    sets.TP.Polearm.MidACC.STP = set_combine(sets.TP.Polearm.MidACC,{})
    sets.TP.Polearm.HighACC.STP = set_combine(sets.TP.Polearm.HighACC,{})
 
    -- Polearm(Ionis + SAM Roll) TP Sets --
    sets.TP.Polearm.Ionis.STP = set_combine(sets.TP.Polearm.Ionis,{
			ear1="Trux Earring",
            ear2="Brutal Earring"})
    sets.TP.Polearm.MidACC.Ionis.STP = set_combine(sets.TP.Polearm.Ionis.STP,{
			head="Yaoyotl Helm",
			ear1="Tripudio Earring",
			ear2="Brutal Earring",
			ring1="Mars's Ring",
			back="Takaha Mantle",
			legs="Otronif Brais +1",
			feet="Wakido Sune-Ate +1"})
    sets.TP.Polearm.HighACC.Ionis.STP = set_combine(sets.TP.Polearm.MidACC.Ionis.STP,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			neck="Iqabi Necklace",
			body="Xaddi Mail",
			hands="Wakido Kote +1",
			ring1="Mars's Ring",
			ring2="Patricius Ring",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses"})
	
	-- Seigan TP Set --
	sets.TP.Seigan = {head="Unkai Kabuto +2",body="Otronif Harness +1"}

	-- Third Eye TP Set --
	sets.TP['Third Eye'] = {legs="Sakonji Haidate +1",body="Otronif Harness +1"}

	-- PDT/MDT Sets --
	sets.PDT = {
			head="Lithelimb Cap",
			neck="Agitator's Collar",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Otronif Harness +1",
			hands="Otronif Gloves +1",
			ring1="Patricius Ring",
			ring2="K'ayres Ring",
			back="Mollusca Mantle",
			waist="Cetl Belt",
			legs="Otronif Brais +1",
			feet="Otronif Boots +1"}

	sets.MDT = set_combine(sets.PDT,{
			head="Lithelimb Cap",
			neck="Twilight Torque",
			ear1="Static Earring",
			ear2="Sanare Earring",
			body="Otronif Harness +1",
			ring2="Shadow Ring",
			back="Mollusca Mantle",
			waist="Cetl Belt"})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			hands="Wakido Kote +1",
			ring1="Patricius Ring",
			back="Mollusca Mantle"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			head="Yaoyotl Helm",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Sakonji Domaru +1",
			hands="Otronif Gloves +1"})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			body="Sakonji Domaru +1",
			hands="Umuthi Gloves",
			waist="Anguinus Belt",
			legs="Xaddi Cuisses"})

	-- WS Base Set --
	sets.WS = {
			head="Otomi Helm",
			neck="Justice Torque",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Caudata Belt",
			legs="Wakido Haidate +1",
			feet="Sak. Sune-Ate +1"}

	-- Tachi: Kaiten Sets --
	sets.WS["Tachi: Kaiten"] = {
			head="Otomi Helm",
			neck="Light Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Light Belt",
			legs="Wakido Haidate +1",
			feet="Ejekamal Boots"}
	sets.WS["Tachi: Kaiten"].MidACC = set_combine(sets.WS["Tachi: Kaiten"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets",
			back="Vespid Mantle",
			legs="Otronif Brais +1",
			feet="Ejekamal Boots"})
	sets.WS["Tachi: Kaiten"].HighACC = set_combine(sets.WS["Tachi: Kaiten"].MidACC,{
			head="Sukeroku Hachimaki",
			body="Sakonji Domaru +1",
			back="Vespid Mantle",
			legs="Miki. Cuisses",
			feet="Wakido Sune-Ate +1"})

	-- Tachi: Kaiten(4 Hits) Set --
	sets.WS["Tachi: Kaiten"].Lentus = set_combine(sets.WS["Tachi: Kaiten"],{
			ring2="Rajas Ring"})

	-- Tachi: Kaiten(SAM Roll) Sets --
	sets.WS["Tachi: Kaiten"].STP = set_combine(sets.WS["Tachi: Kaiten"],{})
	sets.WS["Tachi: Kaiten"].MidACC.STP = set_combine(sets.WS["Tachi: Kaiten"].MidACC,{})
	sets.WS["Tachi: Kaiten"].HighACC.STP = set_combine(sets.WS["Tachi: Kaiten"].HighACC,{})

	-- Tachi: Kaiten(Attack) Set --
	sets.WS["Tachi: Kaiten"].ATT = set_combine(sets.WS["Tachi: Kaiten"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets"})
			
	-- Tachi: Fudo Sets --
	sets.WS["Tachi: Fudo"] = {
			head="Otomi Helm",
			neck="Light Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Light Belt",
			legs="Wakido Haidate +1",
			feet="Ejekamal Boots"}
	sets.WS["Tachi: Fudo"].MidACC = set_combine(sets.WS["Tachi: Fudo"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets",
			back="Vespid Mantle",
			legs="Otronif Brais +1",
			feet="Ejekamal Boots"})
	sets.WS["Tachi: Fudo"].HighACC = set_combine(sets.WS["Tachi: Fudo"].MidACC,{
			head="Sukeroku Hachimaki",
			body="Sakonji Domaru +1",
			back="Vespid Mantle",
			legs="Miki. Cuisses",
			feet="Wakido Sune-Ate +1"})

	-- Tachi: Fudo(4 Hits) Set --
	sets.WS["Tachi: Fudo"].Lentus = set_combine(sets.WS["Tachi: Fudo"],{
			ring2="Rajas Ring"})

	-- Tachi: Fudo(SAM Roll) Sets --
	sets.WS["Tachi: Fudo"].STP = set_combine(sets.WS["Tachi: Fudo"],{})
	sets.WS["Tachi: Fudo"].MidACC.STP = set_combine(sets.WS["Tachi: Fudo"].MidACC,{})
	sets.WS["Tachi: Fudo"].HighACC.STP = set_combine(sets.WS["Tachi: Fudo"].HighACC,{})

	-- Tachi: Fudo(Attack) Set --
	sets.WS["Tachi: Fudo"].ATT = set_combine(sets.WS["Tachi: Fudo"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets"})

	-- Tachi: Shoha Sets --
	sets.WS["Tachi: Shoha"] = {
			head="Otomi Helm",
			neck="Ganesha's Mala",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Sakonji Domaru +1",
			hands="Mikinaak Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Windbuffet Belt",
			legs="Wakido Haidate +1",
			feet="Ejekamal Boots"}
	sets.WS["Tachi: Shoha"].MidACC = set_combine(sets.WS["Tachi: Shoha"],{
			head="Yaoyotl Helm",
			neck="Shadow Gorget",
			hands="Miki. Gauntlets",
			waist="Shadow Belt",
			legs="Otronif Brais +1",
			feet="Ejekamal Boots"})
	sets.WS["Tachi: Shoha"].HighACC = set_combine(sets.WS["Tachi: Shoha"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle",
			legs="Miki. Cuisses",
			feet="Wakido Sune-Ate +1"})
	
	-- Tachi: Shoha(4 Hits) Set --
	sets.WS["Tachi: Shoha"].Lentus = set_combine(sets.WS["Tachi: Shoha"],{})

	-- Tachi: Shoha(SAM Roll) Sets --
	sets.WS["Tachi: Shoha"].STP = set_combine(sets.WS["Tachi: Shoha"],{})
	sets.WS["Tachi: Shoha"].MidACC.STP = set_combine(sets.WS["Tachi: Shoha"].MidACC,{})
	sets.WS["Tachi: Shoha"].HighACC.STP = set_combine(sets.WS["Tachi: Shoha"].HighACC,{})

	-- Tachi: Rana Sets --
	sets.WS["Tachi: Rana"] = {
			head="Otomi Helm",
			neck="Shadow Gorget",
			ear1="Steelflash Earring",
			ear2="Bladeborn Earring",
			body="Sakonji Domaru +1",
			hands="Mikinaak Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Shadow Belt",
			legs="Wakido Haidate +1",
			feet="Sak. Sune-Ate +1"}
	sets.WS["Tachi: Rana"].MidACC = set_combine(sets.WS["Tachi: Rana"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets",
			legs="Xaddi Cuisses",
			feet="Sak. Sune-Ate +1"})
	sets.WS["Tachi: Rana"].HighACC = set_combine(sets.WS["Tachi: Rana"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Vespid Mantle",
			legs="Miki. Cuisses",
			feet="Waki. Sune-Ate +1"})

	-- Tachi: Rana(4 Hits) Set --
	sets.WS["Tachi: Rana"].Lentus = set_combine(sets.WS["Tachi: Rana"],{})

	-- Tachi: Rana(SAM Roll) Sets --
	sets.WS["Tachi: Rana"].STP = set_combine(sets.WS["Tachi: Rana"],{})
	sets.WS["Tachi: Rana"].MidACC.STP = set_combine(sets.WS["Tachi: Rana"].MidACC,{})
	sets.WS["Tachi: Rana"].HighACC.STP = set_combine(sets.WS["Tachi: Rana"].HighACC,{})

	-- Tachi: Gekko Sets --
	sets.WS["Tachi: Gekko"] = {
			head="Otomi Helm",
			neck="Snow Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Snow Belt",
			legs="Wakido Haidate +1",
			feet="Ejekamal Boots"}
	sets.WS["Tachi: Gekko"].MidACC = set_combine(sets.WS["Tachi: Gekko"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets",
			back="Vespid Mantle",
			legs="Otronif Brais +1",
			feet="Ejekamal Boots"})
	sets.WS["Tachi: Gekko"].HighACC = set_combine(sets.WS["Tachi: Gekko"].MidACC,{
			head="Sukeroku Hachimaki",
			body="Sakonji Domaru +1",
			back="Vespid Mantle",
			legs="Miki. Cuisses",
			feet="Waki. Sune-Ate +1"})

	-- Tachi: Gekko(4 Hits) Set --
	sets.WS["Tachi: Gekko"].Lentus = set_combine(sets.WS["Tachi: Gekko"],{})

	-- Tachi: Gekko(SAM Roll) Sets --
	sets.WS["Tachi: Gekko"].STP = set_combine(sets.WS["Tachi: Gekko"],{})
	sets.WS["Tachi: Gekko"].MidACC.STP = set_combine(sets.WS["Tachi: Gekko"].MidACC,{})
	sets.WS["Tachi: Gekko"].HighACC.STP = set_combine(sets.WS["Tachi: Gekko"].HighACC,{})
			
	-- Tachi: Gekko(Attack) Set --
	sets.WS["Tachi: Gekko"].ATT = set_combine(sets.WS["Tachi: Gekko"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets"})
			
	-- Tachi: Yukikaze Sets --
	sets.WS["Tachi: Yukikaze"] = {
			head="Otomi Helm",
			neck="Snow Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Snow Belt",
			legs="Wakido Haidate +1",
			feet="Ejekamal Boots"}
	sets.WS["Tachi: Yukikaze"].MidACC = set_combine(sets.WS["Tachi: Yukikaze"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets",
			back="Vespid Mantle",
			legs="Otronif Brais +1",
			feet="Ejekamal Boots"})
	sets.WS["Tachi: Yukikaze"].HighACC = set_combine(sets.WS["Tachi: Yukikaze"].MidACC,{
			head="Sukeroku Hachimaki",
			body="Sakonji Domaru +1",
			back="Vespid Mantle",
			legs="Miki. Cuisses",
			feet="Waki. Sune-Ate +1"})
			
	-- Tachi: Yukikaze(4 Hits) Set --
	sets.WS["Tachi: Yukikaze"].Lentus = set_combine(sets.WS["Tachi: Yukikaze"],{})

	-- Tachi: Yukikaze(SAM Roll) Sets --
	sets.WS["Tachi: Yukikaze"].STP = set_combine(sets.WS["Tachi: Yukikaze"],{})
	sets.WS["Tachi: Yukikaze"].MidACC.STP = set_combine(sets.WS["Tachi: Yukikaze"].MidACC,{})
	sets.WS["Tachi: Yukikaze"].HighACC.STP = set_combine(sets.WS["Tachi: Yukikaze"].HighACC,{})	
			
	-- Tachi: Yukikaze(Attack) Set --
	sets.WS["Tachi: Yukikaze"].ATT = set_combine(sets.WS["Tachi: Yukikaze"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets"})
			
	-- Tachi: Kasha Sets --
	sets.WS["Tachi: Kasha"] = {
			head="Otomi Helm",
			neck="Light Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Phorcys Korazin",
			hands="Miki. Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Light Belt",
			legs="Wakido Haidate +1",
			feet="Ejekamal Boots"}
	sets.WS["Tachi: Kasha"].MidACC = set_combine(sets.WS["Tachi: Kasha"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets",
			back="Vespid Mantle",
			legs="Otronif Brais +1",
			feet="Ejekamal Boots"})
	sets.WS["Tachi: Kasha"].HighACC = set_combine(sets.WS["Tachi: Kasha"].MidACC,{
			head="Sukeroku Hachimaki",
			body="Sakonji Domaru +1",
			back="Vespid Mantle",
			legs="Miki. Cuisses",
			feet="Waki. Sune-Ate +1"})
			
	-- Tachi: Kasha(4 Hits) Set --
	sets.WS["Tachi: Kasha"].Lentus = set_combine(sets.WS["Tachi: Kasha"],{})

	-- Tachi: Kasha(SAM Roll) Sets --
	sets.WS["Tachi: Kasha"].STP = set_combine(sets.WS["Tachi: Kasha"],{})
	sets.WS["Tachi: Kasha"].MidACC.STP = set_combine(sets.WS["Tachi: Kasha"].MidACC,{})
	sets.WS["Tachi: Kasha"].HighACC.STP = set_combine(sets.WS["Tachi: Kasha"].HighACC,{})
			
	-- Tachi: Kasha(Attack) Set --
	sets.WS["Tachi: Kasha"].ATT = set_combine(sets.WS["Tachi: Kasha"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets"})
			
	-- Tachi: Ageha Sets --
	sets.WS["Tachi: Ageha"] = {
			head="Yaoyotl Helm",
			neck="Justice Torque",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Unkai Domaru +2",
			hands="Miki. Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Shadow Belt",
			legs="Wakido Haidate +1",
			feet="Scamps Sollerets"}
	sets.WS["Tachi: Ageha"].MidACC = set_combine(sets.WS["Tachi: Ageha"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets",
			back="Vespid Mantle",
			legs="Otronif Brais +1",
			feet="Scamps Sollerets"})
	sets.WS["Tachi: Ageha"].HighACC = set_combine(sets.WS["Tachi: Ageha"].MidACC,{
			head="Sukeroku Hachimaki",
			body="Sakonji Domaru +1",
			back="Vespid Mantle",
			legs="Miki. Cuisses",
			feet="Scamps Sollerets"})

	-- Tachi: Ageha(4 Hits) Set --
	sets.WS["Tachi: Ageha"].Lentus = set_combine(sets.WS["Tachi: Ageha"],{})

	-- Tachi: Ageha(SAM Roll) Sets --
	sets.WS["Tachi: Ageha"].STP = set_combine(sets.WS["Tachi: Ageha"],{})
	sets.WS["Tachi: Ageha"].MidACC.STP = set_combine(sets.WS["Tachi: Ageha"].MidACC,{})
	sets.WS["Tachi: Ageha"].HighACC.STP = set_combine(sets.WS["Tachi: Ageha"].HighACC,{})
			
	-- Tachi: Ageha(Attack) Set --
	sets.WS["Tachi: Ageha"].ATT = set_combine(sets.WS["Tachi: Ageha"],{
			head="Yaoyotl Helm",
			hands="Miki. Gauntlets"})

	-- Stardiver Sets --
	sets.WS["Stardiver"] = {
			head="Otomi Helm",
			neck="Shadow Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Sakonji Domaru +1",
			hands="Mikinaak Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Shadow Belt",
			legs="Wakido Haidate +1",
			feet="Ejekamal Boots"}
	sets.WS["Stardiver"].MidACC = set_combine(sets.WS["Stardiver"],{
			head="Yaoyotl Helm",
			neck="Shadow Gorget",
			hands="Miki. Gauntlets",
			waist="Shadow Belt",
			legs="Otronif Brais +1",
			feet="Ejekamal Boots"})
	sets.WS["Stardiver"].HighACC = set_combine(sets.WS["Stardiver"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle",
			legs="Miki. Cuisses",
			feet="Wakido Sune-Ate +1"})
	
	-- Stardiver(4 Hits) Set --
	sets.WS["Stardiver"].Lentus = set_combine(sets.WS["Stardiver"],{})

	-- Stardiver(SAM Roll) Sets --
	sets.WS["Stardiver"].STP = set_combine(sets.WS["Stardiver"],{})
	sets.WS["Stardiver"].MidACC.STP = set_combine(sets.WS["Stardiver"].MidACC,{})
	sets.WS["Stardiver"].HighACC.STP = set_combine(sets.WS["Stardiver"].HighACC,{})			

	-- Penta Thrust Sets --
	sets.WS["Penta Thrust"] = {
			head="Otomi Helm",
			neck="Shadow Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Sakonji Domaru +1",
			hands="Mikinaak Gauntlets",
			ring1="Strigoi Ring",
			ring2="Candent Ring",
			back="Buquwik Cape",
			waist="Shadow Belt",
			legs="Wakido Haidate +1",
			feet="Ejekamal Boots"}
	sets.WS["Penta Thrust"].MidACC = set_combine(sets.WS["Penta Thrust"],{
			head="Yaoyotl Helm",
			neck="Shadow Gorget",
			hands="Miki. Gauntlets",
			waist="Shadow Belt",
			legs="Otronif Brais +1",
			feet="Ejekamal Boots"})
	sets.WS["Penta Thrust"].HighACC = set_combine(sets.WS["Penta Thrust"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle",
			legs="Miki. Cuisses",
			feet="Wakido Sune-Ate +1"})
	
	-- Penta Thrust(4 Hits) Set --
	sets.WS["Penta Thrust"].Lentus = set_combine(sets.WS["Penta Thrust"],{})

	-- Penta Thrust(SAM Roll) Sets --
	sets.WS["Penta Thrust"].STP = set_combine(sets.WS["Penta Thrust"],{})
	sets.WS["Penta Thrust"].MidACC.STP = set_combine(sets.WS["Penta Thrust"].MidACC,{})
	sets.WS["Penta Thrust"].HighACC.STP = set_combine(sets.WS["Penta Thrust"].HighACC,{})
	
	-- Apex Arrow Sets --		
	sets.WS["Apex Arrow"] = {
			ammo="Tulfaire Arrow",
			head="Sakonji Kabuto +1",
			neck="Light Gorget",
			ear1="Moonshade Earring",
			ear2="Clearview Earring",
			body="Kyujutsugi",
			hands="Unkai Kote +2",
			ring1="Paqichikaji Ring",
			ring2="Hajduk Ring",
			back="Ik Cape",
			waist="Light Belt",
			legs="Wakido Haidate +1",
			feet="Waki. Sune-Ate +1"}
	sets.WS["Apex Arrow"].MidACC = set_combine(sets.WS["Apex Arrow"],{})
	sets.WS["Apex Arrow"].HighACC = set_combine(sets.WS["Apex Arrow"].MidACC,{
			body="Kyujutsugi"})

	-- Sidewinder Sets --
	sets.WS["Sidewinder"] = {
			ammo="Tulfaire Arrow",
			head="Sakonji Kabuto +1",
			neck="Light Gorget",
			ear1="Moonshade Earring",
			ear2="Clearview Earring",
			body="Kyujutsugi",
			hands="Unkai Kote +2",
			ring1="Paqichikaji Ring",
			ring2="Hajduk Ring",
			back="Buquwik Cape",
			waist="Light Belt",
			legs="Wakido Haidate +1",
			feet="Waki. Sune-Ate +1"}
	sets.WS["Sidewinder"].MidACC = set_combine(sets.WS["Sidewinder"],{})
	sets.WS["Sidewinder"].HighACC = set_combine(sets.WS["Sidewinder"].MidACC,{
			body="Kyujutsugi"})			
			
	-- JA Sets --
	sets.JA = {}
	sets.JA.Meditate = {head="Wakido Kabuto +1",hands="Sakonji Kote +1"}
	sets.JA["Warding Circle"] = {head="Wakido Kabuto +1"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			neck="Orunmila's Torque",
			ear1="Loquac. Earring",
			ring1="Prolix Ring",
			ring2="Veneficium Ring"}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (player.status == 'Engaged' and (((spell.english == "Namas Arrow" or spell.english == "Apex Arrow") and spell.target.distance > 16+target_distance) or (spell.type == "WeaponSkill" and spell.english ~= "Namas Arrow" and spell.english ~= "Apex Arrow" and spell.target.distance > target_distance))) then -- Cancel Ranged Attack or WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if midaction() then
		okToCast = false
		if os.time() > nextAllowableCast then
			okToCast = true
			midaction(false)
			windower.add_to_chat(050, 'Spell/Ability has finished, resetting')
		else
			cancel_spell()
			return
			windower.add_to_chat(050, 'Spell/Ability not finished, '..nextAllowableCast-os.time()..' seconds remaining')
		end
	else
		okToCast = true
		nextAllowableCast = 0
	end

	if okToCast == true and buffactive['terror'] == nil and buffactive['sleep'] == nil and buffactive['stunned'] == nil and buffactive['petrification'] == nil and buffactive['KO'] == nil then
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
				if Attack == 'ON' then
					equipSet = equipSet["ATT"]
				end
				if equipSet[AccArray[AccIndex]] then
					equipSet = equipSet[AccArray[AccIndex]]
				end
				if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
					equipSet = equipSet["STP"]
				end
				if buffactive.Sekkanoki then -- Equip Unkai Kote +2 When Sekkanoki Is On --
					equipSet = set_combine(equipSet,{hands="Unkai Kote +2"})
				end
				if buffactive.Sengikori then -- Equip Unkai Sune-ate +2 When Sengikori Is On --
					equipSet = set_combine(equipSet,{feet="Unkai Sune-ate +2"})
				end
				if (spell.english == "Tachi: Fudo" or spell.english == "Tachi: Shoha" or spell.english == "Tachi: Kaiten") and (player.tp > 2999 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Flame Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{ear1="Flame Pearl"})
				end
				if (spell.english == "Penta Thrust") and (player.tp > 2999 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Flame Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{ear1="Pixie Earring"})
				end
				if (spell.english == "Stardiver") and (player.tp > 2999 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Flame Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{ear1="Flame Pearl"})
				end
				if (spell.english == "Sidewinder") and (player.tp > 2999 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Flame Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{ear1="Flame Pearl"})
				end
				if (spell.english == "Apex Arrow") and (player.tp > 2999 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Flame Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{ear1="Drone Earring"})
				end
				equip(equipSet)
			end
		elseif spell.type == "JobAbility" then
			if sets.JA[spell.english] then
				equip(sets.JA[spell.english])
			end
		elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
			if string.find(spell.english,'Utsusemi') then
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
		end
		if Twilight == 'Twilight' then
			equip(sets.Twilight)
		end

		currentCast = spell.english
		if spell.cast_time == nil then
			nextAllowableCast = os.time()
		else
			nextAllowableCast = os.time() + spell.cast_time
		end
	else
		cancel_spell()
	end
end

function midcast(spell,action)
	if player.status == 'Resting' then
		nextAllowableCast = 0
		currentCast= ''
		okToCast = true
	elseif buffactive['terror'] == nil and buffactive['sleep'] == nil and buffactive['stunned'] == nil and buffactive['petrification'] == nil and buffactive['KO'] == nil then
		if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
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
end

function aftercast(spell,action)
	if spell.english == currentCast and spell.action_type == 'Interruption' then
		nextAllowableCast = 0
		currentCast= ''
		okToCast = true
	end
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Warding Circle" then -- Warding Circle Countdown --
			send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			equipSet = equipSet["AM3"]
		end
		if buffactive["Aftermath"] and equipSet["AM"] then
            equipSet = equipSet["AM"]
        end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
			equipSet = equipSet["STP"]
		end
		if buffactive.Seigan and Seigan == 'ON' then -- Use Seigan Toggle For Seigan TP Set --
			equipSet = set_combine(equipSet,sets.TP.Seigan)
		end
		if buffactive["Third Eye"] and Third_Eye == 'ON' then -- Use Third Eye Toggle For Third Eye TP Set --
			equipSet = set_combine(equipSet,sets.TP["Third Eye"])
		end
		if player.mp >= 100 then
			equipSet = set_combine(equipSet,{ring1='Oneiros Ring'})
		end
		if player.hp < 300 then
			equipSet = set_combine(equipSet,{body='Twilight Mail',head='Twilight Helm'})
		end
		if player.hp > 300 then
			equipSet = set_combine(equipSet,sets.TP)
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
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
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
	elseif buff == "yaegasumi" then -- Yaegasumi Timer --
		if gain then
			send_command('timers create "Yaegasumi" 45 down')
		else
			send_command('timers delete "Yaegasumi"')
			add_to_chat(123,'Yaegasumi: [OFF]')
		end
	elseif buff == 'aggressor' and not gain then
		add_to_chat(123,'Aggressor: [OFF]')
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C17' then -- Main Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
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
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
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
	elseif command == 'C16' then -- Seigan Toggle --
		if Seigan == 'ON' then
			Seigan = 'OFF'
			add_to_chat(123,'Seigan Set: [Unlocked]')
		else
			Seigan = 'ON'
			add_to_chat(158,'Seigan Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C12' then -- Third Eye Toggle --
		if Third_Eye == 'ON' then
			Third_Eye = 'OFF'
			add_to_chat(123,'Third Eye Set: [Unlocked]')
		else
			Third_Eye = 'ON'
			add_to_chat(158,'Third Eye Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C11' then -- SAM Roll Toggle --
		if Samurai_Roll == 'ON' then
			Samurai_Roll = 'OFF'
			add_to_chat(123,'SAM Roll: [OFF]')
		else
			Samurai_Roll = 'ON'
			add_to_chat(158,'SAM Roll: [ON]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
		else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
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
	elseif command == 'C10' then -- Cancel Meikyo Shisui --
		send_command('Cancel Meikyo Shisui')
		add_to_chat(123,'Meikyo Shisui: [OFF]')
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//'..sc_map[command])
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
		set_macro_page(1, 1)
	elseif player.sub_job == 'RNG' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'DNC' then
		set_macro_page(3, 1)
	elseif player.sub_job == 'DRK' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 1)
	else
		set_macro_page(1, 1)
	end
end