require 'json'
require 'rest_client'
require 'uceem/version'

require 'uceem/util'

require 'uceem/api_operations'
require 'uceem/uceem_object'
require 'uceem/authentication'
require 'uceem/network'
require 'uceem/activity'
require 'uceem/client'
require 'uceem/router'
require 'uceem/guest'
require 'uceem/user'

require 'uceem/errors/uceem_error'
require 'uceem/errors/authentication_error'
require 'uceem/errors/missing_parameters_error'
require 'uceem/errors/no_auth_token_provided_error'
require 'uceem/errors/temporary_redirect'
require 'uceem/errors/resource_not_found'

module Uceem
  
  @base_url = 'localhost:3000' # 'https://uceem.com'
  
  class << self
    attr_accessor :auth_token, :last_response, :last_response_code
  end

  def self.make_request(method, rel_url, params = {})
    raise Uceem::AuthenticationError if @auth_token.nil? and not rel_url == Authentication.rel_url
    
    params[:auth_token] = @auth_token if @auth_token

    response = case method
               when :get    then Uceem.make_request_chasing_redirects(rel_url, params)
               when :put    then RestClient.put(api_url(rel_url), params)
               when :post   then RestClient.post(api_url(rel_url), params)
               else raise Uceem::UceemError
               end
    
    handle_response(response)
  rescue RestClient::Unauthorized
    return handle_error(401)
  rescue RestClient::BadRequest
    return handle_error(400)
  end

  def self.make_request_chasing_redirects(rel_url, params = {})
    RestClient.get(api_url(rel_url), { params: params }) { |response, request, result, &block|
      if [301, 302, 307].include?(response.code)
        response.follow_redirection(request, result, &block)
      else
        response.return!(request, result, &block)
      end
    }
  end

  def self.api_url(rel_url = '')
    "#{ @base_url }#{ rel_url }.json"
  end
  
  def self.handle_response(raw_response)
    begin
      @last_response = Uceem::Util.parse_and_symbolize_json(raw_response.body) unless raw_response.body.nil?
      @last_response_code = raw_response.code
    rescue JSON::ParserError
      raise Uceem::UceemError
    end
    
    case @last_response_code
    when 200, 302 then return true
    when 307      then raise Uceem::TemporaryRedirect
    end
  end
  
  def self.last_response
    @last_response
  end
  
  def self.last_response_code
    @last_response_code
  end
  
  def self.auth_token=(auth_token)
    @auth_token = auth_token
  end
  
  def self.auth_token
    @auth_token
  end
  
  def self.success?
    [200, 302].include?(@last_response_code)
  end

  def self.handle_error(code = 500)
    @last_response_code = code
    @last_response = nil

    case code
    when 400      then raise Uceem::BadRequestError
    when 401, 403 then raise Uceem::AuthenticationError
    when 404      then raise Uceem::ResourceNotFound
    when 500      then raise Uceem::UceemError
    else false
    end
  end
end
