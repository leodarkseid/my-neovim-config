local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        python = { "prettierd", "prettier" },
        go = { "gofmt", "gofumpt", "goimports_reviser", "golines" },
        proto = { "buf" },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        bash = { "beautysh" },
        -- html = { "htmlbeautifier" },
        css = { "prettierd", "prettier" },
        sh = { "shellcheck" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
