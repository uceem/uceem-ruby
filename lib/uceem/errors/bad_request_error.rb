module Uceem
  class BadRequestError < UceemError
    def default_message
      "There was an error because the request wasn't properly formed. Make sure " \
      "that all the required parameters are being provided."
    end
  end
end