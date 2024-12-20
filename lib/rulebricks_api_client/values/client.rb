# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/list_dynamic_values_response_item"
require "json"
require_relative "types/update_response_item"
require_relative "types/delete_dynamic_value_response"
require "async"

module RulebricksApiClient
  class ValuesClient
    # @return [RulebricksApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::RequestClient]
    # @return [RulebricksApiClient::ValuesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve all dynamic values for the authenticated user.
    #
    # @param name [String] Name of a specific dynamic value to retrieve data for
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Values::ListDynamicValuesResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.values.list_dynamic_values
    def list_dynamic_values(name: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "name": name }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        RulebricksApiClient::Values::ListDynamicValuesResponseItem.from_json(json_object: item)
      end
    end

    # Update existing dynamic values or add new ones for the authenticated user.
    #
    # @param request [Hash{String => RulebricksApiClient::Values::UpdateRequestValue}]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Values::UpdateResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.values.update(request: { "Favorite Color": "blue", "Age": 30, "Is Student": false, "Hobbies": ["reading", "cycling"] })
    def update(request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        RulebricksApiClient::Values::UpdateResponseItem.from_json(json_object: item)
      end
    end

    # Delete a specific dynamic value for the authenticated user by its ID.
    #
    # @param id [String] ID of the dynamic value to delete
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Values::DeleteDynamicValueResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.values.delete_dynamic_value(id: "id")
    def delete_dynamic_value(id:, request_options: nil)
      response = @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "id": id }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
      end
      RulebricksApiClient::Values::DeleteDynamicValueResponse.from_json(json_object: response.body)
    end
  end

  class AsyncValuesClient
    # @return [RulebricksApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::AsyncRequestClient]
    # @return [RulebricksApiClient::AsyncValuesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve all dynamic values for the authenticated user.
    #
    # @param name [String] Name of a specific dynamic value to retrieve data for
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Values::ListDynamicValuesResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.values.list_dynamic_values
    def list_dynamic_values(name: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "name": name }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          RulebricksApiClient::Values::ListDynamicValuesResponseItem.from_json(json_object: item)
        end
      end
    end

    # Update existing dynamic values or add new ones for the authenticated user.
    #
    # @param request [Hash{String => RulebricksApiClient::Values::UpdateRequestValue}]
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Values::UpdateResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.values.update(request: { "Favorite Color": "blue", "Age": 30, "Is Student": false, "Hobbies": ["reading", "cycling"] })
    def update(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          RulebricksApiClient::Values::UpdateResponseItem.from_json(json_object: item)
        end
      end
    end

    # Delete a specific dynamic value for the authenticated user by its ID.
    #
    # @param id [String] ID of the dynamic value to delete
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Values::DeleteDynamicValueResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.values.delete_dynamic_value(id: "id")
    def delete_dynamic_value(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "id": id }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
        end
        RulebricksApiClient::Values::DeleteDynamicValueResponse.from_json(json_object: response.body)
      end
    end
  end
end
