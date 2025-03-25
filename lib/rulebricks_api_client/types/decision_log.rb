# frozen_string_literal: true
require_relative "decision_log_request"
require_relative "decision_log_response"
require_relative "decision_log_decision"
require "ostruct"
require "json"

module RulebricksApiClient
  class DecisionLog
  # @return [RulebricksApiClient::DecisionLogRequest] 
    attr_reader :request
  # @return [RulebricksApiClient::DecisionLogResponse] 
    attr_reader :response
  # @return [RulebricksApiClient::DecisionLogDecision] 
    attr_reader :decision
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param request [RulebricksApiClient::DecisionLogRequest] 
    # @param response [RulebricksApiClient::DecisionLogResponse] 
    # @param decision [RulebricksApiClient::DecisionLogDecision] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::DecisionLog]
    def initialize(request: OMIT, response: OMIT, decision: OMIT, additional_properties: nil)
      @request = request if request != OMIT
      @response = response if response != OMIT
      @decision = decision if decision != OMIT
      @additional_properties = additional_properties
      @_field_set = { "request": request, "response": response, "decision": decision }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DecisionLog
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::DecisionLog]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["request"].nil?
        request = parsed_json["request"].to_json
        request = RulebricksApiClient::DecisionLogRequest.from_json(json_object: request)
      else
        request = nil
      end
      unless parsed_json["response"].nil?
        response = parsed_json["response"].to_json
        response = RulebricksApiClient::DecisionLogResponse.from_json(json_object: response)
      else
        response = nil
      end
      unless parsed_json["decision"].nil?
        decision = parsed_json["decision"].to_json
        decision = RulebricksApiClient::DecisionLogDecision.from_json(json_object: decision)
      else
        decision = nil
      end
      new(
        request: request,
        response: response,
        decision: decision,
        additional_properties: struct
      )
    end
# Serialize an instance of DecisionLog to a JSON object
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
      obj.request.nil? || RulebricksApiClient::DecisionLogRequest.validate_raw(obj: obj.request)
      obj.response.nil? || RulebricksApiClient::DecisionLogResponse.validate_raw(obj: obj.response)
      obj.decision.nil? || RulebricksApiClient::DecisionLogDecision.validate_raw(obj: obj.decision)
    end
  end
end