# Home Dashboard
Purpose: To provide high-level overview and control of my apartment.

Architecture:
- Angular
- node.js

Note: Want to avoid a database if possible, but if need one then maybe graphite/statsd
Use docker?

# MVP

Angular CoffeeScript application that displays selected lists/items from my Trello account.

Built as a node.js (io.js?) single-page app. No database in MVP.

Uses webhooks to watch list: https://trello.com/docs/gettingstarted/webhooks.html
Uses websockets on Heroku (https://devcenter.heroku.com/articles/websockets) to receive notifications

# Running
supervisor app.coffee
gulp sass

# TODO:
- Can include unread count for gmail?
- Use grunt buildpack to deploy to prod: https://github.com/mbuchetics/heroku-buildpack-nodejs-grunt
- Switch to bluebird promise library: https://github.com/petkaantonov/bluebird/
- Use websockets/webhooks
    - Trello: https://trello.com/docs/gettingstarted/webhooks.html
    - Trello: https://trello.com/docs/gettingstarted/index.html#watching-models-with-webhooks
    - Heroku: https://devcenter.heroku.com/articles/websockets
