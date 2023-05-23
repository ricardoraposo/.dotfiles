local org = require("orgmode")
local treesitter_config = require("nvim-treesitter.configs")

org.setup({
  org_agenda_files = { "~/Documents/notes/org/*" },
  org_default_notes_file = "~/Documents/notes/org/refile.org",
  mappings = {
    org = {
      org_open_at_point = "<CR>",
    },
  },
  org_capture_templates = {
    -- TODO: Create a template for fucking yomama
    t = {
      description = "task",
      template = "* TODO %?\n SCHEDULED: %t\n",
      target = "~/Documents/notes/org/agenda.org",
    },
    n = {
      description = "quick note",
      template = "- %?\n",
      target = "~/Documents/notes/org/notes.org",
    },
    j = {
      description = "journal",
      template = "\n* %<%Y-%m-%d> %<%A>\n%?",
      target = "~/Documents/notes/org/journal.org",
    },
  },
})

-- Load custom treesitter grammar for org filetype
org.setup_ts_grammar()
treesitter_config.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "org" },
  },
  ensure_installed = { "org" },
})

-- Org Bullets configuration
require("org-bullets").setup({
  concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
  symbols = {
    -- list symbol
    list = "⁍",
    -- headlines can be a list
    headlines = { "◉", "○", "✸", "✿" },
    checkboxes = {
      half = { "-" },
      done = { "X" },
      todo = { " " },
    },
  },
})

require("orgWiki").setup({
  wiki_path = { "~/Documents/notes/org/brain/" },
  diary_path = "~/Documents/notes/org/journal/",
})
