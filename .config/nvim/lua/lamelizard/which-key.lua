local wk = require("which-key")
wk.setup {
  opts = {
    -- cannot get rid of warnings -> just disable them...
    notify = false,
    icons = {
      mappings = false,
    },
  }
}

-- add categories
wk.add({
  {"<leader>f", group="Find"},
  {"<leader>fl", group="LSP"},
  {"<leader>flc", group="Calls"},
  {"<leader>e", group="Edit"},
  {"<leader>v", group="View"},
})

