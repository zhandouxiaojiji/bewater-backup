local skynet = require "skynet"
local conf = require "conf"
require "bash"

local M = {}
function M.dump(cname)
    local c = conf.schedule[cname].redis
    assert(c.host and c.port)
    assert(conf.redis_cli and conf.redis_data)
    local cmd = string.format("%s -h %s -p %s save", conf.redis_cli, c.host, c.port)
    skynet.error(cmd)
    bash(cmd)
    bash("mkdir -p %s/%s/redis", conf.path, cname)
    bash("cp %s/dump.rdb %s/%s/redis/%s_%s", 
        conf.redis_data, conf.path, cname, cname, os.date("%Y%m%d_%H%M"))
end

function M.restore(filename)
    -- todo 需要手动操作
end

return M
