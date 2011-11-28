// blatantly stolen from Steve Klabnik 
var blink_closure = (function () {
  var state = "on";
  return function() {
    if(state == "on"){
      document.getElementById("cursor").style.visibility="hidden";
      state = "off";
    } else {
      document.getElementById("cursor").style.visibility="visible";
      state = "on";
    }
    return true;
  };
})();