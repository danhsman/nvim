-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   core/autocmds.lua                                              ║
-- ╚══════════════════════════════════════════════════════════════════╝

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    group = augroup("TrimWhitespace", { clear = true }),
    pattern = "*",
    callback = function()
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, pos)
    end,
})

-- Resize splits when window is resized
autocmd("VimResized", {
    group = augroup("ResizeSplits", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Set 2-space indent for lua
autocmd("FileType", {
    group = augroup("LuaIndent", { clear = true }),
    pattern = "lua",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop    = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- Close these filetypes with just q
autocmd("FileType", {
    group = augroup("QuickClose", { clear = true }),
    pattern = { "help", "man", "qf", "checkhealth", "lspinfo" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
    end,
})
