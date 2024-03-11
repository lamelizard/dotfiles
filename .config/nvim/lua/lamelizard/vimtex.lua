
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
