# frozen_string_literal: true
require_relative "../../requests"
require_relative "rules/client"
require_relative "flows/client"
require_relative "folders/client"
require_relative "../types/usage_statistics"
require "async"
require_relative "../../requests"

module RulebricksApiClient
  class AssetsClient
  # @return [RulebricksApiClient::RequestClient] 
    attr_reader :request_client
  # @return [RulebricksApiClient::Assets::RulesClient] 
    attr_reader :rules
  # @return [RulebricksApiClient::Assets::FlowsClient] 
    attr_reader :flows
  # @return [RulebricksApiClient::Assets::FoldersClient] 
    attr_reader :folders


# Administrative operations for managing rules, flows, folders, and usage
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::AssetsClient]
    def initialize(request_client:)
      @request_client = request_client
      @rules = RulebricksApiClient::Assets::RulesClient.new(request_client: request_client)
      @flows = RulebricksApiClient::Assets::FlowsClient.new(request_client: request_client)
      @folders = RulebricksApiClient::Assets::FoldersClient.new(request_client: request_client)
    end
# Get the rule execution usage of your organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::UsageStatistics]
    # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.get_usage
    def get_usage(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/usage"
end
      RulebricksApiClient::UsageStatistics.from_json(json_object: response.body)
    end
  end
  class AsyncAssetsClient
  # @return [RulebricksApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [RulebricksApiClient::Assets::RulesClient] 
    attr_reader :rules
  # @return [RulebricksApiClient::Assets::FlowsClient] 
    attr_reader :flows
  # @return [RulebricksApiClient::Assets::FoldersClient] 
    attr_reader :folders


# Administrative operations for managing rules, flows, folders, and usage
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::AsyncAssetsClient]
    def initialize(request_client:)
      @request_client = request_client
      @rules = RulebricksApiClient::Assets::AsyncRulesClient.new(request_client: request_client)
      @flows = RulebricksApiClient::Assets::AsyncFlowsClient.new(request_client: request_client)
      @folders = RulebricksApiClient::Assets::AsyncFoldersClient.new(request_client: request_client)
    end
# Get the rule execution usage of your organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::UsageStatistics]
    # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.get_usage
    def get_usage(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/usage"
end
        RulebricksApiClient::UsageStatistics.from_json(json_object: response.body)
      end
    end
  end
end