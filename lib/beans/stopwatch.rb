module Beans
  class Stopwatch

    def initialize
      @t0 = Time.now.to_f
    end

    def seconds_elapsed
      Time.now.to_f - @t0
    end

    def minutes_elapsed
      seconds_elapsed / 60.0
    end

    def hours_elapsed
      minutes_elapsed / 60.0
    end

    def days_elapsed
      hours_elapsed/24.0
    end

    def dollars_elapsed
      seconds_elapsed * Config.dollars_per_second
    end

    def query(unit)
      self.send( "#{unit.strip}_elapsed" )
    end

  end
end
