local conform = require("conform")

conform.formatters.sqlfluff = {
	args = { "fix", "--force", "--dialect=mysql", "-" },
}

conform.setup({
	formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
		sql = { "sqlfluff" },
		lua = { "stylua" },
		go = { "goimports" },
		json = { "jq" },
		css = { "stylelint" },
		graphql = { "prettierd" },
		ocaml = { "ocamlformat" },
	},
})
