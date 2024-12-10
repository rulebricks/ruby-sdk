# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/list_rule_tests_response_item"
require "json"
require_relative "types/create_rule_test_response"
require_relative "types/delete_rule_test_response"
require_relative "types/list_flow_tests_response_item"
require_relative "types/create_flow_test_response"
require_relative "types/delete_flow_test_response"
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

    # Retrieves a list of tests associated with the rule identified by the slug.
    #
    # @param slug [String] The slug of the rule whose tests are to be retrieved.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Tests::ListRuleTestsResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.list_rule_tests(slug: "slug")
    def list_rule_tests(slug:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/#{slug}/tests"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        RulebricksApiClient::Tests::ListRuleTestsResponseItem.from_json(json_object: item)
      end
    end

    # Adds a new test to the test suite of a rule identified by the slug.
    #
    # @param slug [String] The slug of the rule to which the test will be added.
    # @param name [String] The name of the test.
    # @param request [Hash{String => Object}] The request object for the test.
    # @param response [Hash{String => Object}] The expected response object for the test.
    # @param critical [Boolean] Indicates whether the test is critical.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::CreateRuleTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.create_rule_test(
    #    slug: "slug",
    #    name: "Test 3",
    #    request: { "param1": "value1" },
    #    response: { "status": "success" },
    #    critical: true
    #  )
    def create_rule_test(slug:, name:, request:, response:, critical:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/#{slug}/tests"
      end
      RulebricksApiClient::Tests::CreateRuleTestResponse.from_json(json_object: response.body)
    end

    # Deletes a test from the test suite of a rule identified by the slug.
    #
    # @param slug [String] The slug of the rule from which the test will be deleted.
    # @param test_id [String] The ID of the test to delete.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::DeleteRuleTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.delete_rule_test(slug: "slug", test_id: "testId")
    def delete_rule_test(slug:, test_id:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/#{slug}/tests/#{test_id}"
      end
      RulebricksApiClient::Tests::DeleteRuleTestResponse.from_json(json_object: response.body)
    end

    # Retrieves a list of tests associated with the flow identified by the slug.
    #
    # @param slug [String] The slug of the flow whose tests are to be retrieved.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Tests::ListFlowTestsResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.list_flow_tests(slug: "slug")
    def list_flow_tests(slug:, request_options: nil)
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
        RulebricksApiClient::Tests::ListFlowTestsResponseItem.from_json(json_object: item)
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
    # @return [RulebricksApiClient::Tests::CreateFlowTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.create_flow_test(
    #    slug: "slug",
    #    name: "Test 3",
    #    request: { "param1": "value1" },
    #    response: { "status": "success" },
    #    critical: true
    #  )
    def create_flow_test(slug:, name:, request:, response:, critical:, request_options: nil)
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
      RulebricksApiClient::Tests::CreateFlowTestResponse.from_json(json_object: response.body)
    end

    # Deletes a test from the test suite of a flow identified by the slug.
    #
    # @param slug [String] The slug of the flow from which the test will be deleted.
    # @param test_id [String] The ID of the test to delete.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::DeleteFlowTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.delete_flow_test(slug: "slug", test_id: "testId")
    def delete_flow_test(slug:, test_id:, request_options: nil)
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
      RulebricksApiClient::Tests::DeleteFlowTestResponse.from_json(json_object: response.body)
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

    # Retrieves a list of tests associated with the rule identified by the slug.
    #
    # @param slug [String] The slug of the rule whose tests are to be retrieved.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Tests::ListRuleTestsResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.list_rule_tests(slug: "slug")
    def list_rule_tests(slug:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/#{slug}/tests"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          RulebricksApiClient::Tests::ListRuleTestsResponseItem.from_json(json_object: item)
        end
      end
    end

    # Adds a new test to the test suite of a rule identified by the slug.
    #
    # @param slug [String] The slug of the rule to which the test will be added.
    # @param name [String] The name of the test.
    # @param request [Hash{String => Object}] The request object for the test.
    # @param response [Hash{String => Object}] The expected response object for the test.
    # @param critical [Boolean] Indicates whether the test is critical.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::CreateRuleTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.create_rule_test(
    #    slug: "slug",
    #    name: "Test 3",
    #    request: { "param1": "value1" },
    #    response: { "status": "success" },
    #    critical: true
    #  )
    def create_rule_test(slug:, name:, request:, response:, critical:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/#{slug}/tests"
        end
        RulebricksApiClient::Tests::CreateRuleTestResponse.from_json(json_object: response.body)
      end
    end

    # Deletes a test from the test suite of a rule identified by the slug.
    #
    # @param slug [String] The slug of the rule from which the test will be deleted.
    # @param test_id [String] The ID of the test to delete.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::DeleteRuleTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.delete_rule_test(slug: "slug", test_id: "testId")
    def delete_rule_test(slug:, test_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/#{slug}/tests/#{test_id}"
        end
        RulebricksApiClient::Tests::DeleteRuleTestResponse.from_json(json_object: response.body)
      end
    end

    # Retrieves a list of tests associated with the flow identified by the slug.
    #
    # @param slug [String] The slug of the flow whose tests are to be retrieved.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Tests::ListFlowTestsResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.list_flow_tests(slug: "slug")
    def list_flow_tests(slug:, request_options: nil)
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
          RulebricksApiClient::Tests::ListFlowTestsResponseItem.from_json(json_object: item)
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
    # @return [RulebricksApiClient::Tests::CreateFlowTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.create_flow_test(
    #    slug: "slug",
    #    name: "Test 3",
    #    request: { "param1": "value1" },
    #    response: { "status": "success" },
    #    critical: true
    #  )
    def create_flow_test(slug:, name:, request:, response:, critical:, request_options: nil)
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
        RulebricksApiClient::Tests::CreateFlowTestResponse.from_json(json_object: response.body)
      end
    end

    # Deletes a test from the test suite of a flow identified by the slug.
    #
    # @param slug [String] The slug of the flow from which the test will be deleted.
    # @param test_id [String] The ID of the test to delete.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Tests::DeleteFlowTestResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.tests.delete_flow_test(slug: "slug", test_id: "testId")
    def delete_flow_test(slug:, test_id:, request_options: nil)
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
        RulebricksApiClient::Tests::DeleteFlowTestResponse.from_json(json_object: response.body)
      end
    end
  end
end
