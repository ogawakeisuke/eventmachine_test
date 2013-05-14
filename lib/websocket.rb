require 'rubygems'
require 'em-websocket'
require 'open3'

# EM::run
EM::run {
  p "server start"
  @channel = EM::Channel.new
  EM::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|
    puts "aaaaaaaa"
    ws.onopen{
      sid = @channel.subscribe{ |mes|
        ws.send(mes)
      }
    }
    puts "<#{sid}> connected!!"
    @channel.push("hello <#{sid}>")
  end
}