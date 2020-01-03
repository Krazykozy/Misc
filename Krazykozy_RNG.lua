-- Last Updated: 5-8-2017 2:26 PM EST *Credit: Krazykozy*-- 
-- ** I Use Some of Motenten's Functions ** --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Shooting/TP/WS. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {"Lionsquall","Vijaya"} -- Default Ranged Weapon Is Lionsquall. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Goldsmithing","Fishing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	warning = false
	AutoMode = 'OFF' -- Set Default Auto RA/WS ON or OFF Here --
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Enmity = 'OFF' -- Set Default Enmity Set ON or OFF Here --
	ammo_warning_limit = 10 -- Set Ammo Limit Check Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="LastStand", SC2="Coronach", SC3="Ranged"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}

	-- Idle/Town Sets --
	sets.Idle.Regen = {
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
		    legs="Mummu Kecks +2",
			feet="Jute Boots +1"}
	sets.Idle.Regen.Lionsquall = set_combine(sets.Idle.Regen,{
			main="Perun +1",
			sub="Nusku Shield",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet"})
	sets.Idle.Regen.Vijaya = set_combine(sets.Idle.Regen,{
			main="Perun +1",
			sub="Nusku Shield",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow",})
	sets.Idle.Regen.Lionsquall.SAM = set_combine(sets.Idle.Regen,{
			main="Mekki Shakki",
			sub="Potent Grip",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet"})
	sets.Idle.Regen.Lionsquall.NIN = set_combine(sets.Idle.Regen,{
			main="Perun +1",
			sub="Perun",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet"})
	sets.Idle.Regen.Vijaya.SAM = set_combine(sets.Idle.Regen,{
			main="Mekki Shakki",
			sub="Potent Grip",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow"})
	sets.Idle.Regen.Vijaya.NIN = set_combine(sets.Idle.Regen,{
			main="Perun +1",
			sub="Perun",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow"})
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MP+20','Attack+4','DEF+12',}},
			waist="Flume Belt +1",
		    legs="Mummu Kecks +2",
			feet="Jute Boots +1"})
	sets.Idle.Movement.Lionsquall = set_combine(sets.Idle.Movement,{
			main="Perun +1",
			sub="Nusku Shield",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet"})
	sets.Idle.Movement.Vijaya = set_combine(sets.Idle.Movement,{
			main="Perun +1",
			sub="Nusku Shield",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow"})
	sets.Idle.Movement.Lionsquall.SAM = set_combine(sets.Idle.Movement,{
			main="Mekki Shakki",
			sub="Potent Grip",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet"})
	sets.Idle.Movement.Lionsquall.NIN = set_combine(sets.Idle.Movement,{
			main="Perun +1",
			sub="Perun",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet"})
	sets.Idle.Movement.Vijaya.SAM = set_combine(sets.Idle.Movement,{
			main="Mekki Shakki",
			sub="Potent Grip",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow"})
	sets.Idle.Movement.Vijaya.NIN = set_combine(sets.Idle.Movement,{
			main="Perun +1",
			sub="Perun",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow"})

	sets.Idle.Goldsmithing = {
			main="Caduceus",
			sub="Toreutic Shield",
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
			feet="Jute Boots +1"}			

	sets.Idle.Fishing = {
			main="Perun +1",
			sub="Nusku Shield",
			range="Ebisu Fishing Rod",
			head="Arcadian Beret +1",
			neck="Fisher's Torque",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			right_ring="Puffin Ring",
			left_ring="Noddy Ring",
            back="Repulse Mantle",
            waist="Yemaya Belt",
			legs="Angler's Hose",
			feet="Waders"}
			
	-- Preshot --
	sets.Preshot = {
			head="Orion Beret +1",
			body="Arcadian Jerkin +1",
			hands="Arcadian Bracers +1",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Yemaya Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet="Meg. Jambeaux +1"}

	-- Shooting Base Set --
	sets.Midshot = {}

	-- Lionsquall(Decoy Down) Sets --
	sets.Midshot.Lionsquall = {
			main="Perun +1",
			sub="Nusku Shield",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet",
			head="Arcadian Beret +1",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			body="Mummu Jacket +1",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
            left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Yemaya Belt",
			legs="Meg. Chausses +2",
			feet="Meg. Jambeaux +2"}
	sets.Midshot.Lionsquall.MidACC = set_combine(sets.Midshot.Lionsquall,{
			left_ear="Enervating Earring",
			hands="Mummu Wrists +1",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Lionsquall.HighACC = set_combine(sets.Midshot.Lionsquall.MidACC,{
	        head="Meg. Visor +2",
			hands="Mummu Wrists +1",
			neck="Combatant's Torque",
			right_ring="Cacoethic Ring +1",
            left_ring="Cacoethic Ring",})

	-- Lionsquall(Decoy Up) Sets --
	sets.Midshot.Lionsquall.Decoy = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.Decoy = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.Decoy = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall(Enmity) Sets --
	sets.Midshot.Lionsquall.Enmity = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.Enmity = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.Enmity = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall(AM) Sets --
	sets.Midshot.Lionsquall.AM = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.AM = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.AM = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall(Decoy Down: Ionis) Sets --
	sets.Midshot.Lionsquall.Ionis = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.Ionis = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.Ionis = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall(Decoy Up: Ionis) Sets --
	sets.Midshot.Lionsquall.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall(Decoy Down: SAM Roll) Sets --
	sets.Midshot.Lionsquall.STP = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.STP = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.STP = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall(Decoy Up: SAM Roll) Sets --
	sets.Midshot.Lionsquall.Decoy.STP = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.Decoy.STP = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.Decoy.STP = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall(Decoy Down: Ionis + SAM Roll) Sets --
	sets.Midshot.Lionsquall.Ionis.STP = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.Ionis.STP = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.Ionis.STP = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall(Decoy Up: Ionis + SAM Roll) Sets --
	sets.Midshot.Lionsquall.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall,{})
	sets.Midshot.Lionsquall.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall.MidACC,{})
	sets.Midshot.Lionsquall.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall.HighACC,{})

	-- Lionsquall Barrage Sets --
	sets.Midshot.Lionsquall.Barrage = set_combine(sets.Midshot.Lionsquall,{},Barrage)
	sets.Midshot.Lionsquall.MidACC.Barrage = set_combine(sets.Midshot.Lionsquall.MidACC,{},Barrage)
	sets.Midshot.Lionsquall.HighACC.Barrage = set_combine(sets.Midshot.Lionsquall.HighACC,{},Barrage)

	-- Vijaya(Decoy Down) Sets --
	sets.Midshot.Vijaya = {
			main="Perun +1",
			sub="Nusku Shield",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow",            
			head="Arcadian Beret +1",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
            body="Kyujutsugi",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
            left_ring="Cacoethic Ring",
            back="Lutian Cape",
            waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"}
	sets.Midshot.Vijaya.MidACC = set_combine(sets.Midshot.Vijaya,{
			neck="Combatant's Torque",
			left_ear="Enervating Earring",
			right_ear="Clearview Earring",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			legs="Meg. Chausses +1",
            waist="Yemaya Belt",
            back="Lutian Cape",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Vijaya.HighACC = set_combine(sets.Midshot.Vijaya.MidACC,{
	        head="Meg. Visor +2",
			neck="Combatant's Torque",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			feet="Meg. Jambeaux +1"})

	-- Vijaya(Decoy Up) Sets --
	sets.Midshot.Vijaya.Decoy = set_combine(sets.Midshot.Vijaya,{})
	sets.Midshot.Vijaya.MidACC.Decoy = set_combine(sets.Midshot.Vijaya.MidACC,{})
	sets.Midshot.Vijaya.HighACC.Decoy = set_combine(sets.Midshot.Vijaya.HighACC,{})

	-- Vijaya(Enmity) Sets --
	sets.Midshot.Vijaya.Enmity = set_combine(sets.Midshot.Vijaya,{})
	sets.Midshot.Vijaya.MidACC.Enmity = set_combine(sets.Midshot.Vijaya.MidACC,{})
	sets.Midshot.Vijaya.HighACC.Enmity = set_combine(sets.Midshot.Vijaya.HighACC,{})

	-- Vijaya(AM) Sets --
	sets.Midshot.Vijaya.AM = set_combine(sets.Midshot.Vijaya,{})
	sets.Midshot.Vijaya.MidACC.AM = set_combine(sets.Midshot.Vijaya.MidACC,{})
	sets.Midshot.Vijaya.HighACC.AM = set_combine(sets.Midshot.Vijaya.HighACC,{})

	-- Vijaya(Decoy Down: Ionis) Sets --
	sets.Midshot.Vijaya.Ionis = set_combine(sets.Midshot.Vijaya,{})
	sets.Midshot.Vijaya.MidACC.Ionis = set_combine(sets.Midshot.Vijaya.MidACC,{})
	sets.Midshot.Vijaya.HighACC.Ionis = set_combine(sets.Midshot.Vijaya.HighACC,{})

	-- Vijaya(Decoy Up: Ionis) Sets --
	sets.Midshot.Vijaya.Decoy.Ionis = set_combine(sets.Midshot.Vijaya,{})
	sets.Midshot.Vijaya.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Vijaya.MidACC,{})
	sets.Midshot.Vijaya.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Vijaya.HighACC,{})

	-- Vijaya(Decoy Down: SAM Roll) Sets --
	sets.Midshot.Vijaya.STP = set_combine(sets.Midshot.Vijaya,{
			main="Mekki Shakki",
			sub="Potent Grip",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			hands="Mummu Wrists +1",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Vijaya.MidACC.STP = set_combine(sets.Midshot.Vijaya.STP,{
			hands="Mummu Wrists +1",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			legs="Feast Hose"})
	sets.Midshot.Vijaya.HighACC.STP = set_combine(sets.Midshot.Vijaya.MidACC.STP,{
	        head="Meg. Visor +2",
			neck="Combatant's Torque",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			feet="Meg. Jambeaux +1"})

	-- Vijaya(Decoy Up: SAM Roll) Sets --
	sets.Midshot.Vijaya.Decoy.STP = set_combine(sets.Midshot.Vijaya,{})
	sets.Midshot.Vijaya.MidACC.Decoy.STP = set_combine(sets.Midshot.Vijaya.MidACC,{})
	sets.Midshot.Vijaya.HighACC.Decoy.STP = set_combine(sets.Midshot.Vijaya.HighACC,{})

	-- Vijaya(Decoy Down: Ionis + SAM Roll) Sets --
	sets.Midshot.Vijaya.Ionis.STP = set_combine(sets.Midshot.Vijaya,{})
	sets.Midshot.Vijaya.MidACC.Ionis.STP = set_combine(sets.Midshot.Vijaya.MidACC,{})
	sets.Midshot.Vijaya.HighACC.Ionis.STP = set_combine(sets.Midshot.Vijaya.HighACC,{})

	-- Vijaya(Decoy Up: Ionis + SAM Roll) Sets --
	sets.Midshot.Vijaya.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya,{})
	sets.Midshot.Vijaya.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya.MidACC,{})
	sets.Midshot.Vijaya.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya.HighACC,{})

	-- Vijaya Barrage Sets --
	sets.Midshot.Vijaya.Barrage = set_combine(sets.Midshot.Vijaya,{},Barrage)
	sets.Midshot.Vijaya.MidACC.Barrage = set_combine(sets.Midshot.Vijaya.MidACC,{},Barrage)
	sets.Midshot.Vijaya.HighACC.Barrage = set_combine(sets.Midshot.Vijaya.HighACC,{},Barrage)

	-- Lionsquall(Decoy Down) /SAM Sets --
	sets.Midshot.Lionsquall.SAM = {
			main="Mekki Shakki",
			sub="Potent Grip",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet",
			head="Arcadian Beret +1",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			body="Mummu Jacket +1",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"}
	sets.Midshot.Lionsquall.SAM.MidACC = set_combine(sets.Midshot.Lionsquall.SAM,{
			right_ear="Clearview Earring",
			hands="Mummu Wrists +1",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Lionsquall.SAM.HighACC = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{
	        head="Meg. Visor +2",
			neck="Combatant's Torque",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			feet="Meg. Jambeaux +1"})

	-- Lionsquall(Decoy Up) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.Decoy = set_combine(sets.Midshot.Lionsquall.SAM,{})
	sets.Midshot.Lionsquall.SAM.MidACC.Decoy = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{})
	sets.Midshot.Lionsquall.SAM.HighACC.Decoy = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{})

	-- Lionsquall(Enmity) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.Enmity = set_combine(sets.Midshot.Lionsquall.SAM,{})
	sets.Midshot.Lionsquall.SAM.MidACC.Enmity = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{})
	sets.Midshot.Lionsquall.SAM.HighACC.Enmity = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{})

	-- Lionsquall(AM) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.AM = set_combine(sets.Midshot.Lionsquall.SAM,{})
	sets.Midshot.Lionsquall.SAM.MidACC.AM = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{})
	sets.Midshot.Lionsquall.SAM.HighACC.AM = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{})

	-- Lionsquall(Decoy Down: Ionis) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.Ionis = set_combine(sets.Midshot.Lionsquall.SAM,{})
	sets.Midshot.Lionsquall.SAM.MidACC.Ionis = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{})
	sets.Midshot.Lionsquall.SAM.HighACC.Ionis = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{})

	-- Lionsquall(Decoy Up: Ionis) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall.SAM,{})
	sets.Midshot.Lionsquall.SAM.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{})
	sets.Midshot.Lionsquall.SAM.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{})

	-- Lionsquall(Decoy Down: SAM Roll) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.STP = set_combine(sets.Midshot.Lionsquall.SAM,{})
	sets.Midshot.Lionsquall.SAM.MidACC.STP = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{})
	sets.Midshot.Lionsquall.SAM.HighACC.STP = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{})

	-- Lionsquall(Decoy Up: SAM Roll) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.Decoy.STP = set_combine(sets.Midshot.Lionsquall.SAM,{
			main="Mekki Shakki",
			sub="Potent Grip",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			hands="Mummu Wrists +1",
			waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Lionsquall.SAM.MidACC.Decoy.STP = set_combine(sets.Midshot.Lionsquall.SAM.Decoy.STP,{})
	sets.Midshot.Lionsquall.SAM.HighACC.Decoy.STP = set_combine(sets.Midshot.Lionsquall.SAM.MidACC.Decoy.STP,{})

	-- Lionsquall(Decoy Down: Ionis + SAM Roll) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.Ionis.STP = set_combine(sets.Midshot.Lionsquall.SAM,{})
	sets.Midshot.Lionsquall.SAM.MidACC.Ionis.STP = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{})
	sets.Midshot.Lionsquall.SAM.HighACC.Ionis.STP = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{})

	-- Lionsquall(Decoy Up: Ionis + SAM Roll) /SAM Sets --
	sets.Midshot.Lionsquall.SAM.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall.SAM,{})
	sets.Midshot.Lionsquall.SAM.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{})
	sets.Midshot.Lionsquall.SAM.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{})

	-- Lionsquall /SAM Barrage Sets --
	sets.Midshot.Lionsquall.SAM.Barrage = set_combine(sets.Midshot.Lionsquall.SAM,{},Barrage)
	sets.Midshot.Lionsquall.SAM.MidACC.Barrage = set_combine(sets.Midshot.Lionsquall.SAM.MidACC,{},Barrage)
	sets.Midshot.Lionsquall.SAM.HighACC.Barrage = set_combine(sets.Midshot.Lionsquall.SAM.HighACC,{},Barrage)

	-- Vijaya(Decoy Down) /SAM Sets --
	sets.Midshot.Vijaya.SAM = {
			main="Mekki Shakki",
			sub="Potent Grip",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow",
			head="Arcadian Beret +1",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			body="Mummu Jacket +1",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"}
	sets.Midshot.Vijaya.SAM.MidACC = set_combine(sets.Midshot.Vijaya.SAM,{
			right_ear="Clearview Earring",
			hands="Mummu Wrists +1",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Vijaya.SAM.HighACC = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{
	        head="Meg. Visor +2",
			neck="Combatant's Torque",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			feet="Meg. Jambeaux +1"})

	-- Vijaya(Decoy Up) /SAM Sets --
	sets.Midshot.Vijaya.SAM.Decoy = set_combine(sets.Midshot.Vijaya.SAM,{})
	sets.Midshot.Vijaya.SAM.MidACC.Decoy = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{})
	sets.Midshot.Vijaya.SAM.HighACC.Decoy = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{})

	-- Vijaya(Enmity) /SAM Sets --
	sets.Midshot.Vijaya.SAM.Enmity = set_combine(sets.Midshot.Vijaya.SAM,{})
	sets.Midshot.Vijaya.SAM.MidACC.Enmity = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{})
	sets.Midshot.Vijaya.SAM.HighACC.Enmity = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{})

	-- Vijaya(AM) /SAM Sets --
	sets.Midshot.Vijaya.SAM.AM = set_combine(sets.Midshot.Vijaya.SAM,{})
	sets.Midshot.Vijaya.SAM.MidACC.AM = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{})
	sets.Midshot.Vijaya.SAM.HighACC.AM = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{})

	-- Vijaya(Decoy Down: Ionis) /SAM Sets --
	sets.Midshot.Vijaya.SAM.Ionis = set_combine(sets.Midshot.Vijaya.SAM,{})
	sets.Midshot.Vijaya.SAM.MidACC.Ionis = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{})
	sets.Midshot.Vijaya.SAM.HighACC.Ionis = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{})

	-- Vijaya(Decoy Up: Ionis) /SAM Sets --
	sets.Midshot.Vijaya.SAM.Decoy.Ionis = set_combine(sets.Midshot.Vijaya.SAM,{})
	sets.Midshot.Vijaya.SAM.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{})
	sets.Midshot.Vijaya.SAM.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{})

	-- Vijaya(Decoy Down: SAM Roll) /SAM Sets --
	sets.Midshot.Vijaya.SAM.STP = set_combine(sets.Midshot.Vijaya.SAM,{})
	sets.Midshot.Vijaya.SAM.MidACC.STP = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{})
	sets.Midshot.Vijaya.SAM.HighACC.STP = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{})

	-- Vijaya(Decoy Up: SAM Roll) /SAM Sets --
	sets.Midshot.Vijaya.SAM.Decoy.STP = set_combine(sets.Midshot.Vijaya.SAM,{
			main="Mekki Shakki",
			sub="Potent Grip",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			hands="Mummu Wrists +1",
			back="Sylvan Chlamys",
			waist="Yemaya Belt",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Vijaya.SAM.MidACC.Decoy.STP = set_combine(sets.Midshot.Vijaya.SAM.Decoy.STP,{
			hands="Mummu Wrists +1",
			legs="Feast Hose"})
	sets.Midshot.Vijaya.SAM.HighACC.Decoy.STP = set_combine(sets.Midshot.Vijaya.SAM.MidACC.Decoy.STP,{
	        head="Meg. Visor +2",
			neck="Combatant's Torque",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			feet="Meg. Jambeaux +1"})

	-- Vijaya(Decoy Down: Ionis + SAM Roll) /SAM Sets --
	sets.Midshot.Vijaya.SAM.Ionis.STP = set_combine(sets.Midshot.Vijaya.SAM,{})
	sets.Midshot.Vijaya.SAM.MidACC.Ionis.STP = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{})
	sets.Midshot.Vijaya.SAM.HighACC.Ionis.STP = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{})

	-- Vijaya(Decoy Up: Ionis + SAM Roll) /SAM Sets --
	sets.Midshot.Vijaya.SAM.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya.SAM,{})
	sets.Midshot.Vijaya.SAM.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{})
	sets.Midshot.Vijaya.SAM.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{})

	-- Vijaya /SAM Barrage Sets --
	sets.Midshot.Vijaya.SAM.Barrage = set_combine(sets.Midshot.Vijaya.SAM,{},Barrage)
	sets.Midshot.Vijaya.SAM.MidACC.Barrage = set_combine(sets.Midshot.Vijaya.SAM.MidACC,{},Barrage)
	sets.Midshot.Vijaya.SAM.HighACC.Barrage = set_combine(sets.Midshot.Vijaya.SAM.HighACC,{},Barrage)

	-- Lionsquall(Decoy Down) /NIN Sets --
	sets.Midshot.Lionsquall.NIN = {
			main="Perun +1",
			sub="Courser's Pugio",
			range={ name="Lionsquall", augments={'Rng.Acc.+50','"Store TP"+8','"Snapshot"+5',}},
			ammo="Achiyalabopa Bullet",
			head="Arcadian Beret +1",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			body="Mummu Jacket +1",
			hands="Mummu Wrists +1",
			right_ring="Chirich Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"}
	sets.Midshot.Lionsquall.NIN.MidACC = set_combine(sets.Midshot.Lionsquall.NIN,{
			left_ear="Enervating Earring",
			hands="Mummu Wrists +1",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Lionsquall.NIN.HighACC = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{
	        head="Meg. Visor +2",
			neck="Combatant's Torque",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			feet="Meg. Jambeaux +1"})

	-- Lionsquall(Decoy Up) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.Decoy = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.Decoy = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.Decoy = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall(Enmity) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.Enmity = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.Enmity = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.Enmity = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall(AM) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.AM = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.AM = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.AM = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall(Decoy Down: Ionis) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.Ionis = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.Ionis = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.Ionis = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall(Decoy Up: Ionis) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall(Decoy Down: SAM Roll) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.STP = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.STP = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.STP = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall(Decoy Up: SAM Roll) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.Decoy.STP = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.Decoy.STP = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.Decoy.STP = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall(Decoy Down: Ionis + SAM Roll) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.Ionis.STP = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.Ionis.STP = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.Ionis.STP = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall(Decoy Up: Ionis + SAM Roll) /NIN Sets --
	sets.Midshot.Lionsquall.NIN.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall.NIN,{})
	sets.Midshot.Lionsquall.NIN.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{})
	sets.Midshot.Lionsquall.NIN.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{})

	-- Lionsquall /NIN Barrage Sets --
	sets.Midshot.Lionsquall.NIN.Barrage = set_combine(sets.Midshot.Lionsquall.NIN,{},Barrage)
	sets.Midshot.Lionsquall.NIN.MidACC.Barrage = set_combine(sets.Midshot.Lionsquall.NIN.MidACC,{},Barrage)
	sets.Midshot.Lionsquall.NIN.HighACC.Barrage = set_combine(sets.Midshot.Lionsquall.NIN.HighACC,{},Barrage)

	-- Vijaya(Decoy Down) /NIN Sets --
	sets.Midshot.Vijaya.NIN = {
			main="Perun +1",
			sub="Trailer's Kukri",
			range={ name="Vijaya Bow", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
			ammo="Adlivun Arrow",
			head="Arcadian Beret +1",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
            right_ear="Telos Earring",
			body="Mummu Jacket +1",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"}
	sets.Midshot.Vijaya.NIN.MidACC = set_combine(sets.Midshot.Vijaya.NIN,{
			left_ear="Enervating Earring",
			hands="Mummu Wrists +1",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.Midshot.Vijaya.NIN.HighACC = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{
	        head="Meg. Visor +2",
			neck="Combatant's Torque",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring"})

	-- Vijaya(Decoy Up) /NIN Sets --
	sets.Midshot.Vijaya.NIN.Decoy = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.Decoy = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.Decoy = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya(Enmity) /NIN Sets --
	sets.Midshot.Vijaya.NIN.Enmity = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.Enmity = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.Enmity = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya(AM) /NIN Sets --
	sets.Midshot.Vijaya.NIN.AM = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.AM = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.AM = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya(Decoy Down: Ionis) /NIN Sets --
	sets.Midshot.Vijaya.NIN.Ionis = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.Ionis = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.Ionis = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya(Decoy Up: Ionis) /NIN Sets --
	sets.Midshot.Vijaya.NIN.Decoy.Ionis = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya(Decoy Down: SAM Roll) /NIN Sets --
	sets.Midshot.Vijaya.NIN.STP = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.STP = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.STP = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya(Decoy Up: SAM Roll) /NIN Sets --
	sets.Midshot.Vijaya.NIN.Decoy.STP = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.Decoy.STP = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.Decoy.STP = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya(Decoy Down: Ionis + SAM Roll) /NIN Sets --
	sets.Midshot.Vijaya.NIN.Ionis.STP = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.Ionis.STP = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.Ionis.STP = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya(Decoy Up: Ionis + SAM Roll) /NIN Sets --
	sets.Midshot.Vijaya.NIN.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya.NIN,{})
	sets.Midshot.Vijaya.NIN.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{})
	sets.Midshot.Vijaya.NIN.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{})

	-- Vijaya /NIN Barrage Sets --
	sets.Midshot.Vijaya.NIN.Barrage = set_combine(sets.Midshot.Vijaya.NIN,{},Barrage)
	sets.Midshot.Vijaya.NIN.MidACC.Barrage = set_combine(sets.Midshot.Vijaya.NIN.MidACC,{},Barrage)
	sets.Midshot.Vijaya.NIN.HighACC.Barrage = set_combine(sets.Midshot.Vijaya.NIN.HighACC,{},Barrage)

	-- DT/DeathDT Sets --
	sets.DT = {
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Flume Belt +1",
		    legs="Mummu Kecks +2",
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},}

	sets.DeathDT = set_combine(sets.DT,{
			head={ name="Herculean Helm", augments={'Rng.Atk.+16','Damage taken-3%','Accuracy+5',}},
			neck="Loricate Torque +1",
			left_ear="Odnowa Earring",
			right_ear="Odnowa Earring +1",
			body={ name="Herculean Vest", augments={'Accuracy+13 Attack+13','Damage taken-3%','STR+3','Accuracy+15',}},
			hands={ name="Herculean Gloves", augments={'Attack+16','Damage taken-3%','AGI+4','Accuracy+8',}},
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Moonbeam Cape",
			waist="Engraved Belt",
		    legs="Mummu Kecks +2",
			feet={ name="Herculean Boots", augments={'Damage taken-3%','DEX+10','Accuracy+9','Attack+9',}},})

	-- Melee Sets --
	sets.Melee = {}
	sets.Melee.MidACC = set_combine(sets.Melee,{})
	sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{})

	-- WS Base Set --
	sets.WS = {
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
            waist="Fotia Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet="Meg. Jambeaux +1"}
	sets.WS.MidACC = set_combine(sets.WS,{
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.WS.HighACC = set_combine(sets.WS.MidACC,{
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
			
	-- Coronach Sets --
	sets.WS.Coronach = {
			ammo="Achiyalabopa Bullet",
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Fotia Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet="Meg. Jambeaux +1"}
	sets.WS.Coronach.MidACC = set_combine(sets.WS.Coronach,{
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.WS.Coronach.HighACC = set_combine(sets.WS.Coronach.MidACC,{
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})

	-- Coronach(Attack) Set. This Set Takes Priority Over Other Sets. --
	sets.WS.Coronach.ATT = set_combine(sets.WS.Coronach,{})

	-- Coronach(Enmity) Sets --
	sets.WS.Coronach.Enmity = set_combine(sets.WS.Coronach,{})
	sets.WS.Coronach.MidACC.Enmity = set_combine(sets.WS.Coronach.MidACC,{})
	sets.WS.Coronach.HighACC.Enmity = set_combine(sets.WS.Coronach.HighACC,{})

	-- Coronach(AM) Sets --
	sets.WS.Coronach.AM = set_combine(sets.WS.Coronach,{})
	sets.WS.Coronach.MidACC.AM = set_combine(sets.WS.Coronach.MidACC,{})
	sets.WS.Coronach.HighACC.AM = set_combine(sets.WS.Coronach.HighACC,{})

	-- Coronach(SAM Roll) Sets --
	sets.WS.Coronach.STP = set_combine(sets.WS.Coronach,{})
	sets.WS.Coronach.MidACC.STP = set_combine(sets.WS.Coronach.MidACC,{})
	sets.WS.Coronach.HighACC.STP = set_combine(sets.WS.Coronach.HighACC,{})

	-- Last Stand Sets --
	sets.WS["Last Stand"] = {
			ammo="Achiyalabopa Bullet",
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"}
	sets.WS["Last Stand"].MidACC = set_combine(sets.WS["Last Stand"],{
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			neck="Fotia Gorget",
			feet="Meg. Jambeaux +1"})
	sets.WS["Last Stand"].HighACC = set_combine(sets.WS["Last Stand"].MidACC,{
	        head="Meg. Visor +2",			
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})

	-- Last Stand(Attack) Set. This Set Takes Priority Over Other Sets. --
	sets.WS["Last Stand"].ATT = set_combine(sets.WS["Last Stand"],{})

	-- Last Stand(Enmity) Sets --
	sets.WS["Last Stand"].Enmity = set_combine(sets.WS["Last Stand"],{
			hands="Arc. Bracers +1",
			legs="Arc. Braccae +1",
			feet="Meg. Jambeaux +1"})
	sets.WS["Last Stand"].MidACC.Enmity = set_combine(sets.WS["Last Stand"].MidACC,{})
	sets.WS["Last Stand"].HighACC.Enmity = set_combine(sets.WS["Last Stand"].HighACC,{})

	-- Last Stand(AM) Sets --
	sets.WS["Last Stand"].AM = set_combine(sets.WS["Last Stand"],{})
	sets.WS["Last Stand"].MidACC.AM = set_combine(sets.WS["Last Stand"].MidACC,{})
	sets.WS["Last Stand"].HighACC.AM = set_combine(sets.WS["Last Stand"].HighACC,{})

	-- Last Stand(SAM Roll) Sets --
	sets.WS["Last Stand"].STP = set_combine(sets.WS["Last Stand"],{})
	sets.WS["Last Stand"].MidACC.STP = set_combine(sets.WS["Last Stand"].MidACC,{})
	sets.WS["Last Stand"].HighACC.STP = set_combine(sets.WS["Last Stand"].HighACC,{})

	-- Namas Arrow Sets --
	sets.WS["Namas Arrow"] = {
			ammo="Adlivun Arrow",
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			left_ear="Vulcan's Pearl",
			right_ear="Sherida Earring",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",,
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Fotia Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet="Meg. Jambeaux +1"}
	sets.WS["Namas Arrow"].MidACC = set_combine(sets.WS["Namas Arrow"],{
	        head="Meg. Visor +2",		
			neck="Fotia Gorget",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			feet="Meg. Jambeaux +1"})
	sets.WS["Namas Arrow"].HighACC = set_combine(sets.WS["Namas Arrow"].MidACC,{
	        head="Meg. Visor +2",			
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			legs="Orion Braccae +1",
			feet="Meg. Jambeaux +1"})

	-- Namas Arrow(Attack) Set. This Set Takes Priority Over Other Sets. --
	sets.WS["Namas Arrow"].ATT = set_combine(sets.WS["Namas Arrow"],{})

	-- Namas Arrow(Enmity) Sets --
	sets.WS["Namas Arrow"].Enmity = set_combine(sets.WS["Namas Arrow"],{})
	sets.WS["Namas Arrow"].MidACC.Enmity = set_combine(sets.WS["Namas Arrow"].MidACC,{})
	sets.WS["Namas Arrow"].HighACC.Enmity = set_combine(sets.WS["Namas Arrow"].HighACC,{})

	-- Namas Arrow(AM) Sets --
	sets.WS["Namas Arrow"].AM = set_combine(sets.WS["Namas Arrow"],{})
	sets.WS["Namas Arrow"].MidACC.AM = set_combine(sets.WS["Namas Arrow"].MidACC,{})
	sets.WS["Namas Arrow"].HighACC.AM = set_combine(sets.WS["Namas Arrow"].HighACC,{})

	-- Namas Arrow(SAM Roll) Sets --
	sets.WS["Namas Arrow"].STP = set_combine(sets.WS["Namas Arrow"],{})
	sets.WS["Namas Arrow"].MidACC.STP = set_combine(sets.WS["Namas Arrow"].MidACC,{})
	sets.WS["Namas Arrow"].HighACC.STP = set_combine(sets.WS["Namas Arrow"].HighACC,{})

	-- Jishnu's Radiance Sets --
	sets.WS["Jishnu's Radiance"] = {
			head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
            neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring",
            body="Meg. Cuirie +2",
			hands="Mummu Wrists +1",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
            waist="Fotia Belt",
            legs="Jokushu Haidate",
			feet="Meg. Jambeaux +1"}
	sets.WS["Jishnu's Radiance"].MidACC = set_combine(sets.WS["Jishnu's Radiance"],{
	        head="Meg. Visor +2",
            body="Meg. Cuirie +2",
			hands="Mummu Wrists +1",
			neck="Fotia Gorget",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.WS["Jishnu's Radiance"].HighACC = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{
	        head="Meg. Visor +2",
            body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})

	-- Jishnu's Radiance(Attack) Set. This Set Takes Priority Over Other Sets. --
	sets.WS["Jishnu's Radiance"].ATT = set_combine(sets.WS["Jishnu's Radiance"],{})

	-- Jishnu's Radiance(Enmity) Sets --
	sets.WS["Jishnu's Radiance"].Enmity = set_combine(sets.WS["Jishnu's Radiance"],{})
	sets.WS["Jishnu's Radiance"].MidACC.Enmity = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{})
	sets.WS["Jishnu's Radiance"].HighACC.Enmity = set_combine(sets.WS["Jishnu's Radiance"].HighACC,{})

	-- Jishnu's Radiance(AM) Sets --
	sets.WS["Jishnu's Radiance"].AM = set_combine(sets.WS["Jishnu's Radiance"],{})
	sets.WS["Jishnu's Radiance"].MidACC.AM = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{})
	sets.WS["Jishnu's Radiance"].HighACC.AM = set_combine(sets.WS["Jishnu's Radiance"].HighACC,{})

	-- Jishnu's Radiance(SAM Roll) Sets --
	sets.WS["Jishnu's Radiance"].STP = set_combine(sets.WS["Jishnu's Radiance"],{})
	sets.WS["Jishnu's Radiance"].MidACC.STP = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{})
	sets.WS["Jishnu's Radiance"].HighACC.STP = set_combine(sets.WS["Jishnu's Radiance"].HighACC,{})

	-- SIDEWINDER
    sets.WS["Sidewinder"] = {
	        head="Meg. Visor +2",
            neck="Fotia Gorget",
            left_ear="Moonshade Earring",
            right_ear="Telos Earring",
            body="Orion Jerkin +1",
            hands="Arc. Bracers +1",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
            waist="Fotia Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet="Meg. Jambeaux +1"}
	sets.WS["Sidewinder"].MidACC = set_combine(sets.WS["Sidewinder"],{
	        head="Meg. Visor +2",		
			neck="Fotia Gorget",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.WS["Sidewinder"].HighACC = set_combine(sets.WS["Sidewinder"].MidACC,{
	        head="Meg. Visor +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			feet="Meg. Jambeaux +1"})	
	
	-- Apex Arrow Sets --
	sets.WS["Apex Arrow"] = {
	        head="Meg. Visor +2",
            neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Ishvara Earring",
            body="Orion Jerkin +1",
            hands="Arc. Bracers +1",
            left_ring="Regal Ring",
            right_ring="Ilabrat Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
            waist="Yemaya Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet="Meg. Jambeaux +1"}
	sets.WS["Apex Arrow"].MidACC = set_combine(sets.WS["Apex Arrow"],{
	        head="Meg. Visor +2",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.WS["Apex Arrow"].HighACC = set_combine(sets.WS["Apex Arrow"].MidACC,{
	        head="Meg. Visor +2",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			feet="Meg. Jambeaux +1"})

    -- WILDFIRE --
    sets.WS["Wildfire"] = {
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Samnuha Coat",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Izdubar Mantle",
			waist="Eschan Stone",
			legs="LImbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Mag.Atk.Bns."+13',}},}
    sets.WS["Wildfire"].MidACC = set_combine(sets.WS["Wildfire"],{
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Samnuha Coat",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Izdubar Mantle",
			waist="Eschan Stone",
			legs="LImbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Mag.Atk.Bns."+13',}},})
    sets.WS["Wildfire"].HighACC = set_combine(sets.WS["Wildfire"].MidACC,{
			head={ name="Herculean Helm", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic dmg. taken -1%','STR+4','Mag. Acc.+13','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			body="Samnuha Coat",
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			left_ring="Shiva Ring +1",
			right_ring="Shiva Ring +1",
			back="Izdubar Mantle",
			waist="Eschan Stone",
			legs="LImbo Trousers",
			feet={ name="Herculean Boots", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Mag.Atk.Bns."+13',}},})


	-- JA Sets --
	sets.JA = {}
	-- Barrage Base Set. This Set Takes Priority Over Other Pieces. --
	sets.JA.Barrage = {
            head="Arcadian Beret +1",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
			right_ear="Telos Earring",
            body="Kyujutsugi",
            hands="Orion Bracers +1",
			right_ring="Cacoethic Ring +1",
            left_ring="Cacoethic Ring",
            back="Lutian Cape",
            waist="Yemaya Belt",
			legs={ name="Adhemar Kecks", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
			feet="Meg. Jambeaux +1"}
	sets.JA.Barrage.MidACC = set_combine(sets.JA.Barrage,{
            head="Arcadian Beret +1",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
			right_ear="Telos Earring",
            body="Kyujutsugi",
            hands="Orion Bracers +1",
			right_ring="Cacoethic Ring +1",
            left_ring="Cacoethic Ring",
            back="Lutian Cape",
            waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})
	sets.JA.Barrage.HighACC = set_combine(sets.JA.Barrage.MidACC,{
	        head="Meg. Visor +2",
			neck="Combatant's Torque",
            left_ear="Enervating Earring",
			right_ear="Telos Earring",
            body="Kyujutsugi",
            hands="Orion Bracers +1",
			right_ring="Cacoethic Ring +1",
            left_ring="Cacoethic Ring",
            back="Lutian Cape",
            waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"})

	sets.JA.Shadowbind = {
			head="Amini Gapette",
			neck="Combatant's Torque",
			left_ear="Enervating Earring",
			right_ear="Telos Earring",
			body="Mummu Jacket +1",
			hands="Orion Bracers +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Yemaya Belt",
			legs="Meg. Chausses +1",
			feet="Meg. Jambeaux +1"}

	sets.JA.Scavenge = {feet="Orion Socks +1"}
	sets.JA.Camouflage = {body="Orion Jerkin +1"}
	sets.JA.Sharpshot = {legs="Orion Braccae +1"}
	sets.JA["Double Shot"] = {head="Amini Gapette"}
	sets.JA["Velocity Shot"] = {body="Amini Caban"}
	sets.JA["Bounty Shot"] = {hands="Amini Glovelettes"}
	sets.JA["Eagle Eye Shot"] = {
            head="Orion Beret +1",
			neck="Combatant's Torque",
			left_ear="Vulcan's Pearl",
			right_ear="Sherida Earring",
			body="Orion Jerkin +1",
			hands="Mummu Wrists +1",
			right_ring="Cacoethic Ring +1",
			left_ring="Cacoethic Ring",
			back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Yemaya Belt",
			legs="Arcadian Braccae +1", 
			feet="Meg. Jambeaux +1"}

	-- Waltz Set --
	sets.Waltz = {
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
			head="Athos's Chapeau",
			neck="Orunmila's Torque",
			body="Mekosuchinae Harness",
			left_ear="Loquac. Earring",
			hands="Thaumas Gloves",
			right_ring="Prolix Ring",
			left_ring="Veneficium Ring"}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.DT,{
			head="Athos's Chapeau",
			neck="Orunmila's Torque",
			body="Mekosuchinae Harness",
			left_ear="Loquac. Earring",
			hands="Thaumas Gloves",
			right_ring="Prolix Ring",
			left_ring="Veneficium Ring"})
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
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 290 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif spell.action_type == 'Ranged Attack' and not buffactive.amnesia then -- Auto WS/Decoy Shot/Double Shot --
		if player.tp >= 1000 and AutoMode == 'ON' then
			cancel_spell()
			autoWS()
		else
			local recasts = windower.ffxi.get_ability_recasts()
			if recasts[52] < 1 then
				cancel_spell()
				send_command('DecoyShot')
			elseif recasts[126] < 1 then
				cancel_spell()
				send_command('DoubleShot')
			end
		end
	elseif spell.action_type == 'Ranged Attack' and spell.target.distance > 24.9 then
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.type == 'WeaponSkill' and player.status == 'Engaged' then
		if spell.skill == 'Archery' or spell.skill == 'Marksmanship' then
			if spell.target.distance > 16+target_distance then
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				return
			end
		else
			if spell.target.distance > target_distance then
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				return
			end
		end
	end
end

function precast(spell,action)
	local check_ammo
	local check_ammo_count = 1
	if spell.action_type == 'Ranged Attack' then
		check_ammo = player.equipment.ammo
		if player.equipment.ammo == 'empty' or player.inventory[check_ammo].count <= check_ammo_count then
			add_to_chat(123, spell.name..' Canceled: [Out of Ammo]')
			cancel_spell()
			return
		else
			equip(sets.Preshot)
			if player.inventory[check_ammo].count <= ammo_warning_limit and player.inventory[check_ammo].count > 1 and not warning then
				add_to_chat(123, '***** [Low Ammo Warning!] *****')
				warning = true
			elseif player.inventory[check_ammo].count > ammo_warning_limit and warning then
				warning = false
			end
		end
	elseif spell.type == "WeaponSkill" then
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
			if equipSet["Enmity"] and Enmity == 'ON' then
				equipSet = equipSet["Enmity"]
			end
			if buffactive.Aftermath and equipSet["AM"] then
				equipSet = equipSet["AM"]
			end
			if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
				equipSet = equipSet["STP"]
			end
			if player.tp > 2941 or buffactive.Sekkanoki then
				if spell.english == "Last Stand" then -- Equip Auster's Pearl When You Have 3000 TP or Sekkanoki For Last Stand --
					equipSet = set_combine(equipSet,{left_ear="Auster's Pearl"})
				elseif spell.english == "Jishnu's Radiance" then -- Equip Mache Earring When You Have 3000 TP or Sekkanoki For Jishnu's Radiance --
					equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
				elseif spell.english == "Sidewinder" then -- Equip Vulcan's Pearl When You Have 3000 TP or Sekkanoki For Sidewinder --
					equipSet = set_combine(equipSet,{left_ear="Vulcan's Pearl"})
				elseif spell.english == "Apex Arrow" then -- Equip Auster's Pearl When You Have 3000 TP or Sekkanoki For Apex Arrow --
					equipSet = set_combine(equipSet,{left_ear="Auster's Pearl"})
			end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
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
	elseif spell.type == "Waltz" then
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	if spell.action_type == 'Ranged Attack' then
		equipSet = sets.Midshot
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Barrage and equipSet["Barrage"] then
			equipSet = equipSet["Barrage"]
		end
		if buffactive["Decoy Shot"] and equipSet["Decoy"] then
			equipSet = equipSet["Decoy"]
		end
		if equipSet["Enmity"] and Enmity == 'ON' then
			equipSet = equipSet["Enmity"]
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
			equipSet = equipSet["STP"]
		end
		equip(equipSet)
	elseif spell.action_type == 'Magic' then
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
				equipSet = set_combine(equipSet,{left_ring="Sheltered Ring"})
			end
			equip(sets.Midcast.Haste)
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if spell.action_type == 'Ranged Attack' and AutoMode == 'ON' then
		autoRA()
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
		equipSet = sets.Preshot
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
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
        if buffactive.Curse and Doom then
            equipSet = set_combine(equipSet,{left_ring='Purity Ring'})
        end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		equip(equipSet)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "overkill" then -- Overkill Timer --
		if gain then
			send_command('timers create "Overkill" 60 down')
		else
			send_command('timers delete "Overkill"')
			add_to_chat(123,'Overkill: [OFF]')
		end
	elseif buff == 'Berserk' and not gain then
		add_to_chat(123,'Berserk: [OFF]')
	elseif buff == 'aggressor' and not gain then
		add_to_chat(123,'Aggressor: [OFF]')
	elseif buff == "decoy shot" then -- Decoy Shot Timer --
		if gain then
			send_command('timers create "Decoy Shot" 180 down')
		else
			send_command('timers delete "Decoy Shot"')
			add_to_chat(123,'Decoy Shot: [OFF]')
		end
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
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C17' then -- Ranged Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Ranged Weapon: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
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
	elseif command == 'C11' then -- SAM Roll Toggle --
		if Samurai_Roll == 'ON' then
			Samurai_Roll = 'OFF'
			add_to_chat(123,'SAM Roll: [OFF]')
		else
			Samurai_Roll = 'ON'
			add_to_chat(158,'SAM Roll: [ON]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Enmity Toggle --
		if Enmity == 'ON' then
			Enmity = 'OFF'
			add_to_chat(123,'Enmity Set: [OFF]')
		else
			Enmity = 'ON'
			add_to_chat(158,'Enmity Set: [ON]')
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
	elseif command == 'C3' then -- Overkill Toggle --
		send_command('Overkill')
		add_to_chat(158,'Overkill: [ON]')
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
	elseif command == 'C2' then -- Auto RA/WS Toggle --
		if AutoMode == 'ON' then
			AutoMode = 'OFF'
			add_to_chat(123,'Auto Mode: [OFF]')
		else
			AutoMode = 'ON'
			add_to_chat(158,'Auto Mode: [ON]')
		end
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function autoRA()
	send_command('@wait 2.7; input /ra <t>')
end

function autoWS() -- Change Auto WS Here --
	send_command('input /ws "Last Stand" <t>')
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
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'DRG' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 20)
	else
		set_macro_page(1, 20)
	end
end