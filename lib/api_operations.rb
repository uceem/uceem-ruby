module Uceem
  module ApiOperations
    module ClassMethods
      def index
        Uceem.make_request(:get, rel_url)
        Uceem.last_response
      end
    
      def new(params = {})
        raise MissingParametersError if params.nil?
        Uceem.make_request(:post, rel_url, model_name => params)
        Uceem.last_response
      end
    
      def get(id = nil)
        raise MissingParametersError if id.nil?
        Uceem.make_request(:get, rel_url_with_id(id))
        Uceem.last_response
      end
    
      def update(id = nil, params = {})
        raise MissingParametersError if params.nil? or id.nil?
        Uceem.make_request(:put, rel_url_with_id(id), { model_name => params })
      end
    
      def delete(id = nil)
        raise MissingParametersError if id.nil?
        Uceem.make_request(:delete, rel_url_with_id(id))
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
