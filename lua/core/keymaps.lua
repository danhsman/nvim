-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   core/keymaps.lua                                               ║
-- ╚══════════════════════════════════════════════════════════════════╝

local map = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- ── General ────────────────────────────────────────────────────────
map("n", "<Esc>",        "<cmd>nohlsearch<CR>",         { desc = "Clear search highlight" })
map("n", "<leader>w",    "<cmd>w<CR>",                  { desc = "Save" })
map("n", "<leader>q",    "<cmd>q<CR>",                  { desc = "Quit" })
map("n", "<leader>x",    "<cmd>x<CR>",                  { desc = "Save and quit" })

-- ── Navigation ─────────────────────────────────────────────────────
map("n", "<C-h>",        "<C-w>h",                      { desc = "Move to left window" })
map("n", "<C-j>",        "<C-w>j",                      { desc = "Move to below window" })
map("n", "<C-k>",        "<C-w>k",                      { desc = "Move to above window" })
map("n", "<C-l>",        "<C-w>l",                      { desc = "Move to right window" })

-- ── Buffers ────────────────────────────────────────────────────────
map("n", "<S-h>",        "<cmd>bprevious<CR>",          { desc = "Previous buffer" })
map("n", "<S-l>",        "<cmd>bnext<CR>",              { desc = "Next buffer" })
map("n", "<leader>bd",   "<cmd>bdelete<CR>",            { desc = "Delete buffer" })

-- ── Splits ─────────────────────────────────────────────────────────
map("n", "<leader>sv",   "<cmd>vsplit<CR>",             { desc = "Vertical split" })
map("n", "<leader>sh",   "<cmd>split<CR>",              { desc = "Horizontal split" })
map("n", "<leader>se",   "<C-w>=",                      { desc = "Equalise splits" })
map("n", "<leader>sc",   "<cmd>close<CR>",              { desc = "Close split" })

-- ── Move lines ─────────────────────────────────────────────────────
map("v", "J",            ":m '>+1<CR>gv=gv",           { desc = "Move selection down" })
map("v", "K",            ":m '<-2<CR>gv=gv",           { desc = "Move selection up" })

-- ── Better indenting ───────────────────────────────────────────────
map("v", "<",            "<gv",                         { desc = "Indent left" })
map("v", ">",            ">gv",                         { desc = "Indent right" })

-- ── LSP (set in lsp.lua on_attach, kept here for reference) ────────
-- <leader>gd  → go to definition
-- <leader>gr  → references
-- <leader>rn  → rename
-- <leader>ca  → code action
-- K           → hover docs

-- ── Telescope ──────────────────────────────────────────────────────
map("n", "<leader>ff",   "<cmd>Telescope find_files<CR>",   { desc = "Find files" })
map("n", "<leader>fg",   "<cmd>Telescope live_grep<CR>",    { desc = "Live grep" })
map("n", "<leader>fb",   "<cmd>Telescope buffers<CR>",      { desc = "Buffers" })
map("n", "<leader>fh",   "<cmd>Telescope help_tags<CR>",    { desc = "Help tags" })
map("n", "<leader>fr",   "<cmd>Telescope oldfiles<CR>",     { desc = "Recent files" })
map("n", "<leader>fd",   "<cmd>Telescope diagnostics<CR>",  { desc = "Diagnostics" })
