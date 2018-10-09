local util = require "util"
local conf = require "conf"
conf = util.clone(conf)
conf.desc = "共享数据中心"
conf.remote_host = "game@server.kaizhan8.com"
conf.remote_port = 8222
conf.remote_path = "/home/game/server/share"
conf.etcname = "shared"
conf.webconsole.host = "server.kaizhan8.com"
conf.clustername = "share"
conf.cluster = { 
    monitor = "127.0.0.1:19900",
    share   = "127.0.0.1:19901",
}
conf.mongo = { 
    host = "127.0.0.1",
    name = "test",
    port = 28017,
}
conf.redis = { 
    host = "127.0.0.1",
    port = 6379,
}
conf.webconsole = { 
    host = "server.kaizhan8.com",
    port = 9998,
}
conf.alert.enable = true
return conf
