-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

-- diagnostics
vim.keymap.set("n", "[x", vim.diagnostic.goto_next, { desc = "goto next diagnostic" })
vim.keymap.set("n", "]x", vim.diagnostic.goto_prev, { desc = "goto previous diagnostic" })
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "view diagnostics" })
-- always allow adding text without changing buffer (e.g. lsp warnings)
vim.diagnostic.config({
  virtual_text = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(client, bufnr)
    -- Lua 5.1 compatibility
    local unpack = unpack or table.unpack
    --todo change to own preference
    local opts = { buffer = bufnr, remap = false }

    -- goto
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { unpack(opts), desc = "Go to definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { unpack(opts), desc = "Go to definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { unpack(opts), desc = "Go to references" })
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { unpack(opts), desc = "Go to implementation" })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { unpack(opts), desc = "Go to type definition" })

    -- help
    vim.keymap.set("n", "<C-H>", vim.lsp.buf.hover, { unpack(opts), desc = "hover" })
    vim.keymap.set("i", "<C-H>", vim.lsp.buf.hover, { unpack(opts), desc = "hover" })
    vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, { unpack(opts), desc = "signature help" })
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { unpack(opts), desc = "signature help" })

    -- edit
    vim.keymap.set("n", "<leader>ern", vim.lsp.buf.rename, { unpack(opts), desc = "rename" })
    vim.keymap.set("n", "<leader>eca", vim.lsp.buf.code_action, { unpack(opts), desc = "code actions" })
    vim.keymap.set("n", "<leader>ef",
      function() vim.lsp.buf.format { async = true } end,
      { unpack(opts), desc = "format buffer" }
    )
  end
})

require("mason").setup()

-- add(/set?) cmp as completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls"
  },
  -- let lspconfig handle the setup of each server
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities
      })
    end,
    ["lua_ls"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            }
          }
        }
      }
    end,
  },
})

