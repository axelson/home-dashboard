express = require('express')
path = require('path')
coffeeMiddleware = require('coffee-middleware')


app = express()
env = app.get 'env'
console.log "Env is #{env}"

app.set('views', './views')
app.set('view engine', 'jade')

app.get '/', (req, res) ->
  res.render('index', title: 'Hey', message: 'There!')

app.use(express.static(path.join(__dirname, 'public')));

app.use(coffeeMiddleware(
    src: __dirname + '/public',
    compress: true
  ))

# Listen for incoming requests and serve them.
server = app.listen process.env.PORT || 3002, ->
  host = server.address().address
  port = server.address().port

module.exports = app
