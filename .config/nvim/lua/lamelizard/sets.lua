--format
vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"

--Security
vim.opt.modelines = 0

--source .vimrc inside project folder
vim.opt.exrc = true

vim.opt.title = true  -- terminal title

vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.ruler = true

--whitespace
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

--cursor motion
--keep cursor away from edges
vim.opt.scrolloff = 4
--better backspace
vim.opt.backspace = {'indent','eol','start'}
--<these are braces>
vim.opt.matchpairs = vim.bo.matchpairs .. ",<:>"
--status bar
vim.opt.laststatus=2

--looks
vim.cmd([[highlight Normal guibg=none]])

vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.signcolumn = "yes"

--search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.showmatch = true

--timeout
vim.o.timeout = true
vim.o.timeoutlen = 500

--vim.opt.listchars=tab:?\ ,eol:
