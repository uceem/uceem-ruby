module Uceem
  class Client < UceemObject
    def self.rel_url
      '/clients'
    end
    
    def self.model_name
      'client'
    end
  end
end