require 'rubygems'
require 'em-websocket'
require 'open3'

# EM::run
EM::run {
  p "server start"
  @channel = EM::Channel.new
  connections = Array.new
  
  EM::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|
    ws.onopen{
      connections.push(ws) unless connections.index(ws)
      ws.send("hello!!!!!!!!")
    }

    ws.onmessage { |msg|
      puts "received "+msg
      ws.send msg #to myself
      connections.each {|con|
        #to other people
        con.send(msg) unless con == ws
      }
    }
  
  end
}