# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/test_list_response"
require "json"
require_relative "../../types/create_test_request"
require_relative "../../types/test"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module RulebricksApiClient
  module Tests
    class RulesClient
    # @return [RulebricksApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Tests::RulesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieves a list of tests associated with the rule identified by the slug.
      #
      # @param slug [String] The unique identifier for the resource.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::TEST_LIST_RESPONSE]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.tests.rules.list(slug: "slug")
      def list(slug:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/#{slug}/tests"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          RulebricksApiClient::Test.from_json(json_object: item)
        end
      end
# Adds a new test to the test suite of a rule identified by the slug.
      #
      # @param slug [String] The unique identifier for the resource.
      # @param request [Hash] Request of type RulebricksApiClient::CreateTestRequest, as a Hash
      #   * :name (String) 
      #   * :request (Hash{String => Object}) 
      #   * :response (Hash{String => Object}) 
      #   * :critical (Boolean) 
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::Test]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.tests.rules.create(slug: "slug", request: { name: "Test 3", request: { "param1": "value1" }, response: { "status": "success" }, critical: true })
      def create(slug:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/#{slug}/tests"
end
        RulebricksApiClient::Test.from_json(json_object: response.body)
      end
# Deletes a test from the test suite of a rule identified by the slug.
      #
      # @param slug [String] The unique identifier for the resource.
      # @param test_id [String] The ID of the test.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::Test]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.tests.rules.delete(slug: "slug", test_id: "testId")
      def delete(slug:, test_id:, request_options: nil)
        response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/#{slug}/tests/#{test_id}"
end
        RulebricksApiClient::Test.from_json(json_object: response.body)
      end
    end
    class AsyncRulesClient
    # @return [RulebricksApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Tests::AsyncRulesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieves a list of tests associated with the rule identified by the slug.
      #
      # @param slug [String] The unique identifier for the resource.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::TEST_LIST_RESPONSE]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.tests.rules.list(slug: "slug")
      def list(slug:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/#{slug}/tests"
end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do | item |
            item = item.to_json
            RulebricksApiClient::Test.from_json(json_object: item)
          end
        end
      end
# Adds a new test to the test suite of a rule identified by the slug.
      #
      # @param slug [String] The unique identifier for the resource.
      # @param request [Hash] Request of type RulebricksApiClient::CreateTestRequest, as a Hash
      #   * :name (String) 
      #   * :request (Hash{String => Object}) 
      #   * :response (Hash{String => Object}) 
      #   * :critical (Boolean) 
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::Test]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.tests.rules.create(slug: "slug", request: { name: "Test 3", request: { "param1": "value1" }, response: { "status": "success" }, critical: true })
      def create(slug:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/#{slug}/tests"
end
          RulebricksApiClient::Test.from_json(json_object: response.body)
        end
      end
# Deletes a test from the test suite of a rule identified by the slug.
      #
      # @param slug [String] The unique identifier for the resource.
      # @param test_id [String] The ID of the test.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::Test]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.tests.rules.delete(slug: "slug", test_id: "testId")
      def delete(slug:, test_id:, request_options: nil)
        Async do
          response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/#{slug}/tests/#{test_id}"
end
          RulebricksApiClient::Test.from_json(json_object: response.body)
        end
      end
    end
  end
end