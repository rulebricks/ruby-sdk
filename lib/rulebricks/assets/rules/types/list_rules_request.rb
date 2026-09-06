# frozen_string_literal: true

module Rulebricks
  module Assets
    module Rules
      module Types
        class ListRulesRequest < Internal::Types::Model
          field :id, -> { String }, optional: true, nullable: false

          field :slug, -> { String }, optional: true, nullable: false

          field :search, -> { String }, optional: true, nullable: false

          field :version, -> { String }, optional: true, nullable: false

          field :folder, -> { String }, optional: true, nullable: false

          field :labels, -> { String }, optional: true, nullable: false

          field :user_group, -> { String }, optional: true, nullable: false

          field :name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
