module Beans
  class BeanCounter

    def initialize(opts={})
      opts[:port] ||= Config.port

      begin
        @socket = TCPSocket.new('127.0.0.1', opts[:port])
      rescue Errno::ECONNREFUSED
        $stderr.puts "Unable to connect to bean server! Are you sure it's running on port #{Beans::Config.port}?"
        exit
      end

    end

    def query
      @socket.puts "dollars"
      @socket.gets
    end

    def close
      @socket.close
    end

  end
end
