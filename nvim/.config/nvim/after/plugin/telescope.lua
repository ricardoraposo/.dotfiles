local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "dist" },
    prompt_prefix = "♥ ",
    selection_caret = "> ",
    path_display = { "smart" },
  },
  pickers = {
    colorscheme = {
      enable_preview = true,
      theme = "dropdown",
    },
    find_files = {
      layout_config = {
        height = 10
      },
      theme = "ivy",
      previewer=false,
      hidden = false,
    },
  },
  extensions = {
    undo = {
      use_delta = true,
      side_by_side = false,
      diff_context_lines = vim.o.scrolloff,
      entry_format = "state #$ID, $STAT, $TIME",
      mappings = {
        i = {
          ["<CR>"] = require("telescope-undo.actions").yank_additions,
          ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-CR>"] = require("telescope-undo.actions").restore,
        },
      },
    },
  },
})

require("telescope").load_extension("undo")
