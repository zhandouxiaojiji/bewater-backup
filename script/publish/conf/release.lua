local util = require "util"
local conf = require "conf"
conf = util.clone(conf)
conf.desc = "备份节点(正式服)"
conf.remote_host = "game@server.kaizhan8.com"
conf.remote_port = 8222
conf.remote_path = "/home/game/server/backup"
conf.etcname = "backupd"
conf.clustername = "backup"
conf.webconsole = {
    host = "server.kaizhan8.com",
    port = 8790,
}
conf.alert.enable = true
conf.schedule = {
    animal = {   
        mongo = {
            host = "127.0.0.1",
            port = 28020,
            name = "animal",
        },
        date = {hour = 0, min = 0},
    },
}
conf.mongodump      = "/usr/local/mongodb/bin/mongodump"
conf.mongorestore   = "/usr/local/mongodb/bin/mongorestore"
conf.path           = "/home/game/backup"

return conf
