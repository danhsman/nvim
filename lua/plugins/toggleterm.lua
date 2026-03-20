-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   plugins/toggleterm.lua                                         ║
-- ╚══════════════════════════════════════════════════════════════════╝

return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
       keys = { [[<C-\>]] },
       config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping     = [[<C-\>]],
                hide_numbers     = true,
                shade_terminals  = false,
                start_insert     = true,
                insert_mode_mapping = true,
                persist_size     = true,
                direction        = "horizontal",  -- or "vertical" / "float"
                close_on_exit    = true,
                shell            = vim.o.shell,
                float_opts = {
                    border   = "rounded",
                    winblend = 0,
                },
            })

            -- Easy escape from terminal mode
            vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

            -- Multiple terminals with <leader>t1, <leader>t2 etc.
            local map = function(lhs, rhs, desc)
                vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
            end

            map("<leader>t1", "<cmd>1ToggleTerm<CR>", "Terminal 1")
            map("<leader>t2", "<cmd>2ToggleTerm<CR>", "Terminal 2")
            map("<leader>t3", "<cmd>3ToggleTerm<CR>", "Terminal 3")
            map("<leader>tf", "<cmd>ToggleTerm direction=float<CR>",      "Float terminal")
            map("<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>",   "Vertical terminal")
            map("<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal terminal")
        end,
    },
}
