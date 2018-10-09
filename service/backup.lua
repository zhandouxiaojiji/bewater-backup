local skynet    = require "skynet"
local schedule  = require "schedule"
local conf      = require "conf"
local gm        = require "gm"
local log       = require "log"

local trace     = log.trace("backup")

local function fork(c)
    assert(type(c.date) == "table")
    skynet.fork(function()
        while true do
            schedule.submit(c.date) 
            if c.mongo then
                trace("backup mongo")
            end
            if c.redis then
                trace("backup redis")
            end
            if c.mysql then
                trace("backup mysql")
            end
            skynet.sleep(100)
        end
    end)

end

local function init()
    assert(conf.schedule)
    for k, v in pairs(conf.schedule) do
        fork(v)
    end
end

skynet.start(function()
    print("start")

    -- 后台服务
    local c = skynet.newservice("ws/watchdog", "webconsole.webconsole", "webconsole.player_t")
    skynet.call(c, "lua", "start", {
        port = conf.webconsole.port,
        preload = 1,
    })

    gm.add_gmcmd("backup", "gmcmd")

    init()
end)
