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

function six(){
  $("#6").show();
  setInterval(blink_closure, 1000);
}

function five(){
  $("#5").show().jTypeWriter({duration:0.5});;
  setTimeout(six, 1500);
}

function four(){
  $("#4").show();
  setTimeout(five, 1500);
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