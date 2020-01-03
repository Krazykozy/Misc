-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"TP","LowACC","MidACC","HighACC"} -- 4 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. --
	WeaponIndex = 1
	WeaponArray = {"Glanzfaust","Staff","Club"} -- Default Main Weapon Is Glanzfaust. Can Delete Any Weapons That You Don't Own. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Goldsmithing","Fishing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	HP = 'OFF'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
	target_distance = 8 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	okToCast = true
	nextAllowableCast = 0
	currentCast = ''

	sc_map = {SC1="VictorySmite", SC2="Impetus", SC3="Berserk"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}

	-- Idle/Town Sets --
	sets.Idle.Regen = {
			ammo="Staunch Tathlum",
			head="Oce. Headpiece +1",
			body="Hiza. Haramaki +1",
			hands={ name="Hes. Gloves +1", augments={'Enhances "Invigorate" effect',}},
			legs={ name="Hes. Hose +1", augments={'Enhances "Hundred Fists" effect',}},
			feet="Herald's Gaiters",
			neck="Bathy Choker +1",
			waist="Muscle Belt +1",
			left_ear="Infused Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},}
	sets.Idle.Regen.Glanzfaust = set_combine(sets.Idle.Regen,{
			main="Glanzfaust"})
	sets.Idle.Regen.Staff = set_combine(sets.Idle.Regen,{
			main="Blurred Staff"})
	sets.Idle.Regen.Club = set_combine(sets.Idle.Regen,{
			main="Club"})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			waist="Engraved Belt",
		    legs="Mummu Kecks +2",
			feet="Herald's Gaiters"})
	sets.Idle.Movement.Glanzfaust = set_combine(sets.Idle.Movement,{
			main="Glanzfaust"})
	sets.Idle.Movement.Staff = set_combine(sets.Idle.Movement,{
			main="Blurred Staff"})
	sets.Idle.Movement.Club = set_combine(sets.Idle.Movement,{
			main="Club"})

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
		    legs="Mummu Kecks +2",
			feet="Herald's Gaiters"}			
			
	sets.Idle.Fishing = {
			range="Ebisu Fishing Rod",
            ammo="",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Fisher's Torque",
			left_ear="Infused Earring",
			right_ear="Odnowa Earring +1",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			left_ring="Puffin Ring",
			right_ring="Noddy Ring",
			back="Anchoret's Mantle",
			waist="Muscle Belt +1",
			legs="Angler's Hose",
			feet="Waders"}
	sets.Idle.Fishing.Glanzfaust = set_combine(sets.Idle.Fishing,{
			main="Glanzfaust"})
	sets.Idle.Fishing.Staff = set_combine(sets.Idle.Fishing,{
			main="Blurred Staff"})
	sets.Idle.Fishing.Club = set_combine(sets.Idle.Fishing,{
			main="Club"})			

	sets.Idle.HELM = {
			ammo="Staunch Tathlum",
			head="",
			neck="Field Torque",
			left_ear="Infused Earring",
			right_ear="Odnowa Earring +1",
			body="",
			hands="",
			left_ring="",
			right_ring="",
			back="",
			waist="Field Rope",
			legs="",
			feet=""}
	sets.Idle.HELM.Glanzfaust = set_combine(sets.Idle.HELM,{
			main="Glanzfaust"})
	sets.Idle.HELM.Staff = set_combine(sets.Idle.HELM,{
			main="Blurred Staff"})
	sets.Idle.HELM.Club = set_combine(sets.Idle.HELM,{
			main="Club"})

	sets.Idle.D2Ring = {
			ammo="Staunch Tathlum",
            head="Maat's Cap",
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Engraved Belt",
		    legs="Mummu Kecks +2",
			feet="Herald's Gaiters"}
	sets.Idle.D2Ring.Glanzfaust = set_combine(sets.Idle.D2Ring,{
			main="Glanzfaust"})
	sets.Idle.D2Ring.Staff = set_combine(sets.Idle.D2Ring,{
			main="Blurred Staff"})
	sets.Idle.D2Ring.Club = set_combine(sets.Idle.D2Ring,{
			main="Club"})			

	sets.Idle.CpRing = {
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Trizek Ring",
			right_ring="Capacity Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Engraved Belt",
		    legs="Mummu Kecks +2",
			feet="Herald's Gaiters"}
	sets.Idle.CpRing.Glanzfaust = set_combine(sets.Idle.CpRing,{
			main="Glanzfaust"})
	sets.Idle.CpRing.Staff = set_combine(sets.Idle.CpRing,{
			main="Blurred Staff"})
	sets.Idle.CpRing.Club = set_combine(sets.Idle.CpRing,{
			main="Club"})
			
	-- TP Sets --
	sets.TP = {
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Mache Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Epona's Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.TP.LowACC = set_combine(sets.TP,{
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.MidACC = set_combine(sets.TP.LowACC,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Windbuffet Belt +1",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Moonbeam Nodowa",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- Attack TP Set --
	sets.TP.ATT = set_combine(sets.TP,{
			ammo="Ginsen",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			legs="Herculean Trousers"})

	-- March x2 + Haste --
	sets.TP.MidHaste = set_combine(sets.TP,{
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Mache Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Epona's Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.LowACC.MidHaste = set_combine(sets.TP.MidHaste,{
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.MidACC.MidHaste = set_combine(sets.TP.LowACC.MidHaste,{
			ammo="Falcon Eye",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			neck="Moonbeam Nodowa",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

			
	-- March x2 + (Embrava or Haste) --
	sets.TP.HighHaste = {
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Mache Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Windbuffet Belt +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.TP.LowACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Windbuffet Belt +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.LowACC.HighHaste,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Windbuffet Belt +1",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Moonbeam Nodowa",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- March x2 + Haste + Samba --
	sets.TP.HighHaste = {
			left_ear="Mache Earring",
			right_ear="Telos Earring",}
	sets.TP.LowACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Windbuffet Belt +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.LowACC.HighHaste,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Windbuffet Belt +1",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Moonbeam Nodowa",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})


	-- Embrava + (Haste or March) TP Sets --
	sets.TP.EmbravaHaste = {
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Mache Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Epona's Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Windbuffet Belt +1",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.TP.LowACC.EmbravaHaste = set_combine(sets.TP.EmbravaHaste,{
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			waist="Windbuffet Belt +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.MidACC.EmbravaHaste = set_combine(sets.TP.LowACC.EmbravaHaste,{
			ammo="Falcon Eye",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.HighACC.EmbravaHaste = set_combine(sets.TP.MidACC.EmbravaHaste,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Moonbeam Nodowa",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body="Hizamaru Haramaki +2",
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
							
	-- (Impetus Up) TP Sets --
	sets.TP.Impetus = set_combine(sets.TP,{
			ammo="Ginsen",
			left_ear="Mache Earring",
			right_ear="Telos Earring",
			body="Bhikku Cyclas +1",
			hands="Ryuo Tekko",
			legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
			waist="Windbuffet Belt +1"})
	sets.TP.LowACC.Impetus = set_combine(sets.TP.Impetus,{
			ammo="Ginsen",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			body="Bhikku Cyclas +1",
			hands="Ryuo Tekko",
			waist="Windbuffet Belt +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.MidACC.Impetus = set_combine(sets.TP.LowACC.Impetus,{
			ammo="Falcon Eye",
			neck="Moonbeam Nodowa",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Bhikku Cyclas +1",
			hands="Ryuo Tekko",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			waist="Olseni Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})
	sets.TP.HighACC.Impetus = set_combine(sets.TP.MidACC.Impetus,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body="Bhikku Cyclas +1",
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Olseni Belt",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- (Impetus Up) Attack TP Set --
	sets.TP.Impetus.ATT = set_combine(sets.TP.Impetus,{
			ammo="Ginsen",
			hands="Ryuo Tekko",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},})

	-- Hundred Fists TP Set --
	sets.TP.HF = {
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Combatant's Torque",
			left_ear="Zennaroi Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Olseni Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}

	-- Perfect Counter Set --
	sets.TP.PerfectCounter = {head="Tantra Crown +2"}

	-- TP Rancor ON Neck --
	sets.TP.Rancor = {neck="Rancor Collar"}

	-- DT/DeathDT Sets --
	sets.DT = {
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Ethereal Earring",
			right_ear="Genmei Earring",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Engraved Belt",
		    legs="Mummu Kecks +2",
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},}

	sets.DeathDT = set_combine(sets.DT,{
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Sanare Earring",
			right_ear="Etiolation Earring",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Engraved Belt",
		    legs="Mummu Kecks +2",
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})

	-- Hybrid/HP Sets --
	sets.TP.Hybrid = set_combine(sets.DT,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			waist="Engraved Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			waist="Engraved Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Moonbeam Nodowa",
			back="letalis Mantle"})

	sets.HP = set_combine(sets.DT,{
			neck="Loricate Torque +1",
			left_ear="Bloodgem Earring",
			right_ear="Cassie Earring",
			left_ring="Patricius Ring",
			right_ring="K'ayres Ring",
			waist="Engraved Belt",
			back="Anchoret's Mantle"})

	-- WS Base Set --
	sets.WS = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Sherida Earring",
			body="Hizamaru Haramaki +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"}
	sets.WS.LowACC = set_combine(sets.WS,{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
	sets.WS.MidACC = set_combine(sets.WS.LowACC,{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			body="Hizamaru Haramaki +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})

	-- Raging Fists Sets --
	sets.WS["Raging Fists"] = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Sherida Earring",
			body="Hizamaru Haramaki +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Grunfeld Rope",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"}
	sets.WS["Raging Fists"].LowACC = set_combine(sets.WS["Raging Fists"],{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Grunfeld Rope",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
	sets.WS["Raging Fists"].MidACC = set_combine(sets.WS["Raging Fists"].LowACC,{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Fotia Gorget",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Grunfeld Rope",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
	sets.WS["Raging Fists"].HighACC = set_combine(sets.WS["Raging Fists"].MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			body="Hizamaru Haramaki +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Grunfeld Rope",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})

	-- Raging Fists(Attack) Set --
	sets.WS["Raging Fists"].ATT = set_combine(sets.WS["Raging Fists"],{
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
			
	-- Victory Smite Sets --
	sets.WS["Victory Smite"] = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Sherida Earring",
			body="Abnoba Kaftan",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},}
	sets.WS["Victory Smite"].LowACC = set_combine(sets.WS["Victory Smite"],{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})
	sets.WS["Victory Smite"].MidACC = set_combine(sets.WS["Victory Smite"].LowACC,{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
	sets.WS["Victory Smite"].HighACC = set_combine(sets.WS["Victory Smite"].MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			body="Abnoba Kaftan",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})

	-- Victory Smite(Attack) Set --
	sets.WS["Victory Smite"].ATT = set_combine(sets.WS["Victory Smite"],{
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},})

	-- Shijin Spiral Sets --
	sets.WS["Shijin Spiral"] = {
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Fotia Gorget",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body="Hizamaru Haramaki +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs={ name="Herculean Trousers", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','STR+15','Accuracy+6','Attack+4',}},
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	sets.WS["Shijin Spiral"].LowACC = set_combine(sets.WS["Shijin Spiral"],{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			waist="Fotia Belt"})
	sets.WS["Shijin Spiral"].MidACC = set_combine(sets.WS["Shijin Spiral"].LowACC,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			waist="Fotia Belt"})
	sets.WS["Shijin Spiral"].HighACC = set_combine(sets.WS["Shijin Spiral"].MidACC,{
			ammo="Falcon Eye",
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			right_ring="Ramuh Ring +1",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt"})

	-- Shijin Spiral(Attack) Set --
	sets.WS["Shijin Spiral"].ATT = set_combine(sets.WS["Shijin Spiral"],{
			head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands="Hes. Gloves +1"})

	-- Asuran Fists Sets --
	sets.WS["Asuran Fists"] = {
			ammo="Knobkierrie",
			head="Genmei Kabuto",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Terra's Pearl",
			body="Hizamaru Haramaki +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"}
	sets.WS["Asuran Fists"].LowACC = set_combine(sets.WS["Asuran Fists"],{
			right_ring="Titan Ring +1",
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",})
	sets.WS["Asuran Fists"].MidACC = set_combine(sets.WS["Asuran Fists"].LowACC,{
			right_ring="Titan Ring +1",
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",})
	sets.WS["Asuran Fists"].HighACC = set_combine(sets.WS["Asuran Fists"].MidACC,{
			ammo="Falcon Eye",
			head="Genmei Kabuto",
			body="Hizamaru Haramaki +1"})

	sets.WS["Final Heaven"] = {
			ammo="Knobkierrie",
			head="Genmei Kabuto",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Terra's Pearl",
			body="Hizamaru Haramaki +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"}
	sets.WS["Final Heaven"].LowACC = set_combine(sets.WS["Final Heaven"],{
			right_ring="Titan Ring +1",
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
	sets.WS["Final Heaven"].MidACC = set_combine(sets.WS["Final Heaven"].LowACC,{
			right_ring="Titan Ring +1",
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
	sets.WS["Final Heaven"].HighACC = set_combine(sets.WS["Final Heaven"].MidACC,{
			head="Genmei Kabuto",
			ammo="Falcon Eye",
			body="Hizamaru Haramaki +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +1"})

	sets.WS["Ascetic's Fury"] = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
			body="Hizamaru Haramaki +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},}
	sets.WS["Ascetic's Fury"].LowACC = set_combine(sets.WS["Ascetic's Fury"],{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet={ name="Herculean Boots", augments={'Attack+29','Weapon skill damage +2%','STR+14','Accuracy+11',}},})
	sets.WS["Ascetic's Fury"].MidACC = set_combine(sets.WS["Ascetic's Fury"].LowACC,{
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
	sets.WS["Ascetic's Fury"].HighACC = set_combine(sets.WS["Ascetic's Fury"].MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			body="Hizamaru Haramaki +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Hizamaru Hizayoroi +1"})

	-- Ascetic's Fury(Attack) Set --
	sets.WS["Ascetic's Fury"].ATT = set_combine(sets.WS["Ascetic's Fury"],{
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Fotia Gorget",
			body="Hizamaru Haramaki +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"})
			
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
	sets.JA.Provoke = set_combine(sets.Enmity,{})
	sets.JA.Focus = {head="Anchor. Crown +1"}
	sets.JA['Chi Blast'] = {head="Hesychast's Crown",body="Hes. Cyclas +1",hands="Hes. Gloves +1",back="Letalis Mantle",left_ring="Stikini Ring",right_ring="Stikini Ring",}
	sets.JA['Formless Strikes'] = {body="Hes. Cyclas +1"}
	sets.JA['Hundred Fists'] = {legs="Hes. Hose +1"}
	sets.JA.Mantra = {feet="Hes. Gaiters +1"}
	sets.JA.Counterstance = {feet="Hes. Gaiters +1"}
	sets.JA.Dodge = {feet="Anch. Gaiters +1"}
	sets.JA.Boost = {"Anch. Gloves +1"}
	sets.JA.Chakra = {
			ammo="Staunch Tathlum",
			head="Genmei Kabuto",
			left_ear="Terra's Pearl",
			right_ear="Terra's Pearl",
			neck="Unmoving Collar +1",
			body="Anch. Cyclas +1",
			hands="Hes. Gloves +1",
			left_ring="Regal Ring",
			right_ring="Niqmaddu Ring",
			legs="Hizamaru Hizayoroi +2",
			feet="Hizamaru Sune-Ate +1"}

	-- Waltz Set --
	sets.Waltz = {
			ammo="Staunch Tathlum",
            head="Mummu Bonnet +1",
            neck="Unmoving Collar +1",
            left_ear="Terra's Pearl",
            right_ear="Terra's Pearl",
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
			ammo="Impatients",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Orunmila's Torque",
			body="Taeon Tabard",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			waist="Ninurta's Sash",
			feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','DEX+15','Accuracy+14','Attack+10',}},}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.DT,{
			ammo="Impatiens",
			head={ name="Herculean Helm", augments={'Attack+7','Weapon skill damage +4%','STR+9','Accuracy+14',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			body="Taeon Tabard",
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring"})
			
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
	elseif spell.english == 'Impetus' and buffactive.Impetus then -- Change Impetus To Focus When Impetus Is On --
		cancel_spell()
		send_command('Focus')
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
				if spell.english == "Raging Fists" and player.tp > 2941 then -- Equip Mache Earring & Vulcan's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Mache Earring",right_ear="Vulcan's Pearl"})
				end
				if spell.english == "Final Heaven" and player.tp > 2941 then -- Equip Terra's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Terra's Pearl"})
				end
				if spell.english == "Shijin Spiral" and player.tp > 2941 then -- Equip Mache Earring When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
				end
				if spell.english == "Asuran Fists" and player.tp > 2941 then -- Equip Terra's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{left_ear="Terra's Pearl"})
				end
				if spell.english == "Victory Smite" or spell.english == "Ascetic's Fury" then
					if buffactive.Impetus then -- Equip Bhikku Cyclas +1 When You Have Impetus On For Victory Smite or Ascetic's Fury --
						equipSet = set_combine(equipSet,{body="Bhikku Cyclas +1"})
					elseif player.tp > 2941 then -- Equip Vulcan's Pearl When You Have 3000 TP --
						equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
					end
				end
				equip(equipSet)
			end
		elseif spell.type == "JobAbility" then
			if sets.JA[spell.english] then
				equip(sets.JA[spell.english])
			end
		elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
			if string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.Utsusemi)
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
		if HP == 'ON' then
			equip(sets.HP)
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
		if spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
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
end

function aftercast(spell,action)
	if spell.english == currentCast and spell.action_type == 'Interruption' then
		nextAllowableCast = 0
		currentCast= ''
		okToCast = true

	if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Impetus" then -- Impetus Timer --
			timer_impetus()
		elseif spell.english == "Mantra" then -- Mantra Timer/Countdown --
			timer_mantra()
			send_command('wait 170;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /p '..spell.name..': [OFF]')
		end
	if buffactive['doom'] then
		equip(sets['Doom'])
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'DT' then
		equip(sets.DT)
	elseif Armor == 'DeathDT' then
		equip(sets.DeathDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if Attack == 'ON' then
			equipSet = equipSet["ATT"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Impetus and (buffactive.Haste and buffactive.March == 2) and equipSet["Impetus"] then
			equipSet = equipSet["Impetus"]
		end
		if (buffactive.Haste and buffactive.March == 2) and (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste))) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive.Embrava and (buffactive.Haste or buffactive.March) and equipSet["EmbravaHaste"] then
			equipSet = equipSet["EmbravaHaste"]
		end
		if (buffactive.March == 1 and buffactive.Haste and buffactive["Geo-Haste"]) or (buffactive.March == 2) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if buffactive.Impetus and equipSet["Impetus"] then -- For Non Glanzfaust Users: If You Still Want To Use Impetus TP Sets For Whatever Reasons, Just Delete "player.equipment.main == 'Glanzfaust' and" --
			equipSet = equipSet["Impetus"]
		end
		if buffactive['Hundred Fists'] then
			equipSet = set_combine(equipSet,sets.TP.HF)
		end
		if buffactive['Perfect Counter'] then
			equipSet = set_combine(equipSet,sets.TP.PerfectCounter)
		end
		if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
			equipSet = set_combine(equipSet,sets.TP.Rancor)
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
	if HP == 'ON' then
		equip(sets.HP)
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
	elseif buff == 'impetus' and not gain then
		send_command('timers delete "Impetus"')
		add_to_chat(123,'Impetus: [OFF]')
	elseif buff == 'mantra' and not gain then
		send_command('timers delete "Mantra"')
	elseif buff == "inner strength" then -- Inner Strength Timer --
		if gain then
			send_command('timers create "Inner Strength" 30 down')
		else
			send_command('timers delete "Inner Strength"')
			add_to_chat(123,'Inner Strength: [OFF]')
		end
	elseif buff == 'Berserk' and not gain then
		add_to_chat(123,'Berserk: [OFF]')
	elseif buff == 'aggressor' and not gain then
		add_to_chat(123,'Aggressor: [OFF]')
	elseif buff == "perfect defense" then -- PD Timer --
		if gain then
			send_command('timers create "Perfect Defense" 57 down')
		else
			send_command('timers delete "Perfect Defense"')
			add_to_chat(123,'PD: [OFF]')
		end
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
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
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
	elseif command == 'C3' then -- HP Toggle --
		if HP == 'ON' then
			HP = 'OFF'
			add_to_chat(123,'HP Set: [Unlocked]')
		else
			HP = 'ON'
			add_to_chat(158,'HP Set: [locked]')
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
	elseif command == 'C9' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
		else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
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

function timer_impetus()
	local duration = 180
	send_command('timers create "Impetus" '..tostring(duration)..' down')
end

function timer_mantra()
	local duration = 180
	send_command('timers create "Mantra" '..tostring(duration)..' down')
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
		set_macro_page(1, 13)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 14)
	else
		set_macro_page(1, 13)
	end
end