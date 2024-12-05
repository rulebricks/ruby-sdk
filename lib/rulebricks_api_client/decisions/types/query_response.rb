# frozen_string_literal: true

require "ostruct"
require "json"

module RulebricksApiClient
  class Decisions
    class QueryResponse
      # @return [Array<Hash{String => Object}>]
      attr_reader :data
      # @return [String]
      attr_reader :cursor
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param data [Array<Hash{String => Object}>]
      # @param cursor [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Decisions::QueryResponse]
      def initialize(data: OMIT, cursor: OMIT, additional_properties: nil)
        @data = data if data != OMIT
        @cursor = cursor if cursor != OMIT
        @additional_properties = additional_properties
        @_field_set = { "data": data, "cursor": cursor }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of QueryResponse
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Decisions::QueryResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        data = struct["data"]
        cursor = struct["cursor"]
        new(
          data: data,
          cursor: cursor,
          additional_properties: struct
        )
      end

      # Serialize an instance of QueryResponse to a JSON object
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
        obj.data&.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      end
    end
  end
end
