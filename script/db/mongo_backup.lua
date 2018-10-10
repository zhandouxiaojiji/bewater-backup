local skynet = require "skynet"
local conf = require "conf"

require "bash"

local M = {}
function M.backup(cname, c)
    assert(c.host and c.port and c.name)
    assert(conf.mongodump)
    local cmd = string.format("%s -h %s:%d -d %s -o %s/%s/%s_mongo_%s", 
        conf.mongodump, c.host, c.port, c.name, conf.path, cname, cname, os.date("%Y%m%d-%H%M"))
    print(cmd)
    bash(cmd) 
end

function M.restore(filename)

end

return M
