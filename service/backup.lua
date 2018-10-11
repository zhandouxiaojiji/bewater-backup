local skynet    = require "skynet"
local schedule  = require "schedule"
local conf      = require "conf"
local gm        = require "gm"
local log       = require "log"

local trace     = log.trace("backup")

local function fork(cname)
    local c = conf.schedule[cname].mongo
    assert(type(c.date) == "table")
    skynet.fork(function()
        while true do
            schedule.submit(c.date) 
            if c.mongo then
                trace("backup mongo")
                mongo_backup.dump(cname)
            end
            if c.redis then
                trace("backup redis")
                redis_backup.dump(cname)
            end
            if c.mysql then
                trace("backup mysql")
                mysql_backup.dump(cname)
            end
            skynet.sleep(100)
        end
    end)
end

local function init()
    assert(conf.schedule)
    for k, v in pairs(conf.schedule) do
        fork(k)
    end
end

skynet.start(function()
    trace("start")

    -- 后台服务
    local c = skynet.newservice("ws/watchdog", "webconsole.webconsole", "webconsole.player_t")
    skynet.call(c, "lua", "start", {
        port    = conf.webconsole.port,
        preload = 1,
    })

    gm.add_gmcmd("backup", "gmcmd")

    init()
end)
