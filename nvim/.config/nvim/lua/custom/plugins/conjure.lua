return {

	{ "tpope/vim-dispatch",            event = "BufRead", filetypes = { "clojure" } },
	{ "clojure-vim/vim-jack-in",       event = "BufRead", filetypes = { "clojure" } },
	{ "radenling/vim-dispatch-neovim", event = "BufRead", filetypes = { "clojure" } },
	{
		"Olical/conjure",
		event = "BufRead",
		filetypes = { "clojure" }
	},

	{
		"PaterJason/cmp-conjure",
		filetypes = { "clojure" },
		event = "BufRead",
	},
}
