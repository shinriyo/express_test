var app, express, my_path;

express = require('express');

app = express();

my_path = __dirname.replace('js', '');

app.set('views', my_path + '/views');

app.set('view engine', 'ejs');

console.log(my_path + '/views');

app.use(express.json());

app.use(express.urlencoded());

app.use(express.logger('dev'));

app.use(app.router);

app.use(express["static"](my_path + '/public'));

app.param('id', function(req, res, next, id) {
  var users;
  users = ['taguchi', 'fkoji', 'dotinstall'];
  req.params.name = users[id];
  return next();
});

app.get('/new', function(req, res) {
  return res.render('new');
});

app.post('/create', function(req, res) {
  return res.send(res.body.name);
});

app.get('/hello/:id', function(req, res) {
  return res.send('hello ' + req.params.name);
});

app.get('/bye/:id', function(req, res) {
  return res.send('bye ' + req.params.name);
});

app.get('/', function(req, res) {
  return res.render('index', {
    title: 'title'
  });
});

app.use(function(req, res, next) {
  console.log('my custom middleware');
  return next();
});

app.get('/hello.txt', function(req, res) {
  return res.send('hello from app.js');
});

app.listen(3000);

console.log("server starting...");
