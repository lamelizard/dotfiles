-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

require("mason").setup()

-- Lua 5.1 compatibility
local unpack = unpack or table.unpack

local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim' while editing vim lua config files
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
        }
    }
  }
})

-- diagnostics
vim.keymap.set("n", "[x", vim.diagnostic.goto_next, {desc="goto next diagnostic"})
vim.keymap.set("n", "]x", vim.diagnostic.goto_prev, {desc="goto previous diagnostic"})
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {desc="view diagnostics"})

lsp.on_attach(function(client, bufnr)
  --todo change to own preference
  local opts = {buffer = bufnr, remap = false}

  -- goto
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {unpack(opts), desc="Go to definition"})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {unpack(opts), desc="Go to definition"})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {unpack(opts), desc="Go to references"})
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {unpack(opts), desc="Go to implementation"})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {unpack(opts), desc="Go to type definition"})

  -- help
  vim.keymap.set("n", "<C-H>", vim.lsp.buf.hover, {unpack(opts), desc="hover"})
  vim.keymap.set("i", "<C-H>", vim.lsp.buf.hover, {unpack(opts), desc="hover"})
  vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, {unpack(opts), desc="signature help"})
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {unpack(opts), desc="signature help"})

  -- edit
  vim.keymap.set("n", "<leader>ern", vim.lsp.buf.rename, {unpack(opts), desc="rename"})
  vim.keymap.set("n", "<leader>eca", vim.lsp.buf.code_action, {unpack(opts), desc="code actions"})
  vim.keymap.set("n", "<leader>ef",
    function() vim.lsp.buf.format {async=true} end,
    {unpack(opts), desc="format buffer"}
  )
end)

-- fin
lsp.setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls"
  },
  -- let lspconfig handle the setup of each server
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

local lsp = require("lsp-zero")
-- Fix Undefined global 'vim' while editing vim lua config files
lsp.configure('lua_ls', {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
          }
      }
    }
  })

-- always allow adding text without changing buffer (e.g. lsp warnings)
vim.diagnostic.config({
    virtual_text = true,
})

