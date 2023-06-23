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
      previewer = false,
      hidden = false,
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
    diagnostics = {
      theme = "dropdown",
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
          ["<cr>"] = require("telescope-undo.actions").yank_additions,
          ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-cr>"] = require("telescope-undo.actions").restore,
        },
      },
    },
  },
})

require("telescope").load_extension("undo")
