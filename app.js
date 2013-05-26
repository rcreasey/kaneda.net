var express = require('express')
  , routes = require('./routes')
  , http = require('http')
  , path = require('path');

var app = express();

app.set('port', process.env.PORT || 5000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(express.cookieParser('sekr3t_3at1ng'));
app.use(express.session());
app.use(app.router);
app.use(require('stylus').middleware(__dirname + '/public'));
app.use(express.static(path.join(__dirname, 'public')));

app.configure('development', function() { app.use(express.errorHandler({ dumpExceptions: true, showStack: true })); });
app.configure('production', function() { app.use(express.errorHandler()); });

app.get('/', routes.index);
app.get('/about', routes.about);
app.get('/files/ryan.creasey.pdf', function(req, res) { res.redirect(301, 'http://www.linkedin.com/in/ryancreasey')});

app.use(function(req, res, next){ res.render('404', { title: 'kaneda.net :: 404 Not Found', request: req.url}) });

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
