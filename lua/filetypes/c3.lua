-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   filetypes/c3.lua  —  C3 language filetype & LSP setup          ║
-- ╚══════════════════════════════════════════════════════════════════╝

-- Filetype detection
vim.filetype.add({
    extension = {
        c3  = "c3",
        c3l = "c3",
    },
})

-- Devicon (if nvim-web-devicons is installed)
local ok, devicons = pcall(require, "nvim-web-devicons")
if ok then
    devicons.set_icon({
        c3 = {
            icon  = "",   -- C-like nerd font icon
            color = "#EE5396",
            name  = "C3",
        },
    })
end

-- LSP registration (called after lspconfig loads)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c3",
    once    = true,
    callback = function()
        vim.lsp.config("c3_lsp", {
            cmd            = { "c3lsp" },
            filetypes      = { "c3" },
            root_dir       = vim.fs.root(0, { ".git", "project.json" }),
            single_file_support = true,
        })
        vim.lsp.enable("c3_lsp")
    end,
})
