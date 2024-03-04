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
  { "github/copilot.vim", event = "BufRead,FileReadPre" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufRead,FileReadPre",
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
