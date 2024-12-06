return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            lazy = false,
            opts = {
                -- try this out later
                -- multiwindow = true,
                enable = true,
                max_lines = 3,
                multiline_threshold = 1,
                min_window_height = 25,
            },
        },
    },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        -- these are usually embedded, so auto_install won't work
        ensure_installed = { "markdown_inline", "markdown", "diff", "vim", "vimdoc" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
    },
}
