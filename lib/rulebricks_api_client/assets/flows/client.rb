# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/flow_list_response"
require "json"
require "async"
require_relative "../../../requests"

module RulebricksApiClient
  module Assets
    class FlowsClient
    # @return [RulebricksApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Assets::FlowsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# List all flows in the organization.
      #
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::FLOW_LIST_RESPONSE]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.flows.list
      def list(request_options: nil)
        response = @request_client.conn.get do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/flows/list"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          RulebricksApiClient::FlowDetail.from_json(json_object: item)
        end
      end
    end
    class AsyncFlowsClient
    # @return [RulebricksApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Assets::AsyncFlowsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# List all flows in the organization.
      #
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::FLOW_LIST_RESPONSE]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.flows.list
      def list(request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/flows/list"
end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do | item |
            item = item.to_json
            RulebricksApiClient::FlowDetail.from_json(json_object: item)
          end
        end
      end
    end
  end
end