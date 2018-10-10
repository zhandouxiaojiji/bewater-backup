local skynet        = require "skynet"
local mongo         = require "skynet.db.mongo"
local redis         = require "skynet.db.redis"
local mysql         = require "skynet.db.mysql"
local mongo_backup  = require "db.mongo_backup"
local redis_backup  = require "db.redis_backup"
local mysql_backup  = require "db.mysql_backup"

local conf = require "conf"

function test_mongo()
    print("test_mongo")
    local c = conf.schedule.test.mongo
    local db = mongo.client({host = c.host, port = c.port})
    db[c.name].testdb:drop()
    db[c.name].testdb:safe_insert({test_key = "aa", test_value = 2})
end

function test_dump_mongo()
    print("test_dump_mongo")
    mongo_backup.dump("test")
end

function test_restore_mongo()
    print("test_restore_mongo")
    mongo_backup.restore('test_mongo_20181010_1432', '--drop')
end

function test_mysql()
    print("test_mysql")
end

function test_dump_mysql()
    print("test_dump_mysql")
    mysql_backup.dump("test")
end

function test_restore_mysql()
    print("test_restore_mysql")
    mysql_backup.restore("test_20181010_1638")
end

function test_dump_redis()
    print("test_dump_redis")
    redis_backup.dump("test")
end

skynet.start(function()
    --test_mongo()
    test_dump_mongo()
    --test_restore_mongo()
     
    test_dump_mysql()
    --test_restore_mysql()
    
    test_dump_redis()
end)
