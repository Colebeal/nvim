local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities())


lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    lsp.default_keymaps({ buffer = bufnr })
end)

-- Setup mason and mason-lspconfig

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'tailwindcss', 'html', 'eslint', 'somesass_ls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.1" },
                        diagnostics = {
                            globals = { "vim", "it", "describe", "before_each", "after_each" },
                        }
                    }
                }
            }
        end,
    },
})


-- Setup cmp

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup()
