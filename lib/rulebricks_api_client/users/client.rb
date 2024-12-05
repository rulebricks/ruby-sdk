# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/invite_request_role"
require_relative "types/invite_response"
require_relative "types/list_groups_response_item"
require "json"
require_relative "types/create_group_response"
require "async"

module RulebricksApiClient
  class UsersClient
    # @return [RulebricksApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::RequestClient]
    # @return [RulebricksApiClient::UsersClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Invite a new user to the organization or update groupspermissions for an
    #  existing user.
    #
    # @param email [String] Email of the user to invite.
    # @param role [RulebricksApiClient::Users::InviteRequestRole] Role to assign to the user.
    # @param access_groups [Array<String>] List of access group names or IDs to assign to the user.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Users::InviteResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.users.invite(
    #    email: "newuser@example.com",
    #    role: DEVELOPER,
    #    access_groups: ["group1", "group2"]
    #  )
    def invite(email:, role: nil, access_groups: nil, request_options: nil)
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
          email: email,
          role: role,
          accessGroups: access_groups
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/users/invite"
      end
      RulebricksApiClient::Users::InviteResponse.from_json(json_object: response.body)
    end

    # List all user groups available in your Rulebricks organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Users::ListGroupsResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.users.list_groups
    def list_groups(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/users/groups"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        RulebricksApiClient::Users::ListGroupsResponseItem.from_json(json_object: item)
      end
    end

    # Create a new user group in your Rulebricks organization.
    #
    # @param name [String] Unique name of the user group.
    # @param description [String] Description of the user group.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Users::CreateGroupResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.users.create_group(name: "NewGroup", description: "Description of the new group.")
    def create_group(name:, description: nil, request_options: nil)
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
          description: description
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/users/groups"
      end
      RulebricksApiClient::Users::CreateGroupResponse.from_json(json_object: response.body)
    end
  end

  class AsyncUsersClient
    # @return [RulebricksApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [RulebricksApiClient::AsyncRequestClient]
    # @return [RulebricksApiClient::AsyncUsersClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Invite a new user to the organization or update groupspermissions for an
    #  existing user.
    #
    # @param email [String] Email of the user to invite.
    # @param role [RulebricksApiClient::Users::InviteRequestRole] Role to assign to the user.
    # @param access_groups [Array<String>] List of access group names or IDs to assign to the user.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Users::InviteResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.users.invite(
    #    email: "newuser@example.com",
    #    role: DEVELOPER,
    #    access_groups: ["group1", "group2"]
    #  )
    def invite(email:, role: nil, access_groups: nil, request_options: nil)
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
            email: email,
            role: role,
            accessGroups: access_groups
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/users/invite"
        end
        RulebricksApiClient::Users::InviteResponse.from_json(json_object: response.body)
      end
    end

    # List all user groups available in your Rulebricks organization.
    #
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [Array<RulebricksApiClient::Users::ListGroupsResponseItem>]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.users.list_groups
    def list_groups(request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["x-api-key"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/users/groups"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          RulebricksApiClient::Users::ListGroupsResponseItem.from_json(json_object: item)
        end
      end
    end

    # Create a new user group in your Rulebricks organization.
    #
    # @param name [String] Unique name of the user group.
    # @param description [String] Description of the user group.
    # @param request_options [RulebricksApiClient::RequestOptions]
    # @return [RulebricksApiClient::Users::CreateGroupResponse]
    # @example
    #  api = RulebricksApiClient::Client.new(base_url: "https://api.example.com", api_key: "YOUR_API_KEY")
    #  api.users.create_group(name: "NewGroup", description: "Description of the new group.")
    def create_group(name:, description: nil, request_options: nil)
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
            description: description
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/api/v1/admin/users/groups"
        end
        RulebricksApiClient::Users::CreateGroupResponse.from_json(json_object: response.body)
      end
    end
  end
end
