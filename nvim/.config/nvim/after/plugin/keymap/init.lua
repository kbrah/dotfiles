local Remap = require("lasse.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

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
