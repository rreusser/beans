module Beans
  VERSION = "0.2.1"

  class << self
    def version
      Beans::VERSION.dup
    end 
  end 

end
