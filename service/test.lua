local skynet        = require "skynet"
local mongo         = require "skynet.db.mongo"
local redis         = require "skynet.db.redis"
local mysql         = require "skynet.db.mysql"
local mongo_backup  = require "db.mongo_backup"
local redis_backup  = require "db.redis_backup"
local mysql_backup  = require "db.mysql_backup"

local conf = require "conf"

function test_mongo(c)
    print("test_mongo")
    local db = mongo.client({host = c.host, port = c.port})
    db[c.name].testdb:drop()
    db[c.name].testdb:safe_insert({test_key = 1})
end

function test_backup_mongo(c)
    print("test_backup_mongo")
    mongo_backup.backup("test", c)
end

function test_restore_mongo(c)
    print("test_restore_mongo")
    mongo_backup.restore(c)
end

skynet.start(function()
    local c = {
        host = "127.0.0.1",
        port = 19999,
        name = "test_backup",
    }
    test_mongo(c)
    test_backup_mongo(c)

end)
