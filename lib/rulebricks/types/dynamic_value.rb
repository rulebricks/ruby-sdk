# frozen_string_literal: true

module Rulebricks
  module Types
    class DynamicValue < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :value, -> { Object }, optional: true, nullable: false
      field :usages, -> { Internal::Types::Array[Rulebricks::Types::RuleUsage] }, optional: true, nullable: false
      field :access_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "accessGroups"
    end
  end
end
