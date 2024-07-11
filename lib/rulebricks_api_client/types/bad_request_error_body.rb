# frozen_string_literal: true

require "ostruct"
require "json"

module RulebricksApiClient
  class BadRequestErrorBody
    # @return [String] Error message describing the issue with the request.
    attr_reader :error
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param error [String] Error message describing the issue with the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::BadRequestErrorBody]
    def initialize(error: OMIT, additional_properties: nil)
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "error": error }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of BadRequestErrorBody
    #
    # @param json_object [String]
    # @return [RulebricksApiClient::BadRequestErrorBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      error = struct["error"]
      new(error: error, additional_properties: struct)
    end

    # Serialize an instance of BadRequestErrorBody to a JSON object
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
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
    end
  end
end
