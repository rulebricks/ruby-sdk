# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
  class UserInviteResponseUser
  # @return [String] Email of the invited user.
    attr_reader :email
  # @return [String] Role assigned to the user.
    attr_reader :role
  # @return [Array<String>] Access groups assigned to the user.
    attr_reader :access_groups
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] Email of the invited user.
    # @param role [String] Role assigned to the user.
    # @param access_groups [Array<String>] Access groups assigned to the user.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::UserInviteResponseUser]
    def initialize(email: OMIT, role: OMIT, access_groups: OMIT, additional_properties: nil)
      @email = email if email != OMIT
      @role = role if role != OMIT
      @access_groups = access_groups if access_groups != OMIT
      @additional_properties = additional_properties
      @_field_set = { "email": email, "role": role, "accessGroups": access_groups }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UserInviteResponseUser
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::UserInviteResponseUser]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      role = parsed_json["role"]
      access_groups = parsed_json["accessGroups"]
      new(
        email: email,
        role: role,
        access_groups: access_groups,
        additional_properties: struct
      )
    end
# Serialize an instance of UserInviteResponseUser to a JSON object
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
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.role&.is_a?(String) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.access_groups&.is_a?(Array) != false || raise("Passed value for field obj.access_groups is not the expected type, validation failed.")
    end
  end
end