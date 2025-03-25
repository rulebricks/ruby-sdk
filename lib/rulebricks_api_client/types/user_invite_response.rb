# frozen_string_literal: true
require_relative "user_invite_response_user"
require "ostruct"
require "json"

module RulebricksApiClient
  class UserInviteResponse
  # @return [String] Success message indicating whether a new user was invited or an existing user's
#  permissions were updated.
    attr_reader :message
  # @return [RulebricksApiClient::UserInviteResponseUser] 
    attr_reader :user
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [String] Success message indicating whether a new user was invited or an existing user's
#  permissions were updated.
    # @param user [RulebricksApiClient::UserInviteResponseUser] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::UserInviteResponse]
    def initialize(message: OMIT, user: OMIT, additional_properties: nil)
      @message = message if message != OMIT
      @user = user if user != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "user": user }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UserInviteResponse
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::UserInviteResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]
      unless parsed_json["user"].nil?
        user = parsed_json["user"].to_json
        user = RulebricksApiClient::UserInviteResponseUser.from_json(json_object: user)
      else
        user = nil
      end
      new(
        message: message,
        user: user,
        additional_properties: struct
      )
    end
# Serialize an instance of UserInviteResponse to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.user.nil? || RulebricksApiClient::UserInviteResponseUser.validate_raw(obj: obj.user)
    end
  end
end