local lspkind = require("lspkind")
local cmp = require("cmp")
local source_mapping = {
	youtube = "[Suck it YT]",
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
require("refactoring").setup({})
require("react-extract").setup({})
cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
	}),

	formatting = {
		format = lspkind.cmp_format({
			mode = "symbo_text",
			maxwidth = "50",
			ellipsis_char = "...",

			before = function(entry, vim_item)
				-- vim_item.kind = lspkind.presets.default[vim_item.kind]
				local menu = source_mapping[entry.source.name]
				if entry.source.name == "cmp_tabnine" then
					if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
						menu = menu .. " " .. entry.completion_item.data.detail
					end
					vim_item.kind = ""
				end
				vim_item.menu = menu
				return vim_item
			end,
		}),
		-- format = function(entry, vim_item)
		-- 	vim_item.kind = lspkind.presets.default[vim_item.kind]
		-- 	local menu = source_mapping[entry.source.name]
		-- 	if entry.source.name == "cmp_tabnine" then
		-- 		if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
		-- 			menu = entry.completion_item.data.detail .. " " .. menu
		-- 		end
		-- 		vim_item.kind = ""
		-- 	end
		-- 	vim_item.menu = menu
		-- 	return vim_item
		-- end,
	},

	sources = {
		-- tabnine completion? yayaya

		{ name = "cmp_tabnine" },

		{ name = "nvim_lsp" },

		-- For vsnip user.
		-- { name = 'vsnip' },

		-- For luasnip user.
		{ name = "luasnip" },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = "buffer" },

		{ name = "youtube" },
	},
})
local tabnine = require("cmp_tabnine.config")

tabnine:setup({
	max_lines = 1000,
	max_num_results = 5,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
	show_prediction_strength = true,
})

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "gn", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "gp", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<space>wl", function()
	-- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "<leader>f", function()
	-- 	vim.lsp.buf.format({ async = true })
	-- end, bufopts)
end

require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require("lspconfig")
lsp.tsserver.setup({
	on_attach = on_attach,
	init_options = {
		hostinfo = "neovim",
		maxTSServerMemory = 8192,
	},
	cmd = { "typescript-language-server", "--stdio" },
})
lsp.astro.setup({
	on_attach = on_attach,
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.jsonls.setup({
	on_attach = on_attach,
})
lsp.svelte.setup({
	on_attach = on_attach,
})
lsp.rust_analyzer.setup({
	on_attach = on_attach,
})
-- lsp.csharp_ls.setup({
-- 	on_attach = on_attach,
-- })
lsp.omnisharp.setup({
	cmd = { "dotnet", "/usr/lib/omnisharp-roslyn/OmniSharp.dll" },
	capabilities = capabilities,
	-- Enables support for reading code style, naming convention and analyzer
	-- settings from .editorconfig.
	enable_editorconfig_support = true,

	-- If true, MSBuild project system will only load projects for files that
	-- were opened in the editor. This setting is useful for big C# codebases
	-- and allows for faster initialization of code navigation features only
	-- for projects that are relevant to code that is being edited. With this
	-- setting enabled OmniSharp may load fewer projects and may thus display
	-- incomplete reference lists for symbols.
	enable_ms_build_load_projects_on_demand = false,

	-- Enables support for roslyn analyzers, code fixes and rulesets.
	enable_roslyn_analyzers = false,

	-- Specifies whether 'using' directives should be grouped and sorted during
	-- document formatting.
	organize_imports_on_format = false,

	-- Enables support for showing unimported types and unimported extension
	-- methods in completion lists. When committed, the appropriate using
	-- directive will be added at the top of the current file. This option can
	-- have a negative impact on initial completion responsiveness,
	-- particularly for the first few completion sessions after opening a
	-- solution.
	enable_import_completion = false,

	-- Specifies whether to include preview versions of the .NET SDK when
	-- determining which version to use for project loading.
	sdk_include_prereleases = true,

	-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
	-- true
	analyze_open_documents_only = false,
	on_attach = on_attach,
})
lsp.pylsp.setup({
	on_attach = on_attach,
})
lsp.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
