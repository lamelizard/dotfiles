-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

-- completion
-- https://github.com/hrsh7th/nvim-cmp/wiki
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping({
      -- only complete if selected, else newline
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({select = true}),
      c = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    }),
    ['<TAB>'] = cmp.mapping(
      function(fallback)
        -- confirm with tab, select first if none selected
        if cmp.visible() then
          if not cmp.get_selected_entry() then
            cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
          else
            cmp.confirm()
          end
        else
          fallback()
        end
      end,
      -- ???
      {'i','s','c'}
    ),
  }),
  sources = cmp.config.sources(
    {
      {name='nvim_lsp'},
      {name='luasnip'},
    },
    {{name='buffer'}}
  ),
})

--latex
cmp.setup.filetype({
    'tex',
    'plaintex',
  }, {
    sources = {
      {
        name='latex_symbols',
        -- strategy 2: show and insert command
        option = {strategy = 2}
      },
      -- https://github.com/micangl/cmp-vimtex
      --{name='vimtex'}
    }
  }
)

-- sources for '/' and '?'
cmp.setup.cmdline(
  {'/', '?'},
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name='buffer'}}
  }
)
-- sources for ':'
cmp.setup.cmdline(
  {':'},
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {{name='path'}},
      {{name='cmdline'}}
    )
  }
)

