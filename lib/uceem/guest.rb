module Uceem
  class Guest < UceemObject
    def self.rel_url
      '/guests'
    end

    def self.model_name
      'guest'
    end
  end
end