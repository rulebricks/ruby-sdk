# frozen_string_literal: true

require_relative "../../requests"
require "date"
require_relative "types/query_response"
require "async"

module RulebricksApiClient
  class DecisionsClient
    # @return [RulebricksApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::RequestClient]
    # @return [RulebricksApiClient::DecisionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve logs for a specific user and rule, with optional date range and
    #  pagination.
    #
    # @param slug [String] The slug of the rule to query logs for.
    # @param from [DateTime] Start date for the query range (ISO8601 format).
    # @param to [DateTime] End date for the query range (ISO8601 format).
    # @param cursor [String] Cursor for pagination.
    # @param limit [Integer] Number of results to return per page.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Decisions::QueryResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.decisions.query(slug: "slug")
    def query(slug:, from: nil, to: nil, cursor: nil, limit: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "slug": slug,
          "from": from,
          "to": to,
          "cursor": cursor,
          "limit": limit
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/decisions/query"
      end
      RulebricksApiClient::Decisions::QueryResponse.from_json(json_object: response.body)
    end
  end

  class AsyncDecisionsClient
    # @return [RulebricksApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::AsyncRequestClient]
    # @return [RulebricksApiClient::AsyncDecisionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve logs for a specific user and rule, with optional date range and
    #  pagination.
    #
    # @param slug [String] The slug of the rule to query logs for.
    # @param from [DateTime] Start date for the query range (ISO8601 format).
    # @param to [DateTime] End date for the query range (ISO8601 format).
    # @param cursor [String] Cursor for pagination.
    # @param limit [Integer] Number of results to return per page.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Decisions::QueryResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.decisions.query(slug: "slug")
    def query(slug:, from: nil, to: nil, cursor: nil, limit: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "slug": slug,
            "from": from,
            "to": to,
            "cursor": cursor,
            "limit": limit
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/decisions/query"
        end
        RulebricksApiClient::Decisions::QueryResponse.from_json(json_object: response.body)
      end
    end
  end
end
