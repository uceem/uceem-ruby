module Uceem
  class ResourceNotFound < StandardError
    attr_reader :message
    
    def initialize(message = nil)
      @message = message
    end
    
    def to_s
      @message.nil? ? default_message : @message
    end
    
    def default_message
      "It looks like the object you were looking for doesn't exist."
    end
  end
end