require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<esc>", ":nohlsearch<cr>")
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
