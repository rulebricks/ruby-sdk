# frozen_string_literal: true

module Rulebricks
  module Types
    class Folder < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :user_groups, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
