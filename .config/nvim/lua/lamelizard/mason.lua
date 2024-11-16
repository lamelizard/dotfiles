local ensure_installed = {
  "lua_ls",
  "texlab",
}

-- to install from shell
vim.api.nvim_create_user_command("MasonInstallAll", function ()
  vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
end, {})

require("mason").setup()
require("mason-lspconfig").setup(
  ensure_installed = ensure_installed
)

