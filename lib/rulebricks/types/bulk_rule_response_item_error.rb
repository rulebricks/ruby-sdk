# frozen_string_literal: true

module Rulebricks
  module Types
    class BulkRuleResponseItemError < Internal::Types::Model
      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
