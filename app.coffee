express = require('express')
app = express()

console.log("Hello World")

app.get '/', (req, res) ->
  res.send('Hello World!!!')

# Listen for incoming requests and serve them.
server = app.listen process.env.PORT || 3002, ->
  host = server.address().address
  port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)
