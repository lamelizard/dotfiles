vim.o.timeout = true
vim.o.timeoutlen = 500
local wk = require("which-key")
wk.setup {
}

-- register categories
wk.register({
  ["<leader>"] = {
    f = {name = "+Find",
      l = {name = "+LSP",
        c = {name = "+Calls"},
      },
    },
    e = {name = "+Edit"},
  },
})

