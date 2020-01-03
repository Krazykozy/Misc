-- Multiple TP Sets "Normal", ACC, P/MDT, Hybrid
-- Multiple WS Sets, VS(Acc, Impetus, Impetus + ACC) SS(Normal, Acc) FH(Normal, Acc) Others WS
-- Impetus active, auto VS WS Gear depending on TP Set
-- Impetus Wear off, Remove Impetus Gear and back to "Normal"
-- Auto Boost on Certain WS.
-- SE Macros /console sc c .... Commands are Normal, PDT, MDT, Impetus, Hybrid, AutoBoost 

-- Opens a file in append mode
require('files')
packets = require('packets')
res = require('resources')
enfo = {}

enfo['Fire'] = {}
enfo['Water'] = {}
enfo['Thunder'] = {}
enfo['Ice'] = {}
enfo['Earth'] = {}
enfo['Wind'] = {}

include('organizer-lib')

include("COR_gear_include.lua")
include("COR/Fire/include.lua")
include("COR/Ice/include.lua")
include("COR/Earth/include.lua")
include("COR/Wind/include.lua")
include("COR/Water/include.lua")
include("COR/Thunder/include.lua")

LeadenObi = "Eschan Stone"

function getGear(slot)
    local equip = windower.ffxi.get_items()['equipment']
    return windower.ffxi.get_items(equip[slot..'_bag'])[equip[slot]]~= nil and windower.ffxi.get_items(equip[slot..'_bag'])[equip[slot]].id or 0
end

gearTable = {
        [0]=getGear('main'),[1]=getGear('sub'),[2]=getGear('range'),[3]=getGear('ammo'),
        [4]=getGear('head'),[9]=getGear('neck'),[11]=getGear('left_ear'),[12]=getGear('right_ear'),
        [5]=getGear('body'),[6]=getGear('hands'),[13]=getGear('left_ring'),[14]=getGear('right_ring'),
        [15]=getGear('back'),[10]=getGear('waist'),[7]=getGear('legs'),[8]=getGear('feet')
    }

rollInfoTemp = {
        -- Okay, this goes 1-11 boost, Bust effect, Effect, Lucky, +1 Phantom Roll Effect, Bonus Equipment and Effect,
        ['Chaos'] = {6,8,9,25,11,13,16,3,17,19,31,"-4", '% Attack!', 4, 3},
        ['Fighter\'s'] = {2,2,3,4,12,5,6,7,1,9,18,'-4','% Double-Attack!', 5, 1},
        ['Wizard\'s'] = {4,6,8,10,25,12,14,17,2,20,30, "-10", ' MAB', 5, 2},
        ['Evoker\'s'] = {1,1,1,1,3,2,2,2,1,3,4,'-1', ' Refresh!',5, 1},
        ['Rogue\'s'] = {2,2,3,4,12,5,6,6,1,8,14,'-6', '% Critical Hit Rate!', 5, 1},
        ['Corsair\'s'] = {10, 11, 11, 12, 20, 13, 15, 16, 8, 17, 24, '-6', '% Experience Bonus',5, 2},
        ['Hunter\'s'] = {10,13,15,40,18,20,25,5,27,30,50,'-?', ' Accuracy Bonus',4, 5},
        ['Magus\'s'] = {5,20,6,8,9,3,10,13,14,15,25,'-8',' Magic Defense Bonus',2, 2},
        ['Healer\'s'] = {3,4,12,5,6,7,1,8,9,10,16,'-4','% Cure Potency',3, 1},
        ['Drachen'] = {10,13,15,40,18,20,25,5,28,30,50,'-8',' Pet: Accuracy Bonus',4, 5},
        ['Choral'] = {8,42,11,15,19,4,23,27,31,35,50,'+25', '- Spell Interruption Rate',2, 0},
        ['Monk\'s'] = {8,10,32,12,14,15,4,20,22,24,40,'-?', ' Subtle Blow', 3, 4},
        ['Beast'] = {6,8,9,25,11,13,16,3,17,19,31,'-10', '% Pet: Attack Bonus',4, 3},
        ['Samurai'] = {7,32,10,12,14,4,16,20,22,24,40,'-10',' Store TP Bonus',2, 4},
        ['Warlock\'s'] = {2,3,4,12,5,6,7,1,8,9,15,'-5',' Magic Accuracy Bonus',4, 1},
        ['Puppet'] = {5,8,35,11,14,18,2,22,26,30,40,'-8',' Pet: Magic Attack Bonus',3, 3},
        ['Gallant\'s'] = {4,5,15,6,7,8,3,9,10,11,20,'-10','% Defense Bonus', 3, 2.4},
        ['Dancer\'s'] = {3,4,12,5,6,7,1,8,9,10,16,'-4',' Regen',3, 2},
        ['Bolter\'s'] = {0.3,0.3,0.8,0.4,0.4,0.5,0.5,0.6,0.2,0.7,1.0,'-8','% Movement Speed',3, 0.2},
        ['Caster\'s'] = {6,15,7,8,9,10,5,11,12,13,20,'-10','% Fast Cast',2, 3,{7,11140,10}},
        ['Tactician\'s'] = {10,10,10,10,30,10,10,0,20,20,40,'-10',' Regain',5, 2, {5, 11100, 10}},
        ['Miser\'s'] = {30,50,70,90,200,110,20,130,150,170,250,'0',' Save TP',5, 15},
        ['Ninja'] = {4,5,5,14,6,7,9,2,10,11,18,'-10',' Evasion Bonus',4, 2},
        ['Scholar\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?',' Conserve MP',2, 0},
        ['Allies\''] = {6,7,17,9,11,13,15,17,17,5,17,'?','% Skillchain Damage',3, 1,{6,11120, 5}},
        ['Companion\'s'] = {{4,20},{20, 50},{6,20},{8, 20},{10,30},{12,30},{14,30},{16,40},{18, 40}, {3,10},{30, 70},'-?',' Pet: Regen/Regain',2, {1,5}},
        ['Avenger\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?',' Counter Rate',4, 0},
        ['Blitzer\'s'] = {2,3.4,4.5,11.3,5.3,6.4,7.2,8.3,1.5,10.2,12.1,'-?', '% Attack delay reduction',4, 1, {4,11080, 5}},
        ['Courser\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?',' Snapshot',3, 0},
        ['Runeist\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?',' Magic Evasion',4, 0},
        ['Naturalist\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?',' Enhancing Magic Duration',3, 0}
    }
	
