module Uceem
  class Authentication < UceemObject
    
    def self.rel_url
      '/api/login'
    end
  
    def self.begin_session(email = nil, password = nil)
      raise AuthenticationError if email.nil? or password.nil?
    
      Uceem.make_request(:post, rel_url, email: email, password: password)
      Uceem.auth_token = Uceem.last_response[:auth_token] if Uceem.success?
    end
  
    def self.end_session
      Uceem.auth_token = nil
      true
    end
  end
end
