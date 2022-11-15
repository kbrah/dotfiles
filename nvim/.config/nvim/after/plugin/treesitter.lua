require("nvim-treesitter.configs").setup({
	sync_install = false,
	auto_install = true,
	ensure_installed = {
		"tsx",
		"typescript",
		"svelte",
		"json",
		"lua",
		"astro",
		"c_sharp",
		"css",
		"bash",
		"markdown",
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
