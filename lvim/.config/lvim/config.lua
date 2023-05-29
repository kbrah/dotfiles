--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

vim.g.maplocalleader = ","
-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	-- pattern = "*.lua",
	timeout = 1000,
}

lvim.builtin.autopairs.active = false
lvim.builtin.indentlines.active = false
-- lvim.lsp.document_highlight = false
lvim.builtin.illuminate.active = false
-- lvim.builtin.treesitter.highlight.enable = false
-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = false

lvim.lsp.installer.setup.ensure_installed = {
	"svelte",
}

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
-- lvim.colorscheme = "gruvbuddy"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.gitsigns.opts.numhl = true
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
	{ command = "stylua" },
	{
		command = "prettier",
		-- extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
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
	{ "tpope/vim-dispatch", event = "BufRead" },
	{ "clojure-vim/vim-jack-in", event = "BufRead" },
	{ "radenling/vim-dispatch-neovim", event = "BufRead" },
	{ "Olical/conjure", event = "BufRead" },
	{ "tjdevries/colorbuddy.vim" },
	{
		"tjdevries/gruvbuddy.nvim",
		config = function()
			-- require("colorbuddy").colorscheme("gruvbuddy")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		event = "BufRead",
	},
	{
		"tpope/vim-dadbod",
		event = "BufRead",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		event = "BufRead",
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
			},
		},
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"folke/tokyonight.nvim",
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		vim.defer_fn(function()
	-- 			require("copilot").setup()
	-- 		end, 100)
	-- 	end,
	-- },
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
