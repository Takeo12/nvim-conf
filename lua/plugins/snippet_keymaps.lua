-- Key mappings for expanding and navigating snippets
vim.api.nvim_set_keymap('i', '<C-l>', "<cmd>lua require'luasnip'.expand_or_jump()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<C-l>', "<cmd>lua require'luasnip'.expand_or_jump()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<C-h>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { noremap = true, silent = true })


return {}
