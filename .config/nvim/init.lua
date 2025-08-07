-- Minimal Neovim configuration for VSCode Extension
-- No plugins required - just keybindings and settings

-- Only load this config when running in VSCode
if not vim.g.vscode then
  -- If not in VSCode, just set basic options and exit
  vim.opt.number = true
  vim.opt.relativenumber = true
  return
end

-- =========================================
-- VSCode-Specific Configuration
-- =========================================

-- Set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic options that work in VSCode
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard

-- =========================================
-- VSCode Commands Helper
-- =========================================
local vscode = require('vscode-neovim')

-- Helper function to call VSCode commands
local function vscode_action(cmd)
  return function()
    vscode.call(cmd)
  end
end

-- =========================================
-- Navigation (Matches Tmux)
-- =========================================

-- Window navigation with Ctrl+hjkl (handled by VSCode keybindings)
-- These are commented out because we handle them in VSCode's keybindings.json
-- vim.keymap.set('n', '<C-h>', vscode_action('workbench.action.focusLeftGroup'))
-- vim.keymap.set('n', '<C-j>', vscode_action('workbench.action.focusBelowGroup'))
-- vim.keymap.set('n', '<C-k>', vscode_action('workbench.action.focusAboveGroup'))
-- vim.keymap.set('n', '<C-l>', vscode_action('workbench.action.focusRightGroup'))

-- =========================================
-- File Operations
-- =========================================

vim.keymap.set('n', '<leader>w', vscode_action('workbench.action.files.save'), { desc = 'Save file' })
vim.keymap.set('n', '<leader>W', vscode_action('workbench.action.files.saveAll'), { desc = 'Save all files' })
vim.keymap.set('n', '<leader>q', vscode_action('workbench.action.closeActiveEditor'), { desc = 'Close editor' })
vim.keymap.set('n', '<leader>Q', vscode_action('workbench.action.closeAllEditors'), { desc = 'Close all editors' })

-- =========================================
-- Search and Find
-- =========================================

