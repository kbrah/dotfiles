--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

vim.opt.backupcopy = "yes"
vim.opt.colorcolumn = "+1"
vim.opt.textwidth = 80

vim.g.maplocalleader = ","
-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	-- pattern = "*.lua",
	timeout = 1000,
}

-- local new_sources =
-- vim.list_extend(new_sources,)

local ns = vim.api.nvim_create_namespace("LineNr")
vim.api.nvim_set_hl(ns, "LineNr", { bg = "none", fg = "#ffffff" })
vim.api.nvim_set_hl(ns, "colorcolumn", { bg = "#1d202d" })
vim.api.nvim_set_hl_ns(ns)

lvim.builtin.bufferline.active = false
lvim.builtin.autopairs.active = true
lvim.builtin.indentlines.active = false
-- lvim.lsp.document_highlight = false
lvim.builtin.illuminate.active = false
-- lvim.builtin.treesitter.highlight.enable = false
-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = false

lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 200
lvim.lsp.installer.setup.ensure_installed = {
	"svelte",
}

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

lvim.keys.normal_mode["<M-j>"] = false
lvim.keys.normal_mode["<M-k>"] = false
lvim.keys.visual_mode["<M-j>"] = false
lvim.keys.visual_mode["<M-k>"] = false
lvim.keys.insert_mode["<M-k>"] = false
lvim.keys.insert_mode["<M-j>"] = false
-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.localleader = ","
-- add your own keymapping

lvim.builtin.which_key.mappings["r"] = {
	"<cmd>ConjureEval (user/reload)<CR>",
	"Reload clj app",
}
lvim.builtin.which_key.mappings["s"] = {
	"<cmd>ConjureEval (user/start)<CR>",
	"Start clj app",
}
lvim.builtin.which_key.mappings["o"] = {
	"oconsole.log()<ESC>i",
	"console.log",
}
lvim.builtin.which_key.mappings["O"] = {
	"oconsole.log()<ESC>i",
	"console.log next line",
}

lvim.builtin.which_key.mappings["m"] = {
	'<cmd>lua require("harpoon.mark").add_file()<CR>',
	"Harpoon - add file",
}
lvim.builtin.which_key.mappings["1"] = {
	'<cmd>lua require("harpoon.ui").nav_file(1) <CR>',
	"Harpoon - file 1",
}
lvim.builtin.which_key.mappings["2"] = {
	'<cmd>lua require("harpoon.ui").nav_file(2) <CR>',
	"Harpoon - file 2",
}
lvim.builtin.which_key.mappings["3"] = {
	'<cmd>lua require("harpoon.ui").nav_file(3) <CR>',
	"Harpoon - file 3",
}
lvim.builtin.which_key.mappings["4"] = {
	'<cmd>lua require("harpoon.ui").nav_file(4) <CR>',
	"Harpoon - file 4",
}
lvim.builtin.which_key.mappings["<leader>"] = {
	'<cmd>lua require("harpoon.ui").toggle_quick_menu() <CR>',
	"Harpoon - toggle",
}
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["Ls"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["p"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- -- Change theme settings
lvim.colorscheme = "catppuccin"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.gitsigns.opts.numhl = false
lvim.builtin.terminal.direction = "horizontal"
-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- require'telescope'.load_extension('project')
-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black" },
	{ command = "stylua" },
	{
		command = "prettier",
		-- extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json" },
	},
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "eslint_d", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
	-- { command = "flake8", filetypes = { "python" } },
	-- {
	--   command = "shellcheck",
	--   args = { "--severity", "warning" },
	-- },
})

-- add `omnisharp` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "omnisharp" })
-- remove `csharp_ls` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "csharp_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

