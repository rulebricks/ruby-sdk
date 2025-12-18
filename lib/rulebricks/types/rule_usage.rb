# frozen_string_literal: true

module Rulebricks
  module Types
    class RuleUsage < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :slug, -> { String }, optional: true, nullable: false
      field :published, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
