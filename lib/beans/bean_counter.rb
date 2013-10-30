module Beans
  class BeanCounter

    def initialize(opts={})
      opts[:port] ||= Config.port
      @port = opts[:port]
    end
  
    def open
      @socket = TCPSocket.new('127.0.0.1', @port)
    end

    def query
      self.open
      @socket.puts "dollars"
      response = @socket.gets
      self.close
      response
    end

    def close
      @socket.close
    end

  end
end
