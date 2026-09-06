# frozen_string_literal: true

module Rulebricks
  module Types
    class ContextDerivedField < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :expression, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :type, -> { Rulebricks::Types::ContextDerivedFieldType }, optional: true, nullable: false

      field :default_value, -> { Object }, optional: true, nullable: false
    end
  end
end
