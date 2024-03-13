-- requires c compliler
-- on windows: choco install tree-sitter llvm (or mingw)

-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

require('nvim-treesitter.configs').setup {
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    -- programming
    "bash",
    "c",
    "cpp",
    --"glsl",
    --"hlsl",
    "cmake",
    "java",
    "json",
    "lua",
    "python",
    -- latex
    "latex",
    "bibtex",
    -- stuff
    "diff",
    "dockerfile",
    "dot",
    "vimdoc",
    "make",
    "markdown",
    -- git
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    -- small things
    "comment", -- TODO, etc.
    "regex",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false, --true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- use vimtex for latex
    disable = {"latex"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
