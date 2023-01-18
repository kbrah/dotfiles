vim.g.mapleader = " "

vim.opt.guifont = { "Roboto", "h12" }
vim.opt.swapfile = false
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.undofile = true

-- NAVIGATION

-- vim.keymap.set("n", "<C-h>", "<C-w>h", {})
-- vim.keymap.set("n", "<C-j>", "<C-w>j", {})
-- vim.keymap.set("n", "<C-k>", "<C-w>k", {})
-- vim.keymap.set("n", "<C-l>", "<C-w>l", {})

-- TELESCOPE
require("telescope").setup({
	fzf = {
		fuzzy = true,
	},
})
require("telescope").load_extension("fzf")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>sc", function()
	builtin.find_files({
		cwd = "~/.config/nvim",
	})
end, {})
vim.keymap.set("n", "<leader>sp", function()
	builtin.find_files({
		cwd = "~/Code/lab20",
	})
end, {})

-- HARPOON
local mark = require("harpoon.mark")
local harpoonUi = require("harpoon.ui")
vim.keymap.set("n", "<leader>h", mark.add_file, {})
vim.keymap.set("n", "<leader>j", harpoonUi.nav_next, {})
vim.keymap.set("n", "<leader>k", harpoonUi.nav_prev, {})
vim.keymap.set("n", "<leader>l", harpoonUi.toggle_quick_menu, {})
vim.keymap.set("n", "<leader>1", function()
	harpoonUi.nav_file(1)
end, {})
vim.keymap.set("n", "<leader>1", function()
	harpoonUi.nav_file(1)
end, {})
vim.keymap.set("n", "<leader>2", function()
	harpoonUi.nav_file(2)
end, {})
vim.keymap.set("n", "<leader>3", function()
	harpoonUi.nav_file(3)
end, {})
vim.keymap.set("n", "<leader>4", function()
	harpoonUi.nav_file(4)
end, {})

-- GIT
vim.keymap.set("n", "<leader>gg", function()
	vim.api.nvim_command("LazyGit")
end, {})
-- vim.keymap.set("n", "<leader>cd", function()
-- 	vim.api.nvim_command("Gcd")
-- end, {})

-- NVIM-TREE
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})
vim.keymap.set("n", "<leader>e", require("nvim-tree").toggle, {})
