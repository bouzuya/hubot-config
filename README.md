# hubot-config

A configuration management library for Hubot

## Installation

    $ npm install --save hubot-config

## Usage

```coffeescript
parseConfig = require 'hubot-config'

config = parseConfig 'hello',       # 'hello' is script name ( hubot-hello )
  message: 'world'                  # process.env.HUBOT_HELLO_MESSAGE ? 'world'
  friendlyMessage: null             # process.env.HUBOT_HELLO_FRIENDLY_MESSAGE ? null

module.exports = (robot) ->
  robot.respond /hello/, (msg) ->
    msg.send config.message

  robot.respond /hi/, (msg) ->
    msg.send config.friendlyMessage
```

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]
[![Coverage Status][coveralls-badge]][coveralls]

[travis]: https://travis-ci.org/bouzuya/hubot-config
[travis-badge]: https://travis-ci.org/bouzuya/hubot-config.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-config
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-config.png
[coveralls]: https://coveralls.io/r/bouzuya/hubot-config
[coveralls-badge]: https://img.shields.io/coveralls/bouzuya/hubot-config.svg
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
