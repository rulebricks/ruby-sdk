# frozen_string_literal: true

require "ostruct"
require "json"

module RulebricksApiClient
  class Assets
    class ListResponseItem
      # @return [String] The unique identifier for the rule.
      attr_reader :id
      # @return [String] The name of the rule.
      attr_reader :name
      # @return [String] The description of the rule.
      attr_reader :description
      # @return [Boolean] Whether the rule is published.
      attr_reader :published
      # @return [String] The unique slug for the rule used in API requests.
      attr_reader :slug
      # @return [String] The date this rule was last updated.
      attr_reader :updated_at
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] The unique identifier for the rule.
      # @param name [String] The name of the rule.
      # @param description [String] The description of the rule.
      # @param published [Boolean] Whether the rule is published.
      # @param slug [String] The unique slug for the rule used in API requests.
      # @param updated_at [String] The date this rule was last updated.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [RulebricksApiClient::Assets::ListResponseItem]
      def initialize(id: OMIT, name: OMIT, description: OMIT, published: OMIT, slug: OMIT, updated_at: OMIT,
                     additional_properties: nil)
        @id = id if id != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @published = published if published != OMIT
        @slug = slug if slug != OMIT
        @updated_at = updated_at if updated_at != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "name": name,
          "description": description,
          "published": published,
          "slug": slug,
          "updated_at": updated_at
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ListResponseItem
      #
      # @param json_object [String]
      # @return [RulebricksApiClient::Assets::ListResponseItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct["id"]
        name = struct["name"]
        description = struct["description"]
        published = struct["published"]
        slug = struct["slug"]
        updated_at = struct["updated_at"]
        new(
          id: id,
          name: name,
          description: description,
          published: published,
          slug: slug,
          updated_at: updated_at,
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
        obj.published&.is_a?(Boolean) != false || raise("Passed value for field obj.published is not the expected type, validation failed.")
        obj.slug&.is_a?(String) != false || raise("Passed value for field obj.slug is not the expected type, validation failed.")
        obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      end
    end
  end
end
