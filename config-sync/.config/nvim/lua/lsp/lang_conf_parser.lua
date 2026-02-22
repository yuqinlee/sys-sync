local raw = require("lsp.lang_conf").languages

local Registry = {}

------------------------------------------------
-- 基础访问
------------------------------------------------

function Registry.all()
    return raw
end

function Registry.get(lang)
    return raw[lang]
end

function Registry.enabled()
    local result = {}
    for name, conf in pairs(raw) do
        result[name] = conf
    end
    return result
end

------------------------------------------------
-- LSP 相关（新版结构）
------------------------------------------------

function Registry.lsp_servers()
    local result = {}

    for _, conf in pairs(raw) do
        if conf.lsp then
            for name, lsp_conf in pairs(conf.lsp) do
                if lsp_conf.enable then
                    table.insert(result, name)
                end
            end
        end
    end

    return result
end

function Registry.lsp_opts()
    local result = {}

    for _, conf in pairs(raw) do
        if conf.lsp then
            for name, lsp_conf in pairs(conf.lsp) do
                if lsp_conf.enable then
                    result[name] = lsp_conf.opts or {}
                end
            end
        end
    end

    return result
end

------------------------------------------------
-- Mason 需要安装的 LSP
------------------------------------------------

function Registry.mason_lsp()
    local result = {}

    for _, conf in pairs(raw) do
        if conf.lsp then
            for name, lsp_conf in pairs(conf.lsp) do
                if lsp_conf.enable and lsp_conf.mason then
                    table.insert(result, name)
                end
            end
        end
    end

    return result
end

------------------------------------------------
-- Mason 需要安装的其他工具（formatter / lint）
------------------------------------------------

function Registry.mason_tools()
    local result = {}

    for _, conf in pairs(raw) do
        -- formatter
        if conf.formatter then
            for name, fmt_conf in pairs(conf.formatter) do
                if fmt_conf.enable and fmt_conf.mason then
                    table.insert(result, name)
                end
            end
        end

        -- lint
        if conf.lint then
            for name, lint_conf in pairs(conf.lint) do
                if lint_conf.enable and lint_conf.mason then
                    table.insert(result, name)
                end
            end
        end
    end

    return result
end

------------------------------------------------
-- Conform 解析（新版结构）
------------------------------------------------

function Registry.formatters_by_ft()
    local result = {}

    for _, conf in pairs(raw) do
        if conf.formatter and conf.meta and conf.meta.ft then
            for _, fmt_conf in pairs(conf.formatter) do
                if
                    fmt_conf.enable
                    and fmt_conf.opts
                    and fmt_conf.opts.conform
                    and fmt_conf.opts.conform.formatters_by_ft
                then
                    for _, ft in ipairs(conf.meta.ft) do
                        result[ft] = result[ft] or {}
                        for _, formatter_name in ipairs(fmt_conf.opts.conform.formatters_by_ft) do
                            table.insert(result[ft], formatter_name)
                        end
                    end
                end
            end
        end
    end

    return result
end

function Registry.formatters()
    local result = {}

    for _, conf in pairs(raw) do
        if conf.formatter then
            for _, fmt_conf in pairs(conf.formater or conf.formatter) do
                if fmt_conf.enable and fmt_conf.opts and fmt_conf.opts.conform and fmt_conf.opts.conform.formatters then
                    for name, formatter in pairs(fmt_conf.opts.conform.formatters) do
                        -- 避免重复注册
                        if result[name] then
                            result[name] = vim.tbl_deep_extend("force", result[name], formatter)
                        else
                            result[name] = formatter
                        end
                    end
                end
            end
        end
    end

    return result
end
function Registry.lsp_fallback_ft()
    local result = {}

    for _, conf in pairs(raw) do
        if conf.formatter and conf.meta and conf.meta.ft then
            for _, fmt_conf in pairs(conf.formatter) do
                if
                    fmt_conf.enable
                    and fmt_conf.opts
                    and fmt_conf.opts.conform
                    and fmt_conf.opts.conform.lsp_fallback
                then
                    for _, ft in ipairs(conf.meta.ft) do
                        result[ft] = true
                    end
                end
            end
        end
    end

    return result
end

------------------------------------------------
-- Treesitter
------------------------------------------------

function Registry.treesitter_ensure()
    local result = {}

    for _, conf in pairs(raw) do
        if conf.treesitter and conf.treesitter.enable then
            local ensure = conf.treesitter.ensure_installed
            if type(ensure) == "table" then
                for _, lang in ipairs(ensure) do
                    table.insert(result, lang)
                end
            end
        end
    end

    return result
end

------------------------------------------------
-- 生成 nvim-lint 所需 linters_by_ft
------------------------------------------------
function Registry.nvim_lint_linters_by_ft()
    local result = {}

    for _, lang in pairs(raw) do
        local lint = lang.lint
        local fts = lang.meta and lang.meta.ft

        if lint and fts then
            for linter_name, linter_conf in pairs(lint) do
                -- 必须 enable
                -- 必须存在 opts.nvim_lint
                if linter_conf.enable and linter_conf.opts and linter_conf.opts.nvim_lint then
                    for _, ft in ipairs(fts) do
                        result[ft] = result[ft] or {}
                        table.insert(result[ft], linter_name)
                    end
                end
            end
        end
    end

    return result
end

return Registry