RollLuckyUnlucky = {
		['Chaos Roll'] = {4,8},
        ['Fighter\'s Roll'] = {5,9},
        ['Wizard\'s Roll'] = {5,9},
        ['Evoker\'s Roll'] = {5,9},
        ['Rogue\'s Roll'] = {5,9},
        ['Corsair\'s Roll'] = {5,9},
        ['Hunter\'s Roll'] = {4,8},
        ['Magus\'s Roll'] = {2,6},
        ['Healer\'s Roll'] = {3,7},
        ['Drachen Roll'] = {4,8},
        ['Choral Roll'] = {2,6},
        ['Monk\'s Roll'] = {3,7},
        ['Beast Roll'] = {4,8},
        ['Samurai Roll'] = {2,6},
        ['Warlock\'s Roll'] = {4,8},
        ['Puppet Roll'] = {3,7},
        ['Gallant\'s Roll'] = {3,7},
        ['Dancer\'s Roll'] = {3,7},
        ['Bolter\'s Roll'] = {3,9},
        ['Caster\'s Roll'] = {2,7},
        ['Tactician\'s Roll'] = {5,8},
        ['Miser\'s Roll'] = {5,7},
        ['Ninja Roll'] = {4,8},
        ['Scholar\'s Roll'] = {2,6},
        ['Allies\' Roll'] = {3,10},
        ['Companion\'s Roll'] = {2,10},
        ['Avenger\'s Roll'] = {4,8},
        ['Blitzer\'s Roll'] = {4,9},
        ['Courser\'s Roll'] = {3,9},
        ['Runeist\'s Roll'] = {4,8},
        ['Naturalist\'s Roll'] = {3,7},
}


function user_setup()
-- Default macro set/book
set_macro_page(1, 13)
end

WSN = 3
WeaponSetup = {}
WeaponSetup[1] = {"SuperSavage", "Fettering Blade", "Blurred Knife", "Anarchy +2"}
WeaponSetup[2] = {"SuperRange", "Fettering Blade", "Blurred Knife", "Compensator"}
WeaponSetup[3] = {"SuperMAB", "Fettering Blade", "Atoyac", "Doomsday"}

boo = 0


--- BULLETS SET :
RAbullet = "Living Bullet"
WSbullet = "Living Bullet"
MAbullet = "Living Bullet"
QDbullet = "Living Bullet"
RABulletleft = 0
MABulletleft = 0
TCLeft = 0
HH = 0
CA = 0
CC = 0

if(player.inventory[RAbullet]) then
RABulletleft = player.inventory[RAbullet].count
end
if(player.inventory[MAbullet]) then
MABulletleft = player.inventory[MAbullet].count
end
----------------------------- TEXTBOX HELPER -----------------------------------------------------------

RollOne = "Runeist's Roll"
RollTwo = "Samurai Roll"
OneStatus = "Off"
TwoStatus = "Off"
OneValue = 0
TwoValue = 0

MTP = "Normal"
RATP = "Normal"
MWS = "Normal"
RAWS = "Normal"

tb_name = "corhelp"
visible = true


-- Check availability of file
function file_check(file_name)
  local file_found=io.open(file_name, "r")      

  if file_found==nil then
    file_found=false
  else
    file_found=true
  end
  return file_found
end

function parse(element, target, amount)

tfile = windower.addon_path.."data/COR/"..element.."/"..target..".lua"
--- CHECKING IF FILE EXIST
	filexist = file_check(tfile)
if filexist then
print(enfo[element][target])
if(tonumber(amount)>enfo[element][target]) then
file = io.open(windower.addon_path.."data/COR/"..element.."/"..target..".lua", "w")
thetext = 'enfo["'..element..'"]["'..target..'"] = '..amount..''
file:write(thetext)
file:close()
include("COR/"..element.."/include.lua")
end
else
add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..target..'... recording... ] *-*-*-*-*-*-*-*-*')
-- Create file
file = io.open(windower.addon_path.."data/COR/"..element.."/"..target..".lua", "w")
thetext = 'enfo["'..element..'"]["'..target..'"] = '..amount..''
file:write(thetext)
file:close()



-- Include it in include file
file = io.open(windower.addon_path.."data/COR/"..element.."/include.lua", "r")
texting = file:read("*a")
	
	texting = texting..'\n include("COR/'..element..'/'..target..'.lua")'
	
	file:close()
		file = io.open(windower.addon_path.."data/COR/"..element.."/include.lua", "w")
		file:write(tostring(texting))
		file:close()
		include("COR/"..element.."/include.lua")

end

end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

textinbox = ''
R_RA = round(125 + (125-RABulletleft*125/99))
G_RA = round(125 + RABulletleft*125/99)

R_MA = round(125 + (125-MABulletleft*125/99))
G_MA = round(125 + MABulletleft*125/99)
	
	textinbox = textinbox..' \\cs(125, 125, 125) 1-'..RollOne..'\\cr \n'
	textinbox = textinbox..' \\cs(125, 125, 125) 2-'..RollTwo..'\\cr \n'
	textinbox = textinbox..' \\cs(125, 125, 125) '..RAbullet..' :\\cr \\cs('..R_RA..', '..G_RA..', 125)'..RABulletleft..' \\cr \n'
	textinbox = textinbox..' \\cs(125, 125, 125) '..MAbullet..' :\\cr \\cs('..R_MA..', '..G_MA..', 125)'..MABulletleft..' \\cr \n'
	
	
	

    windower.text.create(tb_name)
    windower.text.set_location(tb_name, 600, 150)
    windower.text.set_bg_color(tb_name, 200, 54, 43, 0)
    windower.text.set_color(tb_name, 255, 147, 161, 161)
    windower.text.set_font(tb_name, "Arial")
    windower.text.set_font_size(tb_name, 10)
    windower.text.set_bold(tb_name, false)
    windower.text.set_italic(tb_name, false)
    windower.text.set_text(tb_name, textinbox)
    windower.text.set_bg_visibility(tb_name, visible)

    --local player = windower.ffxi.get_player()

	higherele = ""

 

