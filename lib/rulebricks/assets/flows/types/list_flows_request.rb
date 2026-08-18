# frozen_string_literal: true

module Rulebricks
  module Assets
    module Flows
      module Types
        class ListFlowsRequest < Internal::Types::Model
          field :folder, -> { String }, optional: true, nullable: false

          field :user_group, -> { String }, optional: true, nullable: false

          field :name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
