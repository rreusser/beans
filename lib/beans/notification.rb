require 'ruby-growl'

module Beans
  class Notification
    
    def initialize( m1, m2 )

      @growl = Growl.new('localhost', 'beans')

      @growl.add_notification 'beans'
      @growl.notify 'beans', m1, m2
    end

  end
end
  
    
