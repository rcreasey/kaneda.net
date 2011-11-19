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

function four(){
  $("#4").show();
  setInterval(blink_closure, 1000);
}

function three(){
  $("#3").show();
  setTimeout(four, 1500);
}

function two(){
  $("#2").show().jTypeWriter({duration:0.7});
  setTimeout(three, 1000);
}

function one(){
  $("#1").show();
  setTimeout(two, 1000);
}

$(document).ready(one);