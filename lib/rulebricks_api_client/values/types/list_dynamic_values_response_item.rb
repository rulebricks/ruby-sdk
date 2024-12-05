# frozen_string_literal: true

require_relative "list_dynamic_values_response_item_type"
require_relative "list_dynamic_values_response_item_value"
require_relative "list_dynamic_values_response_item_usages_item"
require "ostruct"
require "json"

module RulebricksApiClient
  class Values
    class ListDynamicValuesResponseItem
      # @return [String] Unique identifier for the dynamic value.
      attr_reader :id
      # @return [String] Name of the dynamic value.
      attr_reader :name
      # @return [RulebricksApiClient::Values::ListDynamicValuesResponseItemType] Data type of the dynamic value.
      attr_reader :type
      # @return [RulebricksApiClient::Values::ListDynamicValuesResponseItemValue] Value of the dynamic value.
      attr_reader :value
      # @return [Array<RulebricksApiClient::Values::ListDynamicValuesResponseItemUsagesItem>]
      attr_reader :usages
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] Unique identifier for the dynamic value.
      # @param name [String] Name of the dynamic value.
      # @param type [RulebricksApiClient::Values::ListDynamicValuesResponseItemType] Data type of the dynamic value.
      # @param value [RulebricksApiClient::Values::ListDynamicValuesResponseItemValue] Value of the dynamic value.
      # @param usages [Array<RulebricksApiClient::Values::ListDynamicValuesResponseItemUsagesItem>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Values::ListDynamicValuesResponseItem]
      def initialize(id: OMIT, name: OMIT, type: OMIT, value: OMIT, usages: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @name = name if name != OMIT
        @type = type if type != OMIT
        @value = value if value != OMIT
        @usages = usages if usages != OMIT
        @additional_properties = additional_properties
        @_field_set = { "id": id, "name": name, "type": type, "value": value, "usages": usages }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ListDynamicValuesResponseItem
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Values::ListDynamicValuesResponseItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        name = struct["name"]
        type = struct["type"]
        if parsed_json["value"].nil?
          value = nil
        else
          value = parsed_json["value"].to_json
          value = RulebricksApiClient::Values::ListDynamicValuesResponseItemValue.from_json(json_object: value)
        end
        usages = parsed_json["usages"]&.map do |item|
          item = item.to_json
          RulebricksApiClient::Values::ListDynamicValuesResponseItemUsagesItem.from_json(json_object: item)
        end
        new(
          id: id,
          name: name,
          type: type,
          value: value,
          usages: usages,
          additional_properties: struct
        )
      end

      # Serialize an instance of ListDynamicValuesResponseItem to a JSON object
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
        obj.type&.is_a?(RulebricksApiClient::Values::ListDynamicValuesResponseItemType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.value.nil? || RulebricksApiClient::Values::ListDynamicValuesResponseItemValue.validate_raw(obj: obj.value)
        obj.usages&.is_a?(Array) != false || raise("Passed value for field obj.usages is not the expected type, validation failed.")
      end
    end
  end
end
