module Uceem
  class AuthenticationError < UceemError
    def default_message
      "You must provide an email and password in order to get your authentication " \
      "token from the Uceem API. Try calling " \
      "Uceem::Authenticate.set_token(your_email, your_password)."
    end
  end
end