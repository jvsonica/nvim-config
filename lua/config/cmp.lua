-- Setup nvim-cmp.
local cmp = require("cmp")
-- local lspkind = require("lspkind")

cmp.setup({
    formatting = {},
    snippet = {},
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- TODO: what is this
        ["<C-u>"] = cmp.mapping.scroll_docs(4), -- TODO: what is this
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer", keyword_length = 5 },
        { name = "luasnip" }, -- TODO: what is this
        { name = "calc" }, -- TODO: what is this
        { name = "path" }, -- TODO: what is this
        { name = "rg", keyword_length = 5 }, -- TODO: what is this
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
            { name = "cmdline" },
        }),
})

