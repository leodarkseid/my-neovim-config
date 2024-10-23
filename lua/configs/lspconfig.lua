-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
-- require("lspconfig").eslint.setup({
--     settings = {
--         packageManager = "yarn",
--     },
--     on_attach = function(client, bufnr)
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = bufnr,
--             command = "EslintFixAll",
--         })
--     end,
-- })
local lspconfig = require("lspconfig")

-- EXAMPLE
lspconfig.servers = {
    "html",
    "cssls",
    "ts_ls",
    "gopls",
    "docker_compose_language_service",
    -- "protols",
    "prismals",
    "pyright",
}
local nvlsp = require("nvchad.configs.lspconfig")
local def_servers = { "lua_ls" }
-- lsps with default config
for _, lsp in ipairs(def_servers) do
    lspconfig[lsp].setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })
end

lspconfig.pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "W391" },
                    maxLineLength = 100,
                },
            },
        },
    },
})

local util = require("lspconfig/util")

lspconfig.gopls.setup({
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
})
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
