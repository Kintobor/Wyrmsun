--       _________ __                 __
--      /   _____//  |_____________ _/  |______     ____  __ __  ______
--      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
--      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ \
--     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
--             \/                  \/          \//_____/            \/
--  ______________________                           ______________________
--                        T H E   W A R   B E G I N S
--         Stratagus - A free fantasy real time strategy game engine
--
--      anim.lua - The gnome unit animation definitions.
--
--      (c) Copyright 2014 by Andre Novellino Gouv�a
--
--      This program is free software; you can redistribute it and/or modify
--      it under the terms of the GNU General Public License as published by
--      the Free Software Foundation; either version 2 of the License, or
--      (at your option) any later version.
--
--      This program is distributed in the hope that it will be useful,
--      but WITHOUT ANY WARRANTY; without even the implied warranty of
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--      GNU General Public License for more details.
--
--      You should have received a copy of the GNU General Public License
--      along with this program; if not, write to the Free Software
--      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

--
-- Gnomish Worker
--

DefineAnimations("animations-gnomish-worker", {
  Still = {
	"if-var v.Variation.Value == 0 variation_1",
	"if-var v.Variation.Value == 1 variation_2",
	"label variation_1", "frame 0", "wait 4", "random-goto 1 variation_1_taunt", "random-goto 99 no-rotate", "random-rotate 1", "goto no-rotate", "label variation_1_taunt", "frame 65", "wait 6", "frame 70", "wait 6", "frame 65", "wait 6", "frame 70", "wait 6", "frame 65", "wait 6", "frame 70", "wait 6", "frame 0", "goto no-rotate",
	"label variation_2", "frame 95", "wait 4", "random-goto 1 variation_2_taunt", "random-goto 99 no-rotate", "random-rotate 1", "goto no-rotate", "label variation_2_taunt", "frame 160", "wait 6", "frame 165", "wait 6", "frame 160", "wait 6", "frame 165", "wait 6", "frame 160", "wait 6", "frame 165", "wait 6", "frame 95", "goto no-rotate",
	"label no-rotate", "wait 1",},
  Move = {"unbreakable begin",
	"if-var v.Variation.Value == 0 variation_1",
	"if-var v.Variation.Value == 1 variation_2", 
	"label variation_1",
	"frame 0", "move 3", "wait 2", "frame 5", "move 3", "wait 1",
	"frame 5", "move 3", "wait 2", "frame 10", "move 2", "wait 1",
	"frame 10", "move 3", "wait 1", "frame 0", "move 2", "wait 1",
	"frame 0", "move 3", "wait 2", "frame 15", "move 3", "wait 1",
	"frame 15", "move 3", "wait 2", "frame 20", "move 2", "wait 1",
	"frame 20", "move 3", "wait 1", "frame 0", "move 2", "goto end",
	"label variation_2",
	"frame 95", "move 3", "wait 2", "frame 100", "move 3", "wait 1",
	"frame 100", "move 3", "wait 2", "frame 105", "move 2", "wait 1",
	"frame 105", "move 3", "wait 1", "frame 95", "move 2", "wait 1",
	"frame 95", "move 3", "wait 2", "frame 110", "move 3", "wait 1",
	"frame 110", "move 3", "wait 2", "frame 115", "move 2", "wait 1",
	"frame 115", "move 3", "wait 1", "frame 95", "move 2", "goto end",
	"label end", "unbreakable end", "wait 1",},
  Attack = {"unbreakable begin",
	"if-var v.Variation.Value == 0 variation_1",
	"if-var v.Variation.Value == 1 variation_2", 
	"label variation_1",
  	"frame 25", "wait 3", "frame 30", "wait 3", "frame 35", "wait 3",
  	"frame 40", "attack", "sound mace-attack", "wait 5", "frame 45", "wait 3",
  	"frame 25", "wait 7", "frame 25", "goto end",
	"label variation_2",
  	"frame 120", "wait 3", "frame 125", "wait 3", "frame 130", "wait 3",
  	"frame 135", "attack", "sound mace-attack", "wait 5", "frame 140", "wait 3",
  	"frame 120", "wait 7", "frame 120", "goto end",
	"label end", "unbreakable end", "wait 1",},
  Harvest_lumber = {"unbreakable begin",
	"if-var v.Variation.Value == 0 variation_1",
	"if-var v.Variation.Value == 1 variation_2", 
	"label variation_1",
	"frame 25", "wait 3", "frame 30", "wait 3", "frame 35", "wait 3",
	"frame 40", "sound tree-chopping", "wait 5", "frame 45", "wait 3",
	"frame 25", "wait 7", "frame 25", "goto end",
	"label variation_2",
  	"frame 120", "wait 3", "frame 125", "wait 3", "frame 130", "wait 3",
  	"frame 135", "sound tree-chopping", "wait 5", "frame 140", "wait 3",
  	"frame 120", "wait 7", "frame 120", "goto end",
	"label end", "unbreakable end", "wait 1",},
  Repair = {"unbreakable begin",
	"if-var v.Variation.Value == 0 variation_1",
	"if-var v.Variation.Value == 1 variation_2", 
	"label variation_1",
	"frame 25", "wait 3", "frame 30", "wait 3", "frame 35", "wait 3",
	"frame 40", "sound mace-attack", "wait 5", "frame 45", "wait 3",
	"frame 25", "wait 7", "frame 25", "goto end",
	"label variation_2",
  	"frame 120", "wait 3", "frame 125", "wait 3", "frame 130", "wait 3",
  	"frame 135", "sound mace-attack", "wait 5", "frame 140", "wait 3",
  	"frame 120", "wait 7", "frame 120", "goto end",
	"label end", "unbreakable end", "wait 1",},
  Death = {"unbreakable begin",
	"if-var v.Variation.Value == 0 variation_1",
	"if-var v.Variation.Value == 1 variation_2", 
	"label variation_1",
	"frame 50", "wait 3", "frame 55", "wait 3", "frame 60", "wait 100", "frame 60", "goto end",
	"label variation_2",
	"frame 145", "wait 3", "frame 150", "wait 3", "frame 155", "wait 100", "frame 155", "goto end",
	"label end", "unbreakable end", "wait 1",},
})

