local util = require "util"
local conf = require "conf"
conf = util.clone(conf)
conf.remote_host = "zhong@dev.zhongfq.com"
conf.remote_port = 22
conf.remote_path = "/mnt/dev/home/zhong/server/share"
conf.etcname = "shared"
conf.clustername = "share"
conf.cluster = {
    monitor = "127.0.0.1:19900",
    share   = "127.0.0.1:19901",
}
conf.mongo = {
    host = "127.0.0.1",
    name = "test",
    port = 19999,
}
conf.redis = {
    host = "127.0.0.1",
    port = 19998,
}
conf.webconsole = {
    host = "dev.zhongfq.com",
    port = 9998,
}
conf.alert.enable = true
return conf
