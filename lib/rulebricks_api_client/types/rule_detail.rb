# frozen_string_literal: true
require "date"
require_relative "folder"
require_relative "schema_field"
require "ostruct"
require "json"

module RulebricksApiClient
  class RuleDetail
  # @return [DateTime] The date this rule was created.
    attr_reader :created_at
  # @return [RulebricksApiClient::Folder] 
    attr_reader :folder
  # @return [Array<RulebricksApiClient::SchemaField>] The published request schema for the rule.
    attr_reader :request_schema
  # @return [Array<RulebricksApiClient::SchemaField>] The published response schema for the rule.
    attr_reader :response_schema
  # @return [String] The unique identifier for the rule.
    attr_reader :id
  # @return [String] The name of the rule.
    attr_reader :name
  # @return [String] The description of the rule.
    attr_reader :description
  # @return [String] The unique slug for the rule used in API requests.
    attr_reader :slug
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param created_at [DateTime] The date this rule was created.
    # @param folder [RulebricksApiClient::Folder] 
    # @param request_schema [Array<RulebricksApiClient::SchemaField>] The published request schema for the rule.
    # @param response_schema [Array<RulebricksApiClient::SchemaField>] The published response schema for the rule.
    # @param id [String] The unique identifier for the rule.
    # @param name [String] The name of the rule.
    # @param description [String] The description of the rule.
    # @param slug [String] The unique slug for the rule used in API requests.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::RuleDetail]
    def initialize(created_at: OMIT, folder: OMIT, request_schema: OMIT, response_schema: OMIT, id: OMIT, name: OMIT, description: OMIT, slug: OMIT, additional_properties: nil)
      @created_at = created_at if created_at != OMIT
      @folder = folder if folder != OMIT
      @request_schema = request_schema if request_schema != OMIT
      @response_schema = response_schema if response_schema != OMIT
      @id = id if id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @slug = slug if slug != OMIT
      @additional_properties = additional_properties
      @_field_set = { "created_at": created_at, "folder": folder, "request_schema": request_schema, "response_schema": response_schema, "id": id, "name": name, "description": description, "slug": slug }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RuleDetail
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::RuleDetail]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      created_at = unless parsed_json["created_at"].nil?
  DateTime.parse(parsed_json["created_at"])
else
  nil
end
      unless parsed_json["folder"].nil?
        folder = parsed_json["folder"].to_json
        folder = RulebricksApiClient::Folder.from_json(json_object: folder)
      else
        folder = nil
      end
      request_schema = parsed_json["request_schema"]&.map do | item |
  item = item.to_json
  RulebricksApiClient::SchemaField.from_json(json_object: item)
end
      response_schema = parsed_json["response_schema"]&.map do | item |
  item = item.to_json
  RulebricksApiClient::SchemaField.from_json(json_object: item)
end
      id = parsed_json["id"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      slug = parsed_json["slug"]
      new(
        created_at: created_at,
        folder: folder,
        request_schema: request_schema,
        response_schema: response_schema,
        id: id,
        name: name,
        description: description,
        slug: slug,
        additional_properties: struct
      )
    end
# Serialize an instance of RuleDetail to a JSON object
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
      obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.folder.nil? || RulebricksApiClient::Folder.validate_raw(obj: obj.folder)
      obj.request_schema&.is_a?(Array) != false || raise("Passed value for field obj.request_schema is not the expected type, validation failed.")
      obj.response_schema&.is_a?(Array) != false || raise("Passed value for field obj.response_schema is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
    end
  end
end