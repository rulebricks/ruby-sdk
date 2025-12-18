# frozen_string_literal: true

module Rulebricks
  module Types
    # Individual response item from a bulk rule execution
    class BulkRuleResponseItem < Internal::Types::Model
      extend Rulebricks::Internal::Types::Union

      member -> { Internal::Types::Hash[String, Object] }
      member -> { Rulebricks::Types::BulkRuleResponseItemError }
    end
  end
end
