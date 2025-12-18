# frozen_string_literal: true

module Rulebricks
  module Types
    class Folder < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"
    end
  end
end
