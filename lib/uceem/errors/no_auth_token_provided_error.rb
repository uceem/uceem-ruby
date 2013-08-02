module Uceem
  class NoAuthTokenProvidedError < UceemError
    def default_message
      "Make sure that you provide an auth_token so " \
      "that the Uceem API know's that it's you."
    end
  end
end