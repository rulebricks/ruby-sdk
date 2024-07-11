# frozen_string_literal: true

require_relative "types_export"
require_relative "requests"
require_relative "rulebricks_api_client/rules/client"
require_relative "rulebricks_api_client/flows/client"
require_relative "rulebricks_api_client/values/client"

module RulebricksApiClient
  class Client
    # @return [RulebricksApiClient::RulesClient]
    attr_reader :rules
    # @return [RulebricksApiClient::FlowsClient]
    attr_reader :flows
    # @return [RulebricksApiClient::ValuesClient]
    attr_reader :values

    # @param base_url [String]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [RulebricksApiClient::Client]
    def initialize(api_key:, base_url: nil, max_retries: nil, timeout_in_seconds: nil)
      @request_client = RulebricksApiClient::RequestClient.new(
        base_url: base_url,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
      @rules = RulebricksApiClient::RulesClient.new(request_client: @request_client)
      @flows = RulebricksApiClient::FlowsClient.new(request_client: @request_client)
      @values = RulebricksApiClient::ValuesClient.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [RulebricksApiClient::AsyncRulesClient]
    attr_reader :rules
    # @return [RulebricksApiClient::AsyncFlowsClient]
    attr_reader :flows
    # @return [RulebricksApiClient::AsyncValuesClient]
    attr_reader :values

    # @param base_url [String]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [RulebricksApiClient::AsyncClient]
    def initialize(api_key:, base_url: nil, max_retries: nil, timeout_in_seconds: nil)
      @async_request_client = RulebricksApiClient::AsyncRequestClient.new(
        base_url: base_url,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
      @rules = RulebricksApiClient::AsyncRulesClient.new(request_client: @async_request_client)
      @flows = RulebricksApiClient::AsyncFlowsClient.new(request_client: @async_request_client)
      @values = RulebricksApiClient::AsyncValuesClient.new(request_client: @async_request_client)
    end
  end
end
