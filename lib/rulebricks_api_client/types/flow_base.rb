# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
  class FlowBase
  # @return [String] The unique identifier for the flow.
    attr_reader :id
  # @return [String] The name of the flow.
    attr_reader :name
  # @return [String] The description of the flow.
    attr_reader :description
  # @return [String] The unique slug for the flow used in API requests.
    attr_reader :slug
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique identifier for the flow.
    # @param name [String] The name of the flow.
    # @param description [String] The description of the flow.
    # @param slug [String] The unique slug for the flow used in API requests.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::FlowBase]
    def initialize(id: OMIT, name: OMIT, description: OMIT, slug: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @slug = slug if slug != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "description": description, "slug": slug }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FlowBase
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::FlowBase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      slug = parsed_json["slug"]
      new(
        id: id,
        name: name,
        description: description,
        slug: slug,
        additional_properties: struct
      )
    end
# Serialize an instance of FlowBase to a JSON object
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
      obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
    end
  end
end