module T2M
  class Stopwatch

    def initialize
      @t0 = Time.now.to_f
    end

    def seconds_elapsed
      Time.now.to_f - @t0
    end

    def read_config
      
    end

  end
end
