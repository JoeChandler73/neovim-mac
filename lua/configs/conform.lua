local mason_bin = vim.fn.expand "$MASON/bin"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    cs = { "charpier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },
  formatters = {
    csharpier = {
      command = mason_bin .. "/" .. "csharpier",
    },
    args = {
      "format",
      "--write-stdout",
    },
    to_stdin = true,
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
