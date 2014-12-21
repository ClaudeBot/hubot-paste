# Description
#   Universal Paste API (Dpaste.com and Pastebin.com)
#
# Configuration:
#   
#
# Commands:
#   hubot dpaste <content> - Creates a new paste with <content> on Dpaste.com
#   hubot pastebin <content> - Creates a new paste with <content> on Pastebin.com
#
# Author:
#   MrSaints

PASTEBIN_API_KEY = process.env.PASTEBIN_API_KEY

DPASTE_API_URL = "http://dpaste.com/api/v2/"
PASTEBIN_API_URL = "http://pastebin.com/api/api_post.php"
SERVER_ERROR = "We are unable to process your request at this time due to a server error. Please try again later."

class Paste
    constructor: (@msg) ->

    create: (err, link) ->
        if err
            @msg.reply SERVER_ERROR
            return @msg.robot.logger.error err
        @msg.reply link

class Dpaste extends Paste
    create: (text, expire = 1) ->
        data = "content=#{encodeURI(text)}&expiry_days=#{expire}"
        data += "&poster=#{robot.name}&title=Generated%20by%20ClaudeBot%27s%20hubot-paste"

        @msg.http(DPASTE_API_URL)
            .header("content-type", "application/x-www-form-urlencoded")
            .post(data) (err, res, body) =>
                @msg.robot.logger.debug res.headers
                super err, res.headers.location

class Pastebin extends Paste
    create: (text, expire = "1D") ->
        data = "api_dev_key=#{encodeURI(PASTEBIN_API_KEY)}&api_option=paste"
        data += "&api_paste_code=#{encodeURI(text)}&api_paste_expire_date=#{expire}"
        data += "&api_paste_name=Generated%20by%20ClaudeBot%27s%20hubot-paste"

        @msg.http(PASTEBIN_API_URL)
            .header("content-type", "application/x-www-form-urlencoded")
            .post(data) (err, res, body) =>
                @msg.robot.logger.debug res.headers
                super err, body

module.exports = (robot) ->
    robot.respond /dpaste (.+)/i, (msg) ->
        service = new Dpaste msg
        service.create msg.match[1]

    if PASTEBIN_API_KEY?
        robot.respond /pastebin (.+)/i, (msg) ->
            service = new Pastebin msg
            service.create msg.match[1]
