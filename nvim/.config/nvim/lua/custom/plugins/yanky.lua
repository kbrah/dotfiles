vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

return {
	"gbprod/yanky.nvim",
	config = function()
		local telescope = require "telescope"
		telescope.load_extension("yank_history")
		local yanky_telescope_mapping = require("yanky.telescope.mapping")
		require("yanky").setup {
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
		}
	end
}
