-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   plugins/lsp.lua                                                ║
-- ╚══════════════════════════════════════════════════════════════════╝

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- ── Mason setup ──────────────────────────────────────────
            require("mason").setup({
                ui = { border = "rounded" },
            })

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",    -- C/C++
                    "zls",       -- Zig
                },
                automatic_installation = true,
            })

            -- ── Capabilities (extended by nvim-cmp) ──────────────────
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
            if ok then
                capabilities = cmp_lsp.default_capabilities(capabilities)
            end

            -- ── Server configs (new vim.lsp.config API) ──────────────
            vim.lsp.config("clangd",  { capabilities = capabilities })
            vim.lsp.config("zls",     { capabilities = capabilities })

            vim.lsp.enable({ "clangd", "zls" })

            -- ── On attach keymaps ────────────────────────────────────
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
                callback = function(event)
                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = event.buf, silent = true, desc = desc })
                    end

                    map("gd",         vim.lsp.buf.definition,      "Go to definition")
                    map("gD",         vim.lsp.buf.declaration,      "Go to declaration")
                    map("gr",         vim.lsp.buf.references,       "References")
                    map("gi",         vim.lsp.buf.implementation,   "Go to implementation")
                    map("K",          vim.lsp.buf.hover,            "Hover docs")
                    map("<leader>rn", vim.lsp.buf.rename,           "Rename symbol")
                    map("<leader>ca", vim.lsp.buf.code_action,      "Code action")
                    map("<leader>D",  vim.lsp.buf.type_definition,  "Type definition")
                    map("[d",         vim.diagnostic.goto_prev,     "Prev diagnostic")
                    map("]d",         vim.diagnostic.goto_next,     "Next diagnostic")
                    map("<leader>e",  vim.diagnostic.open_float,    "Show diagnostic")
                end,
            })

            -- ── Diagnostics UI ───────────────────────────────────────
            vim.diagnostic.config({
                virtual_text     = { prefix = "●" },
                signs            = true,
                underline        = true,
                update_in_insert = false,
                severity_sort    = true,
                float            = { border = "rounded", source = "always" },
            })

            vim.lsp.handlers["textDocument/hover"] =
                vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
        end,
    },
}
