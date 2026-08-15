-- 语言配置的类型定义（LuaCATS），供 lua_ls 做结构校验
-- 约定：一个模块描述一种语言（meta.ft 可包含其变体），formatters_by_ft 一律使用列表式

---@class LangMeta
---@field name string
---@field ft string[]

---@class LangLspEntry
---@field enable boolean
---@field mason boolean
---@field opts? table<string, any>

---@class LangConform
---@field formatters_by_ft? string[]
---@field formatters? table<string, { command: string, args?: string[], stdin?: boolean }>
---@field lsp_fallback? boolean

---@class LangFormatterEntry
---@field enable boolean
---@field mason boolean
---@field opts? { conform?: LangConform }

---@class LangLintEntry
---@field enable boolean
---@field mason boolean
---@field opts? { nvim_lint?: { cmd?: string[] } }

---@class LangTreesitter
---@field enable boolean
---@field ensure_installed? string[]

---@class LangConf
---@field meta LangMeta
---@field lsp? table<string, LangLspEntry>
---@field formatter? table<string, LangFormatterEntry>
---@field lint? table<string, LangLintEntry>
---@field dap? table
---@field treesitter? LangTreesitter

return {}
