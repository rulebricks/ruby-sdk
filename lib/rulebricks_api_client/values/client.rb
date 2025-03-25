# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/dynamic_value_list_response"
require "json"
require_relative "../types/success_message"
require "async"
require "async"
require "async"
require_relative "../../requests"

module RulebricksApiClient
  class ValuesClient
  # @return [RulebricksApiClient::RequestClient] 
    attr_reader :request_client


# Operations for managing dynamic values referenced in rules
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::ValuesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve all dynamic values for the authenticated user.
    #
    # @param name [String] Name of a specific dynamic value to retrieve data for
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::DYNAMIC_VALUE_LIST_RESPONSE]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.values.list
    def list(name: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["x-api-key"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "name": name }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        RulebricksApiClient::DynamicValue.from_json(json_object: item)
      end
    end
# Update existing dynamic values or add new ones for the authenticated user.
    #
    # @param values [Hash{String => RulebricksApiClient::Values::UpdateValuesRequestValuesValue}] A flat dictionary of keys and values to update or add.
    # @param access_groups [Array<String>] Optional array of access group names or IDs. If omitted and user belongs to
#  access groups, values will be assigned to all user's access groups. Required if
#  values should be restricted to specific access groups.
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::DYNAMIC_VALUE_LIST_RESPONSE]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.values.update(values: { "Favorite Color": "blue", "Age": 30, "Is Student": false, "Hobbies": ["reading", "cycling"] }, access_groups: ["marketing", "developers"])
    def update(values:, access_groups: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), values: values, accessGroups: access_groups }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        RulebricksApiClient::DynamicValue.from_json(json_object: item)
      end
    end
# Delete a specific dynamic value for the authenticated user by its ID.
    #
    # @param id [String] ID of the dynamic value to delete
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::SuccessMessage]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.values.delete(id: "id")
    def delete(id:, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["x-api-key"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "id": id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
end
      RulebricksApiClient::SuccessMessage.from_json(json_object: response.body)
    end
  end
  class AsyncValuesClient
  # @return [RulebricksApiClient::AsyncRequestClient] 
    attr_reader :request_client


# Operations for managing dynamic values referenced in rules
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::AsyncValuesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve all dynamic values for the authenticated user.
    #
    # @param name [String] Name of a specific dynamic value to retrieve data for
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::DYNAMIC_VALUE_LIST_RESPONSE]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.values.list
    def list(name: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["x-api-key"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "name": name }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          RulebricksApiClient::DynamicValue.from_json(json_object: item)
        end
      end
    end
# Update existing dynamic values or add new ones for the authenticated user.
    #
    # @param values [Hash{String => RulebricksApiClient::Values::UpdateValuesRequestValuesValue}] A flat dictionary of keys and values to update or add.
    # @param access_groups [Array<String>] Optional array of access group names or IDs. If omitted and user belongs to
#  access groups, values will be assigned to all user's access groups. Required if
#  values should be restricted to specific access groups.
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::DYNAMIC_VALUE_LIST_RESPONSE]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.values.update(values: { "Favorite Color": "blue", "Age": 30, "Is Student": false, "Hobbies": ["reading", "cycling"] }, access_groups: ["marketing", "developers"])
    def update(values:, access_groups: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), values: values, accessGroups: access_groups }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          RulebricksApiClient::DynamicValue.from_json(json_object: item)
        end
      end
    end
# Delete a specific dynamic value for the authenticated user by its ID.
    #
    # @param id [String] ID of the dynamic value to delete
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::SuccessMessage]
    # @example
#  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
#  api.values.delete(id: "id")
    def delete(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["x-api-key"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "id": id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/values"
end
        RulebricksApiClient::SuccessMessage.from_json(json_object: response.body)
      end
    end
  end
end