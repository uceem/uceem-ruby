module Uceem
  class UceemObject
    include Uceem::ApiOperations

    private

      def self.rel_url_with_id(id)
        "#{ rel_url }/#{ id }"
      end
  end
end
