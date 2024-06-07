return {
	{
		"github/copilot.vim",
		enabled = false
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		opts = {
			show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
			debug = true,    -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		dependencies = {
			-- {"zbindenren/nvim-copilot"},
			{ "nvim-lua/plenary.nvim" },
		},
		event = "VeryLazy",
		keys = {
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
			{
				"<leader>ccv",
				":CopilotChatVisual",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ccx",
				":CopilotChatInPlace<cr>",
				mode = "x",
				desc = "CopilotChat - Run in-place code",
			},
		},
	},
}
