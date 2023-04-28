
--"let g:vimtex_view_method = "SumatraPDF"
if not vim.fn.executable('zathura') then
    if vim.fn.executable('SumatraPDF') then
        vim.g.vimtex_view_general_viewer = 'SumatraPDF'
        vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    end
end
