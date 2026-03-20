-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   core/options.lua                                               ║
-- ╚══════════════════════════════════════════════════════════════════╝

local opt = vim.opt

-- UI
opt.number         = true
opt.laststatus = 3        -- global statusline (you likely have this already)
opt.fillchars  = vim.opt.fillchars + { horiz = "─", horizup = "┴", horizdown = "┬", vert = "│", vertleft = "┤", vertright = "├", verthoriz = "┼" }
opt.relativenumber = true
opt.signcolumn     = "yes"
opt.cursorline     = true
opt.scrolloff      = 8
opt.sidescrolloff  = 8
opt.termguicolors  = true
opt.showmode       = false        -- lualine handles this
opt.cmdheight      = 1
opt.pumheight      = 10           -- max completion menu items

-- Indentation
opt.expandtab      = true
opt.shiftwidth     = 4
opt.tabstop        = 4
opt.softtabstop    = 4
opt.smartindent    = true
opt.breakindent    = true

-- Search
opt.hlsearch       = true
opt.incsearch      = true
opt.ignorecase     = true
opt.smartcase      = true

-- Splits
opt.splitbelow     = true
opt.splitright     = true

-- Files
opt.undofile       = true
opt.swapfile       = false
opt.backup         = false
opt.updatetime     = 250
opt.timeoutlen     = 300

-- Misc
opt.mouse          = "a"
opt.clipboard      = "unnamedplus"
opt.wrap           = false
opt.list           = true
opt.listchars      = { tab = "» ", trail = "·", nbsp = "␣" }
opt.conceallevel   = 0
