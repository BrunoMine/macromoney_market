--[[
	Mod Minemacro for Minetest
	Copyright (C) 2022 BrunoMine (https://github.com/BrunoMine)
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>.
	
	Catalogs for markets
  ]]

-- Catalogs table
macromoney_market.catalogs = {}

-- Cria catalogos indexados para verificação no mercado
local to_index = function(tb)
	local new_tb = {}
	for _,itemname in ipairs(tb) do
		new_tb[itemname] = true
	end
	return new_tb
end

-- Default market
-- Itens que jamais precisaram ser negociados a menos de 1 macro
macromoney_market.catalogs.default = {
	"default:wood", 
	"default:book"
}
macromoney_market.catalogs.default_i = to_index(macromoney_market.catalogs.default)

-- Cents market
-- Itens que podem ser negociados a um centavo de macro
macromoney_market.catalogs.cent = {
	"default:wood", 
	"default:book"
}
macromoney_market.catalogs.cent_i = to_index(macromoney_market.catalogs.cent)
