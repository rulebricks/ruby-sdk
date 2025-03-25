# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
  class DecisionLogDecision
  # @return [Array<Hash{String => RulebricksApiClient::DecisionLogDecisionConditionsItemValue}>] 
    attr_reader :conditions
  # @return [Array<Integer>] 
    attr_reader :success_idxs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param conditions [Array<Hash{String => RulebricksApiClient::DecisionLogDecisionConditionsItemValue}>] 
    # @param success_idxs [Array<Integer>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::DecisionLogDecision]
    def initialize(conditions: OMIT, success_idxs: OMIT, additional_properties: nil)
      @conditions = conditions if conditions != OMIT
      @success_idxs = success_idxs if success_idxs != OMIT
      @additional_properties = additional_properties
      @_field_set = { "conditions": conditions, "successIdxs": success_idxs }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DecisionLogDecision
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::DecisionLogDecision]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      conditions = parsed_json["conditions"]&.map do | item |
  item&.transform_values do | value |
  value = value.to_json
  RulebricksApiClient::DecisionLogDecisionConditionsItemValue.from_json(json_object: value)
end
end
      success_idxs = parsed_json["successIdxs"]
      new(
        conditions: conditions,
        success_idxs: success_idxs,
        additional_properties: struct
      )
    end
# Serialize an instance of DecisionLogDecision to a JSON object
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
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
      obj.success_idxs&.is_a?(Array) != false || raise("Passed value for field obj.success_idxs is not the expected type, validation failed.")
    end
  end
end