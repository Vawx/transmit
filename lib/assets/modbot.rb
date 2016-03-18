requires 'sockets'

class ModBot
  define_method :initialize do |nick, channel|
    @nick = nick
    @channel = channel[ 0 ] != "#" ? "#" + channel : channel
    @server = 'irc.freenode.net'
    @socket = TCPSocket.open @server, 6667
    start
  end

  define_method start do
    @socket.puts "NICK #{@nick}"
    @socket.puts "USER #{@nick} 0 * :Moderation Bot"
    @socket.puts "JOIN #{@channel}"
    run
  end

  define_method :run do
    begin
      message = @socket.read_nonblock 1024
      puts message

      if message.match /^PING :(.*)$/
        say "PONG #{$~[1]}"
      end
    rescue
      return
    end
  end

end