return {
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup()
    end,
  },

  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    config = function()
      require("smear_cursor").setup()
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
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
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml", "javascriptreact", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "luadoc",
        "c_sharp",
        "razor",
        "html",
        "css",
        "xml",
        "bash",
        "javascript",
        "json",
        "typescript",
        "yaml",
        "dockerfile",
      },
      autotag = {
        enable = true,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "xmlformatter",
        "csharpier",
        "prettier",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        "typescript-language-server",
        "json-lsp",
        "roslyn",
        "netcoredbg",
        "shfmt",
        "yaml-language-server",
        "docker-language-server",
        "docker-compose-language-server",
      },
    },
  },

  {
    "seblyng/roslyn.nvim",
    ft = {
      "cs",
      "razor",
    },
    opts = {},
  },

  {
    "nvim-neotest/neotest",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nsidorenco/neotest-vstest",
    },
  },

  {
    "nsidorenco/neotest-vstest",
    config = function()
      require("neotest").setup {
        log_level = vim.log.levels.WARN,
        adapters = {
          require "neotest-vstest",
        },
      }
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "configs.nvim-dap"
    end,
    event = "VeryLazy",
  },

  {
    "Cliffback/netcoredbg-macOS-arm64.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      config = function()
        require("netcoredbg-macOS-arm64").setup(require "dap")
      end,
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "configs.nvim-dap-ui"
    end,
  },
}
