return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  { "github/copilot.vim", event = "User,AstroFile" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User,AstroFile",
    setup = function()
      require("nvim-treesitter.configs").setup {
        context = {
          enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        },
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      local ft = require "Comment.ft"
      ft.bsv = { "//%s", "/*%s*/" }
      ft.systemverilog = { "//%s", "/*%s*/" }
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        bsv = {
          icon = "󰘚",
          color = "#51a0cf",
          cterm_color = "74",
          name = "BSV",
        },
      },
    },
  },
}
