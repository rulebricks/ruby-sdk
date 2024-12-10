# frozen_string_literal: true

require "date"
require_relative "list_rules_response_item_folder"
require "ostruct"
require "json"

module RulebricksApiClient
  class Assets
    class ListRulesResponseItem
      # @return [String] The unique identifier for the rule.
      attr_reader :id
      # @return [DateTime] The date this rule was created.
      attr_reader :created_at
      # @return [String] The name of the rule.
      attr_reader :name
      # @return [String] The description of the rule.
      attr_reader :description
      # @return [String] The unique slug for the rule used in API requests.
      attr_reader :slug
      # @return [RulebricksApiClient::Assets::ListRulesResponseItemFolder] The folder containing this rule
      attr_reader :folder
      # @return [Hash{String => Object}] The published request schema for the rule.
      attr_reader :request_schema
      # @return [Hash{String => Object}] The published response schema for the rule.
      attr_reader :response_schema
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] The unique identifier for the rule.
      # @param created_at [DateTime] The date this rule was created.
      # @param name [String] The name of the rule.
      # @param description [String] The description of the rule.
      # @param slug [String] The unique slug for the rule used in API requests.
      # @param folder [RulebricksApiClient::Assets::ListRulesResponseItemFolder] The folder containing this rule
      # @param request_schema [Hash{String => Object}] The published request schema for the rule.
      # @param response_schema [Hash{String => Object}] The published response schema for the rule.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Assets::ListRulesResponseItem]
      def initialize(id: OMIT, created_at: OMIT, name: OMIT, description: OMIT, slug: OMIT, folder: OMIT,
                     request_schema: OMIT, response_schema: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @created_at = created_at if created_at != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @slug = slug if slug != OMIT
        @folder = folder if folder != OMIT
        @request_schema = request_schema if request_schema != OMIT
        @response_schema = response_schema if response_schema != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "created_at": created_at,
          "name": name,
          "description": description,
          "slug": slug,
          "folder": folder,
          "request_schema": request_schema,
          "response_schema": response_schema
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ListRulesResponseItem
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Assets::ListRulesResponseItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        name = struct["name"]
        description = struct["description"]
        slug = struct["slug"]
        if parsed_json["folder"].nil?
          folder = nil
        else
          folder = parsed_json["folder"].to_json
          folder = RulebricksApiClient::Assets::ListRulesResponseItemFolder.from_json(json_object: folder)
        end
        request_schema = struct["request_schema"]
        response_schema = struct["response_schema"]
        new(
          id: id,
          created_at: created_at,
          name: name,
          description: description,
          slug: slug,
          folder: folder,
          request_schema: request_schema,
          response_schema: response_schema,
          additional_properties: struct
        )
      end

      # Serialize an instance of ListRulesResponseItem to a JSON object
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
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
        obj.folder.nil? || RulebricksApiClient::Assets::ListRulesResponseItemFolder.validate_raw(obj: obj.folder)
        obj.request_schema&.is_a?(Hash) != false || raise("Passed value for field obj.request_schema is not the expected type, validation failed.")
        obj.response_schema&.is_a?(Hash) != false || raise("Passed value for field obj.response_schema is not the expected type, validation failed.")
      end
    end
  end
end
