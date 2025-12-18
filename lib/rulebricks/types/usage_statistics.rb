# frozen_string_literal: true

module Rulebricks
  module Types
    class UsageStatistics < Internal::Types::Model
      field :plan, -> { String }, optional: true, nullable: false
      field :monthly_period_start, -> { String }, optional: true, nullable: false
      field :monthly_period_end, -> { String }, optional: true, nullable: false
      field :monthly_executions_usage, -> { Integer }, optional: true, nullable: false
      field :monthly_executions_limit, -> { Integer }, optional: true, nullable: false
      field :monthly_executions_remaining, -> { Integer }, optional: true, nullable: false
    end
  end
end
