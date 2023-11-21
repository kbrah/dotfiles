return {
	"ThePrimeagen/harpoon",
	config = function()
		local ui = require("harpoon.ui")
		vim.keymap.set('n', '<leader>m', require("harpoon.mark").add_file, { desc = "Harpoon - Add file" })
		vim.keymap.set('n', '<leader>h', require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon - Toggle menu" })
		vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, { desc = "Harpoon - Nav file 1" })
		vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, { desc = "Harpoon - Nav file 2" })
		vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, { desc = "Harpoon - Nav file 3" })
		vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, { desc = "Harpoon - Nav file 4" })
		vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end, { desc = "Harpoon - Nav file 5" })
	end
}
