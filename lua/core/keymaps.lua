-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--  disable the spacebar key's default behaviour in Normal and visual modes 
vim.keymap.set({ 'n', 'v'} , '<Space>' , '<Nop>', {silent = true})

local opts = { noremap = true, silent = true} 

-- save file 
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts) 
-- save file without auto-formating
vim.keymap.set('n', '<leader>sn' , '<cmd>noautocmd w <CR>',opts) 

-- quit file 
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into  register 
vim.keymap.set('n', 'x', '"_x', opts)

--- vertical scroll and center 
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts) 
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts) 

-- find and center 
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'nzzzv', opts)


-- resize with arrows 
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- buffers
