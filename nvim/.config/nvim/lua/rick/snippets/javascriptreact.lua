local ls = require('luasnip')
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local s = ls.s
-- local rep = require("luasnip.extras").rep

ls.add_snippets({"javascriptreact"}, {
  s("afb", fmt(
    [[
    const {1} = ({2}) => {{
      {3}
    }}
    ]],
    { i(1), i(2), i(3) }
  )),
	s("cl", fmt("consoole.log({})", { i(1) })),
})
