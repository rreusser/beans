require 'yaml'

module Beans
  class Config

    class <<self
      def config
        @config ||= YAML.load(open(ENV['HOME']+'/.beans.yml'))
      end

      def salary
        config['salary']
      end

      def per
        config['per']
      end

      def salary_per_year
        case per.downcase
          when 'year'
            salary
          when 'month'
            salary*12
          when 'hour'
            salary*hours_per_week*52
        end
      end

      def hours_per_week
        config['hours_per_week']
      end

      def port
        config['port']
      end

      def dollars_per_second
        seconds_per_week = hours_per_week*3600.0
        weeks_per_year = 52.0
        salary_per_year / weeks_per_year / seconds_per_week
      end

    end

  end
end
