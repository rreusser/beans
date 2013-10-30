module Beans
  class Stopwatch

    attr_reader :t0

    def initialize
      @t0 = Time.now
      @last_notification_at = Time.now
    end

    def seconds_elapsed
      Time.now.to_f - @t0.to_f
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

    def next_notification_at
      @last_notification_at + Config.seconds_between_notifications
    end

    def seconds_to_next_notification
      next_notification_at - Time.now
    end

    def notify
      @last_notification_at = Time.now
      Beans::Notification.new(
        sprintf( "$%.02f", dollars_elapsed),
        "since #{@t0.strftime( "%-I:%M %p")} today"
      )
    end

  end
end
