-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
    AccIndex = 1
    AccArray = {"TP","LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
    WeaponIndex = 1
    WeaponArray = {"Sari","Odium"} -- Default Sub Weapon Is Sari. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
    IdleIndex = 1
    IdleArray = {"Running","Town","Goldsmithing","Fishing","HELM","D2Ring"} -- Default Idle Set Is Running --
    SA = false
    TA = false
    TH = 'OFF' -- Set Default Full TH ON or OFF Here --
    Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
    target_distance = 8 -- Set Default Distance Here --
    select_default_macro_book() -- Change Default Macro Book At The End --

    okToCast = true
    nextAllowableCast = 0
    currentCast = ''

    sc_map = {SC1="Exenterator", SC2="HasteSamba", SC3="Ranged"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

    -- Idle/Town Sets --
    sets.Idle = {}

    sets.Idle.Town = {
            ammo="Staunch Tathlum",
            head="Turms Cap",
            neck="Bathy Choker +1",
            left_ear="Infused Earring",
            right_ear="Odnowa Earring +1",
            body="Turms Harness",
            hands="Turms Mittens",
            left_ring="Paguroidea Ring",
            right_ring="Sheltered Ring",
			back="Moonbeam Cape",
            waist="Muscle Belt +1",
            legs="Turms Subligar",
            feet="Turms Leggings"}
    sets.Idle.Town.Odium = set_combine(sets.Idle.Town,{
			main="Tauret",
			sub={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},})
    sets.Idle.Town.Sari = set_combine(sets.Idle.Town,{
			main="Tauret",
			sub={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},})

    sets.Idle.Running = set_combine(sets.Idle.Town,{
            ammo="Staunch Tathlum",
            head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
            hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
			back="Moonbeam Cape",
            waist="Engraved Belt",
            legs="Mummu Kecks +2",
            feet="Jute Boots +1"})
    sets.Idle.Running.Odium = set_combine(sets.Idle.Running,{
			main="Tauret",
			sub={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},})
    sets.Idle.Running.Sari = set_combine(sets.Idle.Running,{
			main="Tauret",
			sub={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},})

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
            legs="Turms Subligar",
            feet="Jute Boots +1"}       
            
    sets.Idle.Fishing = {
            main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
            sub={ name="Taming Sari", augments={'STR+9','DEX+8','DMG:+14',}},
            range="Ebisu Fishing Rod",
            head="Turms Cap",
            ammo="",
            neck="Fisher's Torque",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body="Fisherman's Smock",
            hands="Angler's Gloves",
            left_ring="Puffin Ring",
            right_ring="Seagull Ring",
            back="Moonbeam Cape",
            waist="Muscle Belt +1",
            legs="Angler's Hose",
            feet="Waders"}
        
    sets.Idle.HELM = {
            ammo="Staunch Tathlum",
            head="Turms Cap",
            body="Worker Tunica",
            hands="Worker Gloves",
            legs="Worker Hose",
            feet="Worker Boots",
            neck="Field Torque",
            waist="Field Rope",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
			back="Moonbeam Cape",}          

    sets.Idle.D2Ring = set_combine(sets.Idle.Town,{
            left_ring="Dim. Ring (Dem)",
            right_ring="Warp Ring"})           

    sets.Idle.CpRing = set_combine(sets.Idle.Town,{
            left_ring="Trizek Ring",
            right_ring="Capacity Ring"})
            
    -- TP sets --
    sets.TP = {}
            
    -- Normal TP Sets --
    sets.TP = {
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            neck="Anu Torque",
            left_ear="Telos Earring",
            right_ear="Sherida Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Hetairoi Ring",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            waist="Reiki Yotai",
            legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},}
    sets.TP.LowACC = set_combine(sets.TP,{
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Telos Earring",
            right_ear="Cessance Earring",
            neck="Combatant's Torque",
            body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Hetairoi Ring",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            waist="Reiki Yotai",    
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.MidACC = set_combine(sets.TP.LowACC,{
            ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            left_ear="Telos Earring",
            right_ear="Dignitary's Earring",
            neck="Combatant's Torque",
            body="Pillager's Vest +2",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Hetairoi Ring",
            right_ring="Epona's Ring",
            waist="Kentarch Belt +1",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.HighACC = set_combine(sets.TP.MidACC,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            neck="Subtlety Spectacles",
            left_ear="Telos Earring",
            right_ear="Zennaroi Earring",
            body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Ramuh Ring +1",
            right_ring="Ramuh Ring +1",
            waist="Olseni Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

    -- March x2 + Haste --
    sets.TP.MidHaste = set_combine(sets.TP,{
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Telos Earring",
            right_ear="Sherida Earring",
            body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            waist="Reiki Yotai",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.LowACC.MidHaste = set_combine(sets.TP.MidACC.Haste,{
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Telos Earring",
            right_ear="Cessance Earring",
            neck="Combatant's Torque",
            body="Pillager's Vest +2",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Reiki Yotai",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidACC.Haste,{
            ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Combatant's Torque",
            left_ear="Telos Earring",
            right_ear="Dignitary's Earring",
            body="Pillager's Vest +2",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            left_ear="Telos Earring",
            right_ear="Zennaroi Earring",
            neck="Subtlety Spectacles",
            body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Ramuh Ring +1",
            right_ring="Ramuh Ring +1",
            waist="Olseni Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

    -- March x2 + Haste --
    sets.TP.HighHaste = set_combine(sets.TP.MidHaste,{
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Telos Earring",
            right_ear="Sherida Earring",
            body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Reiki Yotai",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.LowACC.HighHaste = set_combine(sets.TP.HighHaste,{
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Cessance Earring",
            right_ear="Telos Earring",
            neck="Combatant's Torque",
            body="Pillager's Vest +2",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Reiki Yotai",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
            ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Combatant's Torque",
            left_ear="Telos Earring",
            right_ear="Dignitary's Earring",
            body="Pillager's Vest +2",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            left_ear="Telos Earring",
            right_ear="Zennaroi Earring",
            neck="Subtlety Spectacles",
            body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Ramuh Ring +1",
            right_ring="Ramuh Ring +1",
            waist="Olseni Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

    -- March x2 + Haste --
    -- Embrava + (March x2 or March + Haste) --
    sets.TP.HighHaste = {
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Telos Earring",
            right_ear="Sherida Earring",
            body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Reiki Yotai",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.TP.LowACC.HighHaste = set_combine(sets.TP.HighHaste,{
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Telos Earring",
            right_ear="Cessance Earring",
            neck="Combatant's Torque",
            body="Pillager's Vest +2",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Reiki Yotai",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
            ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Combatant's Torque",
            left_ear="Telos Earring",
            right_ear="Dignitary's Earring",
            body="Pillager's Vest +2",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Kentarch Belt +1",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            left_ear="Telos Earring",
            right_ear="Zennaroi Earring",
            neck="Subtlety Spectacles",
            body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Ramuh Ring +1",
            right_ring="Ramuh Ring +1",
            waist="Olseni Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

    -- Embrava + (Haste or March) TP Sets --
    sets.TP.EmbravaHaste = {
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Telos Earring",
            right_ear="Sherida Earring",
            body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
            hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Reiki Yotai",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.TP.LowACC.EmbravaHaste = set_combine(sets.TP.EmbravaHaste,{
            ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            left_ear="Telos Earring",
            right_ear="Cessance Earring",
            neck="Combatant's Torque",
            body="Pillager's Vest +2",
            hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Reiki Yotai",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.MidACC.EmbravaHaste = set_combine(sets.TP.EmbravaHaste,{
            ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Combatant's Torque",
            left_ear="Telos Earring",
            right_ear="Dignitary's Earring",
            body="Pillager's Vest +2",
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Petrov Ring",
            right_ring="Ilabrat Ring",
            waist="Kentarch Belt +1",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.HighACC.EmbravaHaste = set_combine(sets.TP.MidACC.EmbravaHaste,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            left_ear="Telos Earring",
            right_ear="Zennaroi Earring",
            neck="Subtlety Spectacles",
            body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
            hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
            left_ring="Ramuh Ring +1",
            right_ring="Ramuh Ring +1",
            waist="Olseni Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Pillager's Culottes +2",
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})       
            
    -- Full TH TP Set --
    sets.TP.TH = {
            hands="Plunderer's Armlets +1",
            waist="Chaac Belt"}
            
    -- TP Rancor ON Neck --
    sets.TP.Rancor = {}

    -- DT/DeathDT Sets --
    sets.DT = {
            ammo="Staunch Tathlum",
            head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
            hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
            back="Moonbeam Cape",
			waist="Engraved Belt",
            legs="Mummu Kecks +2",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},}

    sets.DeathDT = {
            ammo="Staunch Tathlum",
            head="Turms Cap",
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body="Turms Harness",
            hands="Turms Mittens",
			left_ring="Warden's Ring",
			right_ring="Eihwaz Ring",
            back="Moonbeam Cape",
            waist="Engraved Belt",
            legs="Turms Subligar",
            feet="Turms Leggings"}

    sets.HybridDT = {
            ammo="Staunch Tathlum",
            head="Turms Cap",
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body="Turms Harness",
            hands="Turms Mittens",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
            back="Moonbeam Cape",
            waist="Engraved Belt",
            legs="Turms Subligar",
            feet="Turms Leggings"}	
			
    -- Hybrid/Evasion Sets --
    sets.TP.Hybrid = {
            ammo="Yamarang",
			head="Turms Cap",
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body="Turms Harness",
            hands="Turms Mittens",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Engraved Belt",
            legs="Turms Subligar",
            feet="Turms Leggings"}
    sets.TP.Hybrid.LowACC = set_combine(sets.TP.Hybrid,{
            ammo="Yamarang",
			head="Turms Cap",
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body="Turms Harness",
            hands="Turms Mittens",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Engraved Belt",
            legs="Turms Subligar",
            feet="Turms Leggings"})
    sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid.LowACC,{
            ammo="Yamarang",
			neck="Subtlety Spectacles",
            neck="Loricate Torque +1",
            body="Turms Harness",
            hands="Turms Mittens",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            legs="Turms Subligar",
            feet="Turms Leggings"})
    sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
            ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Loricate Torque +1",
            left_ear="Odnowa Earring",
            right_ear="Odnowa Earring +1",
            body="Turms Harness",
            hands="Turms Mittens",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Engraved Belt",
            legs="Turms Subligar",
            feet="Turms Leggings"})

    -- WS Base Set --
    sets.WS = {
            ammo="Falcon Eye",
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS.LowACC = set_combine(sets.WS,{
            ammo="Falcon Eye",
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
    sets.WS.MidACC = set_combine(sets.WS.LowACC,{
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS.HighACC = set_combine(sets.WS.MidACC,{
            ammo="Falcon Eye",
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    -- WS Sets --
    sets.WS["Mercy Stroke"] = {
            ammo="Seething Bomblet +1",
            head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
            neck="Fotia Gorget",
            left_ear="Vulcan's Pearl",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Shukuyu Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Prosilio Belt +1",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Mercy Stroke"].LowACC = set_combine(sets.WS["Mercy Stroke"],{
            ammo="Seething Bomblet +1",
            waist="Fotia Belt"})
    sets.WS["Mercy Stroke"].MidACC = set_combine(sets.WS["Mercy Stroke"].LowACC,{
            neck="Fotia Gorget",
            left_ring="Regal Ring",
            right_ring="Shukuyu Ring",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS["Mercy Stroke"].HighACC = set_combine(sets.WS["Mercy Stroke"].MidACC,{
            ammo="Falcon Eye",
            head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
            left_ring="Rufescent Ring",
            right_ring="Shukuyu Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    sets.WS["Mercy Stroke"].SA = {
            ammo="Yetshila",
            head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
            neck="Fotia Gorget",
            left_ear="Vulcan's Pearl",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Shukuyu Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Prosilio Belt +1",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Mercy Stroke"].SA.LowACC = set_combine(sets.WS["Mercy Stroke"].SA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS["Mercy Stroke"].SA.MidACC = set_combine(sets.WS["Mercy Stroke"].SA.LowACC,{
            neck="Fotia Gorget",
            left_ring="Regal Ring",
            right_ring="Shukuyu Ring",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS["Mercy Stroke"].SA.HighACC = set_combine(sets.WS["Mercy Stroke"].SA.MidACC,{
            ammo="Yetshila",
            head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
            left_ring="Regal Ring",
            right_ring="Shukuyu Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    sets.WS["Mercy Stroke"].TA = {
            ammo="Yetshila",
            head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
            neck="Fotia Gorget",
            left_ear="Vulcan's Pearl",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Shukuyu Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Prosilio Belt +1",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Mercy Stroke"].TA.LowACC = set_combine(sets.WS["Mercy Stroke"].TA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS["Mercy Stroke"].TA.MidACC = set_combine(sets.WS["Mercy Stroke"].TA.LowACC,{
            neck="Fotia Gorget",
            left_ring="Regal Ring",
            right_ring="Shukuyu Ring",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS["Mercy Stroke"].TA.HighACC = set_combine(sets.WS["Mercy Stroke"].TA.MidACC,{
            ammo="Yetshila",
            head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
            left_ring="Regal Ring",
            right_ring="Shukuyu Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    sets.WS["Rudra's Storm"] = {
            ammo="Jukukik Feather",
            head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Rudra's Storm"].LowACC = set_combine(sets.WS["Rudra's Storm"],{
            ammo="Jukukik Feather",})
    sets.WS["Rudra's Storm"].MidACC = set_combine(sets.WS["Rudra's Storm"].LowACC,{
            ammo="Falcon Eye",
            neck="Fotia Gorget",
            waist="Grunfeld Rope",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
    sets.WS["Rudra's Storm"].HighACC = set_combine(sets.WS["Rudra's Storm"].MidACC,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",})
            
    sets.WS["Rudra's Storm"].SA = {
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Rudra's Storm"].SA.LowACC = set_combine(sets.WS["Rudra's Storm"].SA,{
            ammo="Yetshila",})
    sets.WS["Rudra's Storm"].SA.MidACC = set_combine(sets.WS["Rudra's Storm"].SA.LowACC,{
            ammo="Yetshila",
            neck="Fotia Gorget",
            waist="Grunfeld Rope",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
    sets.WS["Rudra's Storm"].SA.HighACC = set_combine(sets.WS["Rudra's Storm"].SA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",})
            
    sets.WS["Rudra's Storm"].TA = {
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.WS["Rudra's Storm"].TA.LowACC = set_combine(sets.WS["Rudra's Storm"].TA,{
            ammo="Yetshila",})
    sets.WS["Rudra's Storm"].TA.MidACC = set_combine(sets.WS["Rudra's Storm"].TA.LowACC,{
            ammo="Yetshila",
            neck="Fotia Gorget",
            waist="Grunfeld Rope",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.WS["Rudra's Storm"].TA.HighACC = set_combine(sets.WS["Rudra's Storm"].TA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",})         

    sets.WS["Mandalic Stab"] = {
            ammo="Jukukik Feather",
            head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Mandalic Stab"].LowACC = set_combine(sets.WS["Mandalic Stab"],{
            ammo="Jukukik Feather",
            waist="Fotia Belt"})
    sets.WS["Mandalic Stab"].MidACC = set_combine(sets.WS["Mandalic Stab"].LowACC,{
            ammo="Falcon Eye",
            neck="Fotia Gorget",
            waist="Grunfeld Rope",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.WS["Mandalic Stab"].HighACC = set_combine(sets.WS["Mandalic Stab"].MidACC,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS["Mandalic Stab"].SA = {         
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Mandalic Stab"].SA.LowACC = set_combine(sets.WS["Mandalic Stab"].SA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS["Mandalic Stab"].SA.MidACC = set_combine(sets.WS["Mandalic Stab"].SA.LowACC,{
            ammo="Yetshila",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
    sets.WS["Mandalic Stab"].SA.HighACC = set_combine(sets.WS["Mandalic Stab"].SA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS["Mandalic Stab"].TA = {
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.WS["Mandalic Stab"].TA.LowACC = set_combine(sets.WS["Mandalic Stab"].TA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS["Mandalic Stab"].TA.MidACC = set_combine(sets.WS["Mandalic Stab"].TA.LowACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
    sets.WS["Mandalic Stab"].TA.HighACC = set_combine(sets.WS["Mandalic Stab"].TA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})         
            
    sets.WS.Exenterator = {
            ammo="Jukukik Feather",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Trux Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
            hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
            left_ring="Garuda Ring +1",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.WS.Exenterator.LowACC = set_combine(sets.WS.Exenterator,{
            ammo="Jukukik Feather",
            waist="Fotia Belt"})
    sets.WS.Exenterator.MidACC = set_combine(sets.WS.Exenterator.LowACC,{
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS.Exenterator.HighACC = set_combine(sets.WS.Exenterator.MidACC,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    sets.WS.Exenterator.SA = {
            ammo="Jukukik Feather",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Trux Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
            hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
            left_ring="Garuda Ring +1",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.WS.Exenterator.SA.LowACC = set_combine(sets.WS.Exenterator.SA,{
            ammo="Jukukik Feather",
            waist="Fotia Belt"})
    sets.WS.Exenterator.SA.MidACC = set_combine(sets.WS.Exenterator.SA.LowACC,{
            head="Pillager's Bonnet +2",
			neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS.Exenterator.SA.HighACC = set_combine(sets.WS.Exenterator.SA.MidACC,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS.Exenterator.TA = {
            ammo="Jukukik Feather",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Trux Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
            hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
            left_ring="Garuda Ring +1",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            waist="Fotia Belt",
            legs="Meg. Chausses +2",
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS.Exenterator.TA.LowACC = set_combine(sets.WS.Exenterator.TA,{
            ammo="Jukukik Feather",
            waist="Fotia Belt"})
    sets.WS.Exenterator.TA.MidACC = set_combine(sets.WS.Exenterator.TA.LowACC,{
            head="Pillager's Bonnet +2",
			neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS.Exenterator.TA.HighACC = set_combine(sets.WS.Exenterator.TA.MidACC,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS.Evisceration = {
            ammo="Yetshila",
            head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+14 Attack+14','Crit. hit damage +5%','DEX+10','Attack+11',}},
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.WS.Evisceration.LowACC = set_combine(sets.WS.Evisceration,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS.Evisceration.MidACC = set_combine(sets.WS.Evisceration.LowACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+14 Attack+14','Crit. hit damage +3%','DEX+15','Attack+6',}},})
    sets.WS.Evisceration.HighACC = set_combine(sets.WS.Evisceration.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    sets.WS.Evisceration.SA = {
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+14 Attack+14','Crit. hit damage +5%','DEX+10','Attack+11',}},
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+14 Attack+14','Crit. hit damage +3%','DEX+15','Attack+6',}},}
    sets.WS.Evisceration.SA.LowACC = set_combine(sets.WS.Evisceration.SA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS.Evisceration.SA.MidACC = set_combine(sets.WS.Evisceration.SA.LowACC,{
            ammo="Yetshila",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+14 Attack+14','Crit. hit damage +3%','DEX+15','Attack+6',}},})
    sets.WS.Evisceration.SA.HighACC = set_combine(sets.WS.Evisceration.SA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    sets.WS.Evisceration.TA = {
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+14 Attack+14','Crit. hit damage +5%','DEX+10','Attack+11',}},
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+14 Attack+14','Crit. hit damage +3%','DEX+15','Attack+6',}},}
    sets.WS.Evisceration.TA.LowACC = set_combine(sets.WS.Evisceration.TA,{
            ammo="Jukukik Feather",
            waist="Fotia Belt"})
    sets.WS.Evisceration.TA.MidACC = set_combine(sets.WS.Evisceration.TA.LowACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            legs="Pillager's Culottes +2",
			feet={ name="Herculean Boots", augments={'Accuracy+14 Attack+14','Crit. hit damage +3%','DEX+15','Attack+6',}},})
    sets.WS.Evisceration.TA.HighACC = set_combine(sets.WS.Evisceration.TA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS["Dancing Edge"] = {
            ammo="Jukukik Feather",
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
            hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
            left_ring="Hetairoi Ring",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
            legs="Meg. Chausses +2",
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.WS["Dancing Edge"].LowACC = set_combine(sets.WS["Dancing Edge"],{
            ammo="Jukukik Feather",
            waist="Fotia Belt"})
    sets.WS["Dancing Edge"].MidACC = set_combine(sets.WS["Dancing Edge"].LowACC,{
            ammo="Falcon Eye",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            legs={ name="Herculean Trousers", augments={'Accuracy+24','Crit. hit damage +2%','DEX+13','Attack+12',}},
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.WS["Dancing Edge"].HighACC = set_combine(sets.WS["Dancing Edge"].MidACC,{
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS["Dancing Edge"].SA = {
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Hetairoi Ring",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
            legs="Meg. Chausses +2",
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.WS["Dancing Edge"].SA.LowACC = set_combine(sets.WS["Dancing Edge"].SA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS["Dancing Edge"].SA.MidACC = set_combine(sets.WS["Dancing Edge"].SA.LowACC,{
            ammo="Yetshila",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            legs={ name="Herculean Trousers", augments={'Accuracy+24','Crit. hit damage +2%','DEX+13','Attack+12',}},
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.WS["Dancing Edge"].SA.HighACC = set_combine(sets.WS["Dancing Edge"].SA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS["Dancing Edge"].TA = {
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Hetairoi Ring",
            right_ring="Epona's Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
            legs="Meg. Chausses +2",
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
    sets.WS["Dancing Edge"].TA.LowACC = set_combine(sets.WS["Dancing Edge"].TA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS["Dancing Edge"].TA.MidACC = set_combine(sets.WS["Dancing Edge"].TA.LowACC,{
            ammo="Yetshila",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            legs={ name="Herculean Trousers", augments={'Accuracy+24','Crit. hit damage +2%','DEX+13','Attack+12',}},
            feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.WS["Dancing Edge"].TA.HighACC = set_combine(sets.WS["Dancing Edge"].TA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    sets.WS["Shark Bite"] = {
            ammo="Jukukik Feather",
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Shark Bite"].LowACC = set_combine(sets.WS["Shark Bite"],{
            ammo="Jukukik Feather",
            waist="Fotia Belt"})
    sets.WS["Shark Bite"].MidACC = set_combine(sets.WS["Shark Bite"].LowACC,{
            ammo="Falcon Eye",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
    sets.WS["Shark Bite"].HighACC = set_combine(sets.WS["Shark Bite"].MidACC,{
            ammo="Falcon Eye",       
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS["Shark Bite"].SA = {            
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Shark Bite"].SA.LowACC = set_combine(sets.WS["Shark Bite"].SA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS["Shark Bite"].SA.MidACC = set_combine(sets.WS["Shark Bite"].SA.LowACC,{
            ammo="Yetshila",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
    sets.WS["Shark Bite"].SA.HighACC = set_combine(sets.WS["Shark Bite"].SA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
            
    sets.WS["Shark Bite"].TA = {
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
            hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
    sets.WS["Shark Bite"].TA.LowACC = set_combine(sets.WS["Shark Bite"].TA,{
            ammo="Yetshila",
            waist="Fotia Belt"})
    sets.WS["Shark Bite"].TA.MidACC = set_combine(sets.WS["Shark Bite"].TA.LowACC,{
            ammo="Falcon Eye",
            neck="Fotia Gorget",
            waist="Fotia Belt",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
            feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
    sets.WS["Shark Bite"].TA.HighACC = set_combine(sets.WS["Shark Bite"].TA.MidACC,{
            ammo="Yetshila",
            head="Pillager's Bonnet +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})

    sets.WS["Gust Slash"] = {
            ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
            neck="Sanctity Necklace",
            left_ear="Friomisi Earring",
            right_ear="Regal Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
            hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
            left_ring="Shiva Ring +1",
            right_ring="Dingir Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Eschan Stone",
            legs="LImbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}
    sets.WS["Gust Slash"].LowACC = set_combine(sets.WS["Gust Slash"],{
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS["Gust Slash"].MidACC = set_combine(sets.WS["Gust Slash"],{
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS["Gust Slash"].HighACC = set_combine(sets.WS["Gust Slash"].MidACC,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})             
            
    sets.WS.Cyclone = {
            ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
            neck="Sanctity Necklace",
            left_ear="Friomisi Earring",
            right_ear="Regal Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
            hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
            left_ring="Shiva Ring +1",
            right_ring="Dingir Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Eschan Stone",
            legs="LImbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}
    sets.WS.Cyclone.LowACC = set_combine(sets.WS.Cyclone,{
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS.Cyclone.MidACC = set_combine(sets.WS.Cyclone,{
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS.Cyclone.HighACC = set_combine(sets.WS.Cyclone.MidACC,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})             
            
    sets.WS["Aeolian Edge"] = {
            ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
            neck="Sanctity Necklace",
            left_ear="Friomisi Earring",
            right_ear="Regal Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
            hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
            left_ring="Shiva Ring +1",
            right_ring="Dingir Ring",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
            waist="Eschan Stone",
            legs="LImbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}
    sets.WS["Aeolian Edge"].LowACC = set_combine(sets.WS["Aeolian Edge"],{
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS["Aeolian Edge"].MidACC = set_combine(sets.WS["Aeolian Edge"],{
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})
    sets.WS["Aeolian Edge"].HighACC = set_combine(sets.WS["Aeolian Edge"].MidACC,{
            head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},})         

    -- Enmity Set --
    sets.Enmity = {
            ammo="Iron Gobbet",
			head="Halitus Helm",
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
    sets.JA.Feint = set_combine(sets.Enmity,{legs={ name="Plun. Culottes +1", augments={'Enhances "Feint" effect',}},})
    sets.JA.Conspirator = {body="Skulker's Vest +1"}
    sets.JA.Accomplice = set_combine(sets.Enmity,{head="Skulker's Bonnet +1"})
    sets.JA.Collaborator = set_combine(sets.Enmity,{head="Skulker's Bonnet +1"})
    sets.JA["Perfect Dodge"] = {hands={ name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}},}
    sets.JA.Steal = {
            ammo="Barathrum",
            head={ name="Plun. Bonnet +1", augments={'Enhances "Aura Steal" effect',}},
            hands="Pillager's Armlets +2",
            legs="Pillager's Culottes +2",
            feet="Pillager's Poulaines +2"}
    sets.JA.Flee = {feet="Pillager's Poulaines +2"}
    sets.JA.Despoil = {
            ammo="Barathrum",
            legs="Skulker's Culottes +1",
            feet="Skulker's Poulaines +1"}
    sets.JA.Mug = {head={ name="Plun. Bonnet +1", augments={'Enhances "Aura Steal" effect',}},}
    sets.JA.Hide = {body="Pillager's Vest +2"}
    sets.JA.Provoke = set_combine(sets.Enmity,{})
    sets.JA.Bully = set_combine(sets.Enmity,{})
    sets.JA["Sneak Attack"] = {hands="Meg. Gloves +2"}
    sets.JA["Trick Attack"] = {hands="Meg. Gloves +2"}
    sets.JA.Lunge = {
            ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
            neck="Combatant's Torque",
            left_ear="Friomisi Earring",
            right_ear="Regal Earring",
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
            hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
            left_ring="Shiva Ring +1",
            right_ring="Shiva Ring +1",
            back="Toro Cape",
            waist="Eschan Stone",
            legs="LImbo Trousers",
            feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Mag.Atk.Bns."+13',}},}
    
    -- Step Set --
    sets.Step = {
            ammo="Falcon Eye",
            left_ear="Zennaroi Earring",
            right_ear="Choreia Earring"}

    -- Flourish Set --
    sets.Flourish = {           
            ammo="Falcon Eye",
            head="Pillager's Bonnet +2",
            left_ear="Telos Earring",
            right_ear="Dignitary's Earring",
            body="Pillager's Vest +2",
            hands="Pillager's Armlets +2",
            legs="Pillager's Culottes +2",
            feet="Pillager's Poulaines +2"}

    -- Ranged Set --
    sets.RA = {
            head="Umbani Cap",
            left_ear="Enervating Earring",
            right_ear="Clearview Earring",
            neck="Combatant's Torque",
            body={ name="Herculean Vest", augments={'Crit. hit damage +4%','DEX+10','Accuracy+11','Attack+13',}},
            hands="Plunderer's Armlets +1",
            left_ring="Hajduk ring",
            right_ring="Longshot Ring",
            legs="Meg. Chausses +2",
            back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
            waist="Chaac Belt",
            feet="Pillager's Poulaines +2"}

    -- Waltz Set --
    sets.Waltz = {
            ammo="Yamarang",
            head="Mummu Bonnet +1",
            neck="Unmoving Collar +1",
            left_ear="Terra's Pearl",
            right_ear="Enchanter Earring +1",
            body="Passion Jacket",
			hands={ name="Herculean Gloves", augments={'Magic dmg. taken -4%','"Waltz" potency +10%','Damage taken-2%','Accuracy+9 Attack+9','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
            left_ring="Asklepian Ring",
            right_ring="Valseur's Ring",
            legs="Plunderer's Culottes +1",
            back="Moonbeam Cape",
            waist="Chaac Belt",
			feet={ name="Rawhide Boots", augments={'STR+10','Attack+15','"Store TP"+5',}},}

    sets.Precast = {}
    -- Fastcast Set --
    sets.Precast.FastCast = {
            ammo="Impatients",
            head={ name="Herculean Helm", augments={'Mag. Acc.+1','"Fast Cast"+5','AGI+5','"Mag.Atk.Bns."+5',}},
            neck="Orunmila's Torque",
            body="Taeon Tabard",
            left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
            hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Lebeche Ring",
            right_ring="Rahab Ring",
            waist="Ninurta's Sash",
            legs="Enif Cosciales",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}

    -- Utsusemi Precast Set --
    sets.Precast.Utsusemi = {
            ammo="Impatients",
            head={ name="Herculean Helm", augments={'Mag. Acc.+1','"Fast Cast"+5','AGI+5','"Mag.Atk.Bns."+5',}},
            neck="Magoraga Beads",
            body="Passion Jacket",
            left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
            hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Lebeche Ring",
            right_ring="Rahab Ring",
            legs="LImbo Trousers",
            waist="Ninurta's Sash",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}

    sets.Midcast = {}
    -- Magic Haste Set --
    sets.Midcast.Haste = set_combine(sets.Precast.FastCast)
    sets.Midcast.FastCast = {
            ammo="Impatients",
            head={ name="Herculean Helm", augments={'Mag. Acc.+1','"Fast Cast"+5','AGI+5','"Mag.Atk.Bns."+5',}},
            neck="Orunmila's Torque",
            body="Taeon Tabard",
            left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
            hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Lebeche Ring",
            right_ring="Rahab Ring",
            legs="Enif Cosciales",
            waist="Ninurta's Sash",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}

    sets.Midcast.Utsusemi = {
            ammo="Impatients",
            head={ name="Herculean Helm", augments={'Mag. Acc.+1','"Fast Cast"+5','AGI+5','"Mag.Atk.Bns."+5',}},
            neck="Magoraga Beads",
            body="Passion Jacket",
            left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
            hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Lebeche Ring",
            right_ring="Rahab Ring",
            legs="Enif Cosciales",
            waist="Ninurta's Sash",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},}
            
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
    elseif command == 'C3' then -- Hybrid DT Toggle --
        if Armor == 'HybridDT' then
            Armor = 'None'
            add_to_chat(123,'HybridDT Set: [Unlocked]')
        else
            Armor = 'HybridDT'
            add_to_chat(158,'HybridDT Set: [Locked]')
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