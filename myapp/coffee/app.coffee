express = require('express')
app = express()

my_path = __dirname.replace('js', '')
app.set('views', my_path + '/views')
app.set('view engine', 'ejs')
console.log(my_path + '/views')

# middleware
app.use(express.logger('dev'))
app.use(app.router)
#app.use(express.static(__dirname + '/public'))
app.use(express.static(my_path + '/public'))

add.param('id', (req, res, next, id) ->
  users = ['taguchi', 'fkoji', '']
  req.params.name = users[id]
  next()

app.get('/hello/:id', (req, res) ->
  res.send('hello ' + req.arams.id)

app.get('/bye/:id', (req, res) ->
  res.send('hello ' + req.arams.id)

app.get('/', (req, res) ->
 res.render('index', {title: 'title'})
)

app.use((req, res, next) ->
  console.log('my custom middleware')
  next()
)

app.get('/hello.txt', (req, res) ->
  #res.sendfile(__dirname + '/public/hello.txt')
  #res.sendfile(__dirname.replace('js', '') + '/public/hello.txt')
  res.send('hello from app.js')
)

app.listen(3000)
console.log("server starting...")
