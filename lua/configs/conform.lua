local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    cs = { "dotnet_format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    xml = { "prettier" },
  },

  formatters = {
    dotnet_format = {
      command = "dotnet",
      args = function(ctx)
        local filename = ctx.filename or vim.api.nvim_buf_get_name(0)

        return {
          "format",
          "--include",
          filename,
          "--verbosity",
          "quiet",
        }
      end,
      stdin = false,
    },
    prettier = {
      condition = function(ctx)
        local f = ctx.filename or ""

        return vim.tbl_contains({
          "xml",
        }, ctx.filetype) or f:match "%.props$" or f:match "%.csproj$" or f:match "%.targets$"
      end,
    },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}

return options
