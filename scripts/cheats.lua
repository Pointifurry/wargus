--       _________ __                 __                               
--      /   _____//  |_____________ _/  |______     ____  __ __  ______
--      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
--      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ \ 
--     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
--             \/                  \/          \//_____/            \/ 
--  ______________________                           ______________________
--			  T H E   W A R   B E G I N S
--	   Stratagus - A free fantasy real time strategy game engine
--
--	wc2.ccl		-	WC2 compatibility level
--
--	(c) Copyright 2001-2003 by Lutz Sammer and Jimmy Salmon
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
--	$Id$

speedcheat = false

function HandleCheats(str)
  local resources = { "gold", "wood", "oil" }

  if (str == "there is no aliens level") then
    -- FIXME: no function yet
    AddMessage("cheat enabled")

  elseif (str == "hatchet") then
    SetSpeedResourceHarvest("wood", 52 / 2)
    AddMessage("Wow -- I got jigsaw!")

  elseif (str == "glittering prizes") then
    SetPlayerResource(GetThisPlayer(), "gold",
      GetPlayerResource(GetThisPlayer(), "gold") + 12000)
    SetPlayerResource(GetThisPlayer(), "wood",
      GetPlayerResource(GetThisPlayer(), "wood") + 5000)
    SetPlayerResource(GetThisPlayer(), "oil",
      GetPlayerResource(GetThisPlayer(), "oil") + 5000)
    AddMessage("!!! :)")

  elseif (str == "on screen") then
    RevealMap()

  elseif (str == "showpath") then
    RevealMap()

  elseif (str == "fow on") then
    -- FIXME: Not supported yet

  elseif (str == "fow off") then
    -- FIXME: Not supported yet

  elseif (str == "fast debug") then
    for i = 1,table.getn(resources) do
      SetSpeedResourcesHarvest(resources[i], 10)
      SetSpeedResourcesReturn(resources[i], 10)
    end
    SetSpeedBuild(10)
    SetSpeedTrain(10)
    SetSpeedUpgrade(10)
    SetSpeedResearch(10)
    AddMessage("FAST DEBUG SPEED")

  elseif (str == "normal debug") then
    for i = 1,table.getn(resources) do
      SetSpeedResourcesHarvest(resources[i], 1)
      SetSpeedResourcesReturn(resources[i], 1)
    end
    SetSpeedBuild(1)
    SetSpeedTrain(1)
    SetSpeedUpgrade(1)
    SetSpeedResearch(1)
    AddMessage("NORMAL DEBUG SPEED")

  elseif (str == "make it so") then
    if (speedcheat) then
      speedcheat = false
      for i = 1,table.getn(resources) do
        SetSpeedResourcesHarvest(resources[i], 1)
        SetSpeedResourcesReturn(resources[i], 1)
      end
      SetSpeedBuild(1)
      SetSpeedTrain(1)
      SetSpeedUpgrade(1)
      SetSpeedResearch(1)
      AddMessage("NO SO!")
    else
      speedcheat = true
      for i = 1,table.getn(resources) do
        SetSpeedResourcesHarvest(resources[i], 10)
        SetSpeedResourcesReturn(resources[i], 10)
      end
      SetSpeedBuild(10)
      SetSpeedTrain(10)
      SetSpeedUpgrade(10)
      SetSpeedResearch(10)
      for i = 1,table.getn(resources) do
        SetPlayerResource(GetThisPlayer(), resources[i],
          GetPlayerResource(GetThisPlayer(), resources[i]) + 32000)
      end
      AddMessage("SO!")
    end

  elseif (str == "unite the clans") then
    -- FIXME: Not supported yet

  elseif (str == "you pitiful worm") then
    -- FIXME: Not supported yet

  elseif (str == "it is a good day to die") then
    -- FIXME: Not supported yet

  elseif (str == "fill mana") then
    -- FIXME: Not supported yet

  elseif (str == "ai me") then
    -- FIXME: Not supported yet

  else
    return false
  end
  return true
end