-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   plugins/colorscheme.lua                                        ║
-- ╚══════════════════════════════════════════════════════════════════╝

return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy     = false,
        priority = 1000,
        config   = function()
            vim.opt.background = "dark"
            vim.cmd.colorscheme("oxocarbon")

            local set = vim.api.nvim_set_hl

            -- Completion menu
            set(0, "Pmenu",             { fg = "#F2F4F8", bg = "#4a4a4a" })
            set(0, "PmenuSel",          { fg = "#161616", bg = "#FF7EB6", bold = true })
            set(0, "PmenuSbar",         { bg = "#4a4a4a" })
            set(0, "PmenuThumb",        { bg = "#6a6a6a" })

            -- Floating windows + nvim-cmp (uses NormalFloat)
            set(0, "NormalFloat",       { fg = "#F2F4F8", bg = "#4a4a4a" })
            set(0, "FloatBorder",       { fg = "#BE95FF", bg = "#4a4a4a" })

            -- nvim-cmp item highlights
            set(0, "CmpItemAbbr",          { fg = "#F2F4F8" })
            set(0, "CmpItemAbbrMatch",     { fg = "#FF7EB6", bold = true })
            set(0, "CmpItemAbbrMatchFuzzy",{ fg = "#FF7EB6", bold = true })
            set(0, "CmpItemKind",          { fg = "#BE95FF" })
            set(0, "CmpItemMenu",          { fg = "#888888" })

            -- Statusline
            set(0, "StatusLine",        { fg = "#F2F4F8", bg = "#262626" })
            set(0, "StatusLineNC",      { fg = "#525252", bg = "#161616" })
            set(0, "WinBar",            { fg = "#F2F4F8", bg = "#262626" })
            set(0, "WinBarNC",          { fg = "#525252", bg = "#161616" })
        end,
    },
}
