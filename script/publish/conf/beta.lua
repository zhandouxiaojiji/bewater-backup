local util = require "util"
local conf = require "conf"
conf = util.clone(conf)
conf.desc = "备份节点(测试服)"
conf.remote_host = "localhost"
conf.remote_port = 22
conf.remote_path = "/home/huangjx/test_server/backup"
conf.etcname = "backupd"
conf.clustername = "backup"
conf.webconsole = {
    host = "game.kaizhan8.com",
    port = 8790,
}
conf.alert.enable = true
conf.schedule = {
    animal = {   
        mongo = {
            host = "127.0.0.1",
            port = 19999,
            name = "test_wx",
        },
        redis = {
            host = "127.0.0.1",
            port = 19999, 
        },
        date = {hour = 0, min = 0},
    },
    test = {   
        mongo = {
            host = "127.0.0.1",
            port = 19999,
            name = "test_backup",
        },
        redis = {
            host = "127.0.0.1",
            port = 19998, 
        },
        mysql = {
            host = "127.0.0.1",
            port = 3306,
            name = "test",
        },
        date = {hour = 0, min = 0},
    },

}
conf.mongodump      = "/home/huangjx/mongo/bin/mongodump"
conf.mongorestore   = "/home/huangjx/mongo/bin/mongorestore"
conf.mysqldump      = "/usr/bin/mysqldump"
conf.mysql          = "/usr/bin/mysql"
conf.redis_cli      = "/home/huangjx/redis/bin/redis-cli"
conf.redis_data     = "/home/huangjx/redis/data"
conf.path           = "/home/huangjx/backup"

return conf
