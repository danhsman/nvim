-- ╔══════════════════════════════════════════════════════════════════╗
-- ║   plugins/completion.lua                                         ║
-- ╚══════════════════════════════════════════════════════════════════╝

return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp     = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"]     = cmp.mapping.select_prev_item(),
                    ["<C-j>"]     = cmp.mapping.select_next_item(),
                    ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"]     = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"]     = cmp.mapping.abort(),
                    ["<CR>"]      = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"]     = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"]   = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp", priority = 1000 },
                    { name = "luasnip",  priority = 750  },
                    { name = "buffer",   priority = 500  },
                    { name = "path",     priority = 250  },
                }),
                formatting = {
                    format = function(entry, item)
                        local source_names = {
                            nvim_lsp = "[LSP]",
                            luasnip  = "[Snip]",
                            buffer   = "[Buf]",
                            path     = "[Path]",
                        }
                        item.menu = source_names[entry.source.name] or ""
                        return item
                    end,
                },
            })

            -- Define the highlight groups cmp will actually use
            local set = vim.api.nvim_set_hl
            set(0, "CmpNormal",  { fg = "#F2F4F8", bg = "#2e2e2e" })
            set(0, "CmpBorder",  { fg = "#BE95FF", bg = "#2e2e2e" })
            set(0, "CmpSel",     { fg = "#161616", bg = "#FF7EB6", bold = true })
        end,
    },
}
