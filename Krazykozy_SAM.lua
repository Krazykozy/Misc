-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"TP","LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"Kogarasumaru","Soboro","Polearm"} -- Default TP Set Is Kogarasumaru. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Goldsmithing","Fishing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Seigan = 'ON' -- Set Default Seigan Set ON or OFF Here --
	Third_Eye = 'ON' -- Set Default Third Eye Set ON or OFF Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	target_distance = 8 -- Set Default Distance Here --
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

	sc_map = {SC1="TachiFudo", SC2="TachiRana", SC3="NamasArrow"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}

	-- Idle/Town Sets --

	sets.Idle.Regen = {
			ammo="Staunch Tathlum",
			head="Twilight Helm",
			neck="Bathy Choker +1",
			left_ear="Infused Earring",
			right_ear="Odnowa Earring +1",
			body="Hizamaru Haramaki +2",
			hands="Wakido Kote +3",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs="Flamma Dirs +1",
			feet="Danzo Sune-Ate"}
	sets.Idle.Regen.Kogarasumaru = set_combine(sets.Idle.Regen,{
			main="Kogarasumaru",
			sub="Utu Grip",})
	sets.Idle.Regen.Soboro = set_combine(sets.Idle.Regen,{
			main="Soboro Sukehiro",
			sub="Utu Grip",})
	sets.Idle.Regen.Polearm = set_combine(sets.Idle.Regen,{
            main="Blurred Lance",
            sub="Utu Grip",})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head={ name="Valorous Mask", augments={'Damage taken-4%','STR+9','Accuracy+2','Attack+12',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Tartarus Platemail",
			hands="Kurys Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			waist="Flume Belt +1",
			legs="Flamma Dirs +1",
			feet="Danzo Sune-Ate"})
	sets.Idle.Movement.Kogarasumaru = set_combine(sets.Idle.Movement,{
			main="Kogarasumaru",
			sub="Utu Grip",})
	sets.Idle.Movement.Soboro = set_combine(sets.Idle.Movement,{
			main="Soboro Sukehiro",
			sub="Utu Grip",})
    sets.Idle.Movement.Polearm = set_combine(sets.Idle.Movement,{
            main="Blurred Lance",
            sub="Utu Grip",})

	sets.Idle.Goldsmithing = {
			main="Caduceus",
			sub="Toreutic Shield",
			ammo="Staunch Tathlum",
			head="Shaded Spectacles",
			neck="Goldsmith's Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Goldsmith's Smock",
			hands="Goldsmith's Cuffs",
			left_ring="Orvail Ring +1",
			right_ring="Craftmaster's Ring",
			back="Moonbeam Cape",
			waist="Goldsmith's Belt",
			legs="Flamma Dirs +1",
			feet="Danzo Sune-Ate"}			
			
	sets.Idle.Fishing = {
			range="Ebisu Fishing Rod",
            ammo="",
			head="Lithelimb Cap",
			neck="Fisher's Torque",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			left_ring="Puffin Ring",
			right_ring="Noddy Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Flume Belt +1",
			legs="Angler's Hose",
			feet="Waders"}
	sets.Idle.Fishing.Kogarasumaru = set_combine(sets.Idle.Fishing,{
			main="Kogarasumaru",
			sub="Utu Grip",})
	sets.Idle.Fishing.Soboro = set_combine(sets.Idle.Fishing,{
			main="Soboro Sukehiro",
			sub="Utu Grip",})
    sets.Idle.Fishing.Polearm = set_combine(sets.Idle.Fishing,{
            main="Blurred Lance",
            sub="Utu Grip",})

	sets.Idle.HELM = {
			ammo="Staunch Tathlum",
			head="",
			neck="Field Torque",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="",
			hands="",
			left_ring="",
			right_ring="",
			back="",
			waist="Field Rope",
			legs="",
			feet=""}
	sets.Idle.HELM.Kogarasumaru = set_combine(sets.Idle.HELM,{
			main="Kogarasumaru",
			sub="Utu Grip",})
	sets.Idle.HELM.Soboro = set_combine(sets.Idle.HELM,{
			main="Soboro Sukehiro",
			sub="Utu Grip",})
    sets.Idle.HELM.Polearm = set_combine(sets.Idle.HELM,{
            main="Blurred Lance",
            sub="Utu Grip",})			

	sets.Idle.D2Ring =  set_combine(sets.Idle.Regen,{
			head="Maat's Cap",
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring",})
	sets.Idle.D2Ring.Kogarasumaru = set_combine(sets.Idle.D2Ring,{
			main="Kogarasumaru",
			sub="Utu Grip",})
	sets.Idle.D2Ring.Soboro = set_combine(sets.Idle.D2Ring,{
			main="Soboro Sukehiro",
			sub="Utu Grip",})
    sets.Idle.D2Ring.Polearm = set_combine(sets.Idle.D2Ring,{
            main="Blurred Lance",
            sub="Utu Grip",})			

	sets.Idle.CpRing = set_combine(sets.Idle.Regen,{
			left_ring="Trizek Ring",
			right_ring="Capacity Ring"})
	sets.Idle.CpRing.Kogarasumaru = set_combine(sets.Idle.CpRing,{
			main="Kogarasumaru",
			sub="Utu Grip",})
	sets.Idle.CpRing.Soboro = set_combine(sets.Idle.CpRing,{
			main="Soboro Sukehiro",
			sub="Utu Grip",})
    sets.Idle.CpRing.Polearm = set_combine(sets.Idle.CpRing,{
            main="Blurred Lance",
            sub="Utu Grip",})
			
	sets.Twilight = {head="Twilight Helm",neck="Loricate Torque +1",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- Kogarasumaru(AM3 Down) TP Sets --
	sets.TP.Kogarasumaru = {
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Hetairoi Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},}
	sets.TP.Kogarasumaru.LowACC = set_combine(sets.TP.Kogarasumaru,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Hetairoi Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Kogarasumaru.MidACC = set_combine(sets.TP.Kogarasumaru.LowACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
	sets.TP.Kogarasumaru.HighACC = set_combine(sets.TP.Kogarasumaru.MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
			
	-- Kogarasumaru(AM3 Up) TP Sets --
	sets.TP.Kogarasumaru.AM3 = set_combine(sets.TP.Kogarasumaru,{
			head="Flamma Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Kogarasumaru.LowACC.AM3 = set_combine(sets.TP.Kogarasumaru.AM3,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Hetairoi Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Kogarasumaru.MidACC.AM3 = set_combine(sets.TP.Kogarasumaru.LowACC.AM3,{
			ammo="Amar Cluster",
			head="Flamma Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
	sets.TP.Kogarasumaru.HighACC.AM3 = set_combine(sets.TP.Kogarasumaru.MidACC.AM3,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})

	-- Kogarasumaru(AM3 Up: Ionis) TP Sets --
	sets.TP.Kogarasumaru.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.AM3,{
			head="Flamma Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Kogarasumaru.LowACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.LowACC.AM3,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Kogarasumaru.MidACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.MidACC.AM3,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
	sets.TP.Kogarasumaru.HighACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.HighACC.AM3,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})				

	-- Kogarasumaru(AM3 Down: Ionis) TP Sets --
	sets.TP.Kogarasumaru.Ionis = set_combine(sets.TP.Kogarasumaru,{})
	sets.TP.Kogarasumaru.LowACC.Ionis = set_combine(sets.TP.Kogarasumaru.LowACC,{})
	sets.TP.Kogarasumaru.MidACC.Ionis = set_combine(sets.TP.Kogarasumaru.MidACC,{})
	sets.TP.Kogarasumaru.HighACC.Ionis = set_combine(sets.TP.Kogarasumaru.HighACC,{})

	-- Kogarasumaru(AM3 Up: Ionis) TP Sets --
	sets.TP.Kogarasumaru.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.AM3,{})
	sets.TP.Kogarasumaru.LowACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.LowACC.AM3,{})
	sets.TP.Kogarasumaru.MidACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.MidACC.AM3,{})
	sets.TP.Kogarasumaru.HighACC.AM3.Ionis = set_combine(sets.TP.Kogarasumaru.HighACC.AM3,{})

	-- Kogarasumaru(AM3 Down: SAM Roll) TP Sets --
	sets.TP.Kogarasumaru.STP = set_combine(sets.TP.Kogarasumaru,{
			head="Flamma Zucchetto +1",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			waist="Ioskeha Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Kogarasumaru.LowACC.STP = set_combine(sets.TP.Kogarasumaru.STP,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Kogarasumaru.MidACC.STP = set_combine(sets.TP.Kogarasumaru.STP,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
	sets.TP.Kogarasumaru.HighACC.STP = set_combine(sets.TP.Kogarasumaru.MidACC.STP,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Moonbeam Nodowa",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})

	-- Kogarasumaru(AM3 Up: SAM Roll) TP Sets --
	sets.TP.Kogarasumaru.AM3.STP = set_combine(sets.TP.Kogarasumaru.STP,{})
	sets.TP.Kogarasumaru.LowACC.STP = set_combine(sets.TP.Kogarasumaru.LowACC.STP,{})
	sets.TP.Kogarasumaru.MidACC.AM3.STP = set_combine(sets.TP.Kogarasumaru.MidACC.STP,{})
	sets.TP.Kogarasumaru.HighACC.AM3.STP = set_combine(sets.TP.Kogarasumaru.HighACC.STP,{})

	-- Kogarasumaru(AM3 Down: Ionis + SAM Roll) TP Sets --
	sets.TP.Kogarasumaru.Ionis.STP = set_combine(sets.TP.Kogarasumaru.STP,{})
	sets.TP.Kogarasumaru.LowACC.Ionis.STP = set_combine(sets.TP.Kogarasumaru.LowACC.STP,{})
	sets.TP.Kogarasumaru.MidACC.Ionis.STP = set_combine(sets.TP.Kogarasumaru.MidACC.STP,{})
	sets.TP.Kogarasumaru.HighACC.Ionis.STP = set_combine(sets.TP.Kogarasumaru.HighACC.STP,{})

	-- Kogarasumaru(AM3 Up: Ionis + SAM Roll) TP Sets --
	sets.TP.Kogarasumaru.AM3.Ionis.STP = set_combine(sets.TP.Kogarasumaru.AM3.STP,{})
	sets.TP.Kogarasumaru.LowACC.AM3.Ionis.STP = set_combine(sets.TP.Kogarasumaru.LowACC.AM3.STP,{})
	sets.TP.Kogarasumaru.MidACC.AM3.Ionis.STP = set_combine(sets.TP.Kogarasumaru.MidACC.AM3.STP,{})
	sets.TP.Kogarasumaru.HighACC.AM3.Ionis.STP = set_combine(sets.TP.Kogarasumaru.HighACC.AM3.STP,{})

	-- Soboro TP Sets --
    sets.TP.Soboro = {
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},}
 	sets.TP.Soboro.LowACC = set_combine(sets.TP.Soboro,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Soboro.MidACC = set_combine(sets.TP.Soboro,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
    sets.TP.Soboro.HighACC = set_combine(sets.TP.Soboro.MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Ken. Sune-Ate",})

    -- Soboro(Ionis) TP Sets --
    sets.TP.Soboro.Ionis = set_combine(sets.TP.Soboro,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
 	sets.TP.Soboro.LowACC.Ionis = set_combine(sets.TP.Soboro.Ionis,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Soboro.MidACC.Ionis = set_combine(sets.TP.Soboro.Ionis,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
    sets.TP.Soboro.HighACC.Ionis = set_combine(sets.TP.Soboro.MidACC.Ionis,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Ken. Sune-Ate",})
 
    -- Soboro(SAM Roll) TP Sets --
    sets.TP.Soboro.STP = set_combine(sets.TP.Soboro,{})
 	sets.TP.Soboro.LowACC.STP = set_combine(sets.TP.Soboro.STP,{})
    sets.TP.Soboro.MidACC.STP = set_combine(sets.TP.Soboro.MidACC,{})
    sets.TP.Soboro.HighACC.STP = set_combine(sets.TP.Soboro.HighACC,{})
 
    -- Soboro(Ionis + SAM Roll) TP Sets --
    sets.TP.Soboro.Ionis.STP = set_combine(sets.TP.Soboro.Ionis,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
 	sets.TP.Soboro.LowACC.Ionis.STP = set_combine(sets.TP.Soboro.Ionis.STP,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Soboro.MidACC.Ionis.STP = set_combine(sets.TP.Soboro.Ionis.STP,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
    sets.TP.Soboro.HighACC.Ionis.STP = set_combine(sets.TP.Soboro.MidACC.Ionis.STP,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Ken. Sune-Ate",})	
	
	-- Polearm TP Sets --
    sets.TP.Polearm = {
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},}
 	sets.TP.Polearm.LowACC = set_combine(sets.TP.Polearm,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Polearm.MidACC = set_combine(sets.TP.Polearm,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
    sets.TP.Polearm.HighACC = set_combine(sets.TP.Polearm.MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Ken. Sune-Ate",})
 
    -- Polearm(Ionis) TP Sets --
    sets.TP.Polearm.Ionis = set_combine(sets.TP.Polearm,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
 	sets.TP.Polearm.LowACC.Ionis = set_combine(sets.TP.Polearm.Ionis,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Polearm.MidACC.Ionis = set_combine(sets.TP.Polearm.Ionis,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
    sets.TP.Polearm.HighACC.Ionis = set_combine(sets.TP.Polearm.MidACC.Ionis,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Ken. Sune-Ate",})
 
    -- Polearm(SAM Roll) TP Sets --
    sets.TP.Polearm.STP = set_combine(sets.TP.Polearm,{})
 	sets.TP.Polearm.LowACC.STP = set_combine(sets.TP.Polearm.STP,{})
    sets.TP.Polearm.MidACC.STP = set_combine(sets.TP.Polearm.MidACC,{})
    sets.TP.Polearm.HighACC.STP = set_combine(sets.TP.Polearm.HighACC,{})
 
    -- Polearm(Ionis + SAM Roll) TP Sets --
    sets.TP.Polearm.Ionis.STP = set_combine(sets.TP.Polearm.Ionis,{
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",})
 	sets.TP.Polearm.LowACC.Ionis.STP = set_combine(sets.TP.Polearm.Ionis.STP,{
			ammo="Ginsen",
			head="Flamma Zucchetto +1",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Ken. Samue",
			hands="Wakido Kote +3",
			left_ring="Ilabrat Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Ioskeha Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Valorous Greaves", augments={'"Snapshot"+4','Pet: "Mag.Atk.Bns."+12','Quadruple Attack +1','Accuracy+16 Attack+16','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},})
	sets.TP.Polearm.MidACC.Ionis.STP = set_combine(sets.TP.Polearm.Ionis.STP,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			waist="Olseni Belt",
			legs="Wakido Haidate +2",
			feet="Ken. Sune-Ate",})
    sets.TP.Polearm.HighACC.Ionis.STP = set_combine(sets.TP.Polearm.MidACC.Ionis.STP,{
			ammo="Amar Cluster",			
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body="Wakido Domaru +2",
			hands="Wakido Kote +3",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet="Ken. Sune-Ate",})
	
	-- Seigan TP Set --
	sets.TP.Seigan = {
			ammo="Staunch Tathlum",
			head="Kasuga Kabuto +1",
			left_ear="Cryptic Earring",
			right_ear="Etiolation Earring",
			body="Tartarus Platemail",
			hands="Hizamaru Kote +1",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs={ name="Sakonji Haidate +1", augments={'Enhances "Shikikoyo" effect',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},}

	-- Third Eye TP Set --
	sets.TP['Third Eye'] = {
			ammo="Staunch Tathlum",
			head="Kasuga Kabuto +1",
			left_ear="Cryptic Earring",
			right_ear="Etiolation Earring",
			body="Tartarus Platemail",
			hands="Hizamaru Kote +1",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs={ name="Sakonji Haidate +1", augments={'Enhances "Shikikoyo" effect',}},
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},}

	-- PDT/DeathDT Sets --
	sets.PDT = {
			ammo="Staunch Tathlum",
			head={ name="Valorous Mask", augments={'Damage taken-4%','STR+9','Accuracy+2','Attack+12',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Tartarus Platemail",
			hands="Kurys Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs="Flamma Dirs +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},}

	sets.DeathDT = set_combine(sets.PDT,{
			ammo="Staunch Tathlum",
			head={ name="Valorous Mask", augments={'Damage taken-4%','STR+9','Accuracy+2','Attack+12',}},
			neck="Loricate Torque +1",
			left_ear="Sanare Earring",
			right_ear="Etiolation Earring",
			body="Tartarus Platemail",
			hands="Kurys Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs="Flamma Dirs +1",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			ammo="Staunch Tathlum",
			head={ name="Valorous Mask", augments={'Damage taken-4%','STR+9','Accuracy+2','Attack+12',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Tartarus Platemail",
			hands="Kurys Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Solemnity Cape",
			waist="Ioskeha Belt",
			legs="Wakido Haidate +2",
			feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS.LowACC = set_combine(sets.WS,{
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs="Hizamaru Hizayoroi +2",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS.MidACC = set_combine(sets.WS,{
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs="Hizamaru Hizayoroi +2",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Fudo Sets --
	sets.WS["Tachi: Fudo"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Tachi: Fudo"].LowACC = set_combine(sets.WS["Tachi: Fudo"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs="Hizamaru Hizayoroi +2",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Fudo"].MidACC = set_combine(sets.WS["Tachi: Fudo"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			waist="Grunfeld Rope",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Fudo"].HighACC = set_combine(sets.WS["Tachi: Fudo"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Grunfeld Rope",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Fudo(SAM Roll) Sets --
	sets.WS["Tachi: Fudo"].STP = set_combine(sets.WS["Tachi: Fudo"],{})
	sets.WS["Tachi: Fudo"].LowACC.STP = set_combine(sets.WS["Tachi: Fudo"].LowACC,{})
	sets.WS["Tachi: Fudo"].MidACC.STP = set_combine(sets.WS["Tachi: Fudo"].MidACC,{})
	sets.WS["Tachi: Fudo"].HighACC.STP = set_combine(sets.WS["Tachi: Fudo"].HighACC,{})

	-- Tachi: Fudo(Attack) Set --
	sets.WS["Tachi: Fudo"].ATT = set_combine(sets.WS["Tachi: Fudo"],{
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			hands="Valorous Mitts"})

	-- Tachi: Jinpu Sets --
	sets.WS["Tachi: Jinpu"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Windbuffet Belt +1",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Tachi: Jinpu"].LowACC = set_combine(sets.WS["Tachi: Jinpu"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			neck="Fotia Gorget",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Windbuffet Belt +1",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Jinpu"].MidACC = set_combine(sets.WS["Tachi: Jinpu"],{
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Jinpu"].HighACC = set_combine(sets.WS["Tachi: Jinpu"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Jinpu(SAM Roll) Sets --
	sets.WS["Tachi: Jinpu"].STP = set_combine(sets.WS["Tachi: Jinpu"],{})
	sets.WS["Tachi: Jinpu"].LowACC.STP = set_combine(sets.WS["Tachi: Jinpu"].LowACC,{})
	sets.WS["Tachi: Jinpu"].MidACC.STP = set_combine(sets.WS["Tachi: Jinpu"].MidACC,{})
	sets.WS["Tachi: Jinpu"].HighACC.STP = set_combine(sets.WS["Tachi: Jinpu"].HighACC,{})			
			
	-- Tachi: Shoha Sets --
	sets.WS["Tachi: Shoha"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Windbuffet Belt +1",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Tachi: Shoha"].LowACC = set_combine(sets.WS["Tachi: Shoha"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			neck="Fotia Gorget",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Grunfeld Rope",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Shoha"].MidACC = set_combine(sets.WS["Tachi: Shoha"],{
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Grunfeld Rope",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Shoha"].HighACC = set_combine(sets.WS["Tachi: Shoha"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Shoha(SAM Roll) Sets --
	sets.WS["Tachi: Shoha"].STP = set_combine(sets.WS["Tachi: Shoha"],{})
	sets.WS["Tachi: Shoha"].LowACC.STP = set_combine(sets.WS["Tachi: Shoha"].LowACC,{})
	sets.WS["Tachi: Shoha"].MidACC.STP = set_combine(sets.WS["Tachi: Shoha"].MidACC,{})
	sets.WS["Tachi: Shoha"].HighACC.STP = set_combine(sets.WS["Tachi: Shoha"].HighACC,{})

	-- Tachi: Rana Sets --
	sets.WS["Tachi: Rana"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Tachi: Rana"].LowACC = set_combine(sets.WS["Tachi: Rana"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			waist="Fotia Belt",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Rana"].MidACC = set_combine(sets.WS["Tachi: Rana"].LowACC,{
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},	
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Rana"].HighACC = set_combine(sets.WS["Tachi: Rana"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Rana(SAM Roll) Sets --
	sets.WS["Tachi: Rana"].STP = set_combine(sets.WS["Tachi: Rana"],{})
	sets.WS["Tachi: Rana"].LowACC.STP = set_combine(sets.WS["Tachi: Rana"].LowACC,{})
	sets.WS["Tachi: Rana"].MidACC.STP = set_combine(sets.WS["Tachi: Rana"].MidACC,{})
	sets.WS["Tachi: Rana"].HighACC.STP = set_combine(sets.WS["Tachi: Rana"].HighACC,{})

	-- Tachi: Gekko Sets --
	sets.WS["Tachi: Gekko"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Tachi: Gekko"].LowACC = set_combine(sets.WS["Tachi: Gekko"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs="Hizamaru Hizayoroi +2",
			waist="Prosilio Belt +1",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Gekko"].MidACC = set_combine(sets.WS["Tachi: Gekko"].LowACC,{
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Gekko"].HighACC = set_combine(sets.WS["Tachi: Gekko"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",	
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Gekko(SAM Roll) Sets --
	sets.WS["Tachi: Gekko"].STP = set_combine(sets.WS["Tachi: Gekko"],{})
	sets.WS["Tachi: Gekko"].LowACC.STP = set_combine(sets.WS["Tachi: Gekko"].LowACC,{})
	sets.WS["Tachi: Gekko"].MidACC.STP = set_combine(sets.WS["Tachi: Gekko"].MidACC,{})
	sets.WS["Tachi: Gekko"].HighACC.STP = set_combine(sets.WS["Tachi: Gekko"].HighACC,{})
			
	-- Tachi: Gekko(Attack) Set --
	sets.WS["Tachi: Gekko"].ATT = set_combine(sets.WS["Tachi: Gekko"],{
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			hands="Valorous Mitts"})
			
	-- Tachi: Yukikaze Sets --
	sets.WS["Tachi: Yukikaze"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Tachi: Yukikaze"].LowACC = set_combine(sets.WS["Tachi: Yukikaze"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs="Hizamaru Hizayoroi +2",
			waist="Prosilio Belt +1",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Yukikaze"].MidACC = set_combine(sets.WS["Tachi: Yukikaze"].LowACC,{
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Yukikaze"].HighACC = set_combine(sets.WS["Tachi: Yukikaze"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Yukikaze(SAM Roll) Sets --
	sets.WS["Tachi: Yukikaze"].STP = set_combine(sets.WS["Tachi: Yukikaze"],{})
	sets.WS["Tachi: Yukikaze"].LowACC.STP = set_combine(sets.WS["Tachi: Yukikaze"].LowACC,{})
	sets.WS["Tachi: Yukikaze"].MidACC.STP = set_combine(sets.WS["Tachi: Yukikaze"].MidACC,{})
	sets.WS["Tachi: Yukikaze"].HighACC.STP = set_combine(sets.WS["Tachi: Yukikaze"].HighACC,{})	
			
	-- Tachi: Yukikaze(Attack) Set --
	sets.WS["Tachi: Yukikaze"].ATT = set_combine(sets.WS["Tachi: Yukikaze"],{
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			hands="Valorous Mitts"})
			
	-- Tachi: Kasha Sets --
	sets.WS["Tachi: Kasha"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Tachi: Kasha"].LowACC = set_combine(sets.WS["Tachi: Kasha"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs="Hizamaru Hizayoroi +2",
			waist="Prosilio Belt +1",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Kasha"].MidACC = set_combine(sets.WS["Tachi: Kasha"].LowACC,{
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Kasha"].HighACC = set_combine(sets.WS["Tachi: Kasha"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Kasha(SAM Roll) Sets --
	sets.WS["Tachi: Kasha"].STP = set_combine(sets.WS["Tachi: Kasha"],{})
	sets.WS["Tachi: Kasha"].LowACC.STP = set_combine(sets.WS["Tachi: Kasha"].LowACC,{})
	sets.WS["Tachi: Kasha"].MidACC.STP = set_combine(sets.WS["Tachi: Kasha"].MidACC,{})
	sets.WS["Tachi: Kasha"].HighACC.STP = set_combine(sets.WS["Tachi: Kasha"].HighACC,{})
			
	-- Tachi: Kasha(Attack) Set --
	sets.WS["Tachi: Kasha"].ATT = set_combine(sets.WS["Tachi: Kasha"],{
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			hands="Valorous Mitts"})
			
	-- Tachi: Ageha Sets --
	sets.WS["Tachi: Ageha"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			neck="Moonbeam Nodowa",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Tachi: Ageha"].LowACC = set_combine(sets.WS["Tachi: Ageha"],{
			neck="Moonbeam Nodowa",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},})
	sets.WS["Tachi: Ageha"].MidACC = set_combine(sets.WS["Tachi: Ageha"].LowACC,{
			neck="Moonbeam Nodowa",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Tachi: Ageha"].HighACC = set_combine(sets.WS["Tachi: Ageha"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Tachi: Ageha(SAM Roll) Sets --
	sets.WS["Tachi: Ageha"].STP = set_combine(sets.WS["Tachi: Ageha"],{})
	sets.WS["Tachi: Ageha"].LowACC.STP = set_combine(sets.WS["Tachi: Ageha"].LowACC,{})
	sets.WS["Tachi: Ageha"].MidACC.STP = set_combine(sets.WS["Tachi: Ageha"].MidACC,{})
	sets.WS["Tachi: Ageha"].HighACC.STP = set_combine(sets.WS["Tachi: Ageha"].HighACC,{})
			
	-- Tachi: Ageha(Attack) Set --
	sets.WS["Tachi: Ageha"].ATT = set_combine(sets.WS["Tachi: Ageha"],{
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			hands="Valorous Mitts"})

	-- Stardiver Sets --
	sets.WS["Stardiver"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Vulcan's Pearl",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Stardiver"].LowACC = set_combine(sets.WS["Stardiver"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs="Hizamaru Hizayoroi +2",
			waist="Prosilio Belt +1"})
	sets.WS["Stardiver"].MidACC = set_combine(sets.WS["Stardiver"].LowACC,{
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Stardiver"].HighACC = set_combine(sets.WS["Stardiver"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			right_ring="Rufescent Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Stardiver(SAM Roll) Sets --
	sets.WS["Stardiver"].STP = set_combine(sets.WS["Stardiver"],{})
	sets.WS["Stardiver"].LowACC.STP = set_combine(sets.WS["Stardiver"].LowACC,{})
	sets.WS["Stardiver"].MidACC.STP = set_combine(sets.WS["Stardiver"].MidACC,{})
	sets.WS["Stardiver"].HighACC.STP = set_combine(sets.WS["Stardiver"].HighACC,{})			

	-- Penta Thrust Sets --
	sets.WS["Penta Thrust"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+20 Attack+20','Crit. hit damage +2%','STR+10','Accuracy+14','Attack+10',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Penta Thrust"].LowACC = set_combine(sets.WS["Penta Thrust"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			back="Smertrios's Mantle"})
	sets.WS["Penta Thrust"].MidACC = set_combine(sets.WS["Penta Thrust"].LowACC,{
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Penta Thrust"].HighACC = set_combine(sets.WS["Penta Thrust"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Penta Thrust(SAM Roll) Sets --
	sets.WS["Penta Thrust"].STP = set_combine(sets.WS["Penta Thrust"],{})
	sets.WS["Penta Thrust"].LowACC.STP = set_combine(sets.WS["Penta Thrust"].LowACC,{})
	sets.WS["Penta Thrust"].MidACC.STP = set_combine(sets.WS["Penta Thrust"].MidACC,{})
	sets.WS["Penta Thrust"].HighACC.STP = set_combine(sets.WS["Penta Thrust"].HighACC,{})

	-- Sonic Thrust Sets --
	sets.WS["Sonic Thrust"] = {
			ammo="Knobkierrie",
			head={ name="Valorous Mask", augments={'Accuracy+17','Weapon skill damage +4%','STR+15',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},}
	sets.WS["Sonic Thrust"].LowACC = set_combine(sets.WS["Sonic Thrust"],{
			neck="Fotia Gorget",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+15','STR+8','Accuracy+12','Attack+13',}},
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			waist="Prosilio Belt +1"})
	sets.WS["Sonic Thrust"].MidACC = set_combine(sets.WS["Sonic Thrust"].LowACC,{
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Valorous Mitts", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%','Accuracy+15',}},
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})
	sets.WS["Sonic Thrust"].HighACC = set_combine(sets.WS["Sonic Thrust"].MidACC,{
			ammo="Amar Cluster",
			head={ name="Valorous Mask", augments={'Accuracy+23 Attack+23','DEX+8','Accuracy+15',}},
			right_ear="Telos Earring",
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			feet={ name="Valorous Greaves", augments={'Accuracy+29','Weapon skill damage +5%','VIT+10',}},})

	-- Sonic Thrust(SAM Roll) Sets --
	sets.WS["Sonic Thrust"].STP = set_combine(sets.WS["Sonic Thrust"],{})
	sets.WS["Sonic Thrust"].LowACC.STP = set_combine(sets.WS["Sonic Thrust"].LowACC,{})
	sets.WS["Sonic Thrust"].MidACC.STP = set_combine(sets.WS["Sonic Thrust"].MidACC,{})
	sets.WS["Sonic Thrust"].HighACC.STP = set_combine(sets.WS["Sonic Thrust"].HighACC,{})
			
	-- Apex Arrow Sets --		
	sets.WS["Apex Arrow"] = {
			head="Sakonji Kabuto +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Kyujutsugi",
			hands="Kasuga Kote +1",
			left_ring="Regal Ring",
			right_ring="Garuda Ring +1",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Aeto. Trousers +1",
			feet="Wakido Sune-Ate +2"}
	sets.WS["Apex Arrow"].LowACC = set_combine(sets.WS["Apex Arrow"],{
			head="Sakonji Kabuto +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Kyujutsugi",
			hands="Kasuga Kote +1",
			left_ring="Regal Ring",
			right_ring="Garuda Ring +1",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Aeto. Trousers +1",
			feet="Wakido Sune-Ate +2"})
	sets.WS["Apex Arrow"].MidACC = set_combine(sets.WS["Apex Arrow"],{
			head="Sakonji Kabuto +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Kyujutsugi",
			hands="Kasuga Kote +1",
			left_ring="Regal Ring",
			right_ring="Garuda Ring +1",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Aeto. Trousers +1",
			feet="Wakido Sune-Ate +2"})
	sets.WS["Apex Arrow"].HighACC = set_combine(sets.WS["Apex Arrow"].MidACC,{
			head="Sakonji Kabuto +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			body="Kyujutsugi",
			hands="Kasuga Kote +1",
			left_ring="Regal Ring",
			right_ring="Garuda Ring +1",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Aeto. Trousers +1",
			feet="Wakido Sune-Ate +2"})

	-- Apex Arrow(SAM Roll) Sets --
	sets.WS["Apex Arrow"].STP = set_combine(sets.WS["Apex Arrow"],{})
	sets.WS["Apex Arrow"].LowACC.STP = set_combine(sets.WS["Apex Arrow"].LowACC,{})
	sets.WS["Apex Arrow"].MidACC.STP = set_combine(sets.WS["Apex Arrow"].MidACC,{})
	sets.WS["Apex Arrow"].HighACC.STP = set_combine(sets.WS["Apex Arrow"].HighACC,{})			
			
	-- Sidewinder Sets --
	sets.WS["Sidewinder"] = {
			head="Sakonji Kabuto +1",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Kyujutsugi",
			hands="Kasuga Kote +1",
			left_ring="Regal Ring",
			right_ring="Rufescent Ring",
			back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Aeto. Trousers +1",
			feet="Wakido Sune-Ate +2"}
	sets.WS["Sidewinder"].LowACC = set_combine(sets.WS["Sidewinder"],{})
	sets.WS["Sidewinder"].MidACC = set_combine(sets.WS["Sidewinder"].LowACC,{})
	sets.WS["Sidewinder"].HighACC = set_combine(sets.WS["Sidewinder"].MidACC,{
			body="Kyujutsugi"})			

	-- Sidewinder(SAM Roll) Sets --
	sets.WS["Sidewinder"].STP = set_combine(sets.WS["Sidewinder"],{})
	sets.WS["Sidewinder"].LowACC.STP = set_combine(sets.WS["Sidewinder"].LowACC,{})
	sets.WS["Sidewinder"].MidACC.STP = set_combine(sets.WS["Sidewinder"].MidACC,{})
	sets.WS["Sidewinder"].HighACC.STP = set_combine(sets.WS["Sidewinder"].HighACC,{})

	-- Enmity Set --
	sets.Enmity = {
			ammo="Iron Gobbet",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			neck="Unmoving Collar +1",
			body="Emet Harness +1",
			hands="Kurys Gloves",
			waist="Goading Belt",
			left_ring="Begrudging Ring",
			right_ring="Eihwaz Ring",
			back="Reiki Cloak",}
	
	-- JA Sets --
	sets.JA = {}
	sets.JA.Hasso = set_combine(sets.Enmity,{})
	sets.JA.Provoke = set_combine(sets.Enmity,{})
	sets.JA.Meditate = set_combine(sets.Enmity,{head="Wakido Kabuto +2",neck="Unmoving Collar",hands="Sakonji Kote +1",back="Smertrios's Mantle"})
	sets.JA["Warding Circle"] = {head="Wakido Kabuto +2",neck="Unmoving Collar",hands="Kurys Gloves"}
	sets.JA.Seigan = {head="Kasuga Kabuto +1",hands="Kurys Gloves"}
	sets.JA['Third Eye'] = {legs={ name="Sakonji Haidate +1", augments={'Enhances "Shikikoyo" effect',}},}
	sets.JA.Sengrikori = {feet="Kasuga Sune-Ate +1"}
	sets.JA.Sekkanoki = {hands="Kasuga Kote +1"}
	sets.JA['Blade Bash'] = {hands={ name="Sakonji Kote +1", augments={'Enhances "Blade Bash" effect',}},}
	sets.JA["Meikyo Shisui"] = {feet={ name="Sak. Sune-Ate +1", augments={'Enhances "Meikyo Shisui" effect',}},}
	sets.JA.Shikikoyo = {legs={ name="Sakonji Haidate +1", augments={'Enhances "Shikikoyo" effect',}},}
	
	-- Waltz Set --
	sets.Waltz = {
			head="Lithelimb Cap",
			neck="Unmoving Collar +1",
			left_ring="Asklepian Ring",
			right_ring="Valseur's Ring",
			back="Moonbeam Cape",
			waist="Chaac Belt"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = {			
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",}
			
    --Doom/Cursed Sets--
	sets.Doom = {
			left_ring="Purity Ring",
			right_ring="Defending Ring",
			waist="Gishdubar Sash",}
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
	elseif spell.english == "Meditate" and player.tp > 2600 then -- Cancel Meditate If TP Is Above 2600 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (player.status == 'Engaged' and (((spell.english == "Namas Arrow" or spell.english == "Apex Arrow") and spell.target.distance > 16+target_distance) or (spell.type == "WeaponSkill" and spell.english ~= "Namas Arrow" and spell.english ~= "Apex Arrow" and spell.target.distance > target_distance))) then -- Cancel Ranged Attack or WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
    if check_ready(spell) then
        if spell.type == "WeaponSkill" then
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
				if buffactive["Meikyo Shisui"] then
					equipSet = set_combine(equipSet,{feet={ name="Sak. Sune-Ate +1", augments={'Enhances "Meikyo Shisui" effect',}},})
				end
				if buffactive.Sekkanoki then -- Equip Kasuga Kote +1 When Sekkanoki Is On --
					equipSet = set_combine(equipSet,{hands="Kasuga Kote +1"})
				end
				if buffactive.Sengikori then -- Equip Kasuga Sune-Ate When Sengikori Is On --
					equipSet = set_combine(equipSet,{feet="Kasuga Sune-Ate"})
				end
				if (spell.english == "Tachi: Fudo" or spell.english == "Tachi: Shoha" or spell.english == "Tachi: Kaiten") and (player.tp > 2941 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Vulcan's Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if (spell.english == "Penta Thrust") and (player.tp > 2941 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Mache Earring When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
				end
				if (spell.english == "Tachi: Rana") and (player.tp > 2941 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Vulcan's Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if (spell.english == "Stardiver") and (player.tp > 2941 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Vulcan's Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if (spell.english == "Sidewinder") and (player.tp > 2941 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Vulcan's Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if (spell.english == "Apex Arrow") and (player.tp > 2941 or buffactive.Sekkanoki or (player.tp > 1999 and buffactive.Hagakure)) then -- Equip Telos Earring When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
					equipSet = set_combine(equipSet,{left_ear="Telos Earring",})
				end
				if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
					equipSet = set_combine(equipSet,{})
				end
				
				equip(equipSet)
        elseif spell.type=="JobAbility" then
            if sets.JA[spell.english] then
                equip(sets.JA[spell.english])
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
		if Twilight == 'Twilight' then
			equip(sets.Twilight)
		end
		
        spam_protection_on(spell)
    else
        cancel_spell()
    end
end

function midcast(spell,action)
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
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(equipSet,{right_ring="Sheltered Ring"})
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
	if spam_protection_off(spell)then
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
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'DeathDT' then
		equip(sets.DeathDT)
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
		if player.hp < 1000 then
			equipSet = set_combine(equipSet,{body='Twilight Mail',head='Twilight Helm'})
		end
		if player.hp > 1000 then
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
	if buff == 'doom' then
		equip(sets['Doom'])
		end
	if buff == "sleep" and gain and player.hp > 100 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 100+ HP --
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
	elseif command == 'C15' then -- DeathDT Toggle --
		if Armor == 'DeathDT' then
			Armor = 'None'
			add_to_chat(123,'DeathDT Set: [Unlocked]')
		else
			Armor = 'DeathDT'
			add_to_chat(158,'DeathDT Set: [Locked]')
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