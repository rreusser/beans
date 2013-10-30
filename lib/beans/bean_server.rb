require 'socket'

module Beans
  class BeanServer

    def initialize(opts={})
      opts[:port] ||= Config.port

      @stopwatch = Stopwatch.new
      @server = TCPServer.new(opts[:port])

      puts "Listening for bean counters on port #{opts[:port]}..."

      @last_notification_at = Time.now
    end

    def notify
      # Notification loop:
      Thread.start do
        loop do
          sleep(@stopwatch.seconds_to_next_notification+0.1)
          @stopwatch.notify
        end
      end
    end

    def listen
      # Server loop:
      loop do
        Thread.start(@server.accept) do |client|
          client.puts @stopwatch.query(client.gets)
          client.close
        end
      end

    end
  end
end
