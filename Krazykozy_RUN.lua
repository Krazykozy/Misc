-- Last Updated: 01.03.2020 *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"TP","LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Tanking. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"Epeolatry","Lionheart","Aettir","Flyssa"} -- Default TP Set Is Epeolatry. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Running","Regen","Refresh","Goldsmithing","Fishing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Running --
	Armor = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Seigan = 'ON' -- Set Default Seigan Set ON or OFF Here --
	Third_Eye = 'ON' -- Set Default Third Eye Set ON or OFF Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	target_distance = 7 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="Resolution", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}

	-- Idle/Town Sets --

	sets.Idle.Town = {
			ammo="Homiliary",
			head="Turms Cap",
			neck="Bathy Choker +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Turms Harness",
            hands="Turms Mittens",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back="Moonbeam Cape",
			waist="Muscle Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Turms Leggings"}
	sets.Idle.Town.Epeolatry = set_combine(sets.Idle.Town,{
			main="Epeolatry",
			sub="Utu Grip"})
	sets.Idle.Town.Lionheart = set_combine(sets.Idle.Town,{
            main="Lionheart",
            sub="Utu Grip"})
	sets.Idle.Town.Aettir = set_combine(sets.Idle.Town,{
            main="Aettir",
            sub="Refined Grip +1"})
	sets.Idle.Town.Flyssa = set_combine(sets.Idle.Town,{
            main="Flyssa +1",
            sub="Flyssa"})
			
	sets.Idle.Refresh = {
			ammo="Homiliary",
			neck="Bathy Choker +1",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Respite Cloak",
			hands={ name="Herculean Gloves", augments={'Weapon skill damage +1%','Pet: Mag. Acc.+20','"Refresh"+1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back="Moonbeam Cape",
			waist="Fucho-no-Obi",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Crit.hit rate+2','Pet: DEX+11','"Refresh"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},}
	sets.Idle.Refresh.Epeolatry = set_combine(sets.Idle.Refresh,{
			main="Epeolatry",
			sub="Utu Grip"})
	sets.Idle.Refresh.Lionheart = set_combine(sets.Idle.Refresh,{
            main="Lionheart",
            sub="Utu Grip"})
	sets.Idle.Refresh.Aettir = set_combine(sets.Idle.Refresh,{
            main="Aettir",
            sub="Refined Grip +1"})			
	sets.Idle.Refresh.Flyssa = set_combine(sets.Idle.Refresh,{
            main="Flyssa +1",
            sub="Flyssa"})
			
	sets.Idle.Running = {
			ammo="Staunch Tathlum",
			head="Aya. Zucchetto +2",
			body={ name="Futhark Coat +2", augments={'Enhances "Elemental Sforzo" effect',}},
			hands="Aya. Manopolas +2",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",}
	sets.Idle.Running.Epeolatry = set_combine(sets.Idle.Running,{
			main="Epeolatry",
			sub="Utu Grip"})
	sets.Idle.Running.Lionheart = set_combine(sets.Idle.Running,{
            main="Lionheart",
            sub="Utu Grip"})
	sets.Idle.Running.Aettir = set_combine(sets.Idle.Running,{
            main="Aettir",
            sub="Refined Grip +1"})			
	sets.Idle.Running.Flyssa = set_combine(sets.Idle.Running,{
            main="Flyssa +1",
            sub="Flyssa"})

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
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},}		
			
	sets.Idle.Fishing = {
			range="Ebisu Fishing Rod",
            ammo="",
			head="Ayanmo Zucchetto +2",
			neck="Fisher's Torque",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			left_ring="Puffin Ring",
			right_ring="Noddy Ring",
			back="",
			waist="Muscle Belt +1",
			legs="Angler's Hose",
			feet="Waders"}

	sets.Idle.HELM = {
			ammo="Staunch Tathlum",
			head="",
			neck="Field Torque",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body="",
			hands="",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
			back="",
			waist="Field Rope",
			legs="",
			feet=""}	

    sets.Idle.D2Ring = set_combine(sets.Idle.Town,{
            left_ring="Dim. Ring (Dem)",
            right_ring="Warp Ring"})           

    sets.Idle.CpRing = set_combine(sets.Idle.Town,{
            left_ring="Trizek Ring",
            right_ring="Capacity Ring"})		
			
	-- TP Base Set --
	sets.TP = {}

    -- Epeolatry TP Sets --	
	sets.TP.Epeolatry = {
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},}
	sets.TP.Epeolatry.LowACC = set_combine(sets.TP.Epeolatry,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Epeolatry.MidACC = set_combine(sets.TP.Epeolatry.LowACC,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Epeolatry.HighACC = set_combine(sets.TP.Epeolatry.MidACC,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 
    -- Epeolatry(Ionis) TP Sets --
    sets.TP.Epeolatry.Ionis = set_combine(sets.TP.Epeolatry,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
 	sets.TP.Epeolatry.LowACC.Ionis = set_combine(sets.TP.Epeolatry.Ionis,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Epeolatry.MidACC.Ionis = set_combine(sets.TP.Epeolatry.Ionis,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.Epeolatry.HighACC.Ionis = set_combine(sets.TP.Epeolatry.MidACC.Ionis,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 
    -- Epeolatry(SAM Roll) TP Sets --
    sets.TP.Epeolatry.STP = set_combine(sets.TP.Epeolatry,{})
 	sets.TP.Epeolatry.LowACC.STP = set_combine(sets.TP.Epeolatry.STP,{})
    sets.TP.Epeolatry.MidACC.STP = set_combine(sets.TP.Epeolatry.MidACC,{})
    sets.TP.Epeolatry.HighACC.STP = set_combine(sets.TP.Epeolatry.HighACC,{})
 
    -- Epeolatry(Ionis + SAM Roll) TP Sets --
    sets.TP.Epeolatry.Ionis.STP = set_combine(sets.TP.Epeolatry.Ionis,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
 	sets.TP.Epeolatry.LowACC.Ionis.STP = set_combine(sets.TP.Epeolatry.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Epeolatry.MidACC.Ionis.STP = set_combine(sets.TP.Epeolatry.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.Epeolatry.HighACC.Ionis.STP = set_combine(sets.TP.Epeolatry.MidACC.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

    -- Lionheart TP Sets --	
	sets.TP.Lionheart = {
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},}
	sets.TP.Lionheart.LowACC = set_combine(sets.TP.Lionheart,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Lionheart.MidACC = set_combine(sets.TP.Lionheart.LowACC,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Lionheart.HighACC = set_combine(sets.TP.Lionheart.MidACC,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 
    -- Lionheart(Ionis) TP Sets --
    sets.TP.Lionheart.Ionis = set_combine(sets.TP.Lionheart,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
 	sets.TP.Lionheart.LowACC.Ionis = set_combine(sets.TP.Lionheart.Ionis,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Lionheart.MidACC.Ionis = set_combine(sets.TP.Lionheart.Ionis,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.Lionheart.HighACC.Ionis = set_combine(sets.TP.Lionheart.MidACC.Ionis,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 
    -- Lionheart(SAM Roll) TP Sets --
    sets.TP.Lionheart.STP = set_combine(sets.TP.Lionheart,{})
 	sets.TP.Lionheart.LowACC.STP = set_combine(sets.TP.Lionheart.STP,{})
    sets.TP.Lionheart.MidACC.STP = set_combine(sets.TP.Lionheart.MidACC,{})
    sets.TP.Lionheart.HighACC.STP = set_combine(sets.TP.Lionheart.HighACC,{})
 
    -- Lionheart(Ionis + SAM Roll) TP Sets --
    sets.TP.Lionheart.Ionis.STP = set_combine(sets.TP.Lionheart.Ionis,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
 	sets.TP.Lionheart.LowACC.Ionis.STP = set_combine(sets.TP.Lionheart.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Lionheart.MidACC.Ionis.STP = set_combine(sets.TP.Lionheart.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.Lionheart.HighACC.Ionis.STP = set_combine(sets.TP.Lionheart.MidACC.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
			
	-- Aettir TP Sets --
    sets.TP.Aettir = {
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},}
 	sets.TP.Aettir.LowACC = set_combine(sets.TP.Aettir,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Aettir.MidACC = set_combine(sets.TP.Aettir,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.Aettir.HighACC = set_combine(sets.TP.Aettir.MidACC,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 
    -- Aettir(Ionis) TP Sets --
    sets.TP.Aettir.Ionis = set_combine(sets.TP.Aettir,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
 	sets.TP.Aettir.LowACC.Ionis = set_combine(sets.TP.Aettir.Ionis,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Aettir.MidACC.Ionis = set_combine(sets.TP.Aettir.Ionis,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.Aettir.HighACC.Ionis = set_combine(sets.TP.Aettir.MidACC.Ionis,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 
    -- Aettir(SAM Roll) TP Sets --
    sets.TP.Aettir.STP = set_combine(sets.TP.Aettir,{})
 	sets.TP.Aettir.LowACC.STP = set_combine(sets.TP.Aettir.STP,{})
    sets.TP.Aettir.MidACC.STP = set_combine(sets.TP.Aettir.MidACC,{})
    sets.TP.Aettir.HighACC.STP = set_combine(sets.TP.Aettir.HighACC,{})
 
    -- Aettir(Ionis + SAM Roll) TP Sets --
    sets.TP.Aettir.Ionis.STP = set_combine(sets.TP.Aettir.Ionis,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
 	sets.TP.Aettir.LowACC.Ionis.STP = set_combine(sets.TP.Aettir.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Sherida Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
	sets.TP.Aettir.MidACC.Ionis.STP = set_combine(sets.TP.Aettir.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','Attack+12',}},})
    sets.TP.Aettir.HighACC.Ionis.STP = set_combine(sets.TP.Aettir.MidACC.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

    -- Flyssa TP Sets --	
	sets.TP.Flyssa = {
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.TP.Flyssa.LowACC = set_combine(sets.TP.Flyssa,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Flyssa.MidACC = set_combine(sets.TP.Flyssa.LowACC,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Flyssa.HighACC = set_combine(sets.TP.Flyssa.MidACC,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 
    -- Flyssa(Ionis) TP Sets --
    sets.TP.Flyssa.Ionis = set_combine(sets.TP.Flyssa,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 	sets.TP.Flyssa.LowACC.Ionis = set_combine(sets.TP.Flyssa.Ionis,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Flyssa.MidACC.Ionis = set_combine(sets.TP.Flyssa.Ionis,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.Flyssa.HighACC.Ionis = set_combine(sets.TP.Flyssa.MidACC.Ionis,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 
    -- Flyssa(SAM Roll) TP Sets --
    sets.TP.Flyssa.STP = set_combine(sets.TP.Flyssa,{})
 	sets.TP.Flyssa.LowACC.STP = set_combine(sets.TP.Flyssa.STP,{})
    sets.TP.Flyssa.MidACC.STP = set_combine(sets.TP.Flyssa.MidACC,{})
    sets.TP.Flyssa.HighACC.STP = set_combine(sets.TP.Flyssa.HighACC,{})
 
    -- Flyssa(Ionis + SAM Roll) TP Sets --
    sets.TP.Flyssa.Ionis.STP = set_combine(sets.TP.Flyssa.Ionis,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
 	sets.TP.Flyssa.LowACC.Ionis.STP = set_combine(sets.TP.Flyssa.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Anu Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.Flyssa.MidACC.Ionis.STP = set_combine(sets.TP.Flyssa.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
    sets.TP.Flyssa.HighACC.Ionis.STP = set_combine(sets.TP.Flyssa.MidACC.Ionis.STP,{
			ammo="Yamarang",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Subtlety Spectacles",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			right_ring="Niqmaddu Ring",
			left_ring="Epona's Ring",
			waist="Olseni Belt",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+6','"Store TP"+10','Damage taken-5%',}},
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- Tanking Sets --
	sets.TP.Tanking = {
			ammo="Yamarang",
			head="Aya. Zucchetto +2",
			body="Ayanmo Corazza +2",
			hands="Aya. Manopolas +2",
			legs="Eri. Leg Guards +1",
			feet="Turms Leggings",
			neck="Loricate Torque +1",
			waist="Goading Belt",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},}
	sets.TP.Tanking.LowACC = set_combine(sets.TP.Tanking,{
			ammo="Yamarang",
			head="Aya. Zucchetto +2",
			body="Ayanmo Corazza +2",
			hands="Aya. Manopolas +2",
			legs="Eri. Leg Guards +1",
			feet="Turms Leggings",
			neck="Loricate Torque +1",
			waist="Engraved Belt",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},})
	sets.TP.Tanking.MidACC = set_combine(sets.TP.Tanking.LowACC,{
			ammo="Yamarang",
			head="Aya. Zucchetto +2",
			body="Ayanmo Corazza +2",
			hands="Aya. Manopolas +2",
			legs="Eri. Leg Guards +1",
			feet="Turms Leggings",
			neck="Loricate Torque +1",
			waist="Engraved Belt",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},})
	sets.TP.Tanking.HighACC = set_combine(sets.TP.Tanking.MidACC,{
			ammo="Yamarang",
			head="Aya. Zucchetto +2",
			body="Ayanmo Corazza +2",
			hands="Aya. Manopolas +2",
			legs="Eri. Leg Guards +1",
			feet="Turms Leggings",
			neck="Loricate Torque +1",
			waist="Engraved Belt",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},})
			
	-- Seigan TP Set --
	sets.TP.Seigan = set_combine(sets.DT,{
			ammo="Staunch Tathlum",
			head="Turms Cap",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			hands="Aya. Manopolas +2",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},
			waist="Flume Belt +1",
			legs="Ayanmo Cosciales +2",
			feet="Turms Leggings"})

	-- Third Eye TP Set --
	sets.TP['Third Eye'] = set_combine(sets.DT,{
			ammo="Staunch Tathlum",
			head="Turms Cap",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			hands="Aya. Manopolas +2",
            left_ring="Moonlight Ring",
            right_ring="Defending Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},
			waist="Flume Belt +1",
			legs="Ayanmo Cosciales +2",
			feet="Turms Leggings"})

	-- DT/DeathDT Sets --
	sets.DT = {
			ammo="Staunch Tathlum",
			head="Aya. Zucchetto +2",
			body={ name="Futhark Coat +2", augments={'Enhances "Elemental Sforzo" effect',}},
			hands="Aya. Manopolas +2",
			legs="Aya. Cosciales +2",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Ethereal Earring",
			right_ear="Etiolation Earring",
            left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},}

	sets.DeathDT = set_combine(sets.DT,{
			ammo="Staunch Tathlum",
			head="Rune. Bandeau +2",
			body="Runeist's Coat +2",
			hands="Turms Mittens",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			neck="Loricate Torque +1",
			waist="Engraved Belt",
			left_ear="Sanare Earring",
			right_ear="Etiolation Earring",
			left_ring="Warden's Ring",
			right_ring="Eihwaz Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},})

	-- Battuta Set --
	sets.Battuta = {
			ammo="Yamarang",
			head="Halitus Helm",
			body="Erilaz Surcoat +1",
			hands="Turms Mittens",
			legs="Eri. Leg Guards +1",
			feet="Turms Leggings",
			neck="Combatant's Torque",
			waist="Goading Belt",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			left_ring="Moonlight Ring",
			right_ring="Defending Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},}			
			
	-- Enmity Set --
	sets.Enmity = {
			ammo="Iron Gobbet",
			head="Halitus Helm",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			neck="Moonbeam Necklace",
			body="Emet Harness +1",
			hands="Kurys Gloves",
			legs="Eri. Leg Guards +1",
			feet="Erilaz Greaves +1",
			waist="Goading Belt",
			left_ring="Begrudging Ring",
			right_ring="Eihwaz Ring",
			back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','Enmity+10','Damage taken-5%',}},}

	-- Lunge Set --
	sets.Lunge = {
			ammo="Seeth. Bomblet +1",
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
			body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
			hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
			legs="Limbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Fast Cast"+2','MND+8','Mag. Acc.+12','"Mag.Atk.Bns."+13',}},
			neck="Baetyl Pendant",
			waist="Eschan Stone",
			left_ear="Crematio Earring",
			right_ear="Friomisi Earring",
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back={ name="Evasionist's Cape", augments={'Enmity+2','"Embolden"+8','"Dbl.Atk."+5','Damage taken-4%',}},}

	-- WS Base Set --
	sets.WS = {			
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			left_ear="Ishvara Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Attack+11','Damage taken-4%','AGI+9','Accuracy+11',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.WS.LowACC = set_combine(sets.WS,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.WS.MidACC = set_combine(sets.WS.LowACC,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- Base Set(SAM Roll) Sets --
	sets.WS.STP = set_combine(sets.WS,{})
	sets.WS.LowACC.STP = set_combine(sets.WS.LowACC,{})
	sets.WS.MidACC.STP = set_combine(sets.WS.MidACC,{})
	sets.WS.HighACC.STP = set_combine(sets.WS.HighACC,{})
			
	-- Base Set(Attack) Set --
	sets.WS.ATT = set_combine(sets.WS,{
			head="Valorous Mask",
			hands="Valorous Mitts"})
			
	-- Resolution Sets --
	sets.WS.Resolution = {
			ammo="Seething Bomblet +1",
			head={ name="Lustratio Cap", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			body={ name="Lustratio Harness", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+2','STR+13','Accuracy+15','Attack+11',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Lustratio Leggings", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Sherida Earring",
			right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			left_ring="Niqmaddu Ring",
			right_ring="Regal Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}
	sets.WS.Resolution.LowACC = set_combine(sets.WS.Resolution,{
			ammo="Seething Bomblet +1",
			head={ name="Lustratio Cap", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			body={ name="Lustratio Harness", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+2','STR+13','Accuracy+15','Attack+11',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Lustratio Leggings", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Sherida Earring",
			right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			left_ring="Niqmaddu Ring",
			right_ring="Regal Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},})
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution.LowACC,{
			ammo="Seething Bomblet +1",
			head={ name="Lustratio Cap", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			body={ name="Lustratio Harness", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+2','STR+13','Accuracy+15','Attack+11',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Lustratio Leggings", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Sherida Earring",
			right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			left_ring="Niqmaddu Ring",
			right_ring="Regal Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			body={ name="Lustratio Harness", augments={'Attack+15','STR+5','"Dbl.Atk."+2',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+2','STR+13','Accuracy+15','Attack+11',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet="Meg. Jam. +2",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Sherida Earring",
			right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
			left_ring="Niqmaddu Ring",
			right_ring="Regal Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},})

	-- Resolution(SAM Roll) Sets --
	sets.WS.Resolution.STP = set_combine(sets.WS.Resolution,{})
	sets.WS.Resolution.LowACC.STP = set_combine(sets.WS.Resolution.LowACC,{})
	sets.WS.Resolution.MidACC.STP = set_combine(sets.WS.Resolution.MidACC,{})
	sets.WS.Resolution.HighACC.STP = set_combine(sets.WS.Resolution.HighACC,{})
			
	-- Resolution(Attack) Set --
	sets.WS.Resolution.ATT = set_combine(sets.WS.Resolution,{
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},})

	-- Dimidiation Sets --
	sets.WS.Dimidiation = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
			neck="Fotia Gorget",
			left_ear="Ishvara Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			left_ring="Regal Ring",
			right_ring="Ilabrat Ring",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS.Dimidiation.LowACC = set_combine(sets.WS.Dimidiation,{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS.Dimidiation.MidACC = set_combine(sets.WS.Dimidiation.LowACC,{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS.Dimidiation.HighACC = set_combine(sets.WS.Dimidiation.MidACC,{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','DEX+9',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23','Weapon skill damage +4%','DEX+13','Attack+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})	

	-- Dimidiation(SAM Roll) Sets --
	sets.WS.Dimidiation.STP = set_combine(sets.WS.Dimidiation,{})
	sets.WS.Dimidiation.LowACC.STP = set_combine(sets.WS.Dimidiation.LowACC,{})
	sets.WS.Dimidiation.MidACC.STP = set_combine(sets.WS.Dimidiation.MidACC,{})
	sets.WS.Dimidiation.HighACC.STP = set_combine(sets.WS.Dimidiation.HighACC,{})			

	-- Spinning Slash Sets --
	sets.WS["Spinning Slash"] = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			left_ear="Ishvara Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},}
	sets.WS["Spinning Slash"].LowACC = set_combine(sets.WS["Spinning Slash"],{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})
	sets.WS["Spinning Slash"].MidACC = set_combine(sets.WS["Spinning Slash"].LowACC,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})
	sets.WS["Spinning Slash"].HighACC = set_combine(sets.WS["Spinning Slash"].MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})	

	-- Spinning Slash(SAM Roll) Sets --
	sets.WS["Spinning Slash"].STP = set_combine(sets.WS["Spinning Slash"],{})
	sets.WS["Spinning Slash"].LowACC.STP = set_combine(sets.WS["Spinning Slash"].LowACC,{})
	sets.WS["Spinning Slash"].MidACC.STP = set_combine(sets.WS["Spinning Slash"].MidACC,{})
	sets.WS["Spinning Slash"].HighACC.STP = set_combine(sets.WS["Spinning Slash"].HighACC,{})	
	
	-- Ground Strike Sets --
	sets.WS["Ground Strike"] = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			left_ear="Ishvara Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},}
	sets.WS["Ground Strike"].LowACC = set_combine(sets.WS["Ground Strike"],{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})
	sets.WS["Ground Strike"].MidACC = set_combine(sets.WS["Ground Strike"].LowACC,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})
	sets.WS["Ground Strike"].HighACC = set_combine(sets.WS["Ground Strike"].MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
            body="Meg. Cuirie +2",
			left_ring="Regal Ring",
			right_ring="Shukuyu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})	

	-- Ground Strike(SAM Roll) Sets --
	sets.WS["Ground Strike"].STP = set_combine(sets.WS["Ground Strike"],{})
	sets.WS["Ground Strike"].LowACC.STP = set_combine(sets.WS["Ground Strike"].LowACC,{})
	sets.WS["Ground Strike"].MidACC.STP = set_combine(sets.WS["Ground Strike"].MidACC,{})
	sets.WS["Ground Strike"].HighACC.STP = set_combine(sets.WS["Ground Strike"].HighACC,{})

	-- Requiescat Sets --
	sets.WS.Requiescat = {
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.WS.Requiescat.LowACC = set_combine(sets.WS.Requiescat,{
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
			hands="Jhakri Cuffs +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},})
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat.LowACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			waist="Fotia Belt"})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{
			ammo="Seething Bomblet +1",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
            body="Meg. Cuirie +2",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},})	

	-- Requiescat(SAM Roll) Sets --
	sets.WS.Requiescat.STP = set_combine(sets.WS.Requiescat,{})
	sets.WS.Requiescat.LowACC.STP = set_combine(sets.WS.Requiescat.LowACC,{})
	sets.WS.Requiescat.MidACC.STP = set_combine(sets.WS.Requiescat.MidACC,{})
	sets.WS.Requiescat.HighACC.STP = set_combine(sets.WS.Requiescat.HighACC,{})
			
	-- Vorpal Blade Sets --
	sets.WS["Vorpal Blade"] = {
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.WS["Vorpal Blade"].LowACC = set_combine(sets.WS["Vorpal Blade"],{
			ammo="Seething Bomblet +1",
			waist="Fotia Belt"})
	sets.WS["Vorpal Blade"].MidACC = set_combine(sets.WS["Vorpal Blade"].LowACC,{
			ammo="Seething Bomblet +1",
			waist="Fotia Belt"})
	sets.WS["Vorpal Blade"].HighACC = set_combine(sets.WS["Vorpal Blade"].MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- Vorpal Blade(SAM Roll) Sets --
	sets.WS["Vorpal Blade"].STP = set_combine(sets.WS["Vorpal Blade"],{})
	sets.WS["Vorpal Blade"].LowACC.STP = set_combine(sets.WS["Vorpal Blade"].LowACC,{})
	sets.WS["Vorpal Blade"].MidACC.STP = set_combine(sets.WS["Vorpal Blade"].MidACC,{})
	sets.WS["Vorpal Blade"].HighACC.STP = set_combine(sets.WS["Vorpal Blade"].HighACC,{})

	-- Swift Blade Sets --		
	sets.WS["Swift Blade"] = {
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS["Swift Blade"].LowACC = set_combine(sets.WS["Swift Blade"],{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS["Swift Blade"].MidACC = set_combine(sets.WS["Swift Blade"].LowACC,{
			ammo="Yamarang",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			waist="Fotia Belt"})
	sets.WS["Swift Blade"].HighACC = set_combine(sets.WS["Swift Blade"].MidACC,{
			ammo="Falcon Eye",
			head="Sukeroku Hachimaki",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})

	-- Swift Blade(SAM Roll) Sets --
	sets.WS["Swift Blade"].STP = set_combine(sets.WS["Swift Blade"],{})
	sets.WS["Swift Blade"].LowACC.STP = set_combine(sets.WS["Swift Blade"].LowACC,{})
	sets.WS["Swift Blade"].MidACC.STP = set_combine(sets.WS["Swift Blade"].MidACC,{})
	sets.WS["Swift Blade"].HighACC.STP = set_combine(sets.WS["Swift Blade"].HighACC,{})
	
	-- Savage Blade Sets --		
	sets.WS["Savage Blade"] = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Ishvara Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},}
	sets.WS["Savage Blade"].LowACC = set_combine(sets.WS["Savage Blade"],{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Ishvara Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})
	sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Savage Blade"].LowACC,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			waist="Fotia Belt"})
	sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Savage Blade"].MidACC,{
			ammo="Falcon Eye",
			head="Sukeroku Hachimaki",
            body="Meg. Cuirie +2",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Weapon skill damage +5%','DEX+6',}},})

	-- Savage Blade(SAM Roll) Sets --
	sets.WS["Savage Blade"].STP = set_combine(sets.WS["Savage Blade"],{})
	sets.WS["Savage Blade"].LowACC.STP = set_combine(sets.WS["Savage Blade"].LowACC,{})
	sets.WS["Savage Blade"].MidACC.STP = set_combine(sets.WS["Savage Blade"].MidACC,{})
	sets.WS["Savage Blade"].HighACC.STP = set_combine(sets.WS["Savage Blade"].HighACC,{})			
			
	-- Upheaval Sets --
	sets.WS.Upheaval = {
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Titan Ring +1",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'"Triple Atk."+3','STR+10','Accuracy+8','Attack+13',}},}
	sets.WS.Upheaval.LowACC = set_combine(sets.WS.Upheaval,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'"Triple Atk."+3','STR+10','Accuracy+8','Attack+13',}},})
	sets.WS.Upheaval.MidACC = set_combine(sets.WS.Upheaval.LowACC,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'"Triple Atk."+3','STR+10','Accuracy+8','Attack+13',}},})
	sets.WS.Upheaval.HighACC = set_combine(sets.WS.Upheaval.MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Sherida Earring",
			right_ear="Moonshade Earring",
            body="Meg. Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
            legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'"Triple Atk."+3','STR+10','Accuracy+8','Attack+13',}},})		

	-- Upheaval(SAM Roll) Sets --
	sets.WS.Upheaval.STP = set_combine(sets.WS.Upheaval,{})
	sets.WS.Upheaval.LowACC.STP = set_combine(sets.WS.Upheaval.LowACC,{})
	sets.WS.Upheaval.MidACC.STP = set_combine(sets.WS.Upheaval.MidACC,{})
	sets.WS.Upheaval.HighACC.STP = set_combine(sets.WS.Upheaval.HighACC,{})
			
	-- JA Sets --
	sets.JA = {}
	sets.JA["Elemental Sforzo"] = set_combine(sets.Enmity,{body={ name="Futhark Coat +2", augments={'Enhances "Elemental Sforzo" effect',}},})
	sets.JA.Vallation = set_combine(sets.Enmity,{body="Runeist Coat +2",back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},})
	sets.JA.Swordplay = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
	sets.JA.Lunge = set_combine(sets.Lunge,{})
	sets.JA.Pflug = set_combine(sets.Enmity,{feet="Runeist Boots +2"})
	sets.JA.Valiance = set_combine(sets.Enmity,{body="Runeist Coat +2",back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},})
	sets.JA.Embolden = set_combine(sets.Enmity,{legs="Futhark Trousers +1",back={ name="Evasionist's Cape", augments={'Enmity+2','"Embolden"+8','"Dbl.Atk."+5','Damage taken-4%',}},})
	sets.JA.Gambit = set_combine(sets.Enmity,{hands="Runeist's Mitons +2"})
	sets.JA.Liement = set_combine(sets.Enmity,{body="Futhark Coat +2"})
	sets.JA["One For All"] = set_combine(sets.Enmity,{})
	sets.JA["Vivacious Pulse"] = set_combine(sets.Enmity,{ammo="Iron Gobbet",head="Erilaz Galea +1",body="Erilaz Surcoat +1",hands="Kurys Gloves",legs="Rune. Trousers +2",feet="Runeist's Boots +2",
			neck="Incanter's Torque",waist="Bishop's Sash",left_ear="Beatific Earring",right_ear="Etiolation Earring",left_ring="Stikini Ring",right_ring="Stikini Ring",back="Moonbeam Cape",})
	sets.JA.Battuta = set_combine(sets.Battuta,{head="Futhark Bandeau +1"})
	sets.JA.Rayke = set_combine(sets.Enmity,{feet="Futhark Boots +2"})
	sets.JA.Provoke = set_combine(sets.Enmity,{})
	sets.JA.Meditate = set_combine(sets.Enmity,{})
	sets.JA.Hasso = set_combine(sets.Enmity,{})
	sets.JA.Souleater = set_combine(sets.Enmity,{})
	sets.JA["Last Resort"] = set_combine(sets.Enmity,{})
	sets.JA.Sulpor = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Tellus = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Flabra = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Gelus = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Ignis = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Unda = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Tenebrae = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})
	sets.JA.Lux = set_combine(sets.Enmity,{hands="Aya. Manopolas +2",})

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
            back="Moonbeam Cape",
            waist="Chaac Belt",
			feet={ name="Rawhide Boots", augments={'STR+10','Attack+15','"Store TP"+5',}},}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
            right_ear="Enchanter Earring +1",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			body={ name="Taeon Tabard", augments={'"Mag.Atk.Bns."+4','"Fast Cast"+5','VIT+10',}},
			left_ring="Kishar Ring",
			right_ring="Rahab Ring",
			waist="Ninurta's Sash",
			legs="Aya. Cosciales +2",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},}

	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{legs="Futhark Trousers +1"})

	-- Midcast Base Set --
	sets.Midcast = {neck="Incanter's Torque"}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.DT,{})

	-- Utsusemi Midcast Set --
	sets.Midcast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	-- Stun Set --
	sets.Midcast.Stun = set_combine(sets.Precast.FastCast,{})
	
	-- Flash Set --
	sets.Midcast.Flash = set_combine(sets.Enmity,{})

	-- Foil Set --
	sets.Midcast.Foil = set_combine(sets.Enmity,{})	

	-- Crusade Set --
	sets.Midcast.Crusade = set_combine(sets.Enmity,{})	

	-- Aquaveil Set --
	sets.Midcast.Aquaveil = set_combine(sets.Midcast['Enhancing Magic'],{})
	
	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {head="Erilaz Galea +1",left_ear="Augment. Earring",right_ear="Andoaa Earring"
			,neck="Incanter's Torque",hands="Runeist's Mitons +2",waist="Olympus Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			left_ring="Stikini Ring",right_ring="Stikini Ring"}

	-- Stoneskin --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{head="Carmine Mask",left_ear="Earthcry Earring"})

	-- Refresh --
	sets.Midcast.Refresh = set_combine(sets.Midcast['Enhancing Magic'],{head="Erilaz Galea +1",})	
	
	-- Phalanx --
	sets.Midcast.Phalanx = set_combine(sets.Midcast['Enhancing Magic'],{head="Futhark Bandeau +1"})

	-- Regen --
	sets.Midcast.Regen = {head="Rune. Bandeau +2",neck="Incanter's Torque",left_ring="Stikini Ring",right_ring="Stikini Ring"}

	-- Divine Magic --
	sets.Midcast['Divine Magic'] = set_combine(sets.Enmity,{neck="Incanter's Torque",left_ear="Beatific Earring",left_ring="Stikini Ring"
		,right_ring="Stikini Ring",waist="Bishop's Sash",legs="Runeist Tights +2"})

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
            if equipSet[AccArray[AccIndex]] then
                equipSet = equipSet[AccArray[AccIndex]]
            end
				if spell.english == "Vorpal Blade" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Ground Strike" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Savage Blade" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Dimidation" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
				end
				if spell.english == "Resolution" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				end
				if spell.english == "Requiescat" and player.tp > 2941 then
				equipSet = set_combine(equipSet,{left_ear="Regal Earring"})
				end
            equip(equipSet)
        elseif spell.type=="JobAbility" then
            if sets.JA[spell.english] then
                equip(sets.JA[spell.english])
            end
	elseif spell.type == "JobAbility" or spell.type == "Ward" or spell.type == "Effusion" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Rune" then
		equip(sets.Enmity)
		elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
            if string.find(spell.english,'Utsusemi') then
                if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                    cancel_spell()
                    add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
                    return
				else
					equip(sets.Precast.Utsusemi)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
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
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			equipSet = equipSet.Haste
			if spell.target.name == player.name then
				equipSet = set_combine(equipSet,{right_ring="Sheltered Ring"})
			end
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Spikes') then
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif equipSet[spell.skill] then
			equipSet = equipSet[spell.skill]
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
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
	if Armor == 'DT' then
		equip(sets.DT)
	elseif Armor == 'DeathDT' then
		equip(sets.DeathDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Tanking' and equipSet["Tanking"] then
			equipSet = equipSet["Tanking"]
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
		if buffactive.Battuta then
			equipSet = set_combine(equipSet,sets.Battuta)
		end
		if buffactive.Seigan and Seigan == 'ON' then -- Use Seigan Toggle For Seigan TP Set --
			equipSet = set_combine(equipSet,sets.TP.Seigan)
		end
		if buffactive["Third Eye"] and Third_Eye == 'ON' then -- Use Third Eye Toggle For Third Eye TP Set --
			equipSet = set_combine(equipSet,sets.TP["Third Eye"])
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
	if not midaction() then
		status_change(player.status)
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
	elseif command == 'C2' then -- Tanking Toggle --
		if Armor == 'Tanking' then
			Armor = 'None'
			add_to_chat(123,'Tanking Set: [Unlocked]')
		else
			Armor = 'Tanking'
			add_to_chat(158,'Tanking Set: '..AccArray[AccIndex])
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
		set_macro_page(1, 3)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 2)
	else
		set_macro_page(1, 2)
	end
end