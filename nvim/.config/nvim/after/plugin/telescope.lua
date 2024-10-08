local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "dist" },
    prompt_prefix = " ♥ ",
    selection_caret = " ➜ ",
    path_display = { "smart" },
  },
  pickers = {
    colorscheme = {
      enable_preview = true,
      theme = "dropdown",
    },
    find_files = {
      -- theme = "dropdown",
      previewer = true,
      hidden = false,
    },
  },
  extensions = {
    undo = {
      use_delta = true,
      use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
      side_by_side = false,
      vim_diff_opts = {
        ctxlen = vim.o.scrolloff,
      },
      entry_format = "state #$ID, $STAT, $TIME",
      time_format = "",
      saved_only = false,
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
