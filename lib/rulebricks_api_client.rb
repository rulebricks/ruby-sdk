# frozen_string_literal: true
require_relative "types_export"
require_relative "requests"
require_relative "rulebricks_api_client/rules/client"
require_relative "rulebricks_api_client/flows/client"
require_relative "rulebricks_api_client/decisions/client"
require_relative "rulebricks_api_client/assets/client"
require_relative "rulebricks_api_client/users/client"
require_relative "rulebricks_api_client/tests/client"
require_relative "rulebricks_api_client/values/client"
require_relative "requests"

module RulebricksApiClient
  class Client
  # @return [RulebricksApiClient::RulesClient] 
    attr_reader :rules
  # @return [RulebricksApiClient::FlowsClient] 
    attr_reader :flows
  # @return [RulebricksApiClient::DecisionsClient] 
    attr_reader :decisions
  # @return [RulebricksApiClient::AssetsClient] 
    attr_reader :assets
  # @return [RulebricksApiClient::UsersClient] 
    attr_reader :users
  # @return [RulebricksApiClient::TestsClient] 
    attr_reader :tests
  # @return [RulebricksApiClient::ValuesClient] 
    attr_reader :values


    # @param base_url [String] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param api_key [String] 
    # @return [RulebricksApiClient::Client]
    def initialize(base_url: nil, max_retries: nil, timeout_in_seconds: nil, api_key:)
      @request_client = RulebricksApiClient::RequestClient.new(
  base_url: base_url,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  api_key: api_key
)
      @rules = RulebricksApiClient::RulesClient.new(request_client: @request_client)
      @flows = RulebricksApiClient::FlowsClient.new(request_client: @request_client)
      @decisions = RulebricksApiClient::DecisionsClient.new(request_client: @request_client)
      @assets = RulebricksApiClient::AssetsClient.new(request_client: @request_client)
      @users = RulebricksApiClient::UsersClient.new(request_client: @request_client)
      @tests = RulebricksApiClient::TestsClient.new(request_client: @request_client)
      @values = RulebricksApiClient::ValuesClient.new(request_client: @request_client)
    end
  end
  class AsyncClient
  # @return [RulebricksApiClient::AsyncRulesClient] 
    attr_reader :rules
  # @return [RulebricksApiClient::AsyncFlowsClient] 
    attr_reader :flows
  # @return [RulebricksApiClient::AsyncDecisionsClient] 
    attr_reader :decisions
  # @return [RulebricksApiClient::AsyncAssetsClient] 
    attr_reader :assets
  # @return [RulebricksApiClient::AsyncUsersClient] 
    attr_reader :users
  # @return [RulebricksApiClient::AsyncTestsClient] 
    attr_reader :tests
  # @return [RulebricksApiClient::AsyncValuesClient] 
    attr_reader :values


    # @param base_url [String] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param api_key [String] 
    # @return [RulebricksApiClient::AsyncClient]
    def initialize(base_url: nil, max_retries: nil, timeout_in_seconds: nil, api_key:)
      @async_request_client = RulebricksApiClient::AsyncRequestClient.new(
  base_url: base_url,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  api_key: api_key
)
      @rules = RulebricksApiClient::AsyncRulesClient.new(request_client: @async_request_client)
      @flows = RulebricksApiClient::AsyncFlowsClient.new(request_client: @async_request_client)
      @decisions = RulebricksApiClient::AsyncDecisionsClient.new(request_client: @async_request_client)
      @assets = RulebricksApiClient::AsyncAssetsClient.new(request_client: @async_request_client)
      @users = RulebricksApiClient::AsyncUsersClient.new(request_client: @async_request_client)
      @tests = RulebricksApiClient::AsyncTestsClient.new(request_client: @async_request_client)
      @values = RulebricksApiClient::AsyncValuesClient.new(request_client: @async_request_client)
    end
  end
end