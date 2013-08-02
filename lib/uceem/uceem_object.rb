module Uceem
  class UceemObject
    def self.index
      Uceem.make_request(:get, rel_url)
      Uceem.last_response
    end
  
    def self.new(params = {})
      raise MissingParametersError if params.nil?
      Uceem.make_request(:post, rel_url, model_name => params)
      Uceem.last_response
    end
  
    def self.get(id = nil)
      raise MissingParametersError if id.nil?
      Uceem.make_request(:get, rel_url_with_id(id))
      Uceem.last_response
    end
  
    def self.update(id = nil, params = {})
      raise MissingParametersError if params.nil? or id.nil?
      Uceem.make_request(:put, rel_url_with_id(id), { model_name => params })
    end
  
    def self.delete(id = nil)
      raise MissingParametersError if id.nil?
      Uceem.make_request(:delete, rel_url_with_id(id))
    end
  
    private
      def self.rel_url_with_id(id)
        "#{ rel_url }/#{ id }"
      end
  end
end