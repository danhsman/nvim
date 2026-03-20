-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   plugins/telescope.lua                                          ║
-- ╚══════════════════════════════════════════════════════════════════╝

return {
    {
        "nvim-telescope/telescope.nvim",
        cmd          = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            local telescope = require("telescope")
            local actions   = require("telescope.actions")

            telescope.setup({
                defaults = {
                    prompt_prefix    = "  ",
                    selection_caret  = "  ",
                    path_display     = { "truncate" },
                    sorting_strategy = "ascending",
                    borderchars      = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    layout_config    = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width   = 0.55,
                        },
                    },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<Esc>"] = actions.close,
                        },
                    },
                },
                pickers = {
                    find_files = { hidden = true },
                },
            })

            telescope.load_extension("fzf")

            -- Telescope highlight overrides (oxocarbon + pink accent)
            local set = vim.api.nvim_set_hl
            set(0, "TelescopeBorder",         { fg = "#BE95FF", bg = "#1a1a1a" })
            set(0, "TelescopePromptBorder",    { fg = "#FF7EB6", bg = "#1a1a1a" })
            set(0, "TelescopePromptNormal",    { fg = "#F2F4F8", bg = "#1a1a1a" })
            set(0, "TelescopePromptPrefix",    { fg = "#FF7EB6", bg = "#1a1a1a" })
            set(0, "TelescopeNormal",          { bg = "#1a1a1a" })
            set(0, "TelescopePreviewTitle",    { fg = "#161616", bg = "#BE95FF", bold = true })
            set(0, "TelescopePromptTitle",     { fg = "#161616", bg = "#FF7EB6", bold = true })
            set(0, "TelescopeResultsTitle",    { fg = "#161616", bg = "#BE95FF", bold = true })
            set(0, "TelescopeSelection",       { fg = "#F2F4F8", bg = "#2e2e2e", bold = true })
            set(0, "TelescopeSelectionCaret",  { fg = "#FF7EB6", bg = "#2e2e2e" })
            set(0, "TelescopeMatching",        { fg = "#FF7EB6", bold = true })
        end,
    },
}
