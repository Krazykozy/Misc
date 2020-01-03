-- ** I Use Some of Motenten's Functions ** --
-- Last Updated: 05/02/14 8:00 PM ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"GreatAxe","Greatsword","Sword","Axe","Polearm"} -- Default Main Weapon Is GreatAxe. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Rancor = 'ON' -- Set Default Rancor ON or OFF Here --
	BloodRage = 'ON' -- Set Default BloodRage ON or OFF Here --
	Retaliation = 'OFF' -- Set Default Retaliation ON or OFF Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="UkkosFury", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			ammo="Angha Gem",
			head="Adaman Barbuta",
			neck="Wiglen Gorget",
			left_ear="Black Earring",
			right_ear="Dawn Earring",
			body="Kumarbi's Akar",
			hands="Cizin Mufflers +1",
			left_ring="Sheltered Ring",
			right_ring="Paguroidea Ring",
			back="Repulse Mantle",
			waist="Lycopodium Sash",
			legs="Pumm. Cuisses +1",
			feet="Kaiser Schuhs"}
	sets.Idle.Regen.GreatAxe = set_combine(sets.Idle.Regen,{
			main={ name="Aganoshe", augments={'Phys. dmg. taken -3%','STR+14','Accuracy+20','Attack+18','DMG:+16',}},
			sub="Bloodrain Strap"})
	sets.Idle.Regen.Greatsword = set_combine(sets.Idle.Regen,{
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Bloodrain Strap"})
	sets.Idle.Regen.Sword = set_combine(sets.Idle.Regen,{
			main="Tanmogayi +1",
			sub="Genmei Shield"})
	sets.Idle.Regen.Axe = set_combine(sets.Idle.Regen,{
			main="Tramontane Axe",
			sub="Genmei Shield"})
	sets.Idle.Regen.Polearm = set_combine(sets.Idle.Regen,{
			main="Blurred Lance",
			sub="Bloodrain Strap"})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			ammo="Iron Gobbet",
			head="Sulevia's Mask +1",
			body="Chozor. Coselete",
			hands="Sulev. Gauntlets +1",
			legs="Sulevi. Cuisses +1",
			feet="Hermes' Sandals",
			neck="Loricate Torque +1",
			waist="Sarissapho. Belt",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			left_ring="Succor Ring",
			right_ring="Defending Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},})
	sets.Idle.Movement.GreatAxe = set_combine(sets.Idle.Movement,{
			main={ name="Aganoshe", augments={'Phys. dmg. taken -3%','STR+14','Accuracy+20','Attack+18','DMG:+16',}},
			sub="Bloodrain Strap"})
	sets.Idle.Movement.Greatsword = set_combine(sets.Idle.Movement,{
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Bloodrain Strap"})
	sets.Idle.Regen.Sword = set_combine(sets.Idle.Regen,{
			main="Tanmogayi +1",
			sub="Genmei Shield"})
	sets.Idle.Regen.Axe = set_combine(sets.Idle.Regen,{
			main="Tramontane Axe",
			sub="Genmei Shield"})
	sets.Idle.Regen.Polearm = set_combine(sets.Idle.Regen,{
			main="Blurred Lance",
			sub="Bloodrain Strap"})

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- GreatAxe(AM3 Down) TP Sets --
	sets.TP.GreatAxe = {
			main={ name="Aganoshe", augments={'Phys. dmg. taken -3%','STR+14','Accuracy+20','Attack+18','DMG:+16',}},
			sub="Bloodrain Strap",
			ammo="Yetshila +1",
			head="Felistris Mask",
			neck="Asperity Necklace",
			left_ear="Trux Earring",
			right_ear="Brutal Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands="Cizin Mufflers +1",
			left_ring="K'ayres Ring",
			right_ring="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt",
			legs="Agoge Cuisses +1",
			feet="Huginn Gambieras"}
	sets.TP.GreatAxe.MidACC = set_combine(sets.TP.GreatAxe,{
			ammo="Ginsen",
			head="Yaoyotl Helm",
			neck="Iqabi Necklace",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			waist="Anguinus Belt"})
	sets.TP.GreatAxe.HighACC = set_combine(sets.TP.GreatAxe.MidACC,{
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			left_ring="Mars's Ring"})

	-- GreatAxe(AM3 Up) TP Sets --
	sets.TP.GreatAxe.AM3 = set_combine(sets.TP.GreatAxe,{
			left_ear="Tripudio Earring",
			right_ear="Brutal Earring"})
	sets.TP.GreatAxe.MidACC.AM3 = set_combine(sets.TP.GreatAxe.AM3,{
			ammo="Ginsen",
			head="Yaoyotl Helm",
			neck="Iqabi Necklace",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			waist="Anguinus Belt"})
	sets.TP.GreatAxe.HighACC.AM3 = set_combine(sets.TP.GreatAxe.MidACC.AM3,{
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			left_ring="Mars's Ring",
			back="Mauler's Mantle"})

	-- GreatAxe(AM3 Down: Restraint) TP Sets --
	sets.TP.GreatAxe.Restraint = set_combine(sets.TP.GreatAxe,{})
	sets.TP.GreatAxe.MidACC.Restraint = set_combine(sets.TP.GreatAxe.MidACC,{})
	sets.TP.GreatAxe.HighACC.Restraint = set_combine(sets.TP.GreatAxe.HighACC,{})

	-- GreatAxe(AM3 Up: Restraint) TP Sets --
	sets.TP.GreatAxe.AM3.Restraint = set_combine(sets.TP.GreatAxe.AM3,{})
	sets.TP.GreatAxe.MidACC.AM3.Restraint = set_combine(sets.TP.GreatAxe.MidACC.AM3,{})
	sets.TP.GreatAxe.HighACC.AM3.Restraint = set_combine(sets.TP.GreatAxe.HighACC.AM3,{})

	-- GreatAxe(AM3 Down: Ionis) TP Sets --
	sets.TP.GreatAxe.Ionis = set_combine(sets.TP.GreatAxe,{})
	sets.TP.GreatAxe.MidACC.Ionis = set_combine(sets.TP.GreatAxe.MidACC,{})
	sets.TP.GreatAxe.HighACC.Ionis = set_combine(sets.TP.GreatAxe.HighACC,{})

	-- GreatAxe(AM3 Up: Ionis) TP Sets --
	sets.TP.GreatAxe.AM3.Ionis = set_combine(sets.TP.GreatAxe.AM3,{})
	sets.TP.GreatAxe.MidACC.AM3.Ionis = set_combine(sets.TP.GreatAxe.MidACC.AM3,{})
	sets.TP.GreatAxe.HighACC.AM3.Ionis = set_combine(sets.TP.GreatAxe.HighACC.AM3,{})

	-- GreatAxe(AM3 Down: Restraint + Ionis) TP Sets --
	sets.TP.GreatAxe.Restraint.Ionis = set_combine(sets.TP.GreatAxe,{})
	sets.TP.GreatAxe.MidACC.Restraint.Ionis = set_combine(sets.TP.GreatAxe.MidACC,{})
	sets.TP.GreatAxe.HighACC.Restraint.Ionis = set_combine(sets.TP.GreatAxe.HighACC,{})

	-- GreatAxe(AM3 Up: Restraint + Ionis) TP Sets --
	sets.TP.GreatAxe.AM3.Restraint.Ionis = set_combine(sets.TP.GreatAxe.AM3,{})
	sets.TP.GreatAxe.MidACC.AM3.Restraint.Ionis = set_combine(sets.TP.GreatAxe.MidACC.AM3,{})
	sets.TP.GreatAxe.HighACC.AM3.Restraint.Ionis = set_combine(sets.TP.GreatAxe.HighACC.AM3,{})

	-- GreatAxe(AM3 Down: SAM Roll) TP Sets --
	sets.TP.GreatAxe.STP = set_combine(sets.TP.GreatAxe,{})
	sets.TP.GreatAxe.MidACC.STP = set_combine(sets.TP.GreatAxe.MidACC,{})
	sets.TP.GreatAxe.HighACC.STP = set_combine(sets.TP.GreatAxe.HighACC,{})

	-- GreatAxe(AM3 Up: SAM Roll) TP Sets --
	sets.TP.GreatAxe.AM3.STP = set_combine(sets.TP.GreatAxe.AM3,{})
	sets.TP.GreatAxe.MidACC.AM3.STP = set_combine(sets.TP.GreatAxe.MidACC.AM3,{})
	sets.TP.GreatAxe.HighACC.AM3.STP = set_combine(sets.TP.GreatAxe.HighACC.AM3,{})

	-- GreatAxe(AM3 Down: Restraint + SAM Roll) TP Sets --
	sets.TP.GreatAxe.Restraint.STP = set_combine(sets.TP.GreatAxe,{})
	sets.TP.GreatAxe.MidACC.Restraint.STP = set_combine(sets.TP.GreatAxe.MidACC,{})
	sets.TP.GreatAxe.HighACC.Restraint.STP = set_combine(sets.TP.GreatAxe.HighACC,{})

	-- GreatAxe(AM3 Up: Restraint + SAM Roll) TP Sets --
	sets.TP.GreatAxe.AM3.Restraint.STP = set_combine(sets.TP.GreatAxe.AM3,{})
	sets.TP.GreatAxe.MidACC.AM3.Restraint.STP = set_combine(sets.TP.GreatAxe.MidACC.AM3,{})
	sets.TP.GreatAxe.HighACC.AM3.Restraint.STP = set_combine(sets.TP.GreatAxe.HighACC.AM3,{})

	-- GreatAxe(AM3 Down: Ionis + SAM Roll) TP Sets --
	sets.TP.GreatAxe.Ionis.STP = set_combine(sets.TP.GreatAxe,{})
	sets.TP.GreatAxe.MidACC.Ionis.STP = set_combine(sets.TP.GreatAxe.MidACC,{})
	sets.TP.GreatAxe.HighACC.Ionis.STP = set_combine(sets.TP.GreatAxe.HighACC,{})

	-- GreatAxe(AM3 Up: Ionis + SAM Roll) TP Sets --
	sets.TP.GreatAxe.AM3.Ionis.STP = set_combine(sets.TP.GreatAxe.AM3,{})
	sets.TP.GreatAxe.MidACC.AM3.Ionis.STP = set_combine(sets.TP.GreatAxe.MidACC.AM3,{})
	sets.TP.GreatAxe.HighACC.AM3.Ionis.STP = set_combine(sets.TP.GreatAxe.HighACC.AM3,{})

	-- GreatAxe(AM3 Down: Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.GreatAxe.Restraint.Ionis.STP = set_combine(sets.TP.GreatAxe,{})
	sets.TP.GreatAxe.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.GreatAxe.MidACC,{})
	sets.TP.GreatAxe.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.GreatAxe.HighACC,{})

	-- GreatAxe(AM3 Up: Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.GreatAxe.AM3.Restraint.Ionis.STP = set_combine(sets.TP.GreatAxe.AM3,{})
	sets.TP.GreatAxe.MidACC.AM3.Restraint.Ionis.STP = set_combine(sets.TP.GreatAxe.MidACC.AM3,{})
	sets.TP.GreatAxe.HighACC.AM3.Restraint.Ionis.STP = set_combine(sets.TP.GreatAxe.HighACC.AM3,{})

	-- Greatsword TP Sets --
	sets.TP.Greatsword = {
			main={ name="Zulfiqar", augments={'Haste+1','STR+13','Accuracy+21','Attack+22','DMG:+27',}},
			sub="Bloodrain Strap",
			ammo="Ginsen",
			head="Felistris Mask",
			neck="Asperity Necklace",
			left_ear="Trux Earring",
			right_ear="Brutal Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands="Cizin Mufflers",
			left_ring="K'ayres Ring",
			right_ring="Rajas Ring",
			back="Mauler's Mantle",
			waist="Cetl Belt",
			legs="Pumm. Cuisses +1",
			feet="Pumm. Calligae +1"}
	sets.TP.Greatsword.MidACC = set_combine(sets.TP.Greatsword,{
			head="Yaoyotl Helm",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			waist="Dynamic Belt +1",
			feet="Whirlpool Greaves"})
	sets.TP.Greatsword.HighACC = set_combine(sets.TP.Greatsword.MidACC,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			left_ring="Patricius Ring",
			right_ring="Mars's Ring"})

	-- Greatsword(Restraint) TP Sets --
	sets.TP.Greatsword.Restraint = set_combine(sets.TP.Greatsword,{})
	sets.TP.Greatsword.MidACC.Restraint = set_combine(sets.TP.Greatsword.MidACC,{})
	sets.TP.Greatsword.HighACC.Restraint = set_combine(sets.TP.Greatsword.HighACC,{})

	-- Greatsword(Ionis) TP Sets --
	sets.TP.Greatsword.Ionis = set_combine(sets.TP.Greatsword,{})
	sets.TP.Greatsword.MidACC.Ionis= set_combine(sets.TP.Greatsword.MidACC,{})
	sets.TP.Greatsword.HighACC.Ionis = set_combine(sets.TP.Greatsword.HighACC,{})

	-- Greatsword(Restraint + Ionis) TP Sets --
	sets.TP.Greatsword.Restraint.Ionis = set_combine(sets.TP.Greatsword,{})
	sets.TP.Greatsword.MidACC.Restraint.Ionis = set_combine(sets.TP.Greatsword.MidACC,{})
	sets.TP.Greatsword.HighACC.Restraint.Ionis = set_combine(sets.TP.Greatsword.HighACC,{})

	-- Greatsword(SAM Roll) TP Sets --
	sets.TP.Greatsword.STP = set_combine(sets.TP.Greatsword,{})
	sets.TP.Greatsword.MidACC.STP = set_combine(sets.TP.Greatsword.MidACC,{})
	sets.TP.Greatsword.HighACC.STP = set_combine(sets.TP.Greatsword.HighACC,{})

	-- Greatsword(Restraint + SAM Roll) TP Sets --
	sets.TP.Greatsword.Restraint.STP = set_combine(sets.TP.Greatsword,{})
	sets.TP.Greatsword.MidACC.Restraint.STP = set_combine(sets.TP.Greatsword.MidACC,{})
	sets.TP.Greatsword.HighACC.Restraint.STP = set_combine(sets.TP.Greatsword.HighACC,{})

	-- Greatsword(Ionis + SAM Roll) TP Sets --
	sets.TP.Greatsword.Ionis.STP = set_combine(sets.TP.Greatsword,{})
	sets.TP.Greatsword.MidACC.Ionis.STP = set_combine(sets.TP.Greatsword.MidACC,{})
	sets.TP.Greatsword.HighACC.Ionis.STP = set_combine(sets.TP.Greatsword.HighACC,{})

	-- Greatsword(Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Greatsword.Restraint.Ionis.STP = set_combine(sets.TP.Greatsword,{})
	sets.TP.Greatsword.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Greatsword.MidACC,{})
	sets.TP.Greatsword.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Greatsword.HighACC,{})

	-- Sword TP Sets --
	sets.TP.Sword = {
			main="Tanmogayi +1",
			sub="Genmei Shield"
			ammo="Ginsen",
			head="Felistris Mask",
			neck="Portus Collar",
			left_ear="Trux Earring",
			right_ear="Brutal Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands="Cizin Mufflers",
			left_ring="K'ayres Ring",
			right_ring="Rajas Ring",
			back="Mauler's Mantle",
			waist="Windbuffet Belt",
			legs="Pumm. Cuisses +1",
			feet="Huginn Gambieras"}
	sets.TP.Sword.MidACC = set_combine(sets.TP.Sword,{
			head="Yaoyotl Helm",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			waist="Dynamic Belt +1"})
	sets.TP.Sword.HighACC = set_combine(sets.TP.Sword.MidACC,{
			neck="Iqabi Necklace",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			left_ring="Patricius Ring",
			right_ring="Mars's Ring",
			feet="Whirlpool Greaves"})

	-- Sword(Restraint) TP Sets --
	sets.TP.Sword.Restraint = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.Restraint = set_combine(sets.TP.Sword.MidACC,{})
	sets.TP.Sword.HighACC.Restraint = set_combine(sets.TP.Sword.HighACC,{})

	-- Sword(Ionis) TP Sets --
	sets.TP.Sword.Ionis = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.Ionis = set_combine(sets.TP.Sword.MidACC,{})
	sets.TP.Sword.HighACC.Ionis = set_combine(sets.TP.Sword.HighACC,{})

	-- Sword(Restraint + Ionis) TP Sets --
	sets.TP.Sword.Restraint.Ionis = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.Restraint.Ionis = set_combine(sets.TP.Sword.MidACC,{})
	sets.TP.Sword.HighACC.Restraint.Ionis = set_combine(sets.TP.Sword.HighACC,{})

	-- Sword(SAM Roll) TP Sets --
	sets.TP.Sword.STP = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.STP = set_combine(sets.TP.Sword.MidACC,{})
	sets.TP.Sword.HighACC.STP = set_combine(sets.TP.Sword.HighACC,{})

	-- Sword(Restraint + SAM Roll) TP Sets --
	sets.TP.Sword.Restraint.STP = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.Restraint.STP = set_combine(sets.TP.Sword.MidACC,{})
	sets.TP.Sword.HighACC.Restraint.STP = set_combine(sets.TP.Sword.HighACC,{})

	-- Sword(Ionis + SAM Roll) TP Sets --
	sets.TP.Sword.Ionis.STP = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.Ionis.STP = set_combine(sets.TP.Sword.MidACC,{})
	sets.TP.Sword.HighACC.Ionis.STP = set_combine(sets.TP.Sword.HighACC,{})

	-- Sword(Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Sword.Restraint.Ionis.STP = set_combine(sets.TP.Sword,{})
	sets.TP.Sword.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Sword.MidACC,{})
	sets.TP.Sword.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Sword.HighACC,{})

	-- Axe(AM Down) TP Sets --
	sets.TP.Axe = {
			main="Tramontane Axe",
			sub="Bloodrain Strap",
			ammo="Ginsen",
			head="Felistris Mask",
			neck="Asperity Necklace",
			left_ear="Trux Earring",
			right_ear="Brutal Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands="Cizin Mufflers +1",
			left_ring="K'ayres Ring",
			right_ring="Rajas Ring",
			back="Mauler's Mantle",
			waist="Cetl Belt",
			legs="Pumm. Cuisses +1",
			feet="Mikinaak Greaves"}
	sets.TP.Axe.MidACC = set_combine(sets.TP.Axe,{
			head="Yaoyotl Helm",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			waist="Dynamic Belt +1"})
	sets.TP.Axe.HighACC = set_combine(sets.TP.Axe.MidACC,{
			neck="Ziel Charm",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			left_ring="Patricius Ring",
			right_ring="Mars's Ring",
			feet="Whirlpool Greaves"})

	-- Axe(AM Up) TP Sets --
	sets.TP.Axe.AM = set_combine(sets.TP.Axe,{
			ammo="Angha Gem",
			head="Yaoyotl Helm",
			neck="Twilight Torque",
			left_ring="Defending Ring",
			back="Mollusca Mantle",
			waist="Pya'ekue Belt +1"})
	sets.TP.Axe.MidACC.AM = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.HighACC.AM = set_combine(sets.TP.Axe.MidACC.AM,{})

	-- Axe(AM Down: Restraint) TP Sets --
	sets.TP.Axe.Restraint = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Restraint = set_combine(sets.TP.Axe.Restraint,{})
	sets.TP.Axe.HighACC.Restraint = set_combine(sets.TP.Axe.MidACC.Restraint,{})

	-- Axe(AM Up: Restraint) TP Sets --
	sets.TP.Axe.AM.Restraint = set_combine(sets.TP.Axe.Restraint,{})
	sets.TP.Axe.MidACC.AM.Restraint = set_combine(sets.TP.Axe.AM.Restraint,{})
	sets.TP.Axe.HighACC.AM.Restraint = set_combine(sets.TP.Axe.MidACC.AM.Restraint,{})

	-- Axe(AM Down: Ionis) TP Sets --
	sets.TP.Axe.Ionis = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Ionis = set_combine(sets.TP.Axe.Ionis,{})
	sets.TP.Axe.HighACC.Ionis = set_combine(sets.TP.Axe.MidACC.Ionis,{})

	-- Axe(AM Up: Ionis) TP Sets --
	sets.TP.Axe.AM.Ionis = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.Ionis = set_combine(sets.TP.Axe.AM.Ionis,{})
	sets.TP.Axe.HighACC.AM.Ionis = set_combine(sets.TP.Axe.MidACC.AM.Ionis,{})

	-- Axe(AM Down: Restraint + Ionis) TP Sets --
	sets.TP.Axe.Restraint.Ionis = set_combine(sets.TP.Axe.Restraint,{})
	sets.TP.Axe.MidACC.Restraint.Ionis = set_combine(sets.TP.Axe.Restraint.Ionis,{})
	sets.TP.Axe.HighACC.Restraint.Ionis = set_combine(sets.TP.Axe.MidACC.Restraint.Ionis,{})

	-- Axe(AM Up: Restraint + Ionis) TP Sets --
	sets.TP.Axe.AM.Restraint.Ionis = set_combine(sets.TP.Axe.AM.Restraint,{})
	sets.TP.Axe.MidACC.AM.Restraint.Ionis = set_combine(sets.TP.Axe.AM.Restraint.Ionis,{})
	sets.TP.Axe.HighACC.AM.Restraint.Ionis = set_combine(sets.TP.Axe.MidACC.AM.Restraint.Ionis,{})

	-- Axe(AM Down: SAM Roll) TP Sets --
	sets.TP.Axe.STP = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.STP = set_combine(sets.TP.Axe.MidACC,{})
	sets.TP.Axe.HighACC.STP = set_combine(sets.TP.Axe.HighACC,{})

	-- Axe(AM Up: SAM Roll) TP Sets --
	sets.TP.Axe.AM.STP = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.STP = set_combine(sets.TP.Axe.MidACC.AM,{})
	sets.TP.Axe.HighACC.AM.STP = set_combine(sets.TP.Axe.HighACC.AM,{})

	-- Axe(AM Down: Restraint + SAM Roll) TP Sets --
	sets.TP.Axe.Restraint.STP = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Restraint.STP = set_combine(sets.TP.Axe.MidACC,{})
	sets.TP.Axe.HighACC.Restraint.STP = set_combine(sets.TP.Axe.HighACC,{})

	-- Axe(AM Up: Restraint + SAM Roll) TP Sets --
	sets.TP.Axe.AM.Restraint.STP = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.Restraint.STP = set_combine(sets.TP.Axe.MidACC.AM,{})
	sets.TP.Axe.HighACC.AM.Restraint.STP = set_combine(sets.TP.Axe.HighACC.AM,{})

	-- Axe(AM Down: Ionis + SAM Roll) TP Sets --
	sets.TP.Axe.Ionis.STP = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Ionis.STP = set_combine(sets.TP.Axe.MidACC,{})
	sets.TP.Axe.HighACC.Ionis.STP = set_combine(sets.TP.Axe.HighACC,{})

	-- Axe(AM Up: Ionis + SAM Roll) TP Sets --
	sets.TP.Axe.AM.Ionis.STP = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.Ionis.STP = set_combine(sets.TP.Axe.MidACC.AM,{})
	sets.TP.Axe.HighACC.AM.Ionis.STP = set_combine(sets.TP.Axe.HighACC.AM,{})

	-- Axe(AM Down: Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Axe.Restraint.Ionis.STP = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Axe.MidACC,{})
	sets.TP.Axe.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Axe.HighACC,{})

	-- Axe(AM Up: Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Axe.AM.Restraint.Ionis.STP = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.Restraint.Ionis.STP = set_combine(sets.TP.Axe.MidACC.AM,{})
	sets.TP.Axe.HighACC.AM.Restraint.Ionis.STP = set_combine(sets.TP.Axe.HighACC.AM,{})

	-- Axe(AM Down) TP Sets --
	sets.TP.Axe = {
			main="Tramontane Axe",
			sub="Bloodrain Strap",
			ammo="Ginsen",
			head="Felistris Mask",
			neck="Asperity Necklace",
			left_ear="Trux Earring",
			right_ear="Brutal Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands="Cizin Mufflers +1",
			left_ring="K'ayres Ring",
			right_ring="Rajas Ring",
			back="Mauler's Mantle",
			waist="Cetl Belt",
			legs="Pumm. Cuisses +1",
			feet="Mikinaak Greaves"}
	sets.TP.Axe.MidACC = set_combine(sets.TP.Axe,{
			head="Yaoyotl Helm",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			waist="Dynamic Belt +1"})
	sets.TP.Axe.HighACC = set_combine(sets.TP.Axe.MidACC,{
			neck="Ziel Charm",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			left_ring="Patricius Ring",
			right_ring="Mars's Ring",
			feet="Whirlpool Greaves"})

	-- Axe(AM Up) TP Sets --
	sets.TP.Axe.AM = set_combine(sets.TP.Axe,{
			ammo="Angha Gem",
			head="Yaoyotl Helm",
			neck="Twilight Torque",
			left_ring="Defending Ring",
			back="Mollusca Mantle",
			waist="Pya'ekue Belt +1"})
	sets.TP.Axe.MidACC.AM = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.HighACC.AM = set_combine(sets.TP.Axe.MidACC.AM,{})

	-- Axe(AM Down: Restraint) TP Sets --
	sets.TP.Axe.Restraint = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Restraint = set_combine(sets.TP.Axe.Restraint,{})
	sets.TP.Axe.HighACC.Restraint = set_combine(sets.TP.Axe.MidACC.Restraint,{})

	-- Axe(AM Up: Restraint) TP Sets --
	sets.TP.Axe.AM.Restraint = set_combine(sets.TP.Axe.Restraint,{})
	sets.TP.Axe.MidACC.AM.Restraint = set_combine(sets.TP.Axe.AM.Restraint,{})
	sets.TP.Axe.HighACC.AM.Restraint = set_combine(sets.TP.Axe.MidACC.AM.Restraint,{})

	-- Axe(AM Down: Ionis) TP Sets --
	sets.TP.Axe.Ionis = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Ionis = set_combine(sets.TP.Axe.Ionis,{})
	sets.TP.Axe.HighACC.Ionis = set_combine(sets.TP.Axe.MidACC.Ionis,{})

	-- Axe(AM Up: Ionis) TP Sets --
	sets.TP.Axe.AM.Ionis = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.Ionis = set_combine(sets.TP.Axe.AM.Ionis,{})
	sets.TP.Axe.HighACC.AM.Ionis = set_combine(sets.TP.Axe.MidACC.AM.Ionis,{})

	-- Axe(AM Down: Restraint + Ionis) TP Sets --
	sets.TP.Axe.Restraint.Ionis = set_combine(sets.TP.Axe.Restraint,{})
	sets.TP.Axe.MidACC.Restraint.Ionis = set_combine(sets.TP.Axe.Restraint.Ionis,{})
	sets.TP.Axe.HighACC.Restraint.Ionis = set_combine(sets.TP.Axe.MidACC.Restraint.Ionis,{})

	-- Axe(AM Up: Restraint + Ionis) TP Sets --
	sets.TP.Axe.AM.Restraint.Ionis = set_combine(sets.TP.Axe.AM.Restraint,{})
	sets.TP.Axe.MidACC.AM.Restraint.Ionis = set_combine(sets.TP.Axe.AM.Restraint.Ionis,{})
	sets.TP.Axe.HighACC.AM.Restraint.Ionis = set_combine(sets.TP.Axe.MidACC.AM.Restraint.Ionis,{})

	-- Axe(AM Down: SAM Roll) TP Sets --
	sets.TP.Axe.STP = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.STP = set_combine(sets.TP.Axe.MidACC,{})
	sets.TP.Axe.HighACC.STP = set_combine(sets.TP.Axe.HighACC,{})

	-- Axe(AM Up: SAM Roll) TP Sets --
	sets.TP.Axe.AM.STP = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.STP = set_combine(sets.TP.Axe.MidACC.AM,{})
	sets.TP.Axe.HighACC.AM.STP = set_combine(sets.TP.Axe.HighACC.AM,{})

	-- Axe(AM Down: Restraint + SAM Roll) TP Sets --
	sets.TP.Axe.Restraint.STP = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Restraint.STP = set_combine(sets.TP.Axe.MidACC,{})
	sets.TP.Axe.HighACC.Restraint.STP = set_combine(sets.TP.Axe.HighACC,{})

	-- Axe(AM Up: Restraint + SAM Roll) TP Sets --
	sets.TP.Axe.AM.Restraint.STP = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.Restraint.STP = set_combine(sets.TP.Axe.MidACC.AM,{})
	sets.TP.Axe.HighACC.AM.Restraint.STP = set_combine(sets.TP.Axe.HighACC.AM,{})

	-- Axe(AM Down: Ionis + SAM Roll) TP Sets --
	sets.TP.Axe.Ionis.STP = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Ionis.STP = set_combine(sets.TP.Axe.MidACC,{})
	sets.TP.Axe.HighACC.Ionis.STP = set_combine(sets.TP.Axe.HighACC,{})

	-- Axe(AM Up: Ionis + SAM Roll) TP Sets --
	sets.TP.Axe.AM.Ionis.STP = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.Ionis.STP = set_combine(sets.TP.Axe.MidACC.AM,{})
	sets.TP.Axe.HighACC.AM.Ionis.STP = set_combine(sets.TP.Axe.HighACC.AM,{})

	-- Axe(AM Down: Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Axe.Restraint.Ionis.STP = set_combine(sets.TP.Axe,{})
	sets.TP.Axe.MidACC.Restraint.Ionis.STP = set_combine(sets.TP.Axe.MidACC,{})
	sets.TP.Axe.HighACC.Restraint.Ionis.STP = set_combine(sets.TP.Axe.HighACC,{})

	-- Axe(AM Up: Restraint + Ionis + SAM Roll) TP Sets --
	sets.TP.Axe.AM.Restraint.Ionis.STP = set_combine(sets.TP.Axe.AM,{})
	sets.TP.Axe.MidACC.AM.Restraint.Ionis.STP = set_combine(sets.TP.Axe.MidACC.AM,{})
	sets.TP.Axe.HighACC.AM.Restraint.Ionis.STP = set_combine(sets.TP.Axe.HighACC.AM,{})

	-- MS TP Set --
	sets.TP.MS = {
			-- sub="Brave Grip",
			neck="Portus Collar",
			back="Cavaros Mantle",
			feet="Huginn Gambieras"}

	-- Retaliation Set --
	sets.TP.Retaliation = {hands="Pumm. Mufflers +1",feet="Rvg. Calligae +2"}

	-- AM3 Rancor ON Mantle --
	sets.TP.Rancor = {back="Rancorous Mantle"}

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Angha Gem",
			head="Cizin Helm +1",
			neck="Twilight Torque",
			left_ear="Black Earring",
			right_ear="Darkness Earring",
			body="Cizin Mail +1",
			hands="Cizin Mufflers +1",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back="Shadow Mantle",
			waist="Nierenschutz",
			legs="Cizin Breeches +1",
			feet="Cizin Greaves +1"}

	sets.MDT = set_combine(sets.PDT,{
			ammo="Demonry Stone",
			head="Laeradr Helm",
			left_ear="Merman's Earring",
			right_ear="Sanare Earring",
			body="Nocturnus Mail",
			left_ring="Shadow Ring",
			back="Engulfer Cape",
			waist="Resolute Belt"})

	-- Hybrid/Kiting Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			left_ring="Patricius Ring",
			back="Mollusca Mantle",
			waist="Cetl Belt"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			ammo="Fire Bomblet",
			head="Yaoyotl Helm",
			body="Mes. Haubergeon",
			waist="Dynamic Belt +1",
			legs="Pumm. Cuisses +1",
			feet="Whirlpool Greaves"})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			neck="Iqabi Necklace",
			hands="Buremte Gloves",
			back="Mauler's Mantle"})

	sets.Kiting = set_combine(sets.PDT,{feet="Hermes' Sandals +1"})

	-- WS Base Set --
	sets.WS = {
			head={ name="Valorous Mask", augments={'Accuracy+16 Attack+16','"Store TP"+3','STR+15','Accuracy+6',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Weapon Skill Acc.+10','STR+15','Accuracy+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}

	-- Upheaval Sets --
	sets.WS.Upheaval = {
			head={ name="Valorous Mask", augments={'Accuracy+16 Attack+16','"Store TP"+3','STR+15','Accuracy+6',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Weapon Skill Acc.+10','STR+15','Accuracy+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.WS.Upheaval.MidACC = set_combine(sets.WS.Upheaval,{
			head="Yaoyotl Helm",
			neck="Flame Gorget",
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			feet="Whirlpool Greaves"})
	sets.WS.Upheaval.HighACC = set_combine(sets.WS.Upheaval.MidACC,{
			back="Mauler's Mantle",
			legs="Miki. Cuisses"})

	-- Upheaval(Attack) Set --
	sets.WS.Upheaval.ATT = set_combine(sets.WS.Upheaval,{})

	-- Ukko's Fury Sets --
	sets.WS["Ukko's Fury"] = {
			head={ name="Valorous Mask", augments={'Accuracy+16 Attack+16','"Store TP"+3','STR+15','Accuracy+6',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Weapon Skill Acc.+10','STR+15','Accuracy+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.WS["Ukko's Fury"].MidACC = set_combine(sets.WS["Ukko's Fury"],{
			head="Yaoyotl Helm",
			feet="Whirlpool Greaves"})
	sets.WS["Ukko's Fury"].HighACC = set_combine(sets.WS["Ukko's Fury"].MidACC,{
			body="Mes. Haubergeon",
			hands="Buremte Gloves",
			back="Mauler's Mantle",
			legs="Miki. Cuisses"})

	-- Ukko's Fury(Attack) Set --
	sets.WS["Ukko's Fury"].ATT = set_combine(sets.WS["Ukko's Fury"],{})

	sets.WS["King's Justice"] = {
			head={ name="Valorous Mask", augments={'Accuracy+16 Attack+16','"Store TP"+3','STR+15','Accuracy+6',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Weapon Skill Acc.+10','STR+15','Accuracy+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Fotia Belt",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}
	sets.WS["King's Justice"].MidACC  = set_combine(sets.WS["King's Justice"],{})
	sets.WS["King's Justice"].HighACC = set_combine(sets.WS["King's Justice"].MidACC ,{})

	-- Fell Cleave Set --
	sets.WS["Fell Cleave"] = {
			head={ name="Valorous Mask", augments={'Accuracy+16 Attack+16','"Store TP"+3','STR+15','Accuracy+6',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Cessance Earring",
			body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon Skill Acc.+13','STR+15','Attack+5',}},
			hands={ name="Valorous Mitts", augments={'Weapon Skill Acc.+10','STR+15','Accuracy+15',}},
			left_ring="Hetairoi Ring",
			right_ring="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs={ name="Valor. Hose", augments={'Accuracy+24 Attack+24','"Dbl.Atk."+2','STR+8','Accuracy+12','Attack+13',}},
			feet={ name="Loyalist Sabatons", augments={'STR+9','Attack+13','Phys. dmg. taken -3%','Haste+2',}},}

	-- MS WS Set --
	sets.MS_WS = {
			-- body="Kirin's Osode",
			back="Cavaros Mantle",
			-- legs="Byakko's Haidate",
			feet="Huginn Gambieras"}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Berserk = {body="Pumm. Lorica +1",feet="Agoge Calligae +1"}
	sets.JA.Aggressor = {head="Pumm. Mask +1",body="Agoge Lorica +1"}
	sets.JA["Blood Rage"] = {body="Rvg. Lorica +2"}
	sets.JA.Warcry = {head="Agoge Mask +1"}
	sets.JA.Tomahawk = {ammo="Thr. Tomahawk",feet="Agoge Calligae +1"}
	sets.JA["Mighty Strikes"] = {hands="Agoge Mufflers +1"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Cizin Helm +1",
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			left_ring="Prolix Ring",
			right_ring="Veneficium Ring"}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{
			hands="Agoge Mufflers +1"})
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 290 then -- Cancel Meditate If TP Is Above 290 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
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
			if Attack == 'ON' then
				equipSet = equipSet["ATT"]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if buffactive["Mighty Strikes"] then -- Equip MS_WS Set When You Have Mighty Strikes On --
				equipSet = set_combine(equipSet,sets.MS_WS)
			end
			if spell.english == "Ukko's Fury" and buffactive['Blood Rage'] and BloodRage == "ON" then -- Use Hct. Mittens +1 Toggle For Normal Ukko's Fury Hands --
				equipSet = set_combine(equipSet,{hands="Hct. Mittens +1"})
			end
			if spell.english == "Upheaval" and world.day_element == 'Dark' then -- Equip Shadow Mantle On Darksday For Upheaval --
				equipSet = set_combine(equipSet,{back="Shadow Mantle"})
			end
			if player.tp > 299 or buffactive.Sekkanoki then -- Equip Kokou's Earring When You Have 300 TP or Sekkanoki --
				equipSet = set_combine(equipSet,{left_ear="Kokou's Earring"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
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
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	if spell.action_type == 'Magic' then
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
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Blood Rage" then -- Blood Rage Timer/Countdown --
			timer_blood_rage()
			send_command('wait 50;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		elseif spell.english == "Tomahawk" then -- Tomahawk Timer/Countdown --
			timer_tomahawk()
			send_command('wait 80;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;timers delete "Tomahawk";input /p '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'Kiting' then
		equip(sets.Kiting)
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
			if Rancor == 'ON' then -- Default Rancor Toggle Is Rancorous Mantle --
				equipSet = set_combine(equipSet["AM3"],sets.TP.Rancor)
			else -- Use Rancor Toggle For Atheling Mantle --
				equipSet = equipSet["AM3"]
			end
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive.Restraint and equipSet["Restraint"] then -- Restraint TP Set --
			equipSet = equipSet["Restraint"]
		end
		if buffactive.Ionis and equipSet["Ionis"] then -- Ionis TP Set --
			equipSet = equipSet["Ionis"]
		end
		if buffactive["Mighty Strikes"] then -- Mighty Strikes TP Set --
			equipSet = set_combine(equipSet,sets.TP.MS)
		end
		if buffactive.Retaliation and Retaliation == 'ON' then -- Use Retaliation Toggle For Retaliation TP Set --
			equipSet = set_combine(equipSet,sets.TP.Retaliation)
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
	elseif buff == "blood rage" and not gain then
		send_command('timers delete "Blood Rage"')
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
	elseif command == 'C12' then -- Kiting Toggle --
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Retaliation Toggle --
		if Retaliation == 'ON' then
			Retaliation = 'OFF'
			add_to_chat(123,'Retaliation Set: [Unlocked]')
		else
			Retaliation = 'ON'
			add_to_chat(158,'Retaliation Set: [Locked]')
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
	elseif command == 'C11' then -- Hct. Mittens +1 Toggle --
		if BloodRage == 'ON' then
			BloodRage = 'OFF'
			add_to_chat(123,'Hct. Mittens +1: [OFF]')
		else
			BloodRage = 'ON'
			add_to_chat(158,'Hct. Mittens +1: [ON]')
		end
		status_change(player.status)
	elseif command == 'C18' then -- SAM Roll Toggle --
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

function timer_blood_rage()
	local duration = 60
	send_command('timers create "Blood Rage" '..tostring(duration)..' down')
end

function timer_tomahawk()
	local duration = 90
	send_command('timers create "Tomahawk" '..tostring(duration)..' down')
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
				add_to_chat(8,'Full HP!')
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

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(8, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
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
	if player.sub_job == 'SAM' then
		set_macro_page(1, 15)
	elseif player.sub_job == 'DNC' then
		set_macro_page(3, 15)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 15)
	else
		set_macro_page(1, 15)
	end
end