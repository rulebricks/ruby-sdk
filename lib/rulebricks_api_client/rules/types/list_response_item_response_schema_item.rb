# frozen_string_literal: true

require "ostruct"
require "json"

module RulebricksApiClient
  class Rules
    class ListResponseItemResponseSchemaItem
      # @return [String] The key for the response field.
      attr_reader :key
      # @return [Boolean] Whether the field is visible in the rule editor.
      attr_reader :show
      # @return [String] The name of the response field.
      attr_reader :name
      # @return [String] The description of the response field.
      attr_reader :description
      # @return [String] The data type of the response field.
      attr_reader :type
      # @return [String] The default value of the response field.
      attr_reader :default_value
      # @return [String] The computed default value of the response field.
      attr_reader :default_computed_value
      # @return [String] The transformation applied to the response field.
      attr_reader :transform
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param key [String] The key for the response field.
      # @param show [Boolean] Whether the field is visible in the rule editor.
      # @param name [String] The name of the response field.
      # @param description [String] The description of the response field.
      # @param type [String] The data type of the response field.
      # @param default_value [String] The default value of the response field.
      # @param default_computed_value [String] The computed default value of the response field.
      # @param transform [String] The transformation applied to the response field.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Rules::ListResponseItemResponseSchemaItem]
      def initialize(key: OMIT, show: OMIT, name: OMIT, description: OMIT, type: OMIT, default_value: OMIT,
                     default_computed_value: OMIT, transform: OMIT, additional_properties: nil)
        @key = key if key != OMIT
        @show = show if show != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @type = type if type != OMIT
        @default_value = default_value if default_value != OMIT
        @default_computed_value = default_computed_value if default_computed_value != OMIT
        @transform = transform if transform != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "key": key,
          "show": show,
          "name": name,
          "description": description,
          "type": type,
          "defaultValue": default_value,
          "defaultComputedValue": default_computed_value,
          "transform": transform
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ListResponseItemResponseSchemaItem
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Rules::ListResponseItemResponseSchemaItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        key = struct["key"]
        show = struct["show"]
        name = struct["name"]
        description = struct["description"]
        type = struct["type"]
        default_value = struct["defaultValue"]
        default_computed_value = struct["defaultComputedValue"]
        transform = struct["transform"]
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

      # Serialize an instance of ListResponseItemResponseSchemaItem to a JSON object
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
        obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
        obj.show&.is_a?(Boolean) != false || raise("Passed value for field obj.show is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.default_value&.is_a?(String) != false || raise("Passed value for field obj.default_value is not the expected type, validation failed.")
        obj.default_computed_value&.is_a?(String) != false || raise("Passed value for field obj.default_computed_value is not the expected type, validation failed.")
        obj.transform&.is_a?(String) != false || raise("Passed value for field obj.transform is not the expected type, validation failed.")
      end
    end
  end
end
