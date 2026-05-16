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
      require "configs.transparent"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml", "javascriptreact", "typescriptreact" },
    config = function()
      require "configs.autotag"
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
    opts = require "configs.treesitter",
  },

  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
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
