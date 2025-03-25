# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/folder_list_response"
require "json"
require_relative "../../types/folder"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module RulebricksApiClient
  module Assets
    class FoldersClient
    # @return [RulebricksApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Assets::FoldersClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieve all rule folders for the authenticated user.
      #
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::FOLDER_LIST_RESPONSE]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.folders.list
      def list(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/folders"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          RulebricksApiClient::Folder.from_json(json_object: item)
        end
      end
# Create a new rule folder or update an existing one for the authenticated user.
      #
      # @param id [String] Folder ID (required for updates, omit for creation)
      # @param name [String] Name of the folder
      # @param description [String] Description of the folder
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::Folder]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.folders.upsert(name: "Marketing Rules", description: "Rules for marketing automation workflows")
      def upsert(id: nil, name:, description: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), id: id, name: name, description: description }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/folders"
end
        RulebricksApiClient::Folder.from_json(json_object: response.body)
      end
# Delete a specific rule folder for the authenticated user. This does not delete
#  the rules within the folder.
      #
      # @param id [String] ID of the folder to delete
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::Folder]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.folders.delete(id: "abc123")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/folders"
end
        RulebricksApiClient::Folder.from_json(json_object: response.body)
      end
    end
    class AsyncFoldersClient
    # @return [RulebricksApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [RulebricksApiClient::RequestClient] 
      # @return [RulebricksApiClient::Assets::AsyncFoldersClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieve all rule folders for the authenticated user.
      #
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::FOLDER_LIST_RESPONSE]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.folders.list
      def list(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/folders"
end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do | item |
            item = item.to_json
            RulebricksApiClient::Folder.from_json(json_object: item)
          end
        end
      end
# Create a new rule folder or update an existing one for the authenticated user.
      #
      # @param id [String] Folder ID (required for updates, omit for creation)
      # @param name [String] Name of the folder
      # @param description [String] Description of the folder
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::Folder]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.folders.upsert(name: "Marketing Rules", description: "Rules for marketing automation workflows")
      def upsert(id: nil, name:, description: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), id: id, name: name, description: description }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/folders"
end
          RulebricksApiClient::Folder.from_json(json_object: response.body)
        end
      end
# Delete a specific rule folder for the authenticated user. This does not delete
#  the rules within the folder.
      #
      # @param id [String] ID of the folder to delete
      # @param request_options [RulebricksApiClient::RequestOptions] 
      # @return [RulebricksApiClient::Folder]
      # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.assets.folders.delete(id: "abc123")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/folders"
end
          RulebricksApiClient::Folder.from_json(json_object: response.body)
        end
      end
    end
  end
end