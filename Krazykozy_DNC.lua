-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"TP","LowACC","MidACC","HighACC"} -- 4 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is TP. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Goldsmithing","Fishing","HELM","D2Ring","CpRing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Skillchain = false
	target_distance = 8 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="Exenterator", SC2="FeatherStep", SC3="HasteSamba"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
			sub={ name="Taming Sari", augments={'STR+9','DEX+8','DMG:+14',}},
			ammo="Staunch Tathlum",
			head="Oce. Headpiece +1",
			neck="Bathy Choker +1",
			left_ear="Infused Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Paguroidea Ring",
			right_ring="Sheltered Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Muscle Belt +1",
			legs={ name="Herculean Trousers", augments={'Damage taken-2%','DEX+5','Accuracy+13',}},
			feet="Skd. Jambeaux +1"}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
			sub={ name="Taming Sari", augments={'STR+9','DEX+8','DMG:+14',}},
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Flume Belt +1",
			legs={ name="Herculean Trousers", augments={'Damage taken-2%','DEX+5','Accuracy+13',}},
			feet="Skd. Jambeaux +1"})

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
			legs="Meghanada Chausses +1",
			feet="Skd. Jambeaux +1"}		
			
	sets.Idle.Fishing = {
			main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
			sub={ name="Taming Sari", augments={'STR+9','DEX+8','DMG:+14',}},
			range="Ebisu Fishing Rod",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Fisher's Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			left_ring="Puffin Ring",
			right_ring="Noddy Ring",
			back="",
			waist="Muscle Belt +1",
			legs="Angler's Hose",
			feet="Waders"}

	sets.Idle.HELM = {
			main={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}},
			sub={ name="Taming Sari", augments={'STR+9','DEX+8','DMG:+14',}},
			ammo="Staunch Tathlum",
			head="",
			neck="Field Torque",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			body="",
			hands="",
			left_ring="",
			right_ring="",
			back="",
			waist="Field Rope",
			legs="",
			feet=""}					

	sets.Idle.D2Ring = {
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Dim. Ring (Dem)",
			right_ring="Warp Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Engraved Belt",
			legs={ name="Herculean Trousers", augments={'Damage taken-2%','DEX+5','Accuracy+13',}},
			feet="Skd. Jambeaux +1"}			

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
			legs={ name="Herculean Trousers", augments={'Damage taken-2%','DEX+5','Accuracy+13',}},
			feet="Skd. Jambeaux +1"}
			
	-- Normal TP Sets --
	sets.TP = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Combatant's Torque",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
			left_ring="Petrov Ring",
			right_ring="Epona's Ring",
			back="Letalis Mantle",
			waist="Reiki Yotai",
			legs="Meghanada Chausses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.TP.LowACC = set_combine(sets.TP,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
			left_ring="Petrov Ring",
			right_ring="Epona's Ring",
			back="Letalis Mantle",
			waist="Reiki Yotai",	
			legs="Meghanada Chausses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.MidACC = set_combine(sets.TP.LowACC,{
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
			left_ring="Petrov Ring",
			right_ring="Epona's Ring",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Subtlety Spectacles",
			left_ear="Mache Earring",
			right_ear="Zennaroi Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Grounded Mantle +1",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})

	-- March x2 + Haste --
	sets.TP.MidHaste = set_combine(sets.TP,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			waist="Reiki Yotai",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.LowACC.MidHaste = set_combine(sets.TP.MidACC.Haste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Reiki Yotai",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidACC.Haste,{
			ammo="Seething Bomblet +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Mache Earring",
			right_ear="Zennaroi Earring",
			neck="Subtlety Spectacles",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Grounded Mantle +1",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})

	-- March x2 + Haste + Samba --
	sets.TP.HighHaste = set_combine(sets.TP.MidHaste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Reiki Yotai",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.LowACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Reiki Yotai",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Seething Bomblet +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Mache Earring",
			right_ear="Zennaroi Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Grounded Mantle +1",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})

	-- March x2 + Haste --
	-- Embrava + (March x2 or March + Haste) --
	sets.TP.HighHaste = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Reiki Yotai",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.TP.LowACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Reiki Yotai",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Seething Bomblet +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Mache Earring",
			right_ear="Zennaroi Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Grounded Mantle +1",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})

	-- Embrava + (Haste or March) TP Sets --
	sets.TP.EmbravaHaste = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Reiki Yotai",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.TP.LowACC.EmbravaHaste = set_combine(sets.TP.EmbravaHaste,{
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			neck="Combatant's Torque",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Reiki Yotai",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.MidACC.EmbravaHaste = set_combine(sets.TP.EmbravaHaste,{
			ammo="Seething Bomblet +1",
			neck="Combatant's Torque",
			left_ear="Dignitary's Earring",
			right_ear="Telos Earring",
			body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Petrov Ring",
			right_ring="Chirich Ring",
			waist="Kentarch Belt +1",
			back="Letalis Mantle",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})
	sets.TP.HighACC.EmbravaHaste = set_combine(sets.TP.MidACC.EmbravaHaste,{
			ammo="Falcon Eye",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			left_ear="Mache Earring",
			right_ear="Zennaroi Earring",
			body={ name="Herculean Vest", augments={'Accuracy+28','Attack+26','Accuracy+15 Attack+15','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+30','"Triple Atk."+3','VIT+6','Attack+7',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			waist="Olseni Belt",
			back="Grounded Mantle +1",
			legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},})	

	-- Saber Dance TP Set --
	sets.TP['Saber Dance'] = {legs="Horos Tights"}
	-- Climactic Flourish TP Set --
	sets.TP['Climactic Flourish'] = {head="Charis Tiara +2"}

	-- DT/MDT Sets --
	sets.DT = {
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
			legs={ name="Herculean Trousers", augments={'Damage taken-2%','DEX+5','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},}

	sets.MDT = set_combine(sets.DT,{
			ammo="Staunch Tathlum",
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Engraved Belt",
			legs={ name="Herculean Trousers", augments={'Damage taken-2%','DEX+5','Accuracy+13',}},
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})

	-- Hybrid/Evasion Sets --
	sets.TP.Hybrid = set_combine(sets.DT,{
			head="Felistris Mask",
			left_ear="Heartseeker Earring",
			right_ear="Dudgeon Earring",
			body="Thaumas Coat",
			waist="Windbuffet Belt"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.Evasion = set_combine(sets.DT,{})

	-- WS Base Set --
	sets.WS = {
			ammo="Seething Bomblet +1",
			head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Letalis Mantle",
			waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			feet={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}},}
	sets.WS.LowACC = set_combine(sets.WS,{
			ammo="Seething Bomblet +1",
			head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Letalis Mantle",
			waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			feet={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}},})
	sets.WS.MidACC = set_combine(sets.WS.LowACC,{
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Letalis Mantle"})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle"})

	-- WS Sets --
	sets.WS["Exenterator"] = {
			ammo="Seething Bomblet +1",
			head="Pillager's Bonnet +1",
			neck="Fotia Gorget",
			left_ear="Trux Earring",
			right_ear="Telos Earring",
            body="Meghanada Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Garuda Ring +1",
			right_ring="Epona's Ring",
			back="Letalis Mantle",
			waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.WS["Exenterator"].LowACC = set_combine(sets.WS["Exenterator"],{
			ammo="Seething Bomblet +1",
			waist="Fotia Belt"})
	sets.WS["Exenterator"].MidACC = set_combine(sets.WS["Exenterator"],{
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Letalis Mantle"})
	sets.WS["Exenterator"].HighACC = set_combine(sets.WS["Exenterator"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle"})

	sets.WS["Pyrrhic Kleos"] = {
			ammo="Seething Bomblet +1",
			head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			neck="Fotia Gorget",
			left_ear="Vulcan's Pearl",
			right_ear="Ishvara Earring",
            body="Meghanada Cuirie +2",
			hands="Meghanada Gloves +2",
			left_ring="Shukuyu Ring",
			right_ring="Ifrit Ring",
			back="Bleating Mantle",
			waist="Prosilio Belt +1",
			legs={ name="Herculean Trousers", augments={'Attack+26','Weapon skill damage +3%','DEX+8','Accuracy+10',}},
			feet={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}},}
	sets.WS["Pyrrhic Kleos"].LowACC = set_combine(sets.WS["Pyrrhic Kleos"],{
			ammo="Seething Bomblet +1",
			waist="Fotia Belt"})
	sets.WS["Pyrrhic Kleos"].MidACC = set_combine(sets.WS["Pyrrhic Kleos"],{
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Letalis Mantle"})
	sets.WS["Pyrrhic Kleos"].HighACC = set_combine(sets.WS["Pyrrhic Kleos"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle"})

	sets.WS["Rudra's Storm"] = {
			ammo="Falcon Eye",
			head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meghanada Cuirie +2",
			hands="Meghanada Gloves +2",
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back="Letalis Mantle",
			waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			feet={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}},}
	sets.WS["Rudra's Storm"].LowACC = set_combine(sets.WS["Rudra's Storm"],{
			ammo="Falcon Eye",})
	sets.WS["Rudra's Storm"].MidACC = set_combine(sets.WS["Rudra's Storm"],{
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Letalis Mantle",})
	sets.WS["Rudra's Storm"].HighACC = set_combine(sets.WS["Rudra's Storm"].MidACC,{
			head="Sukeroku Hachimaki"})

	sets.WS["Evisceration"] = {
			ammo="Falcon Eye",
			head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
			body={ name="Herculean Vest", augments={'Crit. hit damage +4%','DEX+10','Accuracy+11','Attack+13',}},
			hands={ name="Herculean Gloves", augments={'Accuracy+16 Attack+16','Crit. hit damage +3%','DEX+7','Attack+15',}},
			left_ring="Ramuh Ring +1",
			right_ring="Ramuh Ring +1",
			back="Letalis Mantle",
			waist="Fotia Belt",
			legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.WS["Evisceration"].LowACC = set_combine(sets.WS["Evisceration"],{
			ammo="Seething Bomblet +1",
			waist="Fotia Belt"})
	sets.WS["Evisceration"].MidACC = set_combine(sets.WS["Evisceration"],{
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Letalis Mantle"})
	sets.WS["Evisceration"].HighACC = set_combine(sets.WS["Evisceration"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle"})
			
	sets.WS["Dancing Edge"] = {
			ammo="Seething Bomblet +1",
			head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
            body="Meghanada Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Letalis Mantle",
			waist="Fotia Belt",
			legs="Meghanada Chausses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.WS["Dancing Edge"].LowACC = set_combine(sets.WS["Dancing Edge"],{
			ammo="Seething Bomblet +1",
			waist="Fotia Belt"})
	sets.WS["Dancing Edge"].MidACC = set_combine(sets.WS["Dancing Edge"],{
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Letalis Mantle"})
	sets.WS["Dancing Edge"].HighACC = set_combine(sets.WS["Dancing Edge"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle"})

	sets.WS["Shark Bite"] = {
			ammo="Seething Bomblet +1",
			head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
            body="Meghanada Cuirie +2",
			hands={ name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back="Letalis Mantle",
			waist="Fotia Belt",
			legs="Meghanada Chausses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}
	sets.WS["Shark Bite"].LowACC = set_combine(sets.WS["Shark Bite"],{
			ammo="Seething Bomblet +1",
			waist="Fotia Belt"})
	sets.WS["Shark Bite"].MidACC = set_combine(sets.WS["Shark Bite"],{
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Letalis Mantle"})
	sets.WS["Shark Bite"].HighACC = set_combine(sets.WS["Shark Bite"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Letalis Mantle"})

	sets.WS["Aeolian Edge"] = {
			ammo="Seething Bomblet +1",
			head={ name="Herculean Helm", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','INT+8','Mag. Acc.+5','"Mag.Atk.Bns."+10',}},
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Samnuha Coat",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Toro Cape",
			waist="Eschan Stone",
			legs="LImbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Mag.Atk.Bns."+13',}},}
	sets.WS["Aeolian Edge"].LowACC = set_combine(sets.WS["Aeolian Edge"],{
			back="Toro Cape"})
	sets.WS["Aeolian Edge"].MidACC = set_combine(sets.WS["Aeolian Edge"],{
			back="Toro Cape"})
	sets.WS["Aeolian Edge"].HighACC = set_combine(sets.WS["Aeolian Edge"].MidACC,{
			head="Sukeroku Hachimaki",
			back="Toro Cape"})				

	-- JA Sets --
	sets.JA = {}
	sets.JA.Trance = {head="Horos Tiara +1"}
	sets.JA['No Foot Rise'] = {legs="Etoile Casaque +2"}

	-- Jig Set --
	sets.Jig = {legs="Etoile Tights +2",feet="Maxixi Toe. +1"}

	-- Step Base Set --
	sets.Step = {}
	sets.Step['Feather Step'] = set_combine(sets.Step,{feet="Charis Shoes +2"})

	-- Samba Set --
	sets.Samba = {head="Maxixi Tiara +1"}

	-- Enmity Set --
	sets.Enmity = {
			ammo="Iron Gobbet",
			left_ear="Cryptic Earring",
			right_ear="Trux Earring",
			neck="Moonbeam Necklace",
			body="Emet Harness +1",
			hands="Kurys Gloves",
			waist="Chaac Belt",
			right_ear="Trux Earring",
			left_ring="Petrov Ring",
			right_ring="Eihwaz Ring",
			back="Reiki Cloak",}			
				
	-- Flourish Base Set --
	sets.Flourish = {}
	sets.Flourish['Reverse Flourish'] = set_combine(sets.Flourish,{hands="Charis Bangles +2"})
	sets.Flourish['Climactic Flourish'] = set_combine(sets.Flourish,{head="Charis Tiara +2"})
	sets.Flourish['Striking Flourish'] = set_combine(sets.Flourish,{body="Charis Casaque +2"})
	sets.Flourish['Violent Flourish'] = set_combine(sets.Flourish)
	sets.Flourish['Desperate Flourish'] = set_combine(sets.Flourish)
	sets.Flourish['Wild Flourish'] = set_combine(sets.Flourish)

	sets.Skillchain = {hands="Charis Bangles +2"}

	-- Waltz Set --
	sets.Waltz = {
			ammo="Iron Gobbet",
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
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Orunmila's Torque",
			body="Taeon Tabard",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			waist="Ninurta's Sash",
			legs="Enif Cosciales",
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}

	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = {
			ammo="Impatients",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Magoraga Beads",
			body="Passion Jacket",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			legs="Enif Cosciales",
			waist="Ninurta's Sash",
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}

	sets.Midcast = {}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast)
	sets.Midcast.FastCast = {
			ammo="Impatients",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Orunmila's Torque",
			body="Taeon Tabard",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			legs="Enif Cosciales",
			waist="Ninurta's Sash",
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}

	sets.Midcast.Utsusemi = {
			ammo="Impatients",
			head={ name="Herculean Helm", augments={'Accuracy+16 Attack+16','"Triple Atk."+4','STR+9','Accuracy+7','Attack+13',}},
			neck="Magoraga Beads",
			body="Passion Jacket",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			legs="Enif Cosciales",
			waist="Ninurta's Sash",
			feet={ name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','DEX+6','Accuracy+15','Attack+11',}},}

end

function pretarget(spell, action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then
		cancel_spell()
		send_command('Aggressor')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell, action)
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
			if Skillchain then
				equipSet = set_combine(equipSet,sets.Skillchain)
			end
			if spell.english == "Evisceration" and player.tp > 299 then
				equipSet = set_combine(equipSet,{left_ear="Jupiter's Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			if spell.english == 'Trance' and buffactive['Saber Dance'] then
				cast_delay(0.2)
				send_command('cancel Saber Dance')
			end
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
	elseif spell.type == "Step" then
		if not buffactive.Presto then
			if not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] then
				add_to_chat(158,'Current Step: ['..spell.english..']')
				cancel_spell()
				add_to_chat(158,'No Presto Up - Popping Presto!')
				send_command('Presto;wait 2;//'..spell.name)
			else
				add_to_chat(123,'Skipping Presto.')
			end
		elseif sets.Step[spell.english] then
			equip(sets.Step[spell.english])
		else
			equip(sets.Step)
		end
	elseif spell.type == "Waltz" then
		if buffactive['Saber Dance'] then
			cast_delay(0.2)
			send_command('cancel Saber Dance')
		end
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.type == "Jig" then
		if spell.english == 'Spectral Jig' and buffactive.Sneak then
			cast_delay(0.2)
			send_command('cancel Sneak')
		end
		equip(sets.Jig)
	elseif spell.type == 'Samba' then
		if buffactive['Fan Dance'] then
			cast_delay(0.2)
			send_command('cancel Fan Dance')
		end
		equip(sets.Samba)
	elseif string.find(spell.type,'Flourish') then
		if sets.Flourish[spell.english] then
			equip(sets.Flourish[spell.english])
		end

		spam_protection_on(spell)
	else
		cancel_spell()
	end
end

function midcast(spell, action)
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
			equip(sets.Midcast.Haste)
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell, action)
	if not spell.interrupted then
		if spell.english == "Wild Flourish" then
			Skillchain = true
			send_command('wait 7;gs c clear Skillchain')
		elseif spell.type == "WeaponSkill" then
			Skillchain = not Skillchain
			send_command('wait 0.2;gs c TP;wait 7;gs c clear Skillchain')
		elseif spell.english == 'Geo-Haste' then
			timer_haste_samba()
		else
			status_change(player.status)
		end
	end
end

function status_change(new,old)
	if Armor == 'DT' then
		equip(sets.DT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
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
		if (buffactive.Embrava and buffactive['Mighty Guard'] and (buffactive.Haste or buffactive.March) and buffactive['Geo-Haste']) or (buffactive.March == 2 and buffactive.Haste and buffactive['Geo-Haste'] and buffactive['Geo-Haste']) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if (buffactive.Embrava and buffactive['Mighty Guard'] and (buffactive.Haste or buffactive.March or buffactive['Geo-Haste'])) or (buffactive.March == 1 and buffactive.Haste and buffactive['Geo-Haste'] and equipSet["EmbravaHaste"]) or (buffactive.March == 2 and (buffactive.Haste or buffactive['Geo-Haste'] and buffactive['Geo-Haste'])) and equipSet["EmbravaHaste"] then
			equipSet = equipSet["EmbravaHaste"]
		end
		if buffactive['Saber Dance'] then
			equipSet = set_combine(equipSet,sets.TP['Saber Dance'])
		end
		if buffactive['Climactic Flourish'] then
			equipSet = set_combine(equipSet,sets.TP['Climactic Flourish'])
		end
		equip(equipSet)
	else
		equip(sets.Idle[IdleArray[IdleIndex]])
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
	elseif buff == 'haste samba' and not gain then
		send_command('timers delete "Geo-Haste"')
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
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
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Evasion Toggle --
		if Armor == 'EVA' then
			Armor = 'None'
			add_to_chat(123,'Evasion Set: [Unlocked]')
		else
			Armor = 'EVA'
			add_to_chat(158,'Evasion Set: [Locked]')
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

function timer_haste_samba()
	local duration = 90

	if player.main_job == 'DNC' then
		if player.equipment.head == "Dancer's Tiara" or player.equipment.head == "Dancer's Tiara +1" then
			duration = duration + 30
		elseif player.equipment.head == 'Maxixi Tiara' then
			duration = duration + 40
		elseif player.equipment.head == 'Maxixi Tiara +1' then
			duration = duration + 45
		end

		if buffactive['Saber Dance'] then
			local merits = player.merits.saber_dance
			if merits > 1 then
				local extend = (merits - 1) * 5
				duration = math.floor(duration + (duration * extend / 100))
			end
		end
	end

	send_command('timers create "Geo-Haste" '..tostring(duration)..' down abilities/00216.png')
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
		if player.main_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 200 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 600 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			elseif missingHP < 1100 then
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			elseif missingHP < 1500 then
				newWaltz = 'Curing Waltz IV'
				waltzID = 193
			else
				newWaltz = 'Curing Waltz V'
				waltzID = 311
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
		set_macro_page(1, 8)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 8)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 8)
	else
		set_macro_page(1, 8)
	end
end