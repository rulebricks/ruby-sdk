# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module RulebricksApiClient
  class Folder
  # @return [String] Unique identifier for the folder.
    attr_reader :id
  # @return [String] Name of the folder.
    attr_reader :name
  # @return [String] Description of the folder.
    attr_reader :description
  # @return [DateTime] Timestamp of when the folder was last updated.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for the folder.
    # @param name [String] Name of the folder.
    # @param description [String] Description of the folder.
    # @param updated_at [DateTime] Timestamp of when the folder was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::Folder]
    def initialize(id: OMIT, name: OMIT, description: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "description": description, "updatedAt": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Folder
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::Folder]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      updated_at = unless parsed_json["updatedAt"].nil?
  DateTime.parse(parsed_json["updatedAt"])
else
  nil
end
      new(
        id: id,
        name: name,
        description: description,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of Folder to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end