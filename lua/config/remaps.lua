local builtin = require('telescope.builtin')
require("telescope").setup {
  pickers = {
    find_files={find_command = {
        'fd',
        '--type',
        'f',
        '--no-ignore-vcs',
        '--color=never',
        '--hidden',
        '--follow',
}}
  }
}

vim.g.mapleader = ' '

vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { desc = 'Save file' })
vim.api.nvim_set_keymap('n', '-', ':Oil<CR>', { noremap = true, silent = true, desc = 'Open Explorer' })
vim.keymap.set('n', '<leader>r', ':luafile %<CR>', { desc = 'Reload configuration' })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader> ', builtin.buffers, { desc = 'Telescope buffers' })

-- Navigazione tra le finestre
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Move left' })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = 'Move right' })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = 'Move down' })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = 'Move up' })
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true, desc = 'Move left' })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true, desc = 'Move right' })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true, desc = 'Move down' })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true, desc = 'Move up' })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true})

-- Splits creation
vim.api.nvim_set_keymap('n', '<leader>|', ':vsplit <CR>', {noremap = true})
vim.keymap.set('n', '<leader>-', ':split <CR>', {noremap = true})


-- Ridimensionamento finestre
vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', { noremap = true, silent = true, desc = 'Riempi finestre' })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +5<CR>', { noremap = true, silent = true, desc = 'Aumenta larghezza' })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -5<CR>', { noremap = true, silent = true, desc = 'Diminuisci larghezza' })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true, desc = 'Aumenta altezza' })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true, desc = 'Diminuisci altezza' })
vim.api.nvim_set_keymap('t', '<C-Left>', ':vertical resize +5<CR>', { noremap = true, silent = true, desc = 'Aumenta larghezza' })
vim.api.nvim_set_keymap('t', '<C-Right>', ':vertical resize -5<CR>', { noremap = true, silent = true, desc = 'Diminuisci larghezza' })
vim.api.nvim_set_keymap('t', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true, desc = 'Aumenta altezza' })
vim.api.nvim_set_keymap('t', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true, desc = 'Diminuisci altezza' })

vim.api.nvim_set_keymap('n', '<leader>t', ':sp<bar>term<cr><c-w>J:resize10<cr>a', {noremap = true})
local term_group = vim.api.nvim_create_augroup('MyTermGroup', { clear = true })

-- Crea l'autocomando
vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  group = term_group,
  callback = function()
    -- Controlla se il tipo di buffer della finestra corrente è 'terminal'
    if vim.bo.buftype == 'terminal' then
      -- Se lo è, esegui il comando per entrare in modalità inserimento
      vim.cmd('startinsert')
    end
  end,
})
