# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module RulebricksApiClient
  class Tests
    class CreateTestResponse
      # @return [String] Unique identifier for the test.
      attr_reader :id
      # @return [String] The name of the test.
      attr_reader :name
      # @return [Hash{String => Object}] The request object for the test.
      attr_reader :request
      # @return [Hash{String => Object}] The expected response object for the test.
      attr_reader :response
      # @return [Boolean] Indicates whether the test is critical.
      attr_reader :critical
      # @return [Boolean] Indicates if the test resulted in an error.
      attr_reader :error
      # @return [Boolean] Indicates if the test was successful.
      attr_reader :success
      # @return [Hash{String => Object}] The state of the test after execution.
      attr_reader :test_state
      # @return [DateTime] The timestamp when the test was last executed.
      attr_reader :last_executed
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] Unique identifier for the test.
      # @param name [String] The name of the test.
      # @param request [Hash{String => Object}] The request object for the test.
      # @param response [Hash{String => Object}] The expected response object for the test.
      # @param critical [Boolean] Indicates whether the test is critical.
      # @param error [Boolean] Indicates if the test resulted in an error.
      # @param success [Boolean] Indicates if the test was successful.
      # @param test_state [Hash{String => Object}] The state of the test after execution.
      # @param last_executed [DateTime] The timestamp when the test was last executed.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Tests::CreateTestResponse]
      def initialize(id:, name:, request:, response:, critical:, error:, success:, test_state: OMIT,
                     last_executed: OMIT, additional_properties: nil)
        @id = id
        @name = name
        @request = request
        @response = response
        @critical = critical
        @error = error
        @success = success
        @test_state = test_state if test_state != OMIT
        @last_executed = last_executed if last_executed != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "name": name,
          "request": request,
          "response": response,
          "critical": critical,
          "error": error,
          "success": success,
          "testState": test_state,
          "lastExecuted": last_executed
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CreateTestResponse
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Tests::CreateTestResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        name = struct["name"]
        request = struct["request"]
        response = struct["response"]
        critical = struct["critical"]
        error = struct["error"]
        success = struct["success"]
        test_state = struct["testState"]
        last_executed = (DateTime.parse(parsed_json["lastExecuted"]) unless parsed_json["lastExecuted"].nil?)
        new(
          id: id,
          name: name,
          request: request,
          response: response,
          critical: critical,
          error: error,
          success: success,
          test_state: test_state,
          last_executed: last_executed,
          additional_properties: struct
        )
      end

      # Serialize an instance of CreateTestResponse to a JSON object
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.request.is_a?(Hash) != false || raise("Passed value for field obj.request is not the expected type, validation failed.")
        obj.response.is_a?(Hash) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
        obj.critical.is_a?(Boolean) != false || raise("Passed value for field obj.critical is not the expected type, validation failed.")
        obj.error.is_a?(Boolean) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
        obj.success.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
        obj.test_state&.is_a?(Hash) != false || raise("Passed value for field obj.test_state is not the expected type, validation failed.")
        obj.last_executed&.is_a?(DateTime) != false || raise("Passed value for field obj.last_executed is not the expected type, validation failed.")
      end
    end
  end
end
