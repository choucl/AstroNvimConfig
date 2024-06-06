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
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "User,AstroFile",
  --   setup = function()
  --     require("treesitter-context").setup {
  --       enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
  --       max_lines = 5, -- The number of context lines to show
  --       multiline_threshold = 10, -- The minimum number of lines that need to be selected before a multi-line context is displayed
  --     }
  --   end,
  -- },
  {
    "numToStr/Comment.nvim",
    config = function()
      local ft = require "Comment.ft"
      ft.bsv = { "//%s", "/*%s*/" }
      ft.systemverilog = { "//%s", "/*%s*/" }
    end,
  },
  {
    "David-Kunz/gen.nvim",
    event = "User,AstroFile",
    opts = {
      model = "llama3:8b-instruct-q5_K_M", -- The default model to use.
      host = "192.168.164.199", -- The host running the Ollama service.
      port = "11434", -- The port on which the Ollama service is listening.
      quit_map = "q", -- set keymap for close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
      -- Function to initialize Ollama
      command = function(options)
        local body = { model = options.model, stream = true }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/v1/chat/completions -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      display_mode = "split", -- The display mode. Can be "float" or "split".
      show_prompt = false, -- Shows the prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = true, -- Never closes the window automatically.
      debug = false, -- Prints errors and the command which is run.
    },
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
