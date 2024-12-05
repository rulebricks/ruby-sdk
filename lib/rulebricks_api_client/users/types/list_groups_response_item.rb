# frozen_string_literal: true

require "ostruct"
require "json"

module RulebricksApiClient
  class Users
    class ListGroupsResponseItem
      # @return [String] Unique identifier of the user group.
      attr_reader :id
      # @return [String] Name of the user group.
      attr_reader :name
      # @return [String] Description of the user group.
      attr_reader :description
      # @return [Array<String>] List of member emails in the user group.
      attr_reader :members
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] Unique identifier of the user group.
      # @param name [String] Name of the user group.
      # @param description [String] Description of the user group.
      # @param members [Array<String>] List of member emails in the user group.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Users::ListGroupsResponseItem]
      def initialize(id: OMIT, name: OMIT, description: OMIT, members: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @members = members if members != OMIT
        @additional_properties = additional_properties
        @_field_set = { "id": id, "name": name, "description": description, "members": members }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ListGroupsResponseItem
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Users::ListGroupsResponseItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct["id"]
        name = struct["name"]
        description = struct["description"]
        members = struct["members"]
        new(
          id: id,
          name: name,
          description: description,
          members: members,
          additional_properties: struct
        )
      end

      # Serialize an instance of ListGroupsResponseItem to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.members&.is_a?(Array) != false || raise("Passed value for field obj.members is not the expected type, validation failed.")
      end
    end
  end
end
