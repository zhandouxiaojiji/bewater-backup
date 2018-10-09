local skynet    = require "skynet"
local schedule  = require "schedule"
local conf      = require "conf"

skynet.start(function()
    print("start")

    -- 后台服务
    local c = skynet.newservice("ws/watchdog", "webconsole.webconsole", "webconsole.player_t")
    skynet.call(c, "lua", "start", {
        port = conf.webconsole.port,
        preload = 1,
    })

end)
