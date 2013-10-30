module Beans
  class BeanCounter

    def initialize(opts={})
      opts[:port] ||= Config.port

      @socket = TCPSocket.new('127.0.0.1', opts[:port])

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
