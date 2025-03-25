# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
  class CreateTestRequest
  # @return [String] The name of the test.
    attr_reader :name
  # @return [Hash{String => Object}] The request object for the test.
    attr_reader :request
  # @return [Hash{String => Object}] The expected response object for the test.
    attr_reader :response
  # @return [Boolean] Indicates whether the test is critical.
    attr_reader :critical
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the test.
    # @param request [Hash{String => Object}] The request object for the test.
    # @param response [Hash{String => Object}] The expected response object for the test.
    # @param critical [Boolean] Indicates whether the test is critical.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::CreateTestRequest]
    def initialize(name:, request:, response:, critical:, additional_properties: nil)
      @name = name
      @request = request
      @response = response
      @critical = critical
      @additional_properties = additional_properties
      @_field_set = { "name": name, "request": request, "response": response, "critical": critical }
    end
# Deserialize a JSON object to an instance of CreateTestRequest
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::CreateTestRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      request = parsed_json["request"]
      response = parsed_json["response"]
      critical = parsed_json["critical"]
      new(
        name: name,
        request: request,
        response: response,
        critical: critical,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateTestRequest to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.request.is_a?(Hash) != false || raise("Passed value for field obj.request is not the expected type, validation failed.")
      obj.response.is_a?(Hash) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
      obj.critical.is_a?(Boolean) != false || raise("Passed value for field obj.critical is not the expected type, validation failed.")
    end
  end
end