# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
  class ParallelSolveRequestValue
  # @return [String] Slug of the rule to execute
    attr_reader :rule
  # @return [String] Slug of the flow to execute
    attr_reader :flow
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param rule [String] Slug of the rule to execute
    # @param flow [String] Slug of the flow to execute
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::ParallelSolveRequestValue]
    def initialize(rule: OMIT, flow: OMIT, additional_properties: nil)
      @rule = rule if rule != OMIT
      @flow = flow if flow != OMIT
      @additional_properties = additional_properties
      @_field_set = { "$rule": rule, "$flow": flow }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ParallelSolveRequestValue
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::ParallelSolveRequestValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      rule = parsed_json["$rule"]
      flow = parsed_json["$flow"]
      new(
        rule: rule,
        flow: flow,
        additional_properties: struct
      )
    end
# Serialize an instance of ParallelSolveRequestValue to a JSON object
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
      obj.rule&.is_a?(String) != false || raise("Passed value for field obj.rule is not the expected type, validation failed.")
      obj.flow&.is_a?(String) != false || raise("Passed value for field obj.flow is not the expected type, validation failed.")
    end
  end
end