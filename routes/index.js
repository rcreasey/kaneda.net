exports.index = function(req, res){
  res.render('index', { title: 'kaneda.net :: ryan c. creasey' });
};

exports.about = function(req, res){
  res.render('about', { title: 'kaneda.net :: about ryan c. creasey' });
};