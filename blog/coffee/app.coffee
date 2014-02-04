express = require('express')
app = express()
post = require('./routes/post')

my_path = __dirname.replace('js', '')
app.set('views', my_path + '/views')
app.set('view engine', 'ejs')
console.log(my_path + '/views')

# middleware
app.use(express.json())
app.use(express.urlencoded())
app.use(express.methodOverride())

app.use(express.logger('dev'))
app.use(app.router)

# routing
app.get('/', post.index)
app.get('/post/new', post.new)
app.post('/post/create', post.create)
app.get('/post/:id/edit', post.edit)
app.put('/post/:id/', post.update)
app.delete('/post/:id/', post.destroy)

app.listen(3000)
console.log("server starting...")
