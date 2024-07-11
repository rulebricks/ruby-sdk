# frozen_string_literal: true

require_relative "list_response_item_request_schema_item"
require_relative "list_response_item_response_schema_item"
require "ostruct"
require "json"

module RulebricksApiClient
  class Rules
    class ListResponseItem
      # @return [String] The unique identifier for the rule.
      attr_reader :id
      # @return [String] The name of the rule.
      attr_reader :name
      # @return [String] The description of the rule.
      attr_reader :description
      # @return [String] The creation date of the rule.
      attr_reader :created_at
      # @return [String] The unique slug for the rule used in API requests.
      attr_reader :slug
      # @return [Array<RulebricksApiClient::Rules::ListResponseItemRequestSchemaItem>]
      attr_reader :request_schema
      # @return [Array<RulebricksApiClient::Rules::ListResponseItemResponseSchemaItem>]
      attr_reader :response_schema
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] The unique identifier for the rule.
      # @param name [String] The name of the rule.
      # @param description [String] The description of the rule.
      # @param created_at [String] The creation date of the rule.
      # @param slug [String] The unique slug for the rule used in API requests.
      # @param request_schema [Array<RulebricksApiClient::Rules::ListResponseItemRequestSchemaItem>]
      # @param response_schema [Array<RulebricksApiClient::Rules::ListResponseItemResponseSchemaItem>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Rules::ListResponseItem]
      def initialize(id: OMIT, name: OMIT, description: OMIT, created_at: OMIT, slug: OMIT, request_schema: OMIT,
                     response_schema: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @created_at = created_at if created_at != OMIT
        @slug = slug if slug != OMIT
        @request_schema = request_schema if request_schema != OMIT
        @response_schema = response_schema if response_schema != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "name": name,
          "description": description,
          "created_at": created_at,
          "slug": slug,
          "request_schema": request_schema,
          "response_schema": response_schema
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ListResponseItem
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Rules::ListResponseItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        name = struct["name"]
        description = struct["description"]
        created_at = struct["created_at"]
        slug = struct["slug"]
        request_schema = parsed_json["request_schema"]&.map do |item|
          item = item.to_json
          RulebricksApiClient::Rules::ListResponseItemRequestSchemaItem.from_json(json_object: item)
        end
        response_schema = parsed_json["response_schema"]&.map do |item|
          item = item.to_json
          RulebricksApiClient::Rules::ListResponseItemResponseSchemaItem.from_json(json_object: item)
        end
        new(
          id: id,
          name: name,
          description: description,
          created_at: created_at,
          slug: slug,
          request_schema: request_schema,
          response_schema: response_schema,
          additional_properties: struct
        )
      end

      # Serialize an instance of ListResponseItem to a JSON object
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
        obj.request_schema&.is_a?(Array) != false || raise("Passed value for field obj.request_schema is not the expected type, validation failed.")
        obj.response_schema&.is_a?(Array) != false || raise("Passed value for field obj.response_schema is not the expected type, validation failed.")
      end
    end
  end
end
