# frozen_string_literal: true
require_relative "schema_field_type"
require_relative "schema_field_default_value"
require "ostruct"
require "json"

module RulebricksApiClient
  class SchemaField
  # @return [String] The unique key for this field.
    attr_reader :key
  # @return [Boolean] Whether this field is visible in the UI.
    attr_reader :show
  # @return [String] Display name for this field.
    attr_reader :name
  # @return [String] Description of this field.
    attr_reader :description
  # @return [RulebricksApiClient::SchemaFieldType] Data type of this field.
    attr_reader :type
  # @return [RulebricksApiClient::SchemaFieldDefaultValue] Default value for this field.
    attr_reader :default_value
  # @return [String] Computed default value for this field.
    attr_reader :default_computed_value
  # @return [String] Transformation expression to apply to this field.
    attr_reader :transform
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The unique key for this field.
    # @param show [Boolean] Whether this field is visible in the UI.
    # @param name [String] Display name for this field.
    # @param description [String] Description of this field.
    # @param type [RulebricksApiClient::SchemaFieldType] Data type of this field.
    # @param default_value [RulebricksApiClient::SchemaFieldDefaultValue] Default value for this field.
    # @param default_computed_value [String] Computed default value for this field.
    # @param transform [String] Transformation expression to apply to this field.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::SchemaField]
    def initialize(key: OMIT, show: OMIT, name: OMIT, description: OMIT, type: OMIT, default_value: OMIT, default_computed_value: OMIT, transform: OMIT, additional_properties: nil)
      @key = key if key != OMIT
      @show = show if show != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @type = type if type != OMIT
      @default_value = default_value if default_value != OMIT
      @default_computed_value = default_computed_value if default_computed_value != OMIT
      @transform = transform if transform != OMIT
      @additional_properties = additional_properties
      @_field_set = { "key": key, "show": show, "name": name, "description": description, "type": type, "defaultValue": default_value, "defaultComputedValue": default_computed_value, "transform": transform }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SchemaField
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::SchemaField]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      show = parsed_json["show"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      type = parsed_json["type"]
      unless parsed_json["defaultValue"].nil?
        default_value = parsed_json["defaultValue"].to_json
        default_value = RulebricksApiClient::SchemaFieldDefaultValue.from_json(json_object: default_value)
      else
        default_value = nil
      end
      default_computed_value = parsed_json["defaultComputedValue"]
      transform = parsed_json["transform"]
      new(
        key: key,
        show: show,
        name: name,
        description: description,
        type: type,
        default_value: default_value,
        default_computed_value: default_computed_value,
        transform: transform,
        additional_properties: struct
      )
    end
# Serialize an instance of SchemaField to a JSON object
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
      obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.show&.is_a?(Boolean) != false || raise("Passed value for field obj.show is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.type&.is_a?(RulebricksApiClient::SchemaFieldType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.default_value.nil? || RulebricksApiClient::SchemaFieldDefaultValue.validate_raw(obj: obj.default_value)
      obj.default_computed_value&.is_a?(String) != false || raise("Passed value for field obj.default_computed_value is not the expected type, validation failed.")
      obj.transform&.is_a?(String) != false || raise("Passed value for field obj.transform is not the expected type, validation failed.")
    end
  end
end