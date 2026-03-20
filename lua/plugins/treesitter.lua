-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   plugins/treesitter.lua                                         ║
-- ╚══════════════════════════════════════════════════════════════════╝

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy  = false,
        opts  = {
            ensure_installed = {
                "c", "cpp", "python", "zig",
                "lua", "vim", "vimdoc",
                "bash", "json", "toml", "yaml", "markdown",
            },
            auto_install = true,
            highlight    = { enable = true },
            indent       = { enable = true },
        },
        config = function(_, opts)
            -- newer nvim-treesitter versions expose setup() directly
            local ts = require("nvim-treesitter")
            if ts.setup then
                ts.setup(opts)
            else
                -- fallback for versions that still have configs module
                require("nvim-treesitter.configs").setup(opts)
            end
        end,
    },
}
