# frozen_string_literal: true
require_relative "test_test_state_evaluation_error"
require "ostruct"
require "json"

module RulebricksApiClient
# The state of the test after execution.
  class TestTestState
  # @return [Float] Execution time in seconds
    attr_reader :duration
  # @return [Hash{String => Object}] Actual response returned
    attr_reader :response
  # @return [Array<Hash{String => RulebricksApiClient::TestTestStateConditionsItemValue}>] 
    attr_reader :conditions
  # @return [Integer] HTTP status code returned
    attr_reader :http_status
  # @return [Array<Integer>] 
    attr_reader :success_idxs
  # @return [RulebricksApiClient::TestTestStateEvaluationError] Error message or flag indicating if evaluation error occurred
    attr_reader :evaluation_error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param duration [Float] Execution time in seconds
    # @param response [Hash{String => Object}] Actual response returned
    # @param conditions [Array<Hash{String => RulebricksApiClient::TestTestStateConditionsItemValue}>] 
    # @param http_status [Integer] HTTP status code returned
    # @param success_idxs [Array<Integer>] 
    # @param evaluation_error [RulebricksApiClient::TestTestStateEvaluationError] Error message or flag indicating if evaluation error occurred
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::TestTestState]
    def initialize(duration: OMIT, response: OMIT, conditions: OMIT, http_status: OMIT, success_idxs: OMIT, evaluation_error: OMIT, additional_properties: nil)
      @duration = duration if duration != OMIT
      @response = response if response != OMIT
      @conditions = conditions if conditions != OMIT
      @http_status = http_status if http_status != OMIT
      @success_idxs = success_idxs if success_idxs != OMIT
      @evaluation_error = evaluation_error if evaluation_error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "duration": duration, "response": response, "conditions": conditions, "httpStatus": http_status, "successIdxs": success_idxs, "evaluationError": evaluation_error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestTestState
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::TestTestState]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      duration = parsed_json["duration"]
      response = parsed_json["response"]
      conditions = parsed_json["conditions"]&.map do | item |
  item&.transform_values do | value |
  value = value.to_json
  RulebricksApiClient::TestTestStateConditionsItemValue.from_json(json_object: value)
end
end
      http_status = parsed_json["httpStatus"]
      success_idxs = parsed_json["successIdxs"]
      unless parsed_json["evaluationError"].nil?
        evaluation_error = parsed_json["evaluationError"].to_json
        evaluation_error = RulebricksApiClient::TestTestStateEvaluationError.from_json(json_object: evaluation_error)
      else
        evaluation_error = nil
      end
      new(
        duration: duration,
        response: response,
        conditions: conditions,
        http_status: http_status,
        success_idxs: success_idxs,
        evaluation_error: evaluation_error,
        additional_properties: struct
      )
    end
# Serialize an instance of TestTestState to a JSON object
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
      obj.duration&.is_a?(Float) != false || raise("Passed value for field obj.duration is not the expected type, validation failed.")
      obj.response&.is_a?(Hash) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
      obj.http_status&.is_a?(Integer) != false || raise("Passed value for field obj.http_status is not the expected type, validation failed.")
      obj.success_idxs&.is_a?(Array) != false || raise("Passed value for field obj.success_idxs is not the expected type, validation failed.")
      obj.evaluation_error.nil? || RulebricksApiClient::TestTestStateEvaluationError.validate_raw(obj: obj.evaluation_error)
    end
  end
end