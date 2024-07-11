# frozen_string_literal: true

require_relative "../../requests"
require "json"
require "async"

module RulebricksApiClient
  class FlowsClient
    # @return [RulebricksApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::RequestClient]
    # @return [RulebricksApiClient::FlowsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Execute a flow by its slug.
    #
    # @param slug [String] The unique identifier for the flow.
    # @param request [Hash{String => Object}]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.flows.execute(slug: "slug", request: { "name": "John Doe", "age": 30, "email": "jdoe@acme.co" })
    def execute(slug:, request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/flow/#{slug}"
      end
      JSON.parse(response.body)
    end
  end

  class AsyncFlowsClient
    # @return [RulebricksApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::AsyncRequestClient]
    # @return [RulebricksApiClient::AsyncFlowsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Execute a flow by its slug.
    #
    # @param slug [String] The unique identifier for the flow.
    # @param request [Hash{String => Object}]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.flows.execute(slug: "slug", request: { "name": "John Doe", "age": 30, "email": "jdoe@acme.co" })
    def execute(slug:, request:, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/flow/#{slug}"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
  end
end
