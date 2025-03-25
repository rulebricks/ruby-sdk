# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/success_message"
require_relative "../../types/rule_export"
require "json"
require_relative "../../types/rule_list_response"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module RulebricksApiClient
  module Assets
    class RulesClient
    # @return [RulebricksApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Assets::RulesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Delete a specific rule by its ID.
      #
      # @param id [String] The ID of the rule to delete.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::SuccessMessage]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.rules.delete(id: "id")
      def delete(id:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), id: id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/delete"
end
        RulebricksApiClient::SuccessMessage.from_json(json_object: response.body)
      end
# Export a specific rule by its ID.
      #
      # @param id [String] The ID of the rule to export.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::RULE_EXPORT]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.rules.export(id: "id")
      def export(id:, request_options: nil)
        response = @request_client.conn.get do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/export"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
# Import a rule into the user's account.
      #
      # @param rule [Hash{String => Object}] The rule data to import.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::RULE_EXPORT]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.rules.import(rule: { "key": "value" })
      def import(rule:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), rule: rule }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/import"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
# List all rules in the organization. Optionally filter by folder name or ID.
      #
      # @param folder [String] Filter rules by folder name or folder ID
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::RULE_LIST_RESPONSE]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.rules.list
      def list(folder: nil, request_options: nil)
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["x-api-key"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "folder": folder }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/list"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          RulebricksApiClient::RuleDetail.from_json(json_object: item)
        end
      end
    end
    class AsyncRulesClient
    # @return [RulebricksApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Assets::AsyncRulesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Delete a specific rule by its ID.
      #
      # @param id [String] The ID of the rule to delete.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::SuccessMessage]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.rules.delete(id: "id")
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), id: id }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/delete"
end
          RulebricksApiClient::SuccessMessage.from_json(json_object: response.body)
        end
      end
# Export a specific rule by its ID.
      #
      # @param id [String] The ID of the rule to export.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::RULE_EXPORT]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.rules.export(id: "id")
      def export(id:, request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/export"
end
          parsed_json = JSON.parse(response.body)
          parsed_json
        end
      end
# Import a rule into the user's account.
      #
      # @param rule [Hash{String => Object}] The rule data to import.
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::RULE_EXPORT]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.rules.import(rule: { "key": "value" })
      def import(rule:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), rule: rule }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/import"
end
          parsed_json = JSON.parse(response.body)
          parsed_json
        end
      end
# List all rules in the organization. Optionally filter by folder name or ID.
      #
      # @param folder [String] Filter rules by folder name or folder ID
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::RULE_LIST_RESPONSE]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.rules.list
      def list(folder: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["x-api-key"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "folder": folder }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/rules/list"
end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do | item |
            item = item.to_json
            RulebricksApiClient::RuleDetail.from_json(json_object: item)
          end
        end
      end
    end
  end
end