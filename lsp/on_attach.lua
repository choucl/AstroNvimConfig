return function(client, bufnr)
  -- local cmp_nvim_lsp = require "cmp_nvim_lsp"
  --
  -- require("lspconfig").clangd.setup {
  --   -- on_attach = on_attach,
  --   capabilities = cmp_nvim_lsp.default_capabilities(),
  --   cmd = {
  --     "clangd",
  --     "--offset-encoding=utf-16",
  --   },
  -- }
  vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
  vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
end
