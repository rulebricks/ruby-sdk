# frozen_string_literal: true
require "json"
require_relative "bulk_rule_response_item_error"

module RulebricksApiClient
# Individual response item from a bulk rule execution
  class BulkRuleResponseItem


# Deserialize a JSON object to an instance of BulkRuleResponseItem
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::BulkRuleResponseItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        struct.is_a?(Hash) != false || raise("Passed value for field struct is not the expected type, validation failed.")
        unless struct.nil?
  return struct
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        RulebricksApiClient::BulkRuleResponseItemError.validate_raw(obj: struct)
        unless struct.nil?
  return RulebricksApiClient::BulkRuleResponseItemError.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return obj.is_a?(Hash) != false || raise("Passed value for field obj is not the expected type, validation failed.")
      rescue StandardError
        # noop
      end
      begin
        return RulebricksApiClient::BulkRuleResponseItemError.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end