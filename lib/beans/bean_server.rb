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
          begin
            sleep(@stopwatch.seconds_to_next_notification+0.1)
            @stopwatch.notify
          rescue Exception=>e
            $stderr.puts e.exception
            $stderr.puts e.message
            $stderr.puts e.backtrace
          end
        end
      end
    end

    def listen
      # Server loop:
      loop do
        Thread.start(@server.accept) do |client|
          begin
            q = client.gets.strip
            case q.downcase
              when 'start'
                @stopwatch.start
                client.puts 'success'
              when 'stop'
                @stopwatch.stop
                client.puts 'success'
              when 'reset'
                @stopwatch.reset
                client.puts 'success'
              else
                client.puts @stopwatch.query(q)
            end
            client.close
          rescue StandardError => e
            $stderr.puts "#{e.exception}: #{e.message}"
            $stderr.puts e.backtrace
          end
        end
      end

    end
  end
end
