# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
# System limits for dynamic values
  class ValueLimits
  # @return [Integer] Maximum number of value keys per user
    attr_reader :max_keys
  # @return [Integer] Maximum length of a single value in characters
    attr_reader :max_value_length
  # @return [Integer] Maximum total size of all values in bytes
    attr_reader :max_total_size
  # @return [Integer] Maximum length of a key name
    attr_reader :max_key_length
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param max_keys [Integer] Maximum number of value keys per user
    # @param max_value_length [Integer] Maximum length of a single value in characters
    # @param max_total_size [Integer] Maximum total size of all values in bytes
    # @param max_key_length [Integer] Maximum length of a key name
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::ValueLimits]
    def initialize(max_keys: OMIT, max_value_length: OMIT, max_total_size: OMIT, max_key_length: OMIT, additional_properties: nil)
      @max_keys = max_keys if max_keys != OMIT
      @max_value_length = max_value_length if max_value_length != OMIT
      @max_total_size = max_total_size if max_total_size != OMIT
      @max_key_length = max_key_length if max_key_length != OMIT
      @additional_properties = additional_properties
      @_field_set = { "MAX_KEYS": max_keys, "MAX_VALUE_LENGTH": max_value_length, "MAX_TOTAL_SIZE": max_total_size, "MAX_KEY_LENGTH": max_key_length }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ValueLimits
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::ValueLimits]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      max_keys = parsed_json["MAX_KEYS"]
      max_value_length = parsed_json["MAX_VALUE_LENGTH"]
      max_total_size = parsed_json["MAX_TOTAL_SIZE"]
      max_key_length = parsed_json["MAX_KEY_LENGTH"]
      new(
        max_keys: max_keys,
        max_value_length: max_value_length,
        max_total_size: max_total_size,
        max_key_length: max_key_length,
        additional_properties: struct
      )
    end
# Serialize an instance of ValueLimits to a JSON object
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
      obj.max_keys&.is_a?(Integer) != false || raise("Passed value for field obj.max_keys is not the expected type, validation failed.")
      obj.max_value_length&.is_a?(Integer) != false || raise("Passed value for field obj.max_value_length is not the expected type, validation failed.")
      obj.max_total_size&.is_a?(Integer) != false || raise("Passed value for field obj.max_total_size is not the expected type, validation failed.")
      obj.max_key_length&.is_a?(Integer) != false || raise("Passed value for field obj.max_key_length is not the expected type, validation failed.")
    end
  end
end