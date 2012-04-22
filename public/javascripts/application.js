window.addEvent('domready', function() {

 $$('code').each( function(code) {
    if (code.getProperty('class') == '') {
      code.addClass('ruby');
    }
 });

});
