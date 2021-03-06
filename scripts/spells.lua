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
--      spells.lua - The spells.
--
--      (c) Copyright 1998-2005 by Joris Dauphin and Jimmy Salmon.
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

-- For documentation see stratagus/doc/ccl/ccl.html

DefineBoolFlags("isundead", "organic", "hero", "volatile", "Capturable", "Food", "Fauna")

--
--  Speed     : just drawing
--  ShadowFly : Shadow of flying unit (0:big, 1:normal, 2:small)
--  Level     : Increase each time an upgrade is applyed to an unit.
--
DefineVariables("Mana", {Max = 255, Value = 84, Increase = 1, Enable = false}, "Speed", "ShadowFly", {Max = 2})

--  Declare some unit types used in spells. This is quite accetable, the other
--  way would be to define can-cast-spell outside unit definitions, not much of an improvement.
DefineUnitType("unit-revealer", {})
DefineUnitType("unit-critter", {})
DefineUnitType("unit-dwarven-axefighter", {})
DefineUnitType("unit-dwarven-steelclad", {})
DefineUnitType("unit-goblin-spearman", {})
DefineUnitType("unit-goblin-archer", {})
DefineUnitType("unit-goblin-war-machine", {})

-- And declare upgrade for dependency...

DefineSpell("spell-dagger-attack",
	"showname", _("dagger attack"),
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"action", {
		{"adjust-vitals", "hit-points", -4, "max-multi-cast", 1}
	},
	"condition", {
		"AirUnit", "false"
	},
	"autocast", {"range", 1, "condition", {"alliance", "false", "opponent", "only", "AirUnit", "false"}},
	"ai-cast", {"range", 1, "condition", {"alliance", "false", "opponent", "only", "AirUnit", "false"}}
)

DefineSpell("spell-war-machine-spear-attack",
	"showname", _("war machine spear attack"),
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"action", {
		{"demolish", "range", 1, "basic-damage", 3, "piercing-damage", 6, "damage-self", false, "damage-friendly", false, "damage-terrain", false},
	},
	"condition", {
		"alliance", "false",
		"opponent", "only",
		"AirUnit", "false"
	},
	"autocast", {"range", 1, "condition", {"alliance", "false", "opponent", "only", "AirUnit", "false"}},
	"ai-cast", {"range", 1, "condition", {"alliance", "false", "opponent", "only", "AirUnit", "false"}}
)

DefineSpell("spell-equip-axe-of-perun",
	"showname", _("equip toporik"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
		{"adjust-variable", {AxeOfPerun = {Value = 2}}},
		{"adjust-variable", {PiercingDamageBonus = {AddValue = 2}}}
	},
	"condition", {
		"AxeOfPerun", {MinValue = 0, MaxValue = 2}
	},
	"ai-cast", {}
)

-- Ability Learning "Spells"

DefineSpell("spell-learn-axe-mastery",
	"showname", _("learn axe mastery"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
		{"adjust-variable", {AxeMastery = {Value = 1}}},
		{"adjust-variable", {PiercingDamageBonus = {AddValue = 2}}},
		{"adjust-variable", {LevelUp = {AddValue = -1}}}
	},
	"condition", {
		"LevelUp", {MinValue = 0}
	},
	"ai-cast", {}
)

DefineSpell("spell-learn-critical-strike",
	"showname", _("learn critical strike"),
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
		{"adjust-variable", {CriticalStrike = {Value = 1}}},
		{"adjust-variable", {CriticalStrikeChance = {AddValue = 15}}},
		{"adjust-variable", {LevelUp = {AddValue = -1}}}
	},
	"condition", {
		"LevelUp", {MinValue = 0}
	},
	"ai-cast", {}
)

-- For the Motherland Spells

DefineSpell("spell-unit-dwarven-axefighter",
	"showname", _("Axefighter"),
	"manacost", 25,
	"range", 6,
	"target", "position",
	"action", {
		{"summon", "unit-type", "unit-dwarven-axefighter", "time-to-live", 99000}
--		{"spawn-missile", "missile", "missile-impact-slime", "start-point", {"base", "target"}}
	}
--	"sound-when-cast", "eye of vision"
)

DefineSpell("spell-unit-goblin-spearman",
	"showname", _("Goblin Impaler"),
	"manacost", 25,
	"range", 6,
	"target", "position",
	"action", {
		{"summon", "unit-type", "unit-goblin-spearman", "time-to-live", 99000}
--		{"spawn-missile", "missile", "missile-impact-slime", "start-point", {"base", "target"}}
	}
--	"sound-when-cast", "eye of vision"
)

DefineSpell("spell-unit-goblin-archer",
	"showname", _("Goblin Archer"),
	"manacost", 25,
	"range", 6,
	"target", "position",
	"action", {
		{"summon", "unit-type", "unit-goblin-archer", "time-to-live", 99000}
--		{"spawn-missile", "missile", "missile-impact-slime", "start-point", {"base", "target"}}
	}
--	"sound-when-cast", "eye of vision"
)

DefineSpell("spell-unit-goblin-war-machine",
	"showname", _("Goblin War Machine"),
	"manacost", 25,
	"range", 6,
	"target", "position",
	"action", {
		{"summon", "unit-type", "unit-goblin-war-machine", "time-to-live", 99000}
--		{"spawn-missile", "missile", "missile-impact-slime", "start-point", {"base", "target"}}
	}
--	"sound-when-cast", "eye of vision"
)
