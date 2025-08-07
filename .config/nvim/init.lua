-- Basic Neovim configuration with tmux integration

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.completeopt = 'menuone,noselect'
vim.opt.undofile = true

-- Install lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin setup
require("lazy").setup({
  -- Tmux navigator for seamless navigation
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  -- Tokyo Night theme to match terminal
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme tokyonight-night]]
    end,
  },
  -- Better statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'tokyonight',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'File Explorer' },
    },
    opts = {
      view = {
        width = 30,
      },
    },
  },
  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep Files' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
    },
  },
  -- Treesitter for better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'python', 'rust', 'go', 'bash' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
})

-- Keymaps for splits (matching tmux)
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>_', ':split<CR>', { desc = 'Split horizontal' })

-- Resize with Alt + hjkl
vim.keymap.set('n', '<M-h>', ':vertical resize -3<CR>', { silent = true })
vim.keymap.set('n', '<M-j>', ':resize -3<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', ':resize +3<CR>', { silent = true })
vim.keymap.set('n', '<M-l>', ':vertical resize +3<CR>', { silent = true })

-- Better window navigation (backup for when not in tmux)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Quick save and quit
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', ':qa<CR>', { desc = 'Quit all' })
