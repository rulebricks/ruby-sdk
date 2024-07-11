# frozen_string_literal: true

require_relative "../../requests"
require "json"
require_relative "types/list_response_item"
require_relative "types/usage_response"
require "async"

module RulebricksApiClient
  class RulesClient
    # @return [RulebricksApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::RequestClient]
    # @return [RulebricksApiClient::RulesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Executes a single rule identified by a unique slug. The request and response
    #  formats are dynamic, dependent on the rule configuration.
    #
    # @param slug [String] The unique identifier for the rule.
    # @param request [Hash{String => Object}]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.solve(slug: "slug", request: { "name": "John Doe", "age": 30, "email": "jdoe@acme.co" })
    def solve(slug:, request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/solve/#{slug}"
      end
      JSON.parse(response.body)
    end

    # Executes a particular rule against multiple request data payloads provided in a
    #  list.
    #
    # @param slug [String] The unique identifier of the rule to execute against all payloads.
    # @param request [Array<Hash{String => Object}>]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<Hash{String => Object}>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.bulk_solve(slug: "slug", request: [{ "name": "John Doe", "age": 30, "email": "jdoe@acme.co" }, { "name": "Jane Doe", "age": 28, "email": "jane@example.com" }])
    def bulk_solve(slug:, request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/bulk-solve/#{slug}"
      end
      JSON.parse(response.body)
    end

    # Executes multiple rules in parallel based on a provided mapping of rule slugs to
    #  payloads.
    #
    # @param request [Hash{String => Object}]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.parallel_solve(request: { "eligibility": {"rule":"1ef03ms","name":"John Doe","age":30,"email":"jdoe@acme.co"}, "offers": {"rule":"OvmsYwn","customer_id":"12345","last_purchase_days_ago":30,"selected_plan":"premium"} })
    def parallel_solve(request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/parallel-solve"
      end
      JSON.parse(response.body)
    end

    # List all rules in the organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Rules::ListResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.list
    def list(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/list"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        RulebricksApiClient::Rules::ListResponseItem.from_json(json_object: item)
      end
    end

    # Get the rule execution usage of your organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Rules::UsageResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.usage
    def usage(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/usage"
      end
      RulebricksApiClient::Rules::UsageResponse.from_json(json_object: response.body)
    end
  end

  class AsyncRulesClient
    # @return [RulebricksApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::AsyncRequestClient]
    # @return [RulebricksApiClient::AsyncRulesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Executes a single rule identified by a unique slug. The request and response
    #  formats are dynamic, dependent on the rule configuration.
    #
    # @param slug [String] The unique identifier for the rule.
    # @param request [Hash{String => Object}]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.solve(slug: "slug", request: { "name": "John Doe", "age": 30, "email": "jdoe@acme.co" })
    def solve(slug:, request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/solve/#{slug}"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end

    # Executes a particular rule against multiple request data payloads provided in a
    #  list.
    #
    # @param slug [String] The unique identifier of the rule to execute against all payloads.
    # @param request [Array<Hash{String => Object}>]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<Hash{String => Object}>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.bulk_solve(slug: "slug", request: [{ "name": "John Doe", "age": 30, "email": "jdoe@acme.co" }, { "name": "Jane Doe", "age": 28, "email": "jane@example.com" }])
    def bulk_solve(slug:, request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/bulk-solve/#{slug}"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end

    # Executes multiple rules in parallel based on a provided mapping of rule slugs to
    #  payloads.
    #
    # @param request [Hash{String => Object}]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.parallel_solve(request: { "eligibility": {"rule":"1ef03ms","name":"John Doe","age":30,"email":"jdoe@acme.co"}, "offers": {"rule":"OvmsYwn","customer_id":"12345","last_purchase_days_ago":30,"selected_plan":"premium"} })
    def parallel_solve(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/parallel-solve"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end

    # List all rules in the organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Rules::ListResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.list
    def list(request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/list"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          RulebricksApiClient::Rules::ListResponseItem.from_json(json_object: item)
        end
      end
    end

    # Get the rule execution usage of your organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Rules::UsageResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.rules.usage
    def usage(request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/usage"
        end
        RulebricksApiClient::Rules::UsageResponse.from_json(json_object: response.body)
      end
    end
  end
end
