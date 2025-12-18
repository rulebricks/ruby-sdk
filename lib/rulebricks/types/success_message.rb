# frozen_string_literal: true

module Rulebricks
  module Types
    class SuccessMessage < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
    end
  end
end
