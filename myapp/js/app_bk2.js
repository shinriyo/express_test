var app, express;

express = require('express');

app = express();

app.use(app.router);

app.get('/users/:name?', function(req, res) {
  if (req.params.name) {
    return res.send('hello, ' + req.params.name);
  } else {
    return res.send('hello, nobody!');
  }
});

app.get('/items/:id([0-9]+)', function(req, res) {
  return res.send('item no: ' + req.params.id);
});

app.listen(3000);

console.log("server starting...");
