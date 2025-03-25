# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
  class DecisionLogDecisionConditionsItemValue
  # @return [Boolean] 
    attr_reader :result
  # @return [String] 
    attr_reader :err
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param result [Boolean] 
    # @param err [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::DecisionLogDecisionConditionsItemValue]
    def initialize(result: OMIT, err: OMIT, additional_properties: nil)
      @result = result if result != OMIT
      @err = err if err != OMIT
      @additional_properties = additional_properties
      @_field_set = { "result": result, "err": err }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  DecisionLogDecisionConditionsItemValue
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::DecisionLogDecisionConditionsItemValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      result = parsed_json["result"]
      err = parsed_json["err"]
      new(
        result: result,
        err: err,
        additional_properties: struct
      )
    end
# Serialize an instance of DecisionLogDecisionConditionsItemValue to a JSON object
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
      obj.result&.is_a?(Boolean) != false || raise("Passed value for field obj.result is not the expected type, validation failed.")
      obj.err&.is_a?(String) != false || raise("Passed value for field obj.err is not the expected type, validation failed.")
    end
  end
end