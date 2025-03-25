# frozen_string_literal: true
require "ostruct"
require "json"

module RulebricksApiClient
  class DecisionLogRequest
  # @return [String] IP address of the requester
    attr_reader :ip
  # @return [String] HTTP method used
    attr_reader :method
  # @return [String] Name of the rule executed
    attr_reader :name
  # @return [String] API endpoint called
    attr_reader :endpoint
  # @return [Hash{String => Array}] 
    attr_reader :params
  # @return [Object] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ip [String] IP address of the requester
    # @param method [String] HTTP method used
    # @param name [String] Name of the rule executed
    # @param endpoint [String] API endpoint called
    # @param params [Hash{String => Array}] 
    # @param data [Object] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RulebricksApiClient::DecisionLogRequest]
    def initialize(ip: OMIT, method: OMIT, name: OMIT, endpoint: OMIT, params: OMIT, data: OMIT, additional_properties: nil)
      @ip = ip if ip != OMIT
      @method = method if method != OMIT
      @name = name if name != OMIT
      @endpoint = endpoint if endpoint != OMIT
      @params = params if params != OMIT
      @data = data if data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "ip": ip, "method": method, "name": name, "endpoint": endpoint, "params": params, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DecisionLogRequest
    #
    # @param json_object [String] 
    # @return [RulebricksApiClient::DecisionLogRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      ip = parsed_json["ip"]
      method = parsed_json["method"]
      name = parsed_json["name"]
      endpoint = parsed_json["endpoint"]
      params = parsed_json["params"]
      data = parsed_json["data"]
      new(
        ip: ip,
        method: method,
        name: name,
        endpoint: endpoint,
        params: params,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of DecisionLogRequest to a JSON object
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
      obj.ip&.is_a?(String) != false || raise("Passed value for field obj.ip is not the expected type, validation failed.")
      obj.method&.is_a?(String) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.endpoint&.is_a?(String) != false || raise("Passed value for field obj.endpoint is not the expected type, validation failed.")
      obj.params&.is_a?(Hash) != false || raise("Passed value for field obj.params is not the expected type, validation failed.")
      obj.data&.is_a?(Object) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
    end
  end
end