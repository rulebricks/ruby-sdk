# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Objects
      module Types
        class UpdateContextRequestSchemaItem < Internal::Types::Model
          field :key, -> { String }, optional: true, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :type, -> { String }, optional: true, nullable: false
          field :default_value, -> { Object }, optional: true, nullable: false
        end
      end
    end
  end
end
