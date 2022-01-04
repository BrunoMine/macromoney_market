--[[
	Mod Minemacro for Minetest
	Copyright (C) 2022 BrunoMine (https://github.com/BrunoMine)
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>.
	
	Macros
  ]]


-- Register market
commoditymarket.register_market("macromoney_market", {
	description = "Bolsa de Mercadorias Macro",
	long_description = "A Bolsa de Mercadorias Macro é a rede oficial para negociar com a centavos de Macromoney (¢). Foi criada visando o fluxo financeiro com as mercadorias e moeda padronizadas.",
	currency = {
		["macromoney:macro"] = 100
	},
	currency_symbol = "¢",
	inventory_limit = 100000,
	--sell_limit =, -- no sell limit
	initial_items = {"default:stone","default:dirt","default:steel_ingot","default:coal_lump"},
})

-- Register node 
minetest.register_node("macromoney_market:market", {
	description = "Bolsa de Mercadorias Macro",
	tiles = {
		"default_wood.png", -- Cima
		"default_wood.png", -- Embaixo
		"macromoney_macromarket1.png", -- Lado
		"macromoney_macromarket2.png", -- Lado
		"macromoney_macromarket3.png", -- Lado
		"macromoney_macromarket4.png" -- Lado
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1,},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		commoditymarket.show_market("macromoney_market", clicker:get_player_name())
	end,
	can_dig = function(pos, player)
		return not minetest.check_player_privs(player, "protection_bypass")
	end,
})


