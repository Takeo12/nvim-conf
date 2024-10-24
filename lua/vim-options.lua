vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.cmd("inoremap jk <Esc>")



vim.keymap.set('n', '<C-n>', ':Neotree toggle <CR>' , {})


-- LUASNIP

-- Use <Tab> to jump to the next snippet placeholder
vim.api.nvim_set_keymap('i', '<Tab>', [[<cmd>lua require'luasnip'.jump(1)<CR>]], {silent = true})
vim.api.nvim_set_keymap('s', '<Tab>', [[<cmd>lua require'luasnip'.jump(1)<CR>]], {silent = true})

-- Use <Shift-Tab> to jump backwards in snippet placeholders
vim.api.nvim_set_keymap('i', '<S-Tab>', [[<cmd>lua require'luasnip'.jump(-1)<CR>]], {silent = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', [[<cmd>lua require'luasnip'.jump(-1)<CR>]], {silent = true})




-- BARBAR MAPPINGS



local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
--
--
-- AUTOINDENT MIT TREESITTEr


vim.opt.expandtab = true
vim.opt.shiftwidth = 2    -- Number of spaces for each indentation level
vim.opt.tabstop = 2       -- Number of spaces a tab counts for
vim.opt.autoindent = true  -- Enable auto-indentation
vim.opt.smartindent = true -- Smart indentation based on syntax

