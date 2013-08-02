module Uceem
  class MissingParametersError < UceemError
    def default_message
      "You didn't provide all the necessary parameters for that request. " \
      "Be sure to check uceem.com/documentation for a list of all required " \
      "Uceem API parameters."
    end
  end
end