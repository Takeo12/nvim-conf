local ls = require'luasnip'
local s = ls.snippet
local t = ls.text_node

-- Create a simple snippet
ls.add_snippets('all', {
    s('trigger', { t('This is a snippet!') }),
})


return {}
