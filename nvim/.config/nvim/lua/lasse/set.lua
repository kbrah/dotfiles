vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
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

function _G.ReloadConfig()
	local hls_status = vim.v.hlsearch
	for name, _ in pairs(package.loaded) do
		if name:match("^lasse") then
			require("plenary.reload").reload_module(name)
			--            package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
	if hls_status == 0 then
		vim.opt.hlsearch = false
	end
end

vim.api.nvim_set_keymap("n", "<leader>vs", "<Cmd>lua ReloadConfig()<CR>", { silent = true, noremap = true })
vim.cmd("command! ReloadConfig lua ReloadConfig()")

-- Autosync plugins on packer file save
local configReloadGroup = vim.api.nvim_create_augroup("ConfigAutogroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "ReloadConfig",
	pattern = "*/nvim/**/*.lua",
	group = configReloadGroup,
})
