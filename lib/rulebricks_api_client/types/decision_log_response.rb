# frozen_string_literal: true
require_relative "decision_log"
require "ostruct"
require "json"

module RulebricksApiClient
  class DecisionLogResponse
  # @return [Array<RulebricksApiClient::DecisionLog>] 
    attr_reader :data
  # @return [String] Pagination cursor for next page
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param data [Array<RulebricksApiClient::DecisionLog>] 
    # @param cursor [String] Pagination cursor for next page
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::DecisionLogResponse]
    def initialize(data: OMIT, cursor: OMIT, additional_properties: nil)
      @data = data if data != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "data": data, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DecisionLogResponse
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::DecisionLogResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      data = parsed_json["data"]&.map do | item |
  item = item.to_json
  RulebricksApiClient::DecisionLog.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        data: data,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of DecisionLogResponse to a JSON object
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
      obj.data&.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end