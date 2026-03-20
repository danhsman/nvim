-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   plugins/ui.lua                                                 ║
-- ╚══════════════════════════════════════════════════════════════════╝

return {
    -- ── Statusline ───────────────────────────────────────────────────
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            -- Oxocarbon palette
            local ox = {
                bg      = "#161616",
                bg1     = "#262626",
                bg2     = "#393939",
                fg      = "#F2F4F8",
                muted   = "#525252",
                pink    = "#FF7EB6",
                purple  = "#BE95FF",
                cyan    = "#3DDBD9",
                green   = "#42BE65",
                yellow  = "#FFD700",
                red     = "#EE5396",
            }

            local theme = {
                normal = {
                    a = { bg = ox.pink,   fg = ox.bg,  gui = "bold" },
                    b = { bg = ox.bg1,    fg = ox.fg },
                    c = { bg = ox.bg,     fg = ox.muted },
                },
                insert = {
                    a = { bg = ox.purple, fg = ox.bg,  gui = "bold" },
                    b = { bg = ox.bg1,    fg = ox.fg },
                },
                visual = {
                    a = { bg = ox.cyan,   fg = ox.bg,  gui = "bold" },
                    b = { bg = ox.bg1,    fg = ox.fg },
                },
                replace = {
                    a = { bg = ox.red,    fg = ox.bg,  gui = "bold" },
                    b = { bg = ox.bg1,    fg = ox.fg },
                },
                command = {
                    a = { bg = ox.green,  fg = ox.bg,  gui = "bold" },
                    b = { bg = ox.bg1,    fg = ox.fg },
                },
                inactive = {
                    a = { bg = ox.bg,     fg = ox.muted },
                    b = { bg = ox.bg,     fg = ox.muted },
                    c = { bg = ox.bg,     fg = ox.muted },
                },
            }

            require("lualine").setup({
                options = {
                    theme            = theme,
                    component_separators = { left = "", right = "" },
                    section_separators  = { left = "", right = "" },
                    globalstatus     = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },

    -- ── Indent guides ────────────────────────────────────────────────
    {
        "lukas-reineke/indent-blankline.nvim",
        event  = { "BufReadPost", "BufNewFile" },
        main   = "ibl",
        config = function()
            require("ibl").setup({
                indent = { char = "│" },
                scope  = { enabled = true },
            })
        end,
    },

    -- ── Auto pairs ───────────────────────────────────────────────────
    {
        "windwp/nvim-autopairs",
        event  = "InsertEnter",
        config = function()
            local autopairs = require("nvim-autopairs")
            autopairs.setup({ check_ts = true })

            -- Hook into nvim-cmp
            local ok, cmp = pcall(require, "cmp")
            if ok then
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end
        end,
    },

    -- ── Git signs ────────────────────────────────────────────────────
    {
        "lewis6991/gitsigns.nvim",
        event  = { "BufReadPost", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add          = { text = "▎" },
                    change       = { text = "▎" },
                    delete       = { text = "" },
                    topdelete    = { text = "" },
                    changedelete = { text = "▎" },
                    untracked    = { text = "▎" },
                },
                on_attach = function(bufnr)
                    local gs  = package.loaded.gitsigns
                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
                    end

                    map("]g", gs.next_hunk,               "Next hunk")
                    map("[g", gs.prev_hunk,               "Prev hunk")
                    map("<leader>gs", gs.stage_hunk,      "Stage hunk")
                    map("<leader>gr", gs.reset_hunk,      "Reset hunk")
                    map("<leader>gp", gs.preview_hunk,    "Preview hunk")
                    map("<leader>gb", gs.blame_line,      "Blame line")
                end,
            })
        end,
    },

    -- ── Icons (used by lualine, telescope etc.) ──────────────────────
    { "nvim-tree/nvim-web-devicons", lazy = true },
}
