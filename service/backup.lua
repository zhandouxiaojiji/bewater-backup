local skynet    = require "skynet"
local schedule  = require "schedule"
local util      = require "util"
local conf      = require "conf"
local gm        = require "gm"

local mongo_backup  = require "db.mongo_backup"
local redis_backup  = require "db.redis_backup"
local mysql_backup  = require "db.mysql_backup"

local log       = require "log"
local trace     = log.trace("backup")

local function fork(cname)
    local c = conf.schedule[cname]
    local date = conf.schedule[cname].date
    assert(type(date) == "table")
    skynet.fork(function()
        while true do
            schedule.submit(date) 
            print("do backup")
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
