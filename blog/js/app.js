var app, express, my_path, post;

express = require('express');

app = express();

post = require('./routes/post');

my_path = __dirname.replace('js', '');

app.set('views', my_path + '/views');

app.set('view engine', 'ejs');

console.log(my_path + '/views');

app.use(express.json());

app.use(express.urlencoded());

app.use(express.methodOverride());

app.use(express.cookieParser());

app.use(express.session({
  secret: '238D&FSD'
}));

app.use(express.csrf());

app.use(function(req, res, next) {
  res.locals.csrftoken = req.csrfToken();
  return next();
});

app.use(express.logger('dev'));

app.use(app.router);

app.get('/', post.index);

app.get('/posts/:id([0-9]+)', post.show);

app.get('/posts/new', post["new"]);

app.post('/posts/create', post.create);

app.get('/posts/:id/edit', post.edit);

app.put('/posts/:id', post.update);

app["delete"]('/posts/:id', post.destroy);

app.listen(3000);

console.log("server starting...");
