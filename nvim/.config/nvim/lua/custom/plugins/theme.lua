return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin'

    local ns = vim.api.nvim_create_namespace("LineNr")
    vim.api.nvim_set_hl(ns, "LineNr", { bg = "none", fg = "#ffffff" })
    -- vim.api.nvim_set_hl(ns, "colorcolumn", { bg = "#1d202d" })
    vim.api.nvim_set_hl_ns(ns)
  end
}
