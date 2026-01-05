# frozen_string_literal: true

module Rulebricks
  module Types
    class DynamicValue < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :value, -> { Rulebricks::Types::DynamicValueValue }, optional: true, nullable: false
      field :usages, -> { Internal::Types::Array[Rulebricks::Types::RuleUsage] }, optional: true, nullable: false
      field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
