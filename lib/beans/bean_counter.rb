module Beans
  class BeanCounter

    def initialize(opts={})
      opts[:port] ||= Config.port
      @port = opts[:port]
    end
  
    def open
      @socket = TCPSocket.new('127.0.0.1', @port)
    end

    def query( query='dollars' )
      self.open
      @socket.puts query
      response = @socket.gets
      self.close
      response
    end

    def close
      @socket.close
    end

  end
end