function refresh()
	textinbox = ''
	
	if(player.inventory[RAbullet]) then
		RABulletleft = player.inventory[RAbullet].count
	end
	if(player.inventory[MAbullet]) then
		MABulletleft = player.inventory[MAbullet].count
	end
	if(player.inventory['Trump Card']) then
		TCLeft = player.inventory['Trump Card'].count
	end
	if(player.inventory["Isgebind's Heart"]) then
		HH = player.inventory["Isgebind's Heart"].count
	end
	if(player.inventory["Carabosse's Gem"]) then
		CA = player.inventory["Carabosse's Gem"].count
	end
	if(player.inventory["Cirein. Lantern"]) then
		CC = player.inventory["Cirein. Lantern"].count
	end
	R_RA = round(125 + (125-RABulletleft*125/99))
	G_RA = round(125 + RABulletleft*125/99)
	R_MA = round(125 + (125-MABulletleft*125/99))
	G_MA = round(125 + MABulletleft*125/99)
	R_TC = round(125 + (125-TCLeft*125/99))
	G_TC = round(125 + TCLeft*125/99)
	
	if R_RA > 255 then R_RA = 255 end
	if R_RA < 0 then R_RA = 0 end
	if G_RA > 255 then G_RA = 255 end
	if G_RA < 0 then G_RA = 0 end
	if R_MA > 255 then R_MA = 255 end
	if R_MA < 0 then R_MA = 0 end
	if G_MA > 255 then G_MA = 255 end
	if G_MA < 0 then G_MA = 0 end
	if R_TC > 255 then R_TC = 255 end
	if R_TC < 0 then R_TC = 0 end
	if G_TC > 255 then G_TC = 255 end
	if G_TC < 0 then G_TC = 0 end
	
	if buffactive[RollOne] then
		OneStatus = "\\cs(125, 255, 125)On\\cr"
	else
		OneStatus = "\\cs(255, 125, 125)Off\\cr"
		--OneValue = 0
	end
	
	if buffactive[RollTwo] then
		TwoStatus = "\\cs(125, 255, 125)On\\cr"
	else
		TwoStatus = "\\cs(255, 125, 125)Off\\cr"
		--TwoValue = 0
	end
	
	-- Rolls SPELL
									--textinbox = textinbox..' \\cs(125, 125, 125) Mobtype = '..player.target.speed..' \n' ---- PARTY COUNT - DoLM = '..party[party.count].distance'
									--textinbox = textinbox..' \\cs(125, 125, 125) DoLM = '..windower.ffxi.get_mob_by_id(party[party.count].mob.id).distance:sqrt()..' \n' ---- PARTY COUNT - 
	prrecast = windower.ffxi.get_ability_recasts()[193]
	--textinbox = textinbox..' \\cs(125, 255, 125) TEST :'..OneValue..'/'..TwoValue..'\\cr \n'
	--textinbox = textinbox..' \\cs(125, 255, 125) TEST :'..boo..'\\cr \n'
	if prrecast == 0 then 
	textinbox = textinbox..' \\cs(125, 255, 125) Phantom Roll :\\cr \n'
	else
	textinbox = textinbox..' \\cs(255, 125, 125) Phantom Roll('..prrecast..'s) :\\cr \n'
	end
	----------------------- ROLL HELPER ---------------------------------------------------------------------
	if OneValue == 	RollLuckyUnlucky[RollOne][1] or OneValue == 11 then
		textinbox = textinbox..' \\cs(125, 125, 125) 1-\\cs(125, 255, 125)'..RollOne..'\\cr(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollOne][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollOne][2]..'\\cr) - \\cr'..OneStatus..' - \\cs(125, 255, 125)'..OneValue..'\\cr \n'
		textinbox = textinbox..' \\cs(200, 200, 100) ------> '..RollEffect(res.job_abilities:with('english', RollOne).id, OneValue+1)..'\\cr \n'
	elseif OneValue == RollLuckyUnlucky[RollOne][2] then
		textinbox = textinbox..' \\cs(125, 125, 125) 1-\\cs(2555, 125, 125)'..RollOne..'\\cr(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollOne][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollOne][2]..'\\cr) - \\cr'..OneStatus..' - \\cs(255, 125, 125)'..OneValue..'\\cr  \n'
		textinbox = textinbox..' \\cs(200, 200, 100) ------> '..RollEffect(res.job_abilities:with('english', RollOne).id, OneValue+1)..'\\cr \n'
	elseif OneValue >= 12 then
		textinbox = textinbox..' \\cs(125, 125, 125) 1-\\cs(255, 255, 125)'..RollOne..'\\cr(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollOne][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollOne][2]..'\\cr) - \\cr'..OneStatus..' - \\cs(255, 125, 125)BUST\\cr  \n'
	elseif OneValue == 0 then
		textinbox = textinbox..' \\cs(125, 125, 125) 1-'..RollOne..'(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollOne][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollOne][2]..'\\cr) - \\cr'..OneStatus..' \n'
	elseif windower.ffxi.get_ability_recasts()[197] == 0 and OneValue == (RollLuckyUnlucky[RollOne][1]-1) and buffactive['Double-Up Chance'] then
		textinbox = textinbox..' \\cs(125, 125, 125) 1-'..RollOne..'(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollOne][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollOne][2]..'\\cr) - \\cr'..OneStatus..' - '..OneValue..' - \\cs(125, 255, 125)Snake Eye to Lucky roll \n'
		textinbox = textinbox..' \\cs(200, 200, 100) ------> '..RollEffect(res.job_abilities:with('english', RollOne).id, OneValue+1)..'\\cr \n'
	else
		textinbox = textinbox..' \\cs(125, 125, 125) 1-'..RollOne..'(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollOne][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollOne][2]..'\\cr) - \\cr'..OneStatus..' - '..OneValue..' \n'
		textinbox = textinbox..' \\cs(200, 200, 100) ------> '..RollEffect(res.job_abilities:with('english', RollOne).id, OneValue+1)..'\\cr \n'
	end
	--if TwoValue == 0 then
	--textinbox = textinbox..' \\cs(125, 125, 125) 2-'..RollTwo..'(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollTwo][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollTwo][2]..'\\cr) - \\cr'..TwoStatus..' \n'
	--end
	if TwoValue == 	RollLuckyUnlucky[RollTwo][1] or TwoValue == 11 then
		textinbox = textinbox..' \\cs(125, 125, 125) 2-\\cs(125, 255, 125)'..RollTwo..'\\cr(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollTwo][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollTwo][2]..'\\cr) - \\cr'..TwoStatus..' - \\cs(125, 255, 125)'..TwoValue..'\\cr \n'
		textinbox = textinbox..' \\cs(100, 200, 200) ------> '..RollEffect(res.job_abilities:with('english', RollTwo).id, TwoValue+1)..'\\cr \n'
	elseif TwoValue == RollLuckyUnlucky[RollTwo][2] then
		textinbox = textinbox..' \\cs(125, 125, 125) 2-\\cs(255, 125, 125)'..RollTwo..'\\cr(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollTwo][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollTwo][2]..'\\cr) - \\cr'..TwoStatus..' - \\cs(255, 125, 125)'..TwoValue..'\\cr  \n'
		textinbox = textinbox..' \\cs(100, 200, 200) ------> '..RollEffect(res.job_abilities:with('english', RollTwo).id, TwoValue+1)..'\\cr \n'
	elseif TwoValue >= 12 then
		textinbox = textinbox..' \\cs(125, 125, 125) 2-\\cs(255, 255, 125)'..RollTwo..'\\cr(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollTwo][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollTwo][2]..'\\cr) - \\cr'..TwoStatus..' - \\cs(255, 125, 125)BUST\\cr  \n'
	elseif TwoValue == 0 then
		textinbox = textinbox..' \\cs(125, 125, 125) 2-'..RollTwo..'(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollTwo][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollTwo][2]..'\\cr) - \\cr'..TwoStatus..' \n'
	elseif windower.ffxi.get_ability_recasts()[197] == 0 and TwoValue == (RollLuckyUnlucky[RollTwo][1]-1) and buffactive['Double-Up Chance'] then
		textinbox = textinbox..' \\cs(125, 125, 125) 2-'..RollTwo..'(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollTwo][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollTwo][2]..'\\cr) - \\cr'..TwoStatus..' - '..TwoValue..' - \\cs(125, 255, 125)Snake Eye to Lucky roll \n'
		textinbox = textinbox..' \\cs(100, 200, 200) ------> '..RollEffect(res.job_abilities:with('english', RollTwo).id, TwoValue+1)..'\\cr \n'
	else
		textinbox = textinbox..' \\cs(125, 125, 125) 2-'..RollTwo..'(\\cs(125, 255, 125)L'..RollLuckyUnlucky[RollTwo][1]..'\\cr/\\cs(255, 125, 125)U'..RollLuckyUnlucky[RollTwo][2]..'\\cr) - \\cr'..TwoStatus..' - '..TwoValue..' \n'
		textinbox = textinbox..' \\cs(100, 200, 200) ------> '..RollEffect(res.job_abilities:with('english', RollTwo).id, TwoValue+1)..'\\cr \n'
	end
	-----------------------------------------------------------------------------------------------------------------
	textinbox = textinbox..' \\cs(125, 125, 125) '..RAbullet..' :\\cr \\cs('..R_RA..', '..G_RA..', 125)'..RABulletleft..' \\cr \n'
	textinbox = textinbox..' \\cs(125, 125, 125) '..MAbullet..' :\\cr \\cs('..R_MA..', '..G_MA..', 125)'..MABulletleft..' \\cr \n'
	qdrecast = windower.ffxi.get_ability_recasts()[195]
	if qdrecast == 0 then
		textinbox = textinbox..' \\cs(125, 255, 125) Trump Cards(2QD) :\\cr \\cs('..R_TC..', '..G_TC..', 125)'..TCLeft..' \\cr \n'
	elseif qdrecast <40 then
		textinbox = textinbox..' \\cs(177, 177, 125) Trump Cards(1QD - '..qdrecast..'s) :\\cr \\cs('..R_TC..', '..G_TC..', 125)'..TCLeft..' \\cr \n'
	else
		textinbox = textinbox..' \\cs(255, 125, 125) Trump Cards(0QD - '..qdrecast..'s) :\\cr \\cs('..R_TC..', '..G_TC..', 125)'..TCLeft..' \\cr \n'
	end
	
	
	
	
	-- Empy
	--textinbox = textinbox..' \\cs(125, 125, 125) --- EMPY ZONE -- \n'
	--textinbox = textinbox..' \\cs(125, 125, 125) Carabosse :\\cr \\cs(55, 255, 55)'..CA..'/50 \\cr \n'
	--textinbox = textinbox..' \\cs(125, 125, 125) Cirein-Croin :\\cr \\cs(255, 55, 255)'..CC..'/50 \\cr \n'
	--textinbox = textinbox..' \\cs(125, 125, 125) Isgebind :\\cr \\cs(255, 55, 55)'..HH..'/75 \\cr \n'
	textinbox = textinbox..' \\cs(125, 125, 125) MeleeTP :\\cr \\cs(255, 55, 55)'..MTP..' \\cr \n'
	textinbox = textinbox..' \\cs(125, 125, 125) RATP :\\cr \\cs(55, 55, 255)'..RATP..' \\cr \n'
	textinbox = textinbox..' \\cs(125, 125, 125) MeleeWS :\\cr \\cs(55, 255, 55)'..MWS..' \\cr \n'
	textinbox = textinbox..' \\cs(125, 125, 125) RAWS :\\cr \\cs(255, 155, 155)'..RAWS..' \\cr \n'
	------------------------ PC in range for roll --------------------------------------------
	dist = 8
	if party.count > 1 then
	if Luzaf == "Luzaf's Ring" then
		dist = 16
	else
		dist = 8
	end
	 disttext = "In Rolls range ("..dist.." yalms) "
	for i=2, party.count do 
		if party[i].mob then
		if windower.ffxi.get_mob_by_id(party[i].mob.id).distance:sqrt() < dist then
			disttext = disttext.." - "..party[i].name
		end
		end
	end
	
	textinbox = textinbox..'\\cs(125, 125, 125)'..disttext..'\\cr \n'
	end
	
	------------------------------------------------------------------------------------------
	
	
	--- TARGET WEAKNESS CHECKER ---------------------------------------------------------------
	
	if player.target.name and player.target.type == "MONSTER" then
		textinbox = textinbox..' \\cs(100, 100, 200) '..player.target.name..' \\cr \n'
		--- MSG FOR NO RECORD
		elementinfo = ' \\cs(255, 125, 125) No Info Element \\cr \n'
		--- MSG FOR PARTIAL ELEMENT
		missingele = 0
		maybeadd = "\\cs(255, 125, 125) Missing Element : \\cr"
		if not	enfo['Fire'][player.target.name] then
			maybeadd = maybeadd.."\\cs(255, 100, 100) Fire \\cr"
			missingele = missingele +1
		end
		if not	enfo['Water'][player.target.name] then
			maybeadd = maybeadd.."\\cs(100, 100, 255) Water \\cr"
			missingele = missingele +1
		end
		if not	enfo['Wind'][player.target.name] then
			maybeadd = maybeadd.."\\cs(100, 255, 100) Wind \\cr"
			missingele = missingele +1
		end
		if not	enfo['Ice'][player.target.name] then
			maybeadd = maybeadd.."\\cs(100, 100, 180) Ice \\cr"
			missingele = missingele +1
		end
		if not	enfo['Earth'][player.target.name] then
			maybeadd = maybeadd.."\\cs(255, 255, 100) Earth \\cr"
			missingele = missingele +1
		end
		if not	enfo['Thunder'][player.target.name] then
			maybeadd = maybeadd.."\\cs(255, 100, 255) Thunder \\cr"
			missingele = missingele +1
		end
		
		if maybeadd ~= "\\cs(255, 125, 125) Missing Element : \\cr" then
			elementinfo = maybeadd
		end
		
		--- MSG FOR WINNER
		if missingele == 0 then
			ele_id = {"Fire","Water","Wind","Ice","Thunder","Earth"}
			higherdmg = enfo['Fire'][player.target.name]
			higherele = "Fire"
			weakerele = "Ice"
			weakerdmg = enfo['Ice'][player.target.name]
			for j=1, 6 do
				if weakerdmg > enfo[ele_id[j]][player.target.name] then
					weakerdmg = enfo[ele_id[j]][player.target.name]
					weakerele = ele_id[j]
				end
			end
			for i=1, 6 do
				if higherdmg < enfo[ele_id[i]][player.target.name] then
					higherdmg = enfo[ele_id[i]][player.target.name]
					higherele = ele_id[i]
				end
			end
			if higherdmg == weakerdmg then
				elementinfo = "No Resistance - No Weakness"
			else
				color = "\\cs(255, 125, 125)"
				if higherele == "Fire" then color = "\\cs(255, 100, 100)"
				elseif higherele == "Water" then color = "\\cs(100, 100, 255)"
				elseif higherele == "Wind" then color = "\\cs(100, 255, 100)"
				elseif higherele == "Ice" then color = "\\cs(100, 100, 180)"
				elseif higherele == "Earth" then color = "\\cs(255, 255, 100)"
				elseif higherele == "Thunder" then color = "\\cs(255, 100, 255)"
				end
				textele = color..""..higherele.."\\cr"
				for k=1, 6 do
					if higherdmg == enfo[ele_id[k]][player.target.name] then
						if ele_id[k] ~= higherele then
							color3 = "\\cs(255, 125, 125)"
							if ele_id[k] == "Fire" then color3 = "\\cs(255, 100, 100)"
							elseif ele_id[k] == "Water" then color3 = "\\cs(100, 100, 255)"
							elseif ele_id[k] == "Wind" then color3 = "\\cs(100, 255, 100)"
							elseif ele_id[k] == "Ice" then color3 = "\\cs(100, 100, 180)"
							elseif ele_id[k] == "Earth" then color3 = "\\cs(255, 255, 100)"
							elseif ele_id[k] == "Thunder" then color3 = "\\cs(255, 100, 255)"
							end
							textele = textele.." - "..color3..""..ele_id[k].."\\cr"
						end
					end
				end
				color2 = "\\cs(255, 125, 125)"
			
				elementinfo = color.."WEAK TO : \\cr"..textele..""
				if weakerele == "Fire" then color2 = "\\cs(255, 100, 100)"
				elseif weakerele == "Water" then color2 = "\\cs(100, 100, 255)"
				elseif weakerele == "Wind" then color2 = "\\cs(100, 255, 100)"
				elseif weakerele == "Ice" then color2 = "\\cs(100, 100, 180)"
				elseif weakerele == "Earth" then color2 = "\\cs(255, 255, 100)"
				elseif weakerele == "Thunder" then color2 = "\\cs(255, 100, 255)"
				end
				elementinfo = elementinfo.." - "..color2.."STRONG TO : "..weakerele.."\\cr"
			end
			
		end
		textinbox = textinbox..elementinfo

	end

	windower.text.set_text(tb_name, textinbox)
