# frozen_string_literal: true

module Rulebricks
  module Types
    # Execution settings for a condition row.
    class RuleImportRowSettings < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :group_id, -> { String }, optional: false, nullable: true, api_name: "groupId"

      field :priority, -> { Integer }, optional: false, nullable: false

      field :schedule, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false

      field :or_, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "or"
    end
  end
end
