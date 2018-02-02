// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
import $ from "jquery"

$(document).ready(function(){
  if(document.getElementById("date")){
    setDate();
  }

  if(document.getElementById("current_time")){
    startTime();
  }
});

function setDate() {
    var date = new Date();
    var dateString   = date.toDateString();
    document.getElementById("date").innerHTML = dateString;
}

function startTime() {
  setInterval(function() {
    var date = new Date();
    var timeString = date.toLocaleTimeString();
    document.getElementById("current_time").innerHTML = timeString;
  }, 1000);
}