end

windower.register_event('unload', function()
    windower.text.delete(tb_name)
end)

foc = 0
--Auto Boost on Certain WS
function precast(spell,action)
	
	if NoQDWS:contains(spell.english)  then
		equip({ammo=RABullet})
		equip(sets.precast[spell.english])
		add_to_chat(256, '*-*-*-*-*-*-*-*-* [ Living was in Ammo Slot -DD is now in Ammo, use WS ] *-*-*-*-*-*-*-*-*' )
	elseif spell.action_type == 'Ranged Attack' then
		if player.ammo == QDBullet then
			equip({ammo=RABullet})
		end
		equip(sets.precast.RA)
	elseif ShotsList:contains(spell.english) or spell.english == "Light Shot" or spell.english == "Dark Shot" then
		equip(sets.precast.CorsairShot)
	elseif sets.precast[spell.english] then
        equip(sets.precast[spell.english])
		-- add_to_chat(392,'*-*-*-*-*-*-*-*-* [ WS AGI = '..player.agi..' ] *-*-*-*-*-*-*-*-*')
	elseif rollslist:contains(spell.english) then
		equip(sets.precast.CorsairRoll)
	elseif spell.type=="WeaponSkill" then
			equip(sets.precast.WS)
	elseif string.find(spell.english,'Waltz') then
			equip(sets.precast.Waltz)
	end
	
	return
