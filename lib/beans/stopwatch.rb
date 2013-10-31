module Beans
  class Stopwatch

    def initialize
      self.reset
    end

    def reset
      t = Time.now
      @first_started_at = nil
      @last_notification_at = t
      @previously_elapsed_time = 0.0
      @last_stopped_at = t
      @last_started_at = nil
      @running = false
    end

    def start
      if stopped?
        t = Time.now

        @first_started_at ||= t

        @last_started_at = t
        @running = true

      end
    end

    def stop
      if running?
        t = Time.now

        @previously_elapsed_time ||= 0
        @previously_elapsed_time += (t-@last_started_at).to_f

        @last_stopped_at = t
        @running = false

      end
    end


    def stopped?
      !@running
    end

    def running?
      @running
    end

    def seconds_elapsed
      if @last_started_at.nil?
        0.0
      else
        s = @previously_elapsed_time
        s += (Time.now-@last_started_at).to_f unless stopped?
        s
      end
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

    def nice_elapsed_time
      if (s=seconds_elapsed) < 60
        "#{sprintf("%i",s)} seconds"
      elsif (m=minutes_elapsed) < 60
        "#{sprintf("%i",m)} minutes"
      elsif (h=hours_elapsed) < 24
        "#{sprintf("%.1f",h)} hours"
      else
        "#{sprintf("%.1f",days_elapsed)} days"
      end
    end
        

    def notify
      @last_notification_at = Time.now
      return false if @first_started_at.nil?
      Beans::Notification.new(
        sprintf( "$%.02f", dollars_elapsed),
        "over #{nice_elapsed_time} since #{@first_started_at.strftime( "%-I:%M %p")}."
      )
    end

  end
end
