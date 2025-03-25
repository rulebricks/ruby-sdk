# frozen_string_literal: true
require_relative "../../requests"
require_relative "rules/client"
require_relative "flows/client"
require_relative "../../requests"

module RulebricksApiClient
  module Tests
    class Client
    # @return [RulebricksApiClient::Tests::RulesClient] 
      attr_reader :rules
    # @return [RulebricksApiClient::Tests::FlowsClient] 
      attr_reader :flows


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Tests::Client]
      def initialize(request_client:)
        @rules = RulebricksApiClient::Tests::RulesClient.new(request_client: request_client)
        @flows = RulebricksApiClient::Tests::FlowsClient.new(request_client: request_client)
      end
    end
    class AsyncClient
    # @return [RulebricksApiClient::Tests::AsyncRulesClient] 
      attr_reader :rules
    # @return [RulebricksApiClient::Tests::AsyncFlowsClient] 
      attr_reader :flows


      # @param request_client [RulebricksApiClient::AsyncRequestClient] 
      # @return [RulebricksApiClient::Tests::AsyncClient]
      def initialize(request_client:)
        @rules = RulebricksApiClient::Tests::AsyncRulesClient.new(request_client: request_client)
        @flows = RulebricksApiClient::Tests::AsyncFlowsClient.new(request_client: request_client)
      end
    end
  end
end