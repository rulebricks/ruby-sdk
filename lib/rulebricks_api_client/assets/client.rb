# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/delete_rule_response"
require "json"
require "date"
require_relative "types/import_rule_response"
require_relative "types/usage_response"
require "async"

module RulebricksApiClient
  class AssetsClient
    # @return [RulebricksApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::RequestClient]
    # @return [RulebricksApiClient::AssetsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Delete a specific rule by its ID.
    #
    # @param id [String] The ID of the rule to delete.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Assets::DeleteRuleResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.delete_rule
    def delete_rule(id: nil, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), id: id }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/delete"
      end
      RulebricksApiClient::Assets::DeleteRuleResponse.from_json(json_object: response.body)
    end

    # Export a specific rule by its ID.
    #
    # @param id [String] The ID of the rule to export.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.export_rule(id: "id")
    def export_rule(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "id": id }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/export"
      end
      JSON.parse(response.body)
    end

    # Import a rule into the user's account.
    #
    # @param id [String]
    # @param created_at [DateTime]
    # @param slug [String]
    # @param updated_at [DateTime]
    # @param test_request [Hash{String => Object}]
    # @param name [String]
    # @param description [String]
    # @param request_schema [Array<Object>]
    # @param response_schema [Array<Object>]
    # @param sample_request [Hash{String => Object}]
    # @param sample_response [Hash{String => Object}]
    # @param conditions [Array<Object>]
    # @param published [Boolean]
    # @param history [Array<Object>]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Assets::ImportRuleResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.import_rule(
    #    id: "id",
    #    created_at: DateTime.parse("2024-01-15T09:30:00.000Z"),
    #    slug: "slug",
    #    updated_at: DateTime.parse("2024-01-15T09:30:00.000Z"),
    #    test_request: { "key": "value" },
    #    name: "name",
    #    description: "description",
    #    request_schema: ,
    #    response_schema: ,
    #    sample_request: { "key": "value" },
    #    sample_response: { "key": "value" },
    #    conditions: ,
    #    published: true,
    #    history:
    #  )
    def import_rule(id:, created_at:, slug:, updated_at:, test_request:, name:, description:, request_schema:,
                    response_schema:, sample_request:, sample_response:, conditions:, published:, history:, request_options: nil)
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
          id: id,
          createdAt: created_at,
          slug: slug,
          updatedAt: updated_at,
          testRequest: test_request,
          name: name,
          description: description,
          requestSchema: request_schema,
          responseSchema: response_schema,
          sampleRequest: sample_request,
          sampleResponse: sample_response,
          conditions: conditions,
          published: published,
          history: history
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/import"
      end
      RulebricksApiClient::Assets::ImportRuleResponse.from_json(json_object: response.body)
    end

    # List all flows in the organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Void]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.list
    def list(request_options: nil)
      @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/flows/list"
      end
    end

    # Get the rule execution usage of your organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Assets::UsageResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.usage
    def usage(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/usage"
      end
      RulebricksApiClient::Assets::UsageResponse.from_json(json_object: response.body)
    end
  end

  class AsyncAssetsClient
    # @return [RulebricksApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::AsyncRequestClient]
    # @return [RulebricksApiClient::AsyncAssetsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Delete a specific rule by its ID.
    #
    # @param id [String] The ID of the rule to delete.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Assets::DeleteRuleResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.delete_rule
    def delete_rule(id: nil, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), id: id }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/delete"
        end
        RulebricksApiClient::Assets::DeleteRuleResponse.from_json(json_object: response.body)
      end
    end

    # Export a specific rule by its ID.
    #
    # @param id [String] The ID of the rule to export.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Hash{String => Object}]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.export_rule(id: "id")
    def export_rule(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "id": id }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/export"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end

    # Import a rule into the user's account.
    #
    # @param id [String]
    # @param created_at [DateTime]
    # @param slug [String]
    # @param updated_at [DateTime]
    # @param test_request [Hash{String => Object}]
    # @param name [String]
    # @param description [String]
    # @param request_schema [Array<Object>]
    # @param response_schema [Array<Object>]
    # @param sample_request [Hash{String => Object}]
    # @param sample_response [Hash{String => Object}]
    # @param conditions [Array<Object>]
    # @param published [Boolean]
    # @param history [Array<Object>]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Assets::ImportRuleResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.import_rule(
    #    id: "id",
    #    created_at: DateTime.parse("2024-01-15T09:30:00.000Z"),
    #    slug: "slug",
    #    updated_at: DateTime.parse("2024-01-15T09:30:00.000Z"),
    #    test_request: { "key": "value" },
    #    name: "name",
    #    description: "description",
    #    request_schema: ,
    #    response_schema: ,
    #    sample_request: { "key": "value" },
    #    sample_response: { "key": "value" },
    #    conditions: ,
    #    published: true,
    #    history:
    #  )
    def import_rule(id:, created_at:, slug:, updated_at:, test_request:, name:, description:, request_schema:,
                    response_schema:, sample_request:, sample_response:, conditions:, published:, history:, request_options: nil)
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
            id: id,
            createdAt: created_at,
            slug: slug,
            updatedAt: updated_at,
            testRequest: test_request,
            name: name,
            description: description,
            requestSchema: request_schema,
            responseSchema: response_schema,
            sampleRequest: sample_request,
            sampleResponse: sample_response,
            conditions: conditions,
            published: published,
            history: history
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/rules/import"
        end
        RulebricksApiClient::Assets::ImportRuleResponse.from_json(json_object: response.body)
      end
    end

    # List all flows in the organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Void]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.list
    def list(request_options: nil)
      Async do
        @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/flows/list"
        end
      end
    end

    # Get the rule execution usage of your organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Assets::UsageResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.assets.usage
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
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/usage"
        end
        RulebricksApiClient::Assets::UsageResponse.from_json(json_object: response.body)
      end
    end
  end
end
