--[[
	Mod Minemacro for Minetest
	Copyright (C) 2022 BrunoMine (https://github.com/BrunoMine)
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>.
	
	Macros
  ]]


local catalogs = macromoney_market.catalogs

-- Register market
commoditymarket.register_market("macromoney_default", {
	description = "Bolsa de Mercadorias Macro",
	long_description = "A Bolsa de Mercadorias Macro é a rede oficial para negociar com a moeda Macromoney (M¢). Foi criada visando o fluxo financeiro com as mercadorias e moeda padronizadas. Esse mercado regulado permite negociar apenas itens ja listados na bolsa portanto novos itens precisam ser incluidos pelos administradores.",
	currency = {
		["macromoney:macro"] = 1
	},
	currency_symbol = "M¢",
	inventory_limit = 100000,
	--sell_limit =, -- no sell limit
	initial_items = catalogs.default,
	
	-- Evitar itens quaisquer
	allow_item = function(item) 
		if catalogs.default_i[item] then
			return true
		else
			return false
		end
	end,
})

-- Register node 
minetest.register_node("macromoney_market:default_market", {
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
		commoditymarket.show_market("macromoney_default", clicker:get_player_name())
	end,
	can_dig = function(pos, player)
		return not minetest.check_player_privs(player, "protection_bypass")
	end,
})


-- Register market cents
commoditymarket.register_market("macromoney_cent", {
	description = "Bolsa de Mercadorias MacroCents",
	long_description = "A Bolsa de Mercadorias MacroCents é uma extensão da Bolsa Macro onde mercadorias menos valiosas podem ser negociadas a centavos de Macro (¢). Segue o mesmo regulamento da Bolsa Macro.",
	currency = {
		["macromoney:macro"] = 100
	},
	currency_symbol = "¢",
	inventory_limit = 100000,
	--sell_limit =, -- no sell limit
	initial_items = catalogs.cent,
	
	-- Evitar itens quaisquer
	allow_item = function(item) 
		if catalogs.cent_i[item] then
			return true
		else
			return false
		end
	end,
})

-- Register node 
minetest.register_node("macromoney_market:cent_market", {
	description = "Bolsa de Mercadorias MacroCents",
	tiles = {
		"default_wood.png", -- Cima
		"default_wood.png", -- Embaixo
		"macromoney_macromarketcent1.png", -- Lado
		"macromoney_macromarketcent2.png", -- Lado
		"macromoney_macromarketcent3.png", -- Lado
		"macromoney_macromarketcent4.png" -- Lado
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1,},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		commoditymarket.show_market("macromoney_cent", clicker:get_player_name())
	end,
	can_dig = function(pos, player)
		return not minetest.check_player_privs(player, "protection_bypass")
	end,
})


-- Register market free
commoditymarket.register_market("macromoney_free", {
	description = "Bolsa de Liberal Mercadorias",
	long_description = "A Bolsa Liberal de Mercadorias é a rede informal de trocas para quem quer negociar itens não listados nas bolsas oficiais. Qualquer item pode ser negociado exceto se estiver personalizado, com desgaste ou listado nas bolsas oficiais.",
	currency = {
		["macromoney:macro"] = 1
	},
	currency_symbol = "M¢",
	inventory_limit = 100000,
	--sell_limit =, -- no sell limit
	initial_items = {}, 
	
	-- Evitar itens ja listados
	allow_item = function(item) 
		if catalogs.default_i[item] or catalogs.cent_i[item] then
			return false
		else
			return true
		end
	end,
})

-- Register node 
minetest.register_node("macromoney_market:free_market", {
	description = "Bolsa de Liberal Mercadorias",
	tiles = {
		"default_wood.png", -- Cima
		"default_wood.png", -- Embaixo
		"macromoney_macromarketfree1.png", -- Lado
		"macromoney_macromarketfree2.png", -- Lado
		"macromoney_macromarketfree3.png", -- Lado
		"macromoney_macromarketfree4.png" -- Lado
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1,},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		commoditymarket.show_market("macromoney_free", clicker:get_player_name())
	end,
	can_dig = function(pos, player)
		return not minetest.check_player_privs(player, "protection_bypass")
	end,
})
