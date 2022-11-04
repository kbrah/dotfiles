vim.g.mapleader = " "

vim.opt.nu = false
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

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

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

vim.keymap.set("n", "<leader>gg", function()
	vim.api.nvim_command("LazyGit")
end, {})

vim.keymap.set("n", "<leader>fc", function()
	builtin.find_files({
		cwd = "~/.config/nvim",
	})
end, {})

vim.keymap.set("n", "<leader>fp", function()
	builtin.find_files({
		cwd = "~/Code/lab20",
	})
end, {})

vim.keymap.set("n", "<leader>cd", function()
	vim.api.nvim_command("Gcd")
end, {})
