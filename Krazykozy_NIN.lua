-- ** I Use Some of Motenten's Functions ** --
-- Last Updated: 05/02/14 10:00 PM *Advanced Version* --
include('spam_protection_new.lua')
include('how_about_no.lua')
include('no_interruptions.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Crafting","Fishing"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Migawari = 'OFF' -- Set Default Migawari Body ON or OFF Here --
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	okToCast = true
	nextAllowableCast = 0
	currentCast = ''

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
	
	sc_map = {SC1="BladeHi", SC2="UtsusemiNi", SC3="UtsusemiIchi"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}

	sets.Idle.Regen = {
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Staunch Tathlum",
			head="Oce. Headpiece +1",
			neck="Wiglen Gorget",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body="Hachiya Chainmail +1",
			hands="Hachiya Tekko +1",
			left_ring="Paguroidea Ring",
			right_ring="Sheltered Ring",
			back="Repulse Mantle",
			waist="Muscle Belt +1",
			legs="Hachiya Hakama +1",
			feet="Taeon Boots"}

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Staunch Tathlum",
			head="Lithelimb Cap",
			neck="Loricate Torque +1",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body="Emet Harness +1",
			hands="Umuthi Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Repulse Mantle",
			waist="Muscle Belt +1",
			legs="Otronif Brais +1",
			feet="Danzo Sune-Ate"})

	sets.Idle.Crafting = {
			main="Raimitsukane",
			sub="Jushimatsu",
			range="",
			head="Lithelimb Cap",
			neck="Goldsmith's Torque",
			left_ear="",
			right_ear="",
			body="Goldsmith's Smock",
			hands="",
			left_ring="Craftmaster's Ring",
			right_ring="Artificer's Ring",
			back="Shaper's Shawl",
			waist="",
			legs="",
			feet="Danzo Sune-Ate"}				
			
	sets.Idle.Fishing = {
			main="Raimitsukane",
			sub="Jushimatsu",
			range="Ebisu Fishing Rod",
			head="Lithelimb Cap",
			neck="Fisher's Torque",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body="Fisherman's Smock",
			hands="Angler's Gloves",
			left_ring="Puffin Ring",
			right_ring="Noddy Ring",
			back="Fravashi Mantle",
			waist="Muscle Belt",
			legs="Angler's Hose",
			feet="Waders"}			
			
	-- Normal TP Sets --
	sets.TP = {
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Yetshila",
			head="Taeon Chapeau",
			neck="Nefarious collar +1",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body="Taeon Tabard",
			hands="Ryuo Tekko",
			left_ring="Oneiros Ring",
			right_ring="Epona's Ring",
			back="Bleating Mantle",
			waist="Reiki Yotai",
			legs="Mochizuki Hakama +1",
			feet="Taeon Boots"}
	sets.TP.MidACC = set_combine(sets.TP,{
			ammo="Ginsen",
			head="Taeon Chapeau",
			neck="Nefarious collar +1",
			body="Mochizuki Chainmail +1",
			hands="Ryuo Tekko",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Hachiya Hakama +1",
			feet="Taeon Boots"})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			head="Taeon Chapeau",
			left_ear="Zennaroi Earring",
			right_ear="Brutal Earring",
			neck="Subtlety Spectacles",
			body="Mes'yohi Haubergeon",
			hands="Ryuo Tekko",
			left_ring="Patricius Ring",
			right_ring="Mars's Ring",
			waist="Anguinus Belt",
			back="Letalis Mantle"})

	-- March x2 --
	-- March + Haste + Haste Samba --
	sets.TP.MidHaste = {
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Yetshila",
			head="Taeon Chapeau",
			neck="Nefarious collar +1",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body={ name="Rawhide Vest", augments={'DEX+10','STR+7','INT+7',}},
			hands="Ryuo Tekko",
			left_ring="Oneiros Ring",
			right_ring="Epona's Ring",
			back="Bleating Mantle",
			waist="Reiki Yotai",
			legs="Hachiya Hakama +1",
			feet="Taeon Boots"}
	sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidHaste,{
			ammo="Ginsen",
			neck="Subtlety Spectacles",
			body="Mochizuki Chainmail +1",
			hands="Ryuo Tekko",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			feet="Taeon Boots"})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
			head="Taeon Chapeau",
			left_ear="Zennaroi Earring",
			right_ear="Brutal Earring",
			neck="Subtlety Spectacles",
			body="Mes'yohi Haubergeon",
			hands="Ryuo Tekko",
			left_ring="Patricius Ring",
			right_ring="Mars's Ring",
			waist="Anguinus Belt",
			back="Letalis Mantle"})

	-- March x2 + Haste --
	-- Embrava + (March x2 or March + Haste) --
	sets.TP.HighHaste = {
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Yetshila",
			head="Taeon Chapeau",
			neck="Nefarious collar +1",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			body={ name="Rawhide Vest", augments={'DEX+10','STR+7','INT+7',}},
			hands="Ryuo Tekko",
			left_ring="Oneiros Ring",
			right_ring="Epona's Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Hachiya Hakama +1",
			feet="Taeon Boots"}
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ammo="Ginsen",
			neck="Nefarious collar +1",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			body="Mochizuki Chainmail +1",
			hands="Ryuo Tekko",
			back="Bleating Mantle",
			waist="Winbuffet Belt",
			feet="Taeon Boots"})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{
			head="Taeon Chapeau",
			left_ear="Zennaroi Earring",
			right_ear="Brutal Earring",
			neck="Subtlety Spectacles",
			body="Mes'yohi Haubergeon",
			hands="Ryuo Tekko",
			left_ring="Patricius Ring",
			right_ring="Mars's Ring",
			waist="Anguinus Belt",
			back="Letalis Mantle"})

	-- Embrava + (Haste or March) TP Sets --
	sets.TP.EmbravaHaste = {
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Yetshila",
			head="Taeon Chapeau",
			neck="Nefarious collar +1",
			left_ear="Suppanomimi",
			right_ear="Brutal Earring",
			body={ name="Rawhide Vest", augments={'DEX+10','STR+7','INT+7',}},
			hands="Ryuo Tekko",
			left_ring="Oneiros Ring",
			right_ring="Epona's Ring",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			legs="Hachiya Hakama +1",
			feet="Taeon Boots"}
	sets.TP.MidACC.EmbravaHaste = set_combine(sets.TP.EmbravaHaste,{
			ammo="Ginsen",
			neck="Subtlety Spectacles",
			left_ear="Heartseeker Earring",
			right_ear="Dudgeon Earring",
			body="Mochizuki Chainmail +1",
			hands="Ryuo Tekko",
			back="Bleating Mantle",
			waist="Windbuffet Belt +1",
			feet="Taeon Boots"})
	sets.TP.HighACC.EmbravaHaste = set_combine(sets.TP.MidACC.EmbravaHaste,{
			head="Taeon Chapeau",
			left_ear="Zennaroi Earring",
			right_ear="Brutal Earring",
			neck="Subtlety Spectacles",
			body="Mes'yohi Haubergeon",
			hands="Ryuo Tekko",
			left_ring="Patricius Ring",
			right_ring="Mars's Ring",
			waist="Anguinus Belt",
			back="Letalis Mantle"})

	-- TP Rancor ON Neck --
	sets.TP.Rancor = {neck="Rancor Collar"}

	-- TP Migawari Set --
	sets.TP.Migawari = {body="Iga Ningi +2"}

	-- PDT/DeathDT Sets --
	sets.PDT = {
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Staunch Tathlum",
			head="Lithelimb Cap",
			neck="Loricate Torque +1",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker Earring",
			body="Qaaxo Harness",
			hands="Umuthi Gloves",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Repulse Mantle",
			waist="Lieutenant's Sash",
			legs="Otronif Brais +1",
			feet="Otronif Boots +1"}

	sets.DeathDT = set_combine(sets.PDT,{
			ammo="Staunch Tathlum",
			head="Otronif Mask +1",
			left_ear="Static Earring",
			right_ear="Sanare Earring",
			body="Qaaxo Harness",
			hands="Qaaxo Mitaines",
			left_ring="Warden's Ring",
			right_ring="Defending Ring",
			back="Mollusca Mantle",
			waist="Lieutenant's Sash",
			legs="Ighwa Trousers",
			feet="Otronif Boots +1"})

	-- Hybrid/Evasion Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			main="Raimitsukane",
			sub="Jushimatsu",
			head="Lithelimb Cap",
			body={ name="Rawhide Vest", augments={'DEX+10','STR+7','INT+7',}},
			left_ear="Heartseeker Earring",
			right_ear="Dudgeon Earring",
			back="Mollusca Mantle"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			head="Taeon Chapeau",
			hands="Qaaxo Mitaines",
			waist="Anguinus Belt",
			legs="Ighwa Trousers",
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			left_ear="Zennaroi Earring",
			right_ear="Brutal Earring",			
			body="Mes. Haubergeon",
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}})

	sets.Evasion = set_combine(sets.PDT,{})

	-- WS Base Set --
	sets.WS = {
			ammo="Ginsen",
			head="Sukeroku Hachimaki",
			neck="Subtlety Spectacles",
			left_ear="Moonshade Earring",
			right_ear="Brutal Earring",
			body="Mes'yohi Haubergeon",
			hands="Ryuo Tekko",
			left_ring="Rajas Ring",
			right_ring="Epona's Ring",
			back="Bleating Mantle",
			waist="Caudata Belt",
			legs="Hachiya Hakama +1",
			feet="Mochizuki Kyahan +1"}

	-- Blade: Hi Sets --
	sets.WS["Blade: Hi"] = {
			ammo="Yetshila",
			head="Taeon Chapeau",
			neck="Hope Torque",
			left_ear="Moonshade Earring",
			right_ear="Brutal Earring",
			body="Taeon Tabard",
			hands="Ryuo Tekko",
			left_ring="Garuda Ring",
			right_ring="Epona's Ring",
			back="Rancorous Mantle",
			waist="Caudata Belt",
			legs="Taeon Tights",
			feet="Taeon Boots"}
	sets.WS["Blade: Hi"].MidACC = set_combine(sets.WS["Blade: Hi"],{
			neck="Fotia Gorget",
			body="Mochi. Chainmail +1",
			left_ring="Garuda Ring",
			right_ring="Epona's Ring",
			back="Rancorous Mantle",
			legs="Taeon Tights",
			feet="Taeon Boots"})
	sets.WS["Blade: Hi"].HighACC = set_combine(sets.WS["Blade: Hi"].MidACC,{
			head="Sukeroku Hachimaki",
			neck="Fotia Gorget",
			body="Mes'yohi Haubergeon",
			right_ring="Garuda Ring",			
			waist="Fotia Belt",
			back="Vespid Mantle"})

	-- Blade: Hi(Attack) Set --
	sets.WS["Blade: Hi"].ATT = set_combine(sets.WS["Blade: Hi"],{})

	-- Blade: Jin Sets --
	sets.WS["Blade: Jin"] = {
			ammo="Yetshila",
			head="Taeon Chapeau",
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Brutal Earring",
			body="Taeon Tabard",
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring",
			right_ring="Epona's Ring",
			back="Rancorous Mantle",
			waist="Caudata Belt",
			legs="Taeon Tights",
			feet="Taeon Boots"}
	sets.WS["Blade: Jin"].MidACC = set_combine(sets.WS["Blade: Jin"],{
			neck="Fotia Gorget",
			body="Mes'yohi Haubergeon",
			left_ring="Ramuh Ring",
			back="Rancorous Mantle",
			legs="Taeon Tights",
			feet="Mochizuki Kyahan +1"})
	sets.WS["Blade: Jin"].HighACC = set_combine(sets.WS["Blade: Jin"].MidACC,{
			head="Sukeroku Hachimaki",
			neck="Fotia Gorget",
			body="Mes'yohi Haubergeon",
			waist="Fotia Belt",
			back="Vespid Mantle"})

	-- Blade: Jin(Attack) Set --
	sets.WS["Blade: Jin"].ATT = set_combine(sets.WS["Blade: Jin"],{})
	
	-- Blade: Kamu Sets --
	sets.WS["Blade: Kamu"] = {
			ammo="Ginsen",
			head={ name="Uk'uxkaj Cap", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','STR+8',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Brutal Earring",
			body="Taeon Tabard",
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring",
			right_ring="Epona's Ring",
			back="Kayapa Cape",
			waist="Caudata Belt",
			legs="Taeon Tights",
			feet="Mochizuki Kyahan +1"}
	sets.WS["Blade: Kamu"].MidACC = set_combine(sets.WS["Blade: Kamu"],{
			neck="Fotia Gorget",
			body="Mes'yohi Haubergeon",
			left_ring="Ramuh Ring",
			back="Kayapa Cape",
			legs="Hachi. Hakama +1",
			feet="Mochizuki Kyahan +1"})
	sets.WS["Blade: Kamu"].HighACC = set_combine(sets.WS["Blade: Kamu"].MidACC,{
			head="Sukeroku Hachimaki",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Vespid Mantle"})

	-- Blade: Kamu(Attack) Set --
	sets.WS["Blade: Kamu"].ATT = set_combine(sets.WS["Blade: Kamu"],{})

	-- Blade: Retsu Sets --
	sets.WS["Blade: Retsu"] = {
			ammo="Ginsen",
			head={ name="Uk'uxkaj Cap", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','STR+8',}},
			neck="Fotia Gorget",
			left_ear="Moonshade Earring",
			right_ear="Brutal Earring",
			body="Taeon Tabard",
			hands="Ryuo Tekko",
			left_ring="Ramuh Ring",
			right_ring="Epona's Ring",
			back="Kayapa Cape",
			waist="Caudata Belt",
			legs="Taeon Tights",
			feet="Mochizuki Kyahan +1"}
	sets.WS["Blade: Retsu"].MidACC = set_combine(sets.WS["Blade: Retsu"],{
			neck="Fotia Gorget",
			body="Mes'yohi Haubergeon",
			left_ring="Ramuh Ring",
			back="Kayapa Cape",
			legs="Taeon Tights",
			feet="Mochizuki Kyahan +1"})
	sets.WS["Blade: Retsu"].HighACC = set_combine(sets.WS["Blade: Retsu"].MidACC,{
			head="Sukeroku Hachimaki",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Vespid Mantle"})

	-- Blade: Retsu(Attack) Set --
	sets.WS["Blade: Retsu"].ATT = set_combine(sets.WS["Blade: Retsu"],{})
	
	-- Blade: Shun Sets --
	sets.WS["Blade: Shun"] = {}
	sets.WS["Blade: Shun"].MidACC = set_combine(sets.WS["Blade: Shun"],{})
	sets.WS["Blade: Shun"].HighACC = set_combine(sets.WS["Blade: Shun"].MidACC,{})

	-- Blade: Shun(Attack) Set --
	sets.WS["Blade: Shun"].ATT = set_combine(sets.WS["Blade: Shun"],{})

	sets.WS.Exenterator = {}

	sets.WS.Evisceration = {}

	sets.WS["Sanguine Blade"] = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Provoke = {ammo="Staunch Tathlum",body="Emet Harness +1",left_ring="Eihwaz Ring",right_ring="Vengeful Ring",right_ear="Trux Earring",waist="Goading Belt",back="Fravashi Mantle",feet="Mochizuki Kyahan +1"}	
	sets.JA.Yonin = {head="Iga Zukin +2"}
	sets.JA.Innin = {legs="Iga Hakama +2"}
	
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
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Impatiens",
			head={ name="Herculean Helm", augments={'Accuracy+21','"Triple Atk."+2','AGI+5',}},
			neck="Orunmila's Torque",
			left_ear="Loquac. Earring",
			body="Mochizuki Chainmail +1",
			hands="Thaumas Gloves",
			left_ring="Prolix Ring",
			right_ring="Veneficium Ring",
			legs="Hachiya Hakama +1",
			feet={name="Qaaxo Leggings",augment="Accuracy +15","STR +7","Physical Damage Taken -3%"}}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{head="Athos's Chapeau",neck="Magoraga Beads",body="Mochi. Chainmail +1"})

	sets.Midcast = {}
	-- -- Magic Haste/Utsusemi Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{head="Athos's Chapeau",body="Mochizuki Chainmail +1",hands="Mochizuki Tekko +1 +1",feet="Iga Kyahan +2"})

	-- Migawari Magic Set --
	sets.Midcast.Migawari = {
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Impatiens",
			head="Hachiya Hatsuburi +1",
			neck="Ninjutsu Torque",
			left_ear="Stealth Earring",
			right_ear="Ninjutsu Earring",
			body="Iga Ningi +2",
			hands="Mochizuki Tekko +1",
			left_ring="Balrahn's Ring",
			right_ring="Sangoma Ring",
			back="Astute ape",
			waist="Ninurta's Sash",
			legs="Hachiya Hakama +1",
			feet="Mochizuki Kyahan +1"}

	-- Ninjutsu Set --
	sets.Midcast.Ninjutsu = {
			main="Raimitsukane",
			sub="Jushimatsu",
			ammo="Impatiens",
			head="Hachiya Hatsuburi +1",
			neck="Ninjutsu Torque",
			left_ear="Stealth Earring",
			right_ear="Ninjutsu Earring",
			body="Mochizuki Chainmail +1",
			hands="Mochizuki Tekko +1",
			left_ring="Balrahn's Ring",
			right_ring="Sangoma Ring",
			back="Yokaze Mantle",
			waist="Ninurta's Sash",
			legs="Hachiya Hakama +1",
			feet="Mochizuki Kyahan +1"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Yonin" and buffactive.Yonin then -- Change Yonin To Innin If Yonin Is On --
		cancel_spell()
		send_command('Innin')
	elseif spell.english == "Innin" and buffactive.Innin then -- Change Innin To Yonin If Innin Is On --
		cancel_spell()
		send_command('Yonin')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged') then -- Cancel Ranged Attack or WS If You Are Out Of Range --
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
				if player.tp > 2999 then
					if spell.english == "Blade: Hi" then
						equipSet = set_combine(equipSet,{left_ear="Fotia Pearl"})
					elseif spell.english == "Blade: Shun" then
						equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
					elseif spell.english == "Blade: Jin" then
						equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
					elseif spell.english == "Blade: Kamu" then
						equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
					elseif spell.english == "Blade: Retsu" then
						equipSet = set_combine(equipSet,{left_ear="Mache Earring"})
					end
				if (wsProperty[spell.skillchain_a] ~= nil and wsProperty[spell.skillchain_a]:contains(world.day_element)) or (wsProperty[spell.skillchain_b] ~= nil and wsProperty[spell.skillchain_b]:contains(world.day_element)) or (wsProperty[spell.skillchain_c] ~= nil and wsProperty[spell.skillchain_c]:contains(world.day_element)) then
					equipSet = set_combine(equipSet,{head="Gavialis Helm"})
				end
				end
				equip(equipSet)
			end
		elseif spell.type == "JobAbility" then
			if sets.JA[spell.english] then
				equip(sets.JA[spell.english])
			end
		elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
			if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
				return
			else
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
			end
		elseif spell.type == "Waltz" then
			refine_waltz(spell,action)
			equip(sets.Waltz)
		elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
			cast_delay(0.2)
			send_command('cancel Sneak')
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
			elseif string.find(spell.english,'Tonko') then
				equip(sets.Midcast.Haste)
			elseif spell.english == 'Migawari: Ichi' then
				equip(sets.Midcast.Migawari)
			elseif sets.Midcast[spell.skill] then
				equip(sets.Midcast[spell.skill])
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
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end

function status_change(new,old)
	check_range_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
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
		if (buffactive.Haste and buffactive.March == 2) and (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste))) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive.Embrava and (buffactive.Haste or buffactive.March) and equipSet["EmbravaHaste"] then
			equipSet = equipSet["EmbravaHaste"]
		end
		if (buffactive.March == 1 and buffactive.Haste and buffactive["Haste Samba"]) or (buffactive.March == 2) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
			equipSet = set_combine(equipSet,sets.TP.Rancor)
		end
		if player.mp >= 100 then -- Use TH Toggle To Lock Full TH Set --
			equipSet = set_combine(equipSet,{left_ring='Oneiros Ring'})
		end
		equip(equipSet)
	else
		equip(sets.Idle[IdleArray[IdleIndex]])
		if world.time >= 1020 or world.time <= 420 then
			equip({feet="Hachi. Kyahan +1"})
		end
	end
	if buffactive.Migawari and Migawari == 'ON' then -- Use Migawari Toggle To Lock Iga Ningi +2 When You Have Migawari On --
		equip(sets.TP.Migawari)
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
	if command == 'C1' then -- Accuracy Toggle --
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
	elseif command == 'C10' then -- Migawari Set Toggle --
		if Migawari == 'ON' then
			Migawari = 'OFF'
			add_to_chat(123,'Migawari Set: [Unlocked]')
		else
			Migawari = 'ON'
			add_to_chat(158,'Migawari Set: [Locked]')
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
		status_change(player.status)
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_range_lock()
	if player.equipment.range ~= 'empty' then
		disable('range','ammo')
	else
		enable('range','ammo')
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

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
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
	if player.sub_job == 'WAR' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'DNC' then
		set_macro_page(2, 2)
	else
		set_macro_page(1, 2)
	end
end