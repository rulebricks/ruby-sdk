# frozen_string_literal: true

require "ostruct"
require "json"

module RulebricksApiClient
  class Assets
    class UsageResponse
      # @return [String] The current plan of the organization.
      attr_reader :plan
      # @return [String] The start date of the current monthly period.
      attr_reader :monthly_period_start
      # @return [String] The end date of the current monthly period.
      attr_reader :monthly_period_end
      # @return [Float] The number of rule executions used this month.
      attr_reader :monthly_executions_usage
      # @return [Float] The total number of rule executions allowed this month.
      attr_reader :monthly_executions_limit
      # @return [Float] The number of rule executions remaining this month.
      attr_reader :monthly_executions_remaining
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param plan [String] The current plan of the organization.
      # @param monthly_period_start [String] The start date of the current monthly period.
      # @param monthly_period_end [String] The end date of the current monthly period.
      # @param monthly_executions_usage [Float] The number of rule executions used this month.
      # @param monthly_executions_limit [Float] The total number of rule executions allowed this month.
      # @param monthly_executions_remaining [Float] The number of rule executions remaining this month.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Assets::UsageResponse]
      def initialize(plan: OMIT, monthly_period_start: OMIT, monthly_period_end: OMIT, monthly_executions_usage: OMIT,
                     monthly_executions_limit: OMIT, monthly_executions_remaining: OMIT, additional_properties: nil)
        @plan = plan if plan != OMIT
        @monthly_period_start = monthly_period_start if monthly_period_start != OMIT
        @monthly_period_end = monthly_period_end if monthly_period_end != OMIT
        @monthly_executions_usage = monthly_executions_usage if monthly_executions_usage != OMIT
        @monthly_executions_limit = monthly_executions_limit if monthly_executions_limit != OMIT
        @monthly_executions_remaining = monthly_executions_remaining if monthly_executions_remaining != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "plan": plan,
          "monthly_period_start": monthly_period_start,
          "monthly_period_end": monthly_period_end,
          "monthly_executions_usage": monthly_executions_usage,
          "monthly_executions_limit": monthly_executions_limit,
          "monthly_executions_remaining": monthly_executions_remaining
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of UsageResponse
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Assets::UsageResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        plan = struct["plan"]
        monthly_period_start = struct["monthly_period_start"]
        monthly_period_end = struct["monthly_period_end"]
        monthly_executions_usage = struct["monthly_executions_usage"]
        monthly_executions_limit = struct["monthly_executions_limit"]
        monthly_executions_remaining = struct["monthly_executions_remaining"]
        new(
          plan: plan,
          monthly_period_start: monthly_period_start,
          monthly_period_end: monthly_period_end,
          monthly_executions_usage: monthly_executions_usage,
          monthly_executions_limit: monthly_executions_limit,
          monthly_executions_remaining: monthly_executions_remaining,
          additional_properties: struct
        )
      end

      # Serialize an instance of UsageResponse to a JSON object
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
        obj.plan&.is_a?(String) != false || raise("Passed value for field obj.plan is not the expected type, validation failed.")
        obj.monthly_period_start&.is_a?(String) != false || raise("Passed value for field obj.monthly_period_start is not the expected type, validation failed.")
        obj.monthly_period_end&.is_a?(String) != false || raise("Passed value for field obj.monthly_period_end is not the expected type, validation failed.")
        obj.monthly_executions_usage&.is_a?(Float) != false || raise("Passed value for field obj.monthly_executions_usage is not the expected type, validation failed.")
        obj.monthly_executions_limit&.is_a?(Float) != false || raise("Passed value for field obj.monthly_executions_limit is not the expected type, validation failed.")
        obj.monthly_executions_remaining&.is_a?(Float) != false || raise("Passed value for field obj.monthly_executions_remaining is not the expected type, validation failed.")
      end
    end
  end
end
