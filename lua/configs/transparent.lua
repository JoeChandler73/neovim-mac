require("transparent").setup {
  extra_groups = {
    -- main UI
    "NormalFloat",
    "FloatBorder",
    "CursorLine",
    "StatusLine",
    "StatusLineNC",
    "SignColumn",
    "EndOfBuffer",
    -- NvChad / tree
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeWinSeparator",
    "NvimTreeEndOfBuffer",
  },
}

-- force transparency AFTER colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "FloatBorder",
      "SignColumn",
      "EndOfBuffer",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
      "NvimTreeEndOfBuffer",
    }

    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
})
