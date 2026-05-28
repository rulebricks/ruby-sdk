# frozen_string_literal: true

module Rulebricks
  module Types
    # Rule object accepted by /admin/rules/import. If `id` is provided, the matching rule is partially updated (all
    # other fields optional). If `id` is omitted, a new rule is created with all other fields required. This object
    # intentionally preserves raw rule document casing (for example, `requestSchema`, `sampleRequest`, and `createdAt`)
    # to support `.rbm` round-tripping.
    class RuleImportPayload < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :stable_id, -> { String }, optional: true, nullable: false

      field :slug, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"

      field :published, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :publish, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "_publish"

      field :unpublish, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "_unpublish"

      field :request_schema, -> { Internal::Types::Array[Rulebricks::Types::RuleImportSchemaField] }, optional: true, nullable: false, api_name: "requestSchema"

      field :response_schema, -> { Internal::Types::Array[Rulebricks::Types::RuleImportSchemaField] }, optional: true, nullable: false, api_name: "responseSchema"

      field :sample_request, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "sampleRequest"

      field :test_request, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "testRequest"

      field :sample_response, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "sampleResponse"

      field :conditions, -> { Internal::Types::Array[Rulebricks::Types::RuleImportConditionRow] }, optional: true, nullable: false

      field :groups, -> { Internal::Types::Hash[String, Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

      field :settings, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :test_suite, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "testSuite"

      field :history, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

      field :published_at, -> { String }, optional: true, nullable: false, api_name: "publishedAt"

      field :published_request_schema, -> { Internal::Types::Array[Rulebricks::Types::RuleImportSchemaField] }, optional: true, nullable: false, api_name: "published_requestSchema"

      field :published_response_schema, -> { Internal::Types::Array[Rulebricks::Types::RuleImportSchemaField] }, optional: true, nullable: false, api_name: "published_responseSchema"

      field :published_conditions, -> { Internal::Types::Array[Rulebricks::Types::RuleImportConditionRow] }, optional: true, nullable: false

      field :published_groups, -> { Internal::Types::Hash[String, Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
    end
  end
end
