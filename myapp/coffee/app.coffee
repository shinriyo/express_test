express = require('express')
app = express()

my_path = __dirname.replace('js', '')
app.set('views', my_path + '/views')
app.set('view engine', 'ejs')
console.log(my_path + '/views')

# middleware
app.use(express.json())
app.use(express.urlencoded())

app.use(express.logger('dev'))
app.use(app.router)
#app.use(express.static(__dirname + '/public'))
app.use(express.static(my_path + '/public'))

app.param('id', (req, res, next, id) ->
  users = ['taguchi', 'fkoji', 'dotinstall']
  req.params.name = users[id]
  next()
)

# 10
# GET
app.get('/new', (req, res) ->
  res.render('new')
)

# POST
app.post('/create', (req, res) ->
  res.send(req.body.name)
)

# 9
app.get('/hello/:id', (req, res) ->
  res.send('hello ' + req.params.name)
)

app.get('/bye/:id', (req, res) ->
  res.send('bye ' + req.params.name)
)

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
