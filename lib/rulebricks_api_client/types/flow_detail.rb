# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module RulebricksApiClient
  class FlowDetail
  # @return [Boolean] Whether the flow is published.
    attr_reader :published
  # @return [DateTime] The date this flow was last updated.
    attr_reader :updated_at
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

    # @param published [Boolean] Whether the flow is published.
    # @param updated_at [DateTime] The date this flow was last updated.
    # @param id [String] The unique identifier for the flow.
    # @param name [String] The name of the flow.
    # @param description [String] The description of the flow.
    # @param slug [String] The unique slug for the flow used in API requests.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::FlowDetail]
    def initialize(published: OMIT, updated_at: OMIT, id: OMIT, name: OMIT, description: OMIT, slug: OMIT, additional_properties: nil)
      @published = published if published != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @id = id if id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @slug = slug if slug != OMIT
      @additional_properties = additional_properties
      @_field_set = { "published": published, "updated_at": updated_at, "id": id, "name": name, "description": description, "slug": slug }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FlowDetail
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::FlowDetail]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      published = parsed_json["published"]
      updated_at = unless parsed_json["updated_at"].nil?
  DateTime.parse(parsed_json["updated_at"])
else
  nil
end
      id = parsed_json["id"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      slug = parsed_json["slug"]
      new(
        published: published,
        updated_at: updated_at,
        id: id,
        name: name,
        description: description,
        slug: slug,
        additional_properties: struct
      )
    end
# Serialize an instance of FlowDetail to a JSON object
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
      obj.published&.is_a?(Boolean) != false || raise("Passed value for field obj.published is not the expected type, validation failed.")
      obj.updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
    end
  end
end