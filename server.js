var express = require('express');
var path = require('path');
var serveStatic = require('serve-static');
var logging = require('morgan');

app = express();
app.use(serveStatic(__dirname + "/dist"));
app.use(logging('combined'));

var port = process.env.PORT || 5000;
app.listen(port);
console.log('server started '+ port);
