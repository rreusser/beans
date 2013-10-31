module Beans
  VERSION = "0.2"

  class << self
    def version
      Beans::VERSION.dup
    end 
  end 

end
