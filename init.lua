--[[
	Mod Minemacro for Minetest
	Copyright (C) 2022 BrunoMine (https://github.com/BrunoMine)
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>.
	
  ]]

local modpath = minetest.get_modpath("macromoney_market")

-- Global table
macromoney_market = {}

-- Catalog
dofile(modpath .. "/catalog.lua")

-- Nodes
dofile(modpath .. "/nodes.lua")
