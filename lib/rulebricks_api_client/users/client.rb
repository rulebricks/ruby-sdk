# frozen_string_literal: true
require_relative "../../requests"
require_relative "groups/client"
require_relative "types/user_invite_request_role"
require_relative "../types/user_invite_response"
require "async"
require_relative "../../requests"

module RulebricksApiClient
  class UsersClient
  # @return [RulebricksApiClient::RequestClient] 
    attr_reader :request_client
  # @return [RulebricksApiClient::Users::GroupsClient] 
    attr_reader :groups


# Operations for managing users on your team and their permissions
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::UsersClient]
    def initialize(request_client:)
      @request_client = request_client
      @groups = RulebricksApiClient::Users::GroupsClient.new(request_client: request_client)
    end
# Invite a new user to the organization or update role or access group data for an
#  existing user.
    #
    # @param email [String] Email of the user to invite.
    # @param role [RulebricksApiClient::Users::UserInviteRequestRole] System or custom role ID to assign to the user. Available system roles include
#  'admin', 'editor', and 'developer'.
    # @param access_groups [Array<String>] List of access group names or IDs to assign to the user. All specified groups
#  must exist in your organization.
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::UserInviteResponse]
    # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.users.invite(
#    email: "newuser@example.com",
#    role: DEVELOPER,
#    access_groups: ["group1", "group2"]
#  )
    def invite(email:, role: nil, access_groups: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), email: email, role: role, accessGroups: access_groups }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/users/invite"
end
      RulebricksApiClient::UserInviteResponse.from_json(json_object: response.body)
    end
  end
  class AsyncUsersClient
  # @return [RulebricksApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [RulebricksApiClient::Users::GroupsClient] 
    attr_reader :groups


# Operations for managing users on your team and their permissions
    #
    # @param request_client [RulebricksApiClient::RequestClient] 
    # @return [RulebricksApiClient::AsyncUsersClient]
    def initialize(request_client:)
      @request_client = request_client
      @groups = RulebricksApiClient::Users::AsyncGroupsClient.new(request_client: request_client)
    end
# Invite a new user to the organization or update role or access group data for an
#  existing user.
    #
    # @param email [String] Email of the user to invite.
    # @param role [RulebricksApiClient::Users::UserInviteRequestRole] System or custom role ID to assign to the user. Available system roles include
#  'admin', 'editor', and 'developer'.
    # @param access_groups [Array<String>] List of access group names or IDs to assign to the user. All specified groups
#  must exist in your organization.
    # @param request_options [RulebricksApiClient::RequestOptions] 
    # @return [RulebricksApiClient::UserInviteResponse]
    # @example
#  api = RulebricksApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: RulebricksApiClient::Environment::DEFAULT,
#    api_key: "YOUR_API_KEY"
#  )
#  api.users.invite(
#    email: "newuser@example.com",
#    role: DEVELOPER,
#    access_groups: ["group1", "group2"]
#  )
    def invite(email:, role: nil, access_groups: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), email: email, role: role, accessGroups: access_groups }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/admin/users/invite"
end
        RulebricksApiClient::UserInviteResponse.from_json(json_object: response.body)
      end
    end
  end
end