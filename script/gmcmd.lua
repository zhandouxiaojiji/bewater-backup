local skynet        = require "skynet"
local mongo_backup  = require "db.mongo_backup"
local redis_backup  = require "db.redis_backup"
local mysql_backup  = require "db.mysql_backup"

local log       = require "log"
local print     = log.print("gm")
local trace     = log.print("gm")

local M = {}
function M.test()
    print("gm test") 
    return "test"
end

local function to_option(...)
    return table.concat({...}, ' ')
end

function M.mongo(cmd, cname, ...)
    if not cname then
        return "请输入配置名"
    end
    if cmd == "dump" then
        mongo_backup.dump(cname, to_option(...))
    elseif cmd == "restore" then
        mongo_backup.restore(cname, to_option(...))
    else
        return cmd.."命令不存在"
    end
end

function M.mysql(cmd, cname, ...)
    if not cname then
        return "请输入配置名"
    end
    if cmd == "dump" then
        mysql_backup.dump(cname, to_option(...))
    elseif cmd == "restore" then
        mysql_backup.restore(cname, to_option(...))
    else
        return cmd.."命令不存在"
    end
end

function M.redis(cmd, cname, ...)
    if not cname then
        return "请输入配置名"
    end
    if cmd == "dump" then
        redis_backup.dump(cname, to_option(...))
    elseif cmd == "restore" then
        return "redis需要手动恢复"
    else
        return cmd.."命令不存在"
    end
end


return M
