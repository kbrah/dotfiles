local Remap = require("lasse.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- console.log macro
nnoremap("<leader>o", "oconsole.log()<esc>i")
nnoremap("<leader>O", "Oconsole.log()<esc>i")

vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")

-- COPY PASTE

-- greatest remap ever
nnoremap("<leader>p", '"+p')
vnoremap("<leader>p", '"+p')
nmap("<leader>P", '"+P')

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

vnoremap("<leader>d", '"_d')

nnoremap("<leader>c", ":bdelete<CR>")

vnoremap("<leader>re", require("react-extract").extract_to_new_file)
vnoremap("<leader>rc", require("react-extract").extract_to_current_file)

nnoremap("<F5>", require("dap").continue)
nnoremap("<F10>", require("dap").step_over)
nnoremap("<F11>", require("dap").step_into)
nnoremap("<F12>", require("dap").step_out)

nnoremap("<leader>b", require("dap").toggle_breakpoint)
nnoremap("<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
nnoremap("<leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
nnoremap("<leader>dl", require("dap").run_last)
-- nnoremap("<leader>dr", require("dap").repl_open)
