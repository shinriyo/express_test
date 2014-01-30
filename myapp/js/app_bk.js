var app, express;

express = require('express');

app = express();

app.use(app.router);

app.get('/', function(req, res) {
  return res.send('hello world');
});

app.get('about', function(req, res) {
  return res.send('about this page!');
});

app.listen(3000);

console.log("server starting...");
