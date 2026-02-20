local raw = require("config.lan_enhance").languages

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

function Registry.lsp_settings()
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
            for tool_name, fmt_conf in pairs(conf.formatter) do
                if fmt_conf.enable and fmt_conf.opts and fmt_conf.opts.conform and fmt_conf.opts.conform.fmt_ft then
                    for _, ft in ipairs(conf.meta.ft) do
                        result[ft] = result[ft] or {}
                        for _, formatter_name in ipairs(fmt_conf.opts.conform.fmt_ft) do
                            table.insert(result[ft], formatter_name)
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
            table.insert(result, conf.treesitter.ensure_installed)
        end
    end

    return result
end

return Registry
