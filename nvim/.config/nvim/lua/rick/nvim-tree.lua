local api = require("nvim-tree.api")

local function vsplit_preview()
    local node = api.tree.get_node_under_cursor()
    if node.nodes ~= nil then
        api.node.open.edit()
    else
        api.node.open.vertical()
    end
    api.tree.focus()
end

local function on_attach(bufnr)
    local km = vim.keymap.set

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    km("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    km("n", "<CR>", api.node.open.edit, opts("Open"))
    km("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
    km("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
    km("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
    km("n", ".", api.node.run.cmd, opts("Run Command"))
    km("n", "-", api.tree.change_root_to_parent, opts("Up"))
    km("n", "a", api.fs.create, opts("Create"))
    km("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
    km("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
    km("n", "c", api.fs.copy.node, opts("Copy"))
    km("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
    km("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
    km("n", "]c", api.node.navigate.git.next, opts("Next Git"))
    km("n", "d", api.fs.remove, opts("Delete"))
    km("n", "D", api.fs.trash, opts("Trash"))
    km("n", "E", api.tree.expand_all, opts("Expand All"))
    km("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
    km("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
    km("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
    km("n", "F", api.live_filter.clear, opts("Clean Filter"))
    km("n", "f", api.live_filter.start, opts("Filter"))
    km("n", "g?", api.tree.toggle_help, opts("Help"))
    km("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
    km("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
    km("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
    km("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
    km("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
    km("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
    km("n", "o", api.node.open.edit, opts("Open"))
    km("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
    km("n", "p", api.fs.paste, opts("Paste"))
    km("n", "P", api.node.navigate.parent, opts("Parent Directory"))
    km("n", "q", api.tree.close, opts("Close"))
    km("n", "r", api.fs.rename, opts("Rename"))
    km("n", "R", api.tree.reload, opts("Refresh"))
    km("n", "s", api.node.run.system, opts("Run System"))
    km("n", "S", api.tree.search_node, opts("Search"))
    km("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
    km("n", "W", api.tree.collapse_all, opts("Collapse"))
    km("n", "x", api.fs.cut, opts("Cut"))
    km("n", "y", api.fs.copy.filename, opts("Copy Name"))
    km("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
    km("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
    km("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
    -- Custom shit
    km("n", "l", api.node.open.edit, opts("Open"))
    km("n", "v", vsplit_preview, opts("vsplit_preview"))
    km("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    km("n", "H", api.tree.collapse_all, opts("Collapse"))
end

require("nvim-tree").setup({
    on_attach = on_attach,
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = true,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_tab = true,
    sort_by = "type",
    update_cwd = false,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        float = {
            enable = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 35,
                height = 30,
                row = 0,
                col = 0,
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                item = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "󰆤",
                modified = "●",
                folder = {
                    arrow_closed = "  ",
                    arrow_open = "  ",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
        },
        open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "gio trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
})