vim.keymap.set('n', '<leader>ff', vscode_action('workbench.action.quickOpen'), { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', vscode_action('workbench.action.findInFiles'), { desc = 'Find in files (grep)' })
vim.keymap.set('n', '<leader>fb', vscode_action('workbench.action.showAllEditors'), { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fr', vscode_action('workbench.action.openRecent'), { desc = 'Recent files' })
vim.keymap.set('n', '<leader>fs', vscode_action('workbench.action.gotoSymbol'), { desc = 'Find symbol in file' })
vim.keymap.set('n', '<leader>fS', vscode_action('workbench.action.showAllSymbols'), { desc = 'Find symbol in workspace' })

-- Quick file switching
vim.keymap.set('n', '<leader><leader>', vscode_action('workbench.action.quickOpen'), { desc = 'Quick open' })

-- =========================================
-- Code Actions and Refactoring
-- =========================================

vim.keymap.set('n', '<leader>ca', vscode_action('editor.action.quickFix'), { desc = 'Code actions' })
vim.keymap.set('n', '<leader>cr', vscode_action('editor.action.rename'), { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>cf', vscode_action('editor.action.formatDocument'), { desc = 'Format document' })
vim.keymap.set('v', '<leader>cf', vscode_action('editor.action.formatSelection'), { desc = 'Format selection' })
vim.keymap.set('n', '<leader>co', vscode_action('editor.action.organizeImports'), { desc = 'Organize imports' })

-- =========================================
-- Git Integration
-- =========================================

vim.keymap.set('n', '<leader>gs', vscode_action('workbench.view.scm'), { desc = 'Git status (source control)' })
vim.keymap.set('n', '<leader>gd', vscode_action('git.openChange'), { desc = 'Git diff current file' })
vim.keymap.set('n', '<leader>gb', vscode_action('git.blame'), { desc = 'Git blame' })
vim.keymap.set('n', '<leader>gh', vscode_action('gitlens.showQuickFileHistory'), { desc = 'Git history' })
vim.keymap.set('n', '<leader>gc', vscode_action('git.commit'), { desc = 'Git commit' })
vim.keymap.set('n', '<leader>gp', vscode_action('git.push'), { desc = 'Git push' })
vim.keymap.set('n', '<leader>gl', vscode_action('git.pull'), { desc = 'Git pull' })

-- =========================================
-- Navigation and Go To
-- =========================================

vim.keymap.set('n', 'gd', vscode_action('editor.action.revealDefinition'), { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vscode_action('editor.action.revealDeclaration'), { desc = 'Go to declaration' })
vim.keymap.set('n', 'gi', vscode_action('editor.action.goToImplementation'), { desc = 'Go to implementation' })
vim.keymap.set('n', 'gr', vscode_action('editor.action.goToReferences'), { desc = 'Go to references' })
vim.keymap.set('n', 'gy', vscode_action('editor.action.goToTypeDefinition'), { desc = 'Go to type definition' })

-- Hover and documentation
vim.keymap.set('n', 'K', vscode_action('editor.action.showHover'), { desc = 'Show hover' })
vim.keymap.set('n', '<leader>k', vscode_action('editor.action.showHover'), { desc = 'Show hover' })

-- =========================================
-- Diagnostics and Problems
-- =========================================

vim.keymap.set('n', '[d', vscode_action('editor.action.marker.prev'), { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vscode_action('editor.action.marker.next'), { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>dd', vscode_action('workbench.actions.view.problems'), { desc = 'Show all diagnostics' })
vim.keymap.set('n', '<leader>df', vscode_action('editor.action.showHover'), { desc = 'Show diagnostic' })

-- =========================================
-- Terminal
-- =========================================

vim.keymap.set('n', '<leader>t', vscode_action('workbench.action.terminal.toggleTerminal'), { desc = 'Toggle terminal' })
vim.keymap.set('n', '<leader>T', vscode_action('workbench.action.terminal.new'), { desc = 'New terminal' })

-- =========================================
-- Sidebar and Panels
-- =========================================

vim.keymap.set('n', '<leader>e', vscode_action('workbench.view.explorer'), { desc = 'File explorer' })
vim.keymap.set('n', '<leader>E', vscode_action('workbench.action.toggleSidebarVisibility'), { desc = 'Toggle sidebar' })
vim.keymap.set('n', '<leader>z', vscode_action('workbench.action.toggleZenMode'), { desc = 'Zen mode' })

-- =========================================
-- Splits (matching tmux bindings)
-- =========================================

vim.keymap.set('n', '<leader>|', vscode_action('workbench.action.splitEditor'), { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>_', vscode_action('workbench.action.splitEditorDown'), { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>m', vscode_action('workbench.action.toggleMaximizedPanel'), { desc = 'Maximize/minimize panel' })

-- =========================================
-- Comments
-- =========================================

vim.keymap.set('n', '<leader>/', vscode_action('editor.action.commentLine'), { desc = 'Toggle comment' })
vim.keymap.set('v', '<leader>/', vscode_action('editor.action.commentLine'), { desc = 'Toggle comment' })

-- =========================================
-- Folding
-- =========================================

vim.keymap.set('n', 'za', vscode_action('editor.toggleFold'), { desc = 'Toggle fold' })
vim.keymap.set('n', 'zR', vscode_action('editor.unfoldAll'), { desc = 'Unfold all' })
vim.keymap.set('n', 'zM', vscode_action('editor.foldAll'), { desc = 'Fold all' })

-- =========================================
-- Better Text Objects and Motions
-- =========================================

-- These work natively in VSCode Neovim
-- ci" - change inside quotes
-- ca" - change around quotes  
-- di( - delete inside parentheses
-- da{ - delete around braces
-- vi[ - visual select inside brackets
-- etc.

-- =========================================
-- Quick Edits
-- =========================================

-- Move lines up/down
vim.keymap.set('n', '<A-j>', vscode_action('editor.action.moveLinesDownAction'), { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', vscode_action('editor.action.moveLinesUpAction'), { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', vscode_action('editor.action.moveLinesDownAction'), { desc = 'Move lines down' })
vim.keymap.set('v', '<A-k>', vscode_action('editor.action.moveLinesUpAction'), { desc = 'Move lines up' })

-- Indent/dedent
vim.keymap.set('v', '<', '<gv', { desc = 'Dedent and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent and reselect' })

-- =========================================
-- Custom Macros
-- =========================================

-- Quick console.log for JavaScript/TypeScript
vim.keymap.set('n', '<leader>cl', function()
  local word = vim.fn.expand('<cword>')
  local line = string.format('console.log("%s:", %s);', word, word)
  vim.api.nvim_put({line}, 'l', true, true)
end, { desc = 'Console.log current word' })

-- =========================================
-- Better Defaults
-- =========================================

-- Center screen after navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keep cursor centered when joining lines
vim.keymap.set('n', 'J', 'mzJ`z')

-- Better undo breakpoints
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '!', '!<c-g>u')
vim.keymap.set('i', '?', '?<c-g>u')

-- =========================================
-- Which-key style hints (as comments)
-- =========================================

-- Leader key mappings overview:
-- <leader>f_  = Find/Search
-- <leader>g_  = Git
-- <leader>c_  = Code actions
-- <leader>d_  = Diagnostics
-- <leader>t   = Terminal
-- <leader>e   = Explorer
-- <leader>w   = Save
-- <leader>q   = Quit/Close
