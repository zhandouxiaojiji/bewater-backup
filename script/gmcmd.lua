local skynet    = require "skynet"
local log       = require "log"

local print     = log.print("gm")
local trace     = log.print("gm")

local M = {}
function M.test()
    print("gm test") 
    return "test"
end

return M
