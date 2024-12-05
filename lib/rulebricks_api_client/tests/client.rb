# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/list_tests_response_item"
require "json"
require_relative "types/create_test_response"
require_relative "types/delete_test_response"
require "async"

module RulebricksApiClient
  class TestsClient
    # @return [RulebricksApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::RequestClient]
    # @return [RulebricksApiClient::TestsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a list of tests associated with the flow identified by the slug.
    #
    # @param slug [String] The slug of the flow whose tests are to be retrieved.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Tests::ListTestsResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.list_tests(slug: "slug")
    def list_tests(slug:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/flows/#{slug}/tests"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        RulebricksApiClient::Tests::ListTestsResponseItem.from_json(json_object: item)
      end
    end

    # Adds a new test to the test suite of a flow identified by the slug.
    #
    # @param slug [String] The slug of the flow to which the test will be added.
    # @param name [String] The name of the test.
    # @param request [Hash{String => Object}] The request object for the test.
    # @param response [Hash{String => Object}] The expected response object for the test.
    # @param critical [Boolean] Indicates whether the test is critical.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::CreateTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.create_test(
    #    slug: "slug",
    #    name: "Test 3",
    #    request: { "param1": "value1" },
    #    response: { "status": "success" },
    #    critical: true
    #  )
    def create_test(slug:, name:, request:, response:, critical:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          name: name,
          request: request,
          response: response,
          critical: critical
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/flows/#{slug}/tests"
      end
      RulebricksApiClient::Tests::CreateTestResponse.from_json(json_object: response.body)
    end

    # Deletes a test from the test suite of a flow identified by the slug.
    #
    # @param slug [String] The slug of the flow from which the test will be deleted.
    # @param test_id [String] The ID of the test to delete.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::DeleteTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.delete_test(slug: "slug", test_id: "testId")
    def delete_test(slug:, test_id:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/flows/#{slug}/tests/#{test_id}"
      end
      RulebricksApiClient::Tests::DeleteTestResponse.from_json(json_object: response.body)
    end
  end

  class AsyncTestsClient
    # @return [RulebricksApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::AsyncRequestClient]
    # @return [RulebricksApiClient::AsyncTestsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieves a list of tests associated with the flow identified by the slug.
    #
    # @param slug [String] The slug of the flow whose tests are to be retrieved.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Tests::ListTestsResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.list_tests(slug: "slug")
    def list_tests(slug:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/flows/#{slug}/tests"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          RulebricksApiClient::Tests::ListTestsResponseItem.from_json(json_object: item)
        end
      end
    end

    # Adds a new test to the test suite of a flow identified by the slug.
    #
    # @param slug [String] The slug of the flow to which the test will be added.
    # @param name [String] The name of the test.
    # @param request [Hash{String => Object}] The request object for the test.
    # @param response [Hash{String => Object}] The expected response object for the test.
    # @param critical [Boolean] Indicates whether the test is critical.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::CreateTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.create_test(
    #    slug: "slug",
    #    name: "Test 3",
    #    request: { "param1": "value1" },
    #    response: { "status": "success" },
    #    critical: true
    #  )
    def create_test(slug:, name:, request:, response:, critical:, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            name: name,
            request: request,
            response: response,
            critical: critical
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/flows/#{slug}/tests"
        end
        RulebricksApiClient::Tests::CreateTestResponse.from_json(json_object: response.body)
      end
    end

    # Deletes a test from the test suite of a flow identified by the slug.
    #
    # @param slug [String] The slug of the flow from which the test will be deleted.
    # @param test_id [String] The ID of the test to delete.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::DeleteTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.delete_test(slug: "slug", test_id: "testId")
    def delete_test(slug:, test_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/flows/#{slug}/tests/#{test_id}"
        end
        RulebricksApiClient::Tests::DeleteTestResponse.from_json(json_object: response.body)
      end
    end
  end
end
