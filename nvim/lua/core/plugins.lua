-- Packer config

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
vim.call('plug#end')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {'neoclide/coc.nvim', branch = 'release'}
    use 'github/copilot.vim'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'
    
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    -- use 'chriskempson/base16-vim'
    -- use 'tomasiser/vim-code-dark'
    -- use 'haberturdeur/vim-code-dark'

    use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'

--    use {'mg979/vim-visual-multi', branch = 'master'}

    use 'MrcJkb/haskell-tools.nvim'

    -- use 'frazrepo/vim-rainbow'

    -- use 'bfrg/vim-cpp-modern'

    -- use 'junegunn/rainbow_parentheses.vim'
    use 'HiPhish/nvim-ts-rainbow2'
    -- use 'tanvirtin/monokai.nvim'
    -- use 'luochen1990/rainbow'
    if packer_bootstrap then
        require('packer').sync()
    end
end)