end

nin = {"Doton", "Suiton", "Raiton", "Katon", "Futon"}

function midcast(spell,action)
	if spell.action_type == 'Ranged Attack' then
		if player.ammo == QDBullet then
			equip({ammo=RABullet})
		end
		if buffactive['Triple Shot'] then
			equip(sets.midcast.RATS)
		else
			equip(sets.midcast.RA)
		end
	elseif spell.english == "Yoran-Oran (UC)" then
		equip({body="Yoran Unity Shirt"})
	elseif spell.english == "Doton: Ichi" or spell.english == "Doton: Nii" or spell.english == "Katon: Ichi" or spell.english == "Katon: Ni" or spell.english == "Suiton: Ichi" or spell.english == "Suiton: Ni" then
		equip(sets.midcast.ninjutsu)
	elseif sets.precast[spell.english] then
        equip(sets.precast[spell.english])
		-- add_to_chat(392,'*-*-*-*-*-*-*-*-* [ WS AGI = '..player.agi..' ] *-*-*-*-*-*-*-*-*')
	elseif ShotsList:contains(spell.english) then
		equip(sets.midcast.CorsairShot)
	elseif spell.type=="WeaponSkill" then
	
			equip(sets.precast.WS)
			-- add_to_chat(392,'*-*-*-*-*-*-*-*-* [ WS AGI = '..player.agi..' ] *-*-*-*-*-*-*-*-*')
	elseif string.find(spell.english,'Waltz') then
			equip(sets.precast.Waltz)
	end
end

function aftercast(spell,action)
	if spell.name == null then
			return -- Cancel Aftercast for outofrange/unable to see.
	end	
	
	

	if player.status == 'Engaged' then
			equip(sets.aftercast.TP)
	else
		
			equip(sets.aftercast.Idle)
			add_to_chat(392,'*-*-*-*-*-*-*-*-* [ Idle ] *-*-*-*-*-*-*-*-*')
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		enga = 1
		
		
		equip(sets.aftercast.TP)
	else
	enga = 0
	equip(sets.aftercast.Idle)
			add_to_chat(392,'*-*-*-*-*-*-*-*-* [ Idle ] *-*-*-*-*-*-*-*-*')
	end
