local dap = require "dap"

local mason_path = vim.fn.stdpath "data" .. "/mason/packages/netcoredbg/netcoredbg"

local netcoredbg_adapter = {
  type = "executable",
  command = mason_path,
  arg = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = netcoredbg_adapter
dap.adapters.coreclr = netcoredbg_adapter

dap.configurations.cs = {
  type = "coreclr",
  name = "launch - netcoredbg",
  request = "launch",
  program = function()
    return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net10.0/", "file")
  end,
}

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>dr", "<cmd>lua require('dap').continue()<cr>", opts)
map("n", "<leader>dt", "<cmd>lua require('neotest').run.run({strategy='dap'})<cr>", opts)
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
map("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>", opts)
map("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>", opts)
map("n", "<leader>dx", "<cmd>lua require('dap').step_out()<cr>", opts)
map("n", "<leader>dro", "<cmd>lua require('dap').repl.open()<cr>", opts)
map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>", opts)
