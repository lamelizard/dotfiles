-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls'
})

-- completion
local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}

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

lsp.on_attach(function(client, bufnr)
  --todo change to own preference
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {unpack(opts), desc="go to definition"})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {unpack(opts), desc="hover"})
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {unpack(opts), desc=""})
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {unpack(opts), desc="view diagnostics"})
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {unpack(opts), desc="goto next diagnostic"})
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {unpack(opts), desc="goto previous diagnostic"})
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {unpack(opts), desc="view code actions"})
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {unpack(opts), desc="view references"})
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {unpack(opts), desc="rename (lsp)"})
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {unpack(opts), desc="signature help"})
end)

-- fin
lsp.setup()

-- always allow adding text without changing buffer (e.g. lsp warnings)
vim.diagnostic.config({
    virtual_text = true,
})

