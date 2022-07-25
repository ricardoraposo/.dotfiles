local ls = require('luasnip')
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node
local s = ls.s
-- local rep = require("luasnip.extras").rep

ls.add_snippets("go", {
  s("fn", fmt(
    [[
    func {1}({2}) {3} {{
      {4}
    }}
    ]],
    { i(1), i(2), i(3), i(4) }
  )),
  s("pmain", fmt(
    [[
    package main

    func main() {{
      {1}
    }}
    ]],
    { i(1) }
  )),
  s("err", fmt(
    [[
    if err != nil {{
      {1}
    }}
    ]],
    { c(1, { t({ "" }), t({ "log.Fatal(err)" }) }) }
  )),
})
