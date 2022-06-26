local ls = require('luasnip')
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local s = ls.s
local rep = require("luasnip.extras").rep

ls.add_snippets("javascript", {
  s("req", fmt("const {} = require('{}')", { i(1, "default"), rep(1) })),
})
