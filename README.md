# Hubot: Paste

A Hubot script for creating a new paste on several online services: [Dpaste.com][dpaste] and [Pastebin.com][pastebin].


## Installation via NPM

1. Install the __hubot-paste__ module as a Hubot dependency by adding it to your `package.json` file:

    ```
    npm install --save hubot-paste
    ```

2. Enable the script by adding the __hubot-paste__ entry to your `external-scripts.json` file:

    ```json
    ["hubot-paste"]
    ```

3. Run `npm install`


## Commands

Command | Description
--- | ---
hubot dpaste `content` | Creates a new paste with `content` on [Dpaste.com][dpaste]
hubot pastebin `content` | Creates a new paste with `content` on [Pastebin.com][pastebin]

  [dpaste]: http://dpaste.com/
  [pastebin]: //pastebin.com/