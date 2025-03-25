# frozen_string_literal: true
require "json"
require_relative "string_value"
require_relative "number_value"
require_relative "boolean_value"
require_relative "list_value"

module RulebricksApiClient
  class DynamicValue
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [RulebricksApiClient::DynamicValue]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of DynamicValue
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::DynamicValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "string"
        member = RulebricksApiClient::StringValue.from_json(json_object: json_object)
      when "number"
        member = RulebricksApiClient::NumberValue.from_json(json_object: json_object)
      when "boolean"
        member = RulebricksApiClient::BooleanValue.from_json(json_object: json_object)
      when "list"
        member = RulebricksApiClient::ListValue.from_json(json_object: json_object)
      else
        member = RulebricksApiClient::StringValue.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "string"
        { **@member.to_json, type: @discriminant }.to_json
      when "number"
        { **@member.to_json, type: @discriminant }.to_json
      when "boolean"
        { **@member.to_json, type: @discriminant }.to_json
      when "list"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "string"
        RulebricksApiClient::StringValue.validate_raw(obj: obj)
      when "number"
        RulebricksApiClient::NumberValue.validate_raw(obj: obj)
      when "boolean"
        RulebricksApiClient::BooleanValue.validate_raw(obj: obj)
      when "list"
        RulebricksApiClient::ListValue.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [RulebricksApiClient::StringValue] 
    # @return [RulebricksApiClient::DynamicValue]
    def self.string(member:)
      new(member: member, discriminant: "string")
    end
    # @param member [RulebricksApiClient::NumberValue] 
    # @return [RulebricksApiClient::DynamicValue]
    def self.number(member:)
      new(member: member, discriminant: "number")
    end
    # @param member [RulebricksApiClient::BooleanValue] 
    # @return [RulebricksApiClient::DynamicValue]
    def self.boolean(member:)
      new(member: member, discriminant: "boolean")
    end
    # @param member [RulebricksApiClient::ListValue] 
    # @return [RulebricksApiClient::DynamicValue]
    def self.list(member:)
      new(member: member, discriminant: "list")
    end
  end
end