vim.g.dbs = {
	dev = "oracle://REKISTERI@localhost:1521/FIMUKEHI",
}
vim.g.db_ui_table_helpers = {
	oracle = {
		settings = {
			"SET NEWPAGE NONE set pagesize 0 embedded on SET SPACE 0 SET LINESIZE 16000 SET ECHO OFF SET FEEDBACK OFF SET VERIFY OFF SET TERMOUT OFF SET TRIMOUT ON SET TRIMSPOOL ON SET COLSEP | ",
		},
	},
}

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
		  keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		  },
	},
	{
		"sindrets/diffview.nvim",
	},
	{
		"PaterJason/cmp-conjure",
		filetypes = { "clojure" },
		event = "BufRead",
		config = function()
			table.insert(lvim.builtin.cmp.sources, { name = "conjure" })
		end,
	},
	{ "tpope/vim-dispatch", event = "BufRead", filetypes = { "clojure" } },
	{ "clojure-vim/vim-jack-in", event = "BufRead", filetypes = { "clojure" } },
	{ "radenling/vim-dispatch-neovim", event = "BufRead", filetypes = { "clojure" } },
	{ "Olical/conjure", event = "BufRead", filetypes = { "clojure" } },
	{ "tjdevries/colorbuddy.vim" },
	-- {
	-- 	"tjdevries/gruvbuddy.nvim",
	-- 	config = function()
	-- 		-- require("colorbuddy").colorscheme("gruvbuddy")
	-- 	end,
	-- },
	{
		"ThePrimeagen/harpoon",
		event = "BufRead",
	},
	{
		"tpope/vim-dadbod",
		event = "BufRead",
	},
	{
		"tpope/vim-sleuth",
		event = "BufRead",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		event = "BufRead",
	},
	{
		"julienvincent/nvim-paredit",
		config = function()
			local paredit = require("nvim-paredit")
			paredit.setup({
				-- should plugin use default keybindings? (default = true)
				use_default_keys = true,
				-- sometimes user wants to restrict plugin to certain file types only
				-- defaults to all supported file types including custom lang
				-- extensions (see next section)
				filetypes = { "clojure" },

				-- This controls where the cursor is placed when performing slurp/barf operations
				--
				-- - "remain" - It will never change the cursor position, keeping it in the same place
				-- - "follow" - It will always place the cursor on the form edge that was moved
				-- - "auto"   - A combination of remain and follow, it will try keep the cursor in the original position
				--              unless doing so would result in the cursor no longer being within the original form. In
				--              this case it will place the cursor on the moved edge
				cursor_behaviour = "auto", -- remain, follow, auto

				indent = {
					-- This controls how nvim-paredit handles indentation when performing operations which
					-- should change the indentation of the form (such as when slurping or barfing).
					--
					-- When set to true then it will attempt to fix the indentation of nodes operated on.
					enabled = false,
					-- A function that will be called after a slurp/barf if you want to provide a custom indentation
					-- implementation.
				},

				-- list of default keybindings
				keys = {
					[">)"] = { paredit.api.slurp_forwards, "Slurp forwards" },
					["<("] = { paredit.api.slurp_backwards, "Slurp backwards" },

					["<)"] = { paredit.api.barf_forwards, "Barf forwards" },
					[">("] = { paredit.api.barf_backwards, "Barf backwards" },

					[">e"] = { paredit.api.drag_element_forwards, "Drag element right" },
					["<e"] = { paredit.api.drag_element_backwards, "Drag element left" },

					[">f"] = { paredit.api.drag_form_forwards, "Drag form right" },
					["<f"] = { paredit.api.drag_form_backwards, "Drag form left" },

					["<localleader>o"] = { paredit.api.raise_form, "Raise form" },
					["<localleader>O"] = { paredit.api.raise_element, "Raise element" },

					["E"] = {
						paredit.api.move_to_next_element_tail,
						"Jump to next element tail",
						-- by default all keybindings are dot repeatable
						repeatable = false,
						mode = { "n", "x", "o", "v" },
					},
					["W"] = {
						paredit.api.move_to_next_element_head,
						"Jump to next element head",
						repeatable = false,
						mode = { "n", "x", "o", "v" },
					},

					["B"] = {
						paredit.api.move_to_prev_element_head,
						"Jump to previous element head",
						repeatable = false,
						mode = { "n", "x", "o", "v" },
					},
					["gE"] = {
						paredit.api.move_to_prev_element_tail,
						"Jump to previous element tail",
						repeatable = false,
						mode = { "n", "x", "o", "v" },
					},

					["("] = {
						paredit.api.move_to_parent_form_start,
						"Jump to parent form's head",
						repeatable = false,
						mode = { "n", "x", "v" },
					},
					[")"] = {
						paredit.api.move_to_parent_form_end,
						"Jump to parent form's tail",
						repeatable = false,
						mode = { "n", "x", "v" },
					},

					-- These are text object selection keybindings which can used with standard `d, y, c`, `v`
					["af"] = {
						paredit.api.select_around_form,
						"Around form",
						repeatable = false,
						mode = { "o", "v" },
					},
					["if"] = {
						paredit.api.select_in_form,
						"In form",
						repeatable = false,
						mode = { "o", "v" },
					},
					["aF"] = {
						paredit.api.select_around_top_level_form,
						"Around top level form",
						repeatable = false,
						mode = { "o", "v" },
					},
					["iF"] = {
						paredit.api.select_in_top_level_form,
						"In top level form",
						repeatable = false,
						mode = { "o", "v" },
					},
					["ae"] = {
						paredit.api.select_element,
						"Around element",
						repeatable = false,
						mode = { "o", "v" },
					},
					["ie"] = {
						paredit.api.select_element,
						"Element",
						repeatable = false,
						mode = { "o", "v" },
					},
				},
			})
		end,
	},

	{
		"tpope/vim-fugitive",
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"gbprod/yanky.nvim",
		config = function()
			require("telescope").load_extension("yank_history")

			local yanky_telescope_mapping = require("yanky.telescope.mapping")
			require("yanky").setup({
				ring = {
					storage = "memory",
				},
				picker = {
					telescope = {
						mappings = {
							default = yanky_telescope_mapping.put("P"),
							i = {
								["<c-p>"] = yanky_telescope_mapping.put("p"),
							},
							n = {
								p = yanky_telescope_mapping.put("p"),
								P = yanky_telescope_mapping.put("P"),
							},
						},
					},
				},
			})
		end,
	},
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	build = ":Neorg sync-parsers",
	-- 	opts = {
	-- 		load = {
	-- 			["core.defaults"] = {}, -- Loads default behaviour
	-- 			["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
	-- 			["core.norg.dirman"] = { -- Manages Neorg workspaces
	-- 				config = {
	-- 					workspaces = {
	-- 						notes = "~/notes",
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	dependencies = { { "nvim-lua/plenary.nvim" } },
	-- },
	"folke/tokyonight.nvim",
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					-- last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--
