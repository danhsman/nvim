-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   plugins/lazygit.lua                                            ║
-- ╚══════════════════════════════════════════════════════════════════╝

return {
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd  = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<CR>",            desc = "LazyGit" },
            { "<leader>gf", "<cmd>LazyGitCurrentFile<CR>", desc = "LazyGit current file" },
            { "<leader>gc", "<cmd>LazyGitConfig<CR>",      desc = "LazyGit config" },
        },
        config = function()
            vim.g.lazygit_floating_window_winblend       = 0
            vim.g.lazygit_floating_window_scaling_factor = 0.9
            vim.g.lazygit_floating_window_border_chars   = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
            vim.g.lazygit_use_neovim_remote              = false
        end,
    },
}
