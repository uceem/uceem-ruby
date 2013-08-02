module Uceem
  class TemporaryRedirect < StandardError
    attr_reader :message
    
    def initialize(message = nil)
      @message = message
    end
    
    def to_s
      @message.nil? ? default_message : @message
    end
    
    def default_message
      "That request was redirected, are you sure you're using HTTPS? " \
      "If this continues to persist please contact <support@uceem.com>. " \
    end
  end
end