local M = {}

vim.o.completeopt = "menu,menuone,noselect"

local types = require("cmp.types")
local compare = require("cmp.config.compare")
local lspkind = require("lspkind")

local source_mapping = {
	nvim_lsp = "[Lsp]",
	luasnip = "[Snip]",
	buffer = "[Buffer]",
	nvim_lua = "[Lua]",
	treesitter = "[Tree]",
	path = "[Path]",
	rg = "[Rg]",
	nvim_lsp_signature_help = "[Sig]",
}

function M.install_plugin()
	return {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		opt = true,
		config = function()
			require("config.cmp").setup()
		end,
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			{ "hrsh7th/cmp-nvim-lsp", module = { "cmp_nvim_lsp" } },
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"lukas-reineke/cmp-rg",
			"davidsierradz/cmp-conventionalcommits",
			{ "onsails/lspkind-nvim", module = { "lspkind" } },
			{
				"L3MON4D3/LuaSnip",
				module = { "luasnip" },
			},
			"rafamadriz/friendly-snippets",
			"honza/vim-snippets",
			{ "tzachar/cmp-tabnine", run = "./install.sh", disable = true },
		},
		disable = false,
		config = function()
			M.setup()
		end,
	}
end

function M.setup()
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	local luasnip = require("luasnip")
	local neogen = require("neogen")
	local cmp = require("cmp")

	cmp.setup({
		completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
		-- experimental = { native_menu = false, ghost_text = false },
		-- view = {
		--   entries = "native",
		-- },
		sorting = {
			priority_weight = 2,
			comparators = {
				compare.score,
				compare.recently_used,
				compare.offset,
				compare.exact,
				compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
			},
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 40,

				before = function(entry, vim_item)
					vim_item.kind = lspkind.presets.default[vim_item.kind]
					local menu = source_mapping[entry.source.name]
					vim_item.menu = menu
					return vim_item
				end,
			}),
		},
		mapping = {
			-- ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-l>"] = cmp.mapping({
				i = function(fallback)
					if luasnip.choice_active() then
						luasnip.change_choice(1)
					else
						fallback()
					end
				end,
			}),
			["<C-u>"] = cmp.mapping({
				i = function(fallback)
					if luasnip.choice_active() then
						require("luasnip.extras.select_choice")()
					else
						fallback()
					end
				end,
			}),
			-- ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping(function(fallback)
				cmp.close()
				cmp.mapping.close()
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, {
				"i",
				"s",
				"c",
			}),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-j>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif neogen.jumpable() then
					neogen.jump_next()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, {
				"i",
				"s",
				"c",
			}),
			["<C-k>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				elseif neogen.jumpable(true) then
					neogen.jump_prev()
				else
					fallback()
				end
			end, {
				"i",
				"s",
				"c",
			}),
			["<C-y>"] = {
				i = cmp.mapping.confirm({ select = false }),
			},
			["<C-n>"] = {
				i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
			},
			["<C-p>"] = {
				i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
			},
		},
		sources = {
			{ name = "nvim_lsp", max_item_count = 15 },
			-- { name = "nvim_lsp_signature_help", max_item_count = 5 },
			{ name = "luasnip", max_item_count = 5 },
			{ name = "treesitter", max_item_count = 5 },
			{ name = "rg", max_item_count = 2 },
			{ name = "buffer", max_item_count = 5 },
			{ name = "nvim_lua" },
			{ name = "path" },
			{ name = "crates" },
			-- { name = "spell" },
			-- { name = "emoji" },
			-- { name = "calc" },
		},
		window = {
			documentation = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
			},
		},
	})

	-- Use buffer source for `/`
	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer" },
		},
	})

	-- -- Use cmdline & path source for ':'
	-- cmp.setup.cmdline(":", {
	-- 	sources = cmp.config.sources({
	-- 		{ name = "path" },
	-- 	}, {
	-- 		{ name = "cmdline" },
	-- 	}),
	-- })

	-- Auto pairs
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

return M