end

memoryset = {}
function buff_change(status,gain_or_loss)
	if status == "sleep" then
		if gain_or_loss then
			equip({neck="Opo-opo Necklace"})
		end
	end
	
	if status == RollOne then
		if not gain_or_loss then
			OneValue = 0
		end
	end
	
	if status == RollTwo then
		if not gain_or_loss then
			OneValue = 0
		end
	end
	
	if status == "Reive Mark" then
		if gain_or_loss then
			equip({neck="Ygnas's Resolve +1"})
			disable("neck")
			add_to_chat(278, "REIVE ----------> WS+25% - Regain up")
		else
			enable("neck")
			add_to_chat(278, "REIVE ----------> OFF")
		end
	end
	
	if status == "encumbrance" then
		if not gain_or_loss then
			equip({main="Fettering blade", sub="Atoyac", range="Death Penalty"})
			add_to_chat(278, "----------> Weapons got back")
		end
	end
end


-- Toggles -- SE Macros: /console gs c "command" [case sensitive]
function self_command(command)
		if command == 'normal' then
			if player.status == 'Engaged' then	
				equip(sets.engaged.Melee)
				sets.aftercast.TP = sets.engaged.Melee
				sets.precast.acclvl = sets.engaged.Melee
				sets.aftercast.Idle = sets.idle
				add_to_chat(455, '*-*-*-*-*-*-*-*-* [ Normal TP ] *-*-*-*-*-*-*-*-*')
			else
				equip(sets.aftercast.Idle)
				sets.aftercast.TP = sets.engaged.Melee
				sets.precast.acclvl = sets.engaged.Melee
				sets.aftercast.Idle = sets.idle
				add_to_chat(455, '*-*-*-*-*-*-*-*-* [ Normal TP - Idle ] *-*-*-*-*-*-*-*-*')
			end
			MTP="Normal"
		elseif command == 'nodt' then
				equip(sets.precast.acclvl)
				sets.aftercast.TP = sets.precast.acclvl
				sets.aftercast.Idle = sets.idle
				add_to_chat(455, '*-*-*-*-*-*-*-*-* [ DT off ] *-*-*-*-*-*-*-*-*')
				MTP="Normal"
		elseif command == 'acc' then
				equip(sets.engaged.Acc)
				sets.aftercast.TP = sets.engaged.Acc
				sets.precast.acclvl = sets.engaged.Acc
				sets.aftercast.Idle = sets.idle
				MTP = "Accuracy"
				add_to_chat(455, '*-*-*-*-*-*-*-*-* [ Full Acc ] *-*-*-*-*-*-*-*-*')
		elseif command == 'PDT' then
			equip(sets.defense.PDT)
			sets.aftercast.TP = sets.defense.PDT
			sets.aftercast.Idle = sets.defense.PDT
				add_to_chat(455, '*-*-*-*-*-*-*-*-* [ PDT ] *-*-*-*-*-*-*-*-*')
				MTP = "PDT"
		elseif command == 'Range' then
			if sets.midcast.RA == sets.midcast.RANorm then
				sets.midcast.RA = sets.midcast.RAcc
				add_to_chat(455, '*-*-*-*-*-*-*-*-* [ RACC ] *-*-*-*-*-*-*-*-*')
				RATP = "RAcc"
			else
				sets.midcast.RA = sets.midcast.RANorm
				add_to_chat(455, '*-*-*-*-*-*-*-*-* [ Range Normal ] *-*-*-*-*-*-*-*-*')
				RATP = "Normal"
			end
		elseif command == 'MDT' then
				equip(sets.defense.MDT)
				sets.aftercast.TP = sets.defense.MDT
				sets.aftercast.Idle = sets.defense.MDT
				add_to_chat(501, '*-*-*-*-*-*-*-*-* [ MDT ] *-*-*-*-*-*-*-*-*')
				MTP="MDT"
		elseif command == 'BestShot' then
				send_command('input /ja "'..higherele..' Shot" <t>')
				add_to_chat(501, '*-*-*-*-*-*-*-*-* [ Best SHOT ] *-*-*-*-*-*-*-*-*')
		elseif command == 'AutoRoll' then
				if OneStatus == "\\cs(255, 125, 125)Off\\cr" then
					send_command('input /ja "'..RollOne..'" <me>')
				elseif TwoStatus == "\\cs(255, 125, 125)Off\\cr" then
					send_command('input /ja "'..RollTwo..'" <me>')
				end
				add_to_chat(501, '*-*-*-*-*-*-*-*-* [ Rolling ] *-*-*-*-*-*-*-*-*')
		elseif command == "Luzaf" then
			if Luzaf == "Luzaf's Ring" then
				Luzaf = ""
				add_to_chat(501, '*-*-*-*-*-*-*-*-* [ LUZAF is OFF - '..Luzaf..' ] *-*-*-*-*-*-*-*-*')
			else
				Luzaf = "Luzaf's Ring"
				add_to_chat(501, '*-*-*-*-*-*-*-*-* [ LUZAF is ON ] - '..Luzaf..' *-*-*-*-*-*-*-*-*')
			end
		elseif command == 'regpack' then 
			if regpack == 1 then
				regpack = 0
				add_to_chat(167, '*-*-*-*-*-*-*-*-* [ Packet register OFF ] *-*-*-*-*-*-*-*-*')
			else
				regpack = 1
				add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Packet register ON ] *-*-*-*-*-*-*-*-*')
			end
		elseif command == "recordshot" then
			if not	enfo['Fire'][player.target.name] then
				send_command('input /ja "Fire Shot" <t>')
			elseif not	enfo['Water'][player.target.name] then
				send_command('input /ja "Water Shot" <t>')
			elseif not	enfo['Wind'][player.target.name] then
				send_command('input /ja "Wind Shot" <t>')
			elseif not	enfo['Ice'][player.target.name] then
				send_command('input /ja "Ice Shot" <t>')
			elseif not	enfo['Earth'][player.target.name] then
				send_command('input /ja "Earth Shot" <t>')
			elseif not	enfo['Thunder'][player.target.name] then
				send_command('input /ja "Thunder Shot" <t>')
			else 
				send_command('input /ja "'..higherele..' Shot" <t>')
			end
	end
end




windower.register_event('Zone change', function(new_id, old_id)
		
	if regpack then
		add_to_chat(204, '*-*-*-*-*-*-*-*-* [ New zone = '..new_id..' / Old zone = '..old_id..' ] *-*-*-*-*-*-*-*-*')
	end
	

	
	return modified, injected
end)

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

