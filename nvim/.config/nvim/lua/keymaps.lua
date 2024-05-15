-- [[ Basic Keymaps ]]
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("x", "p", [["_dP]], opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)


keymap("n", "<leader>db", "<cmd>DBUIToggle<cr>", opts)

keymap('n', '<leader>lr', "<cmd>ConjureEval (user/reload-server)<cr>", opts)
keymap('n', '<leader>ls', "<cmd>ConjureEval (user/start-server)<cr>", opts)
keymap('n', '<leader>lx', "<cmd>ConjureEval (user/stop-server)<cr>", opts)

-- local function open_float()
--   return "<cmd>lua require('oil').open_float()<cr>"
-- end
vim.keymap.set('n', '<leader>e', "<cmd>Neotree float reveal<cr>", { desc = 'Open files' })
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
--
--
--
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })



-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save' })

vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'show line diagnostics' })

vim.keymap.set('n', '<leader>gg', function()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 99,
  }
  lazygit:toggle()
end, { desc = 'lazygit' })
