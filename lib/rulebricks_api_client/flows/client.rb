# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/dynamic_request_payload"
require_relative "../types/dynamic_response_payload"
require "json"
require "async"
require_relative "../../requests"

module RulebricksApiClient
  class FlowsClient
  # @return [RulebricksApiClient::RequestClient] 
    attr_reader :request_client


# Operations for executing flows, which are sequences of rules and external
#  actions
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::FlowsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Execute a flow by its slug.
    #
    # @param slug [String] The unique identifier for the resource.
    # @param request [RulebricksApiClient::DYNAMIC_REQUEST_PAYLOAD] 
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::DYNAMIC_RESPONSE_PAYLOAD]
    # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.flows.execute(slug: "slug", request: { "name": "John Doe", "age": 30, "email": "jdoe@acme.co" })
    def execute(slug:, request:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["x-api-key"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/flows/#{slug}"
end
      parsed_json = JSON.parse(response.body)
      parsed_json
    end
  end
  class AsyncFlowsClient
  # @return [RulebricksApiClient::AsyncRequestClient] 
    attr_reader :request_client


# Operations for executing flows, which are sequences of rules and external
#  actions
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::AsyncFlowsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Execute a flow by its slug.
    #
    # @param slug [String] The unique identifier for the resource.
    # @param request [RulebricksApiClient::DYNAMIC_REQUEST_PAYLOAD] 
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::DYNAMIC_RESPONSE_PAYLOAD]
    # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.flows.execute(slug: "slug", request: { "name": "John Doe", "age": 30, "email": "jdoe@acme.co" })
    def execute(slug:, request:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["x-api-key"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/flows/#{slug}"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
  end
end