function check_set()
	for i=1, numberofautoset do
		
		send_command('input //gs equip naked;wait 0.5; input /equipset '..i..'')
		sleep(2)
		autoset[i] = {
			main=player.equipment.main,
			sub=player.equipment.sub,
			range=player.equipment.range,
			ammo=player.equipment.ammo,
			head=player.equipment.head,
			neck=player.equipment.neck, 
			ear1=player.equipment.left_ear,
			ear2=player.equipment.right_ear,
			body=player.equipment.body,
			hands=player.equipment.hands,
			ring1=player.equipment.left_ring,
			ring2=player.equipment.right_ring,
			back=player.equipment.back,
			waist=player.equipment.waist,
			legs=player.equipment.legs,
			feet=player.equipment.feet
		}
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Auto Set Number '..i..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Main : '..player.equipment.main..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Sub : '..player.equipment.sub..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Range : '..player.equipment.range..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Ammo : '..player.equipment.ammo..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Head : '..player.equipment.head..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Neck : '..player.equipment.neck..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Earring1 : '..player.equipment.left_ear..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Earring2 : '..player.equipment.right_ear..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Body : '..player.equipment.body..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Hands : '..player.equipment.hands..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Ring1 : '..player.equipment.left_ring..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Ring2 : '..player.equipment.right_ring..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Back : '..player.equipment.back..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Waist : '..player.equipment.waist..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Legs : '..player.equipment.legs..' ] *-*-*-*-*-*-*-*-*')
		add_to_chat(179, '*-*-*-*-*-*-*-*-* [ Feet : '..player.equipment.feet..' ] *-*-*-*-*-*-*-*-*')
		sleep(1)
	end
	-- resetting autoset
	sets.precast.Chakra = autoset[1]
	sets.precast.Focus = autoset[2]
end



wscount = 0

beadk=3

--- Delve Assistant
windower.register_event('incoming text', function(original, modified, mode)
    local match
		
		match = original:match('Faloun defeats')
			if match then
				beadk = beadk+1
				add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Counting : '..beadk..' ] *-*-*-*-*-*-*-*-*')
			end
		
		-- NM Move trigger
		if enga == 1 and autoswap == 1 then
			if player.target.name then
			match = original:match(''..player.target.name..' readies ([%s%w]+)%.')
		
			if MEvaTrigger:contains(match) then
				equip(sets.defense.MEva)
				add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..player.target.name..' : '..match..' - Resist MEVA ] *-*-*-*-*-*-*-*-*')
			end
			end
		end
		if player.target.name then
			match = original:match(''..player.name..' uses ([%s%w]+)% Shot.The '..player.target.name..' takes ([%s%w]+)% points of damage.')
			--add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..' ] *-*-*-*-*-*-*-*-*')
			if EleList:contains(match) then
				match2 = original:match(''..player.name..' uses '..match..' Shot.The '..player.target.name..' takes ([%s%w]+)% points of damage.')
				add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..' for '..match2..' dmg - on '..player.target.name..' ] *-*-*-*-*-*-*-*-*')
				parse(match, player.target.name, match2)
			end
		end
		
		if player.target.name then
			if player.target.name == "Urmahlullu" then
			match = original:match('Urmahlullu starts casting')
			--add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..' ] *-*-*-*-*-*-*-*-*')
			if match then
				add_to_chat(204, '*-*-*-*-*-*-*-*-* [ WSINNNG ] *-*-*-*-*-*-*-*-*')
				send_command('input /ws "Leaden Salute" <t>')
			end
			end
		end
		
		if player.target.name then
			if player.target.name == "Chorister" then
			match = original:match('The Chorister readies')
			--add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..' ] *-*-*-*-*-*-*-*-*')
			if match then
				add_to_chat(204, '*-*-*-*-*-*-*-*-* [ WSINNNG ] *-*-*-*-*-*-*-*-*')
				send_command('input /ws "Last Stand" <t>')
			end
			end
		end

		
		if player.target.name then
			match = original:match('The Battleclad Chariot readies Discoid.')
			--add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..' ] *-*-*-*-*-*-*-*-*')
			if match then
			add_to_chat(204, '*-*-*-*-*-*-*-*-* [ DISCOOOOOIIIIIIIIDDDD ] *-*-*-*-*-*-*-*-*')
			send_command("input /ma Stun <t>")
			end
		end
		
		if player.target.name then
			match = original:match(''..player.target.name..' uses ([%s%w]+)% Shot.The '..player.target.name..' take ([%s%w]+)% points of damage.')
			--add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..' ] *-*-*-*-*-*-*-*-*')
			if EleList:contains(match) then
				match2 = original:match(''..player.target.name..' uses '..match..' Shot.The '..player.target.name..' take ([%s%w]+)% points of damage.')
				add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..' for '..match2..' dmg - on '..player.target.name..' ] *-*-*-*-*-*-*-*-*')
				parse(match, player.target.name, match2)
			end
		end
		
		if player.target.name then
			match = original:match(''..player.name..' uses ([%s%w]+)% Shot.'..player.target.name..' takes ([%s%w]+)% points of damage.')
			--add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..'  ] *-*-*-*-*-*-*-*-*')
			if EleList:contains(match) then
				match2 = original:match(''..player.name..' uses '..match..' Shot.'..player.target.name..' takes ([%s%w]+)% points of damage.')
				add_to_chat(204, '*-*-*-*-*-*-*-*-* [ SHOT = '..match..' for '..match2..' dmg - on '..player.target.name..' ] *-*-*-*-*-*-*-*-*')
				parse(match, player.target.name, match2)
			end
		end
		
		
		
		
    return modified, mode
end)



windower.register_event('chat message', function(original, sender, mode, gm)
    local match
               
            ---- Invite checker
                --match = original:match(') ([%w]+)%')
                
				
				
				if sender == player.name then
					if original == "switch" or original == "Switch" then
						switcher = RollOne
						RollOne = RollTwo
						RollTwo = switcher
						switchvalue = OneValue
						OneValue = TwoValue
						TwoValue = switchvalue
						add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Switching Rolls order. ] *-*-*-*-*-*-*-*-*')
					elseif original == "One" or original == "one" or original == "1" then
						oneswitch = true
						twoswitch = false
						add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Choose your FIRST roll. ] *-*-*-*-*-*-*-*-*')
					elseif original == "Two" or original == "2" or original == "two" then
						twoswitch = false
						twoswitch = true
						add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Choose your SECOND roll. ] *-*-*-*-*-*-*-*-*')
					elseif oneswitch and original then
						command=original
						target = string.match(command, "(%a+)")
						targeto = string.match(command, "%p")

						geot = ""

						if rollslist:contains(original) then
							if RollOne ~= original then
								OneValue = 0
							end
							RollOne = original
							add_to_chat(204,"*-*-*-*-*-*-*-*-* [FIRST Roll is "..original.."] *-*-*-*-*-*-*-*-*")
							refresh()
							oneswitch = false
						end
					elseif twoswitch and original then
						command=original
						target = string.match(command, "(%a+)")
						targeto = string.match(command, "%p")

						geot = ""

						
						
						if rollslist:contains(original) then
							if RollTwo ~= original then
								TwoValue = 0
							end
							RollTwo = original
							add_to_chat(204,"*-*-*-*-*-*-*-*-* [SECOND Roll is "..original.."] *-*-*-*-*-*-*-*-*")
							refresh()
							twoswitch = false
						end
					end
				end
				
                       
                       

           
 
    return sender, mode, gm
