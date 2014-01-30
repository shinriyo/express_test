express = require('express')
app = express()

app.use(app.router)

app.get('/users/:name?', (req, res) ->
  if req.params.name
    res.send('hello, ' + req.params.name)
  else
    res.send('hello, nobody!')
)
app.get('/items/:id([0-9]+)', (req, res) ->
  res.send('item no: ' + req.params.id)
)

app.listen(3000)
console.log("server starting...")
