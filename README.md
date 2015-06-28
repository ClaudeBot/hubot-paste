# hubot-paste

[![Build Status](https://travis-ci.org/ClaudeBot/hubot-paste.svg)](https://travis-ci.org/ClaudeBot/hubot-paste)
[![devDependency Status](https://david-dm.org/ClaudeBot/hubot-paste/dev-status.svg)](https://david-dm.org/ClaudeBot/hubot-paste#info=devDependencies)

A Hubot script for creating a new paste on several online services: [Dpaste.com][dpaste] and [Pastebin.com][pastebin].

See [`src/paste.coffee`](src/paste.coffee) for full documentation.


## Installation via NPM

1. Install the __hubot-paste__ module as a Hubot dependency by running:

    ```
    npm install --save hubot-paste
    ```

2. Enable the module by adding the __hubot-paste__ entry to your `external-scripts.json` file:

    ```json
    [
        "hubot-paste"
    ]
    ```

3. Run your bot and see below for available config / commands


## Configuration

Variable | Default | Description
--- | --- | ---
`PASTEBIN_API_KEY` | N/A | A unique developer [API key](http://pastebin.com/api) is required to use Pastebin's API


## Commands

Command | Description
--- | ---
hubot dpaste `content` | Creates a new paste with `content` on [Dpaste.com][dpaste]
hubot pastebin `content` | Creates a new paste with `content` on [Pastebin.com][pastebin]


## Sample Interaction

```
user1>> hubot pastebin Hello World!
hubot>> user1: http://pastebin.com/9jrTi80f
```


  [dpaste]: http://dpaste.com/
  [pastebin]: //pastebin.com/