end)



function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      add_to_chat(204, formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      add_to_chat(204, formatting .. tostring(v))		
    else
      add_to_chat(204, formatting .. v)
    end
  end
end
fps = 1
sec = 0
sav = 0
windower.register_event('prerender', function()
    if fps < 30 then
		fps = fps +1
	else
		fps = 1
	end
	
	
	
	
	if fps == 1 then
		refresh()
		
		-- Checking Weather, DAY, Buff for Leaden

		if LeadenObi == "Eschan Stone" then
			if world.weather_element == 18 or world.weather_id == 19 or world.day == "Darksday" or buffactive["Voidstorm"] then
				add_to_chat(123, "Anrin Obi Set for Leaden")
				LeadenObi = "Anrin Obi"
			end
		else
			if not world.weather_id == 18 and not world.weather_id == 19 and not world.day == "Darksday" and not buffactive["Voidstorm"] then
				add_to_chat(123, "Eschan Stone Set for Leaden")
				LeadenObi = "Eschan Stone"
			end
		end
		
		
		
		
		if player.target.name then
			
			if player.target.name == "Hurkan" or player.target.name == "Achuka" or player.target.name == "Colkhab" or player.target.name == "Uptala" or player.target.name == "Kaggen" then-- or player.target.name == "Frigatebird" or player.target.name == "Undergrowth Hornet"then
				if OneStatus == "\\cs(255, 125, 125)Off\\cr" or TwoStatus == "\\cs(255, 125, 125)Off\\cr" then
					send_command('input //gs c "AutoRoll"')
				end
				
				if player.tp >= 1000 and buffactive["Aftermath: Lv.3"] then
					send_command('input /ws "Wildfire" <t>')
				elseif player.tp == 3000 then
					send_command('input /ws "Leaden Salute" <t>')
				end
			elseif player.target.name == "Quetzalcoatl" or player.target.name == "Selkit" then
				if OneStatus == "\\cs(255, 125, 125)Off\\cr" or TwoStatus == "\\cs(255, 125, 125)Off\\cr" then
					send_command('input //gs c "AutoRoll"')
				elseif player.tp >= 1000 then
					send_command('input /ws "Savage Blade" '..player.target.name..'')
				end
			elseif player.target.name == "Etsune" then
				if OneStatus == "\\cs(255, 125, 125)Off\\cr" or TwoStatus == "\\cs(255, 125, 125)Off\\cr" then
					send_command('input //gs c "AutoRoll"')
				end
				
			end
		end
		
	end
	
	
	
end)

windower.register_event('incoming chunk', function(id,data)

        local packet = packets.parse('incoming', data)
		--add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..id..' = '..data..' ] *-*-*-*-*-*-*-*-*')
		if data == "983" then
			add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..id..' = '..data..' ] *-*-*-*-*-*-*-*-*')
		end
end)

--tprint(windower.ffxi.get_ability_recasts())

rollInfo = {}
    for key, val in pairs(rollInfoTemp) do
        rollInfo[res.job_abilities:with('english', key .. ' Roll').id] = {key, unpack(val)}
    end

windower.register_event('action', function(act)
    if act.category == 6 and table.containskey(rollInfo, act.param) then
        --This is used later to allow/disallow busting
        --If you are not the rollActor you will not be disallowed to bust.
        rollActor = act.actor_id
        local rollID = act.param
        local rollNum = act.targets[1].actions[1].param
		boo = res.job_abilities[rollID].en
		--rollInfo[rollID][1]
		add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..boo..' ] *-*-*-*-*-*-*-*-*')
		if RollOne == boo then
			OneValue = rollNum
			add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..RollOne..' = '..OneValue..' ] *-*-*-*-*-*-*-*-*')
			refresh()
		elseif RollTwo == boo then
			TwoValue = rollNum
			add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..RollTwo..' = '..TwoValue..' ] *-*-*-*-*-*-*-*-*')
			refresh()
		end
    end
end)

ringBonus = true

function RollEffect(rollid, rollnum)
    if rollnum == 13 then
        return
    end


    --There's gotta be a better way to do this.
    local rollName = rollInfo[rollid][1]
    local rollVal = rollInfo[rollid][rollnum]
    


    --I'm handling one roll a bit odd, so I need to deal with it seperately.
    --Which is stupid, I know, but look at how I've done most of this
    if rollName == "Companion\'s" then
        local hpVal = rollVal[1]
        local tpVal = rollVal[2]
        if gearTable[13] == 28548 or gearTable[14]== 28548 or ringBonus then
            hpVal =  hpVal + (rollInfo[rollid][16][1]*5)
            tpVal = tpVal  + (rollInfo[rollid][16][2]*5)
            ringBonus = true
        elseif gearTable[13] == 28547 or gearTable[14] == 28547 or ringBonus then
            hpVal =  hpVal + (rollInfo[rollid][16][1]*3)
            tpVal = tpVal  + (rollInfo[rollid][16][2]*3)
            ringBonus = true
        end
        return "Pet:"..hpVal.." Regen".." +"..tpVal.." Regain" 
    end

    --If there's no Roll Val can't add to it
    if rollVal ~= '?' then
        if gearTable[13] == 28548 or gearTable[14] == 28548 or ringBonus then
            rollVal = rollVal + (rollInfo[rollid][16]*5)
            ringBonus = true
        elseif gearTable[13] == 28547 or gearTable[14] == 28547 or ringBonus then
            rollVal = rollVal + (rollInfo[rollid][16]*3)
            ringBonus = true
        end
    end
    -- Convert Bolters to Movement Speed based on 5.0 being 100%
    if(rollName == "Bolter\'s") then
        rollVal = '%.0f':format(100*((5+rollVal) / 5 - 1))
    end

    if(rollInfo[rollid][17] ~= nil) then
        local bonusVal = gearTable[rollInfo[rollid][17][1]] == rollInfo[rollid][17][2] and rollInfo[rollid][17][3] or 0 
        rollVal = rollVal + bonusVal
    end

    return rollVal..rollInfo[rollid][14]
end