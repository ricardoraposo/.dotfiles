local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local s = ls.s
local rep = require("luasnip.extras").rep

ls.add_snippets("typescript", {
	s("req", fmt("const {} = require('{}')", { i(1, "default"), rep(1) })),
	s("ibr", fmt([[import {{{2}}} from "{1}"]], { i(1), i(2) })),
	s(
		"afb",
		fmt(
			[[
    const {1} = ({2}) => {{
      {3}
    }}
    ]],
			{ i(1), i(2), i(3) }
		)
	),
	s(
		"afc",
		fmt(
			[[
    ({1}) => {{
      {2}
    }}
    ]],
      { c(1, { t{""}, t{"req, res"}, t{"req, res, next"}}), i(2)}
		)
	),
	s("cl", fmt("console.log({})", { i(1) })),
})
