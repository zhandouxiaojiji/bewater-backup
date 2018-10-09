local skynet = require "skynet"
local conf = {
    workspace = skynet.getenv('workspace'),

    proj = "schedule",
    desc = "定时执行节点(开发服)",
    webconsole = {
        host = "www.kaizhan8.com",
        port = 8890,
    },

    alert = { 
        enable      = true,
        corpid      = 'dingbf0f32a0c5a10f0735c2f4657eb6378f',
        corpsecret  = 'E-69ZUSz-6ZizoXNoOLc0HEdiJ6VZb1AXJ5mGPSgjxDVKeMQ2h6YQfhLvWDxGwa9',
        sender      = 'manager3375',
        chatid      = 'chatc342986381ccae6028a690369580d9d0',
    },

}

return conf
