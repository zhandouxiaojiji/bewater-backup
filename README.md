# 配置范例
```
local conf = {
    schedule = {
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
                name = "test_backup",
            },
        },
        date = {hour = 0, min = 0}, -- 定时备份，参考common的schedule日程表
    },
    mongodump       = "/usr/bin/mongo/bin/mongodump",
    mongorestore    = "/usr/bin/mongo/bin/mongorestore",
    mysql           = "/usr/bin/mysql",
    mysqldump       = "/usr/bin/mysqldump",
    redis_cli       = "/usr/redis/bin/redis-cli",
    redis_data      = "/usr/redis/bin/redis-cli",

    path = "/home/backup",
}
```
# GM指令
backup [数据库类型] dump [配置名]
backup [数据库类型] restore [备份文件名]

