# frozen_string_literal: true

module Rulebricks
  module Values
    module Types
      class SyncValuesRequest < Internal::Types::Model
        field :collection, -> { String }, optional: false, nullable: false

        field :values, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :sync_id, -> { String }, optional: true, nullable: false

        field :complete, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :permanently_delete, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :dry_run, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :metadata_by_name, -> { Internal::Types::Hash[String, Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      end
    end
  end
end
