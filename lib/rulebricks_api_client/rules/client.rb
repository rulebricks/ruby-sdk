# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/dynamic_request_payload"
require_relative "../types/dynamic_response_payload"
require "json"
require_relative "../types/bulk_rule_response_item"
require_relative "../types/parallel_solve_request"
require_relative "../types/parallel_solve_response"
require "async"
require "async"
require "async"
require_relative "../../requests"

module RulebricksApiClient
  class RulesClient
  # @return [RulebricksApiClient::RequestClient] 
    attr_reader :request_client


# Operations for efficiently executing individual rules in different formats
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::RulesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Executes a single rule identified by a unique slug. The request and response
#  formats are dynamic, dependent on the rule configuration.
    #
    # @param slug [String] The unique identifier for the resource.
    # @param request [RulebricksApiClient::DYNAMIC_REQUEST_PAYLOAD] 
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::DYNAMIC_RESPONSE_PAYLOAD]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.rules.solve(slug: "slug", request: { "name": "John Doe", "age": 30, "email": "jdoe@acme.co" })
    def solve(slug:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/solve/#{slug}"
end
      parsed_json = JSON.parse(response.body)
      parsed_json
    end
# Executes a particular rule against multiple request data payloads provided in a
#  list.
    #
    # @param slug [String] The unique identifier for the resource.
    # @param request [Array<RulebricksApiClient::DYNAMIC_REQUEST_PAYLOAD>] 
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [Array<RulebricksApiClient::BulkRuleResponseItem>]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.rules.bulk_solve(slug: "slug", request: [{ "name": "John Doe", "age": 30, "email": "jdoe@acme.co" }, { "name": "Jane Doe", "age": 28, "email": "jane@example.com" }])
    def bulk_solve(slug:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/bulk-solve/#{slug}"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        RulebricksApiClient::BulkRuleResponseItem.from_json(json_object: item)
      end
    end
# Executes multiple rules or flows in parallel based on a provided mapping of
#  rule/flow slugs to payloads.
    #
    # @param request [RulebricksApiClient::PARALLEL_SOLVE_REQUEST] 
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::PARALLEL_SOLVE_RESPONSE]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.rules.parallel_solve(request: { "eligibility": { rule: "1ef03ms" }, "offers": { flow: "OvmsYwn" } })
    def parallel_solve(request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/parallel-solve"
end
      parsed_json = JSON.parse(response.body)
      parsed_json
    end
  end
  class AsyncRulesClient
  # @return [RulebricksApiClient::AsyncRequestClient] 
    attr_reader :request_client


# Operations for efficiently executing individual rules in different formats
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::AsyncRulesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Executes a single rule identified by a unique slug. The request and response
#  formats are dynamic, dependent on the rule configuration.
    #
    # @param slug [String] The unique identifier for the resource.
    # @param request [RulebricksApiClient::DYNAMIC_REQUEST_PAYLOAD] 
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::DYNAMIC_RESPONSE_PAYLOAD]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.rules.solve(slug: "slug", request: { "name": "John Doe", "age": 30, "email": "jdoe@acme.co" })
    def solve(slug:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/solve/#{slug}"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
# Executes a particular rule against multiple request data payloads provided in a
#  list.
    #
    # @param slug [String] The unique identifier for the resource.
    # @param request [Array<RulebricksApiClient::DYNAMIC_REQUEST_PAYLOAD>] 
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [Array<RulebricksApiClient::BulkRuleResponseItem>]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.rules.bulk_solve(slug: "slug", request: [{ "name": "John Doe", "age": 30, "email": "jdoe@acme.co" }, { "name": "Jane Doe", "age": 28, "email": "jane@example.com" }])
    def bulk_solve(slug:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/bulk-solve/#{slug}"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          RulebricksApiClient::BulkRuleResponseItem.from_json(json_object: item)
        end
      end
    end
# Executes multiple rules or flows in parallel based on a provided mapping of
#  rule/flow slugs to payloads.
    #
    # @param request [RulebricksApiClient::PARALLEL_SOLVE_REQUEST] 
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::PARALLEL_SOLVE_RESPONSE]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.rules.parallel_solve(request: { "eligibility": { rule: "1ef03ms" }, "offers": { flow: "OvmsYwn" } })
    def parallel_solve(request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/parallel-solve"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
  end
end