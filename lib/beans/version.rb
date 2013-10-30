module Beans
  VERSION = "0.1a"

  class << self
    def version
      Beans::VERSION.dup
    end 
  end 

end
