require './lib/assets/modbot'

class ModBotMain
  attr_accessor :read, :channel, :bot, :controller
  define_method :initialize do |controller|
    @controller = controller
    @read = IO.pipe
    @channel = "#VawxTesting"
    if pid = Process.fork
      @bot = ModBot.new 'VawxBot', @channel, @controller
      while 1
        begin
          @bot.say @read.read_nonblock(1024)
        rescue
          @bot.run
        end
      end
    end
  end

  define_method :recieve do |message|
    puts "Recv: " + message
    controller.read
  end
end