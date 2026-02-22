local Register = require("core.register") -- 插件注册方法管理
local Syncer = require("core.syncer") -- 插件的增删改
local Locker = require("core.locker") -- 插件信息查询

local action = arg[1]
local pkg = arg[2]

-- TODO: 参数检查
-- 1. 参数数量必须为2才执行后续
-- 2. 数量不对报错并打印帮助信息

-- 检测是否为纳入 packer 管理的包
local spec = Register.get(pkg)
if not spec then
	error("no match meta info in registry")
end

-- 安装
if action == "install" then
	-- 1. 安装
	Syncer.install(spec)
	-- 2. lock 文件
	Locker.add(pkg, spec.source.url)
	-- 3. 结果
	print("Installed:", pkg)

-- 卸载
elseif action == "uninstall" then
	-- 1. lock 文件
	Locker.remove(pkg)
	-- 2. 删除文件与配置
	-- 3. 结果
	print("Removed:", pkg)

-- 更新
elseif action == "update" then
	-- TODO: 更新逻辑
	print("更新成功")

-- 列举
elseif action == "list" then
	Locker.list()

-- default
else
	-- TODO: 打印帮助信息
end
