vim.g.mapleader = ';'

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local autocmd = vim.api.nvim_create_autocmd

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')
map('', 'V-j', '<nop>')
map('', 'V-k', '<nop>')

map('n', 'gd', '<Plug>(coc-definition)')
map('n', 'gy', '<Plug>(coc-type-definition)')
map('n', 'gi', '<Plug>(coc-implementation)')
map('n', 'gr', '<Plug>(coc-references)')

-- <A-j> :m .+1<CR>==
-- <A-k> :m .-2<CR>==
-- <A-j> <Esc>:m .+1<CR>==gi
-- <A-k> <Esc>:m .-2<CR>==gi
-- <A-j> :m '>+1<CR>gv=gv
-- <A-k> :m '<-2<CR>gv=gv

vim.g.VM_maps = {}
vim.g.VM_maps["Select Cursor Down"] = '<C-j>'
vim.g.VM_maps["Select Cursor Up"] = '<C-k>'

