
--"let g:vimtex_view_method = "SumatraPDF"
if not vim.fn.executable('zathura') then
    if vim.fn.executable('SumatraPDF') then
        vim.g.vimtex_view_general_viewer = 'SumatraPDF'
        -- todo inverse search setting does not seem to work as expected...
        -- currently, in SumatraPDF options, set the following inverse search command line:
        -- cmd /c start /min "" nvim --headless -c "VimtexInverseSearch %l '%f'"
        vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf' ..
          ' -inverse-search "cmd /c start /min "" nvim --headless -c "VimtexInverseSearch %l \'%f\'"'
        vim.g.vimtex_view_general_options_latexmk = '-reuse-instance'
    -- todo this test does not seems to work as expected:
    elseif vim.fn.executable('C:\\Program Files\\SumatraPDF\\SumatraPDF.exe') then
        vim.g.vimtex_view_general_viewer ='C:\\Program Files\\SumatraPDF\\SumatraPDF.exe'
    else
      vim.print("WARN: no default PDF previewer found")
    end
end

-- do not open the compilation window if no error
vim.g.vimtex_quickfix_open_on_warning = 0

-- concealment (set conceallevel to 1/2 instead of 0 for effect)
vim.g.vimtex_syntax_conceal = {
  ['accents'] = 1,
  ['ligatures'] = 1,
  ['cites'] = 1,
  ['fancy'] = 0, -- e.g., '\item' -> circle
  ['spacing'] = 0, -- hides '\quad' and simmilar
  ['greek'] = 1,
  ['math_bounds'] = 1,
  ['math_delimiters'] = 1,
  ['math_fracs'] = 1,
  ['math_super_sub'] = 0, -- e.g., 'x^{2+a}'
  ['math_symbols'] = 1,
  ['sections'] = 0,
  ['styles'] = 0 -- hides? '\emph' and simmilar
}

