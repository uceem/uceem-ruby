module Uceem
  class UceemError < StandardError
    attr_reader :message
    
    def initialize(message = nil)
      @message = message
    end
    
    def to_s
      @message.nil? ? default_message : @message
    end
    
    def default_message
      "That wasn't supposed to happen, it appears there was an unknown " \
      "(500) error on our end.  If this persists please contact <support@uceem.com>."
    end
  end
end