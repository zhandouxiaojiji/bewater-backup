local conf = require "conf"
require "bash"

local M = {}
function M.dump(cname)
    local c = conf.schedule[cname].mysql
    assert(c.host and c.port and c.name)
    assert(conf.mysqldump)
    local path = string.format("%s/mysql/%s", conf.path, cname)
    bash("mkdir -p %s", path)
    local cmd = string.format("%s -h %s -P %d -t %s %s %s > %s/%s_%s.bk", 
        conf.mysqldump, c.host, c.port, c.user and "-u "..c.user or "", c.password and "-p "..c.password or "", 
        c.name, path, cname, os.date("%Y%m%d_%H%M"))
    print(cmd)
    bash(cmd)
end

function M.restore(filename, option)
    local cname = string.match(dirname, "[^_]+")
    local c = conf.schedule[cname].mysql
    local cmd = string.format("%s -h %s:%d %s %s %s -d %s %s/mysql/%s/%s/%s", 
        conf.mongorestore, c.host, c.port, c.user and "-u"..c.user or "", c.password and "-p"..c.password or "", 
        option or "", c.name, conf.path, cname, dirname, c.name)
    print(cmd)
    --bash(cmd)

end

return M

