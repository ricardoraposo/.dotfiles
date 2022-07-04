local ls = require('luasnip')
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node
local i = ls.insert_node
local s = ls.s
-- local rep = require("luasnip.extras").rep

ls.add_snippets("typescriptreact", {
  s("afb", fmt(
    [[
    const {1} = ({2}) => {{
      {3}
    }}
    ]],
    { t("{$TM_FILENAME_BASE}"), i(2), i(3) }
  )),
	s("cl", fmt("console.log({})", { i(1) })),
})
