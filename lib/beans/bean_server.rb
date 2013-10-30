require 'socket'

module Beans
  class BeanServer

    def initialize(opts={})
      opts[:port] ||= Config.port

      @stopwatch = Stopwatch.new
      @socket = TCPServer.new(opts[:port])

      puts "Listening for bean counters on port #{opts[:port]}..."
    end

    def listen

      while client = @socket.accept
        while s = client.gets
          client.puts @stopwatch.query(s)
        end
      end

    end
  end
end
