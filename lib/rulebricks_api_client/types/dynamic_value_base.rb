# frozen_string_literal: true
require_relative "rule_usage"
require "ostruct"
require "json"

module RulebricksApiClient
  class DynamicValueBase
  # @return [String] Unique identifier for the dynamic value.
    attr_reader :id
  # @return [String] Name of the dynamic value.
    attr_reader :name
  # @return [Array<RulebricksApiClient::RuleUsage>] Rules that use this dynamic value.
    attr_reader :usages
  # @return [Array<String>] Access groups assigned to this value.
    attr_reader :access_groups
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for the dynamic value.
    # @param name [String] Name of the dynamic value.
    # @param usages [Array<RulebricksApiClient::RuleUsage>] Rules that use this dynamic value.
    # @param access_groups [Array<String>] Access groups assigned to this value.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::DynamicValueBase]
    def initialize(id: OMIT, name: OMIT, usages: OMIT, access_groups: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @usages = usages if usages != OMIT
      @access_groups = access_groups if access_groups != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "usages": usages, "accessGroups": access_groups }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DynamicValueBase
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::DynamicValueBase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      usages = parsed_json["usages"]&.map do | item |
  item = item.to_json
  RulebricksApiClient::RuleUsage.from_json(json_object: item)
end
      access_groups = parsed_json["accessGroups"]
      new(
        id: id,
        name: name,
        usages: usages,
        access_groups: access_groups,
        additional_properties: struct
      )
    end
# Serialize an instance of DynamicValueBase to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.usages&.is_a?(Array) != false || raise("Passed value for field obj.usages is not the expected type, validation failed.")
      obj.access_groups&.is_a?(Array) != false || raise("Passed value for field obj.access_groups is not the expected type, validation failed.")
    end
  end
end