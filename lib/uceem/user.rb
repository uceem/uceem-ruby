module Uceem
  class User < UceemObject
    def self.rel_url
      '/manage/users'
    end

    def self.model_name
      'user'
    end
  end
end