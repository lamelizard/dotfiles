require('auto-save').setup {
  condition=function (buf)
    -- for now: only auto-save .tex
    local utils = require('auto-save.utils.data')
    if not utils.not_in(vim.fn.getbufvar(buf, '&filetype'), {
      'tex',
    }) then
      return true
    end
    return false
  end,
}

