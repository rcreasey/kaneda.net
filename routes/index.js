exports.index = function(req, res){
  res.render('index', { title: 'kaneda.net' });
};

exports.about = function(req, res){
  res.render('about', { title: 'kaneda.net :: about' });
};