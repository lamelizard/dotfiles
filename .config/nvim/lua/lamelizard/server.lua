-- untested!
-- the (first?) VIM instance will be available as a server under the name 'VIM'
-- commands can be send to vim, e.g. vimtex synctex backwards search
vim.cmd([[
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
]])