--
-- Gnomish Recruit
--

local GnomishRecruitStill = {"frame 0", "wait 4", "random-goto 1 taunt", "random-goto 99 no-rotate", "random-rotate 1", "goto no-rotate", "label taunt", "frame 60", "wait 6", "frame 65", "wait 6", "frame 60", "wait 6", "frame 65", "wait 6", "frame 60", "wait 6", "frame 65", "wait 6", "frame 0", "label no-rotate", "wait 1",}
local GnomishRecruitMove = {"unbreakable begin","frame 0", "move 3", "wait 2", "frame 5", "move 3", "wait 1",
    "frame 5", "move 3", "wait 2", "frame 10", "move 2", "wait 1",
    "frame 10", "move 3", "wait 1", "frame 0", "move 2", "wait 1",
    "frame 0", "move 3", "wait 2", "frame 15", "move 3", "wait 1",
    "frame 15", "move 3", "wait 2", "frame 20", "move 2", "wait 1",
    "frame 20", "move 3", "wait 1", "frame 0", "move 2", "unbreakable end", "wait 1",}
local GnomishRecruitDeath = {"unbreakable begin", "frame 45", "wait 3", "frame 50", "wait 3", "frame 55", "wait 100",
    "frame 55", "unbreakable end", "wait 1",}

DefineAnimations("animations-gnomish-recruit", {
  Still = GnomishRecruitStill,
  Move = GnomishRecruitMove,
  Attack = {"unbreakable begin", "frame 25", "wait 3", "frame 30", "wait 3", "frame 35", "wait 3",
    "frame 40", "attack", "sound sword-attack", "wait 5", "frame 0", "wait 10",
    "frame 0", "unbreakable end", "wait 1",},
  Death = GnomishRecruitDeath,
  SpellCast = {"unbreakable begin",
	"attack",
	"unbreakable end",
	"wait 1",}
})

--
-- Gnomish Caravan
--

DefineAnimations("animations-gnomish-caravan", {
  Still = {"frame 0", "wait 4", "frame 0", "wait 1",},
  Move = {"unbreakable begin","frame 0", "wait 1", "frame 5", "move 2", "wait 2",
    "frame 0", "move 2", "wait 2", "frame 5", "move 2", "wait 2",
    "frame 0", "move 2", "wait 2", "frame 5", "move 2", "wait 2",
    "frame 0", "move 2", "wait 2", "frame 5", "move 2", "wait 2",
    "frame 0", "move 2", "wait 2", "frame 5", "move 2", "wait 2",
    "frame 0", "move 2", "wait 2", "frame 5", "move 2", "wait 2",
    "frame 0", "move 2", "wait 2", "frame 5", "move 2", "wait 2",
    "frame 0", "move 2", "wait 2", "frame 5", "move 2", "wait 2",
    "frame 0", "move 2", "unbreakable end", "wait 1",},
  Death = {"unbreakable begin", "frame 10", "wait 3", "frame 15", "wait 3", "frame 20", "wait 3", "frame 25", "wait 100",
    "frame 25", "unbreakable end", "wait 1",}
})
