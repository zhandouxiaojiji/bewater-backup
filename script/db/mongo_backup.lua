local skynet = require "skynet"
local conf = require "conf"

require "bash"

local M = {}
function M.backup(cname)
    local c = conf.schedule[cname].mongo
    assert(c.host and c.port and c.name)
    assert(conf.mongodump)
    local cmd = string.format("%s -h %s:%d -d %s -o %s/%s/%s_mongo_%s", 
        conf.mongodump, c.host, c.port, c.name, conf.path, cname, cname, os.date("%Y%m%d_%H%M"))
    print(cmd)
    bash(cmd) 
end

function M.restore(dirname, option)
    local cname = string.match(dirname, "[^_]+")
    local c = conf.schedule[cname].mongo
    local cmd = string.format("%s -h %s:%d %s -d %s %s/%s/%s/%s", 
        conf.mongorestore, c.host, c.port, option or "", c.name, conf.path, cname, dirname, c.name)
    print(cmd)
    bash(cmd)
end

return M
