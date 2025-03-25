# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
# Error response when flow execution fails
  class FlowExecutionError
  # @return [String] Error message describing what went wrong during flow execution
    attr_reader :error
  # @return [String] Identifier of the node where the error occurred (if applicable)
    attr_reader :node
  # @return [Hash{String => Object}] Additional error details
    attr_reader :details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param error [String] Error message describing what went wrong during flow execution
    # @param node [String] Identifier of the node where the error occurred (if applicable)
    # @param details [Hash{String => Object}] Additional error details
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::FlowExecutionError]
    def initialize(error: OMIT, node: OMIT, details: OMIT, additional_properties: nil)
      @error = error if error != OMIT
      @node = node if node != OMIT
      @details = details if details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "error": error, "node": node, "details": details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FlowExecutionError
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::FlowExecutionError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      error = parsed_json["error"]
      node = parsed_json["node"]
      details = parsed_json["details"]
      new(
        error: error,
        node: node,
        details: details,
        additional_properties: struct
      )
    end
# Serialize an instance of FlowExecutionError to a JSON object
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
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      obj.node&.is_a?(String) != false || raise("Passed value for field obj.node is not the expected type, validation failed.")
      obj.details&.is_a?(Hash) != false || raise("Passed value for field obj.details is not the expected type, validation failed.")
    end
  end
end