$(function() {
  // WebSocketのクライアント
  var ws = new WebSocket("ws://localhost:8080/");
  
  ws.onopen = function() {
    ws.send("繋がったよ！(❍ʻ◡ʻ❍) ");
  };

  ws.onmessage = function(evt) {
    $("#msg").append("<p>"+evt.data+"</p>");
  };

  $("#input").keypress(function(e){
    if(e.keyCode ==13){
      var val = $("#input").val()
      ws.send(val)
      $("#input").val("")
    }
  });

});