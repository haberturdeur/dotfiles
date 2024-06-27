vim.cmd([[
   if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
]])

vim.g.airline_left_sep = '▓▒░'
vim.g.airline_right_sep = '░▒▓'
vim.g.airline_symbols.branch = '\\uF126 '
vim.g.airline_symbols.colnr = ' ℅:'
vim.g.airline_symbols.readonly = ''
vim.g.airline_symbols.linenr = ' :'
vim.g.airline_symbols.maxlinenr = '☰ '
vim.g.airline_symbols.dirty='⚡'

--vim.g.codedark_term256=1
vim.g.codedark_transparent=1

-- vim.cmd([[colorscheme parchment]])
vim.cmd([[colorscheme codedark]])
-- codedark
-- vim.cmd([[syntax enable]])
