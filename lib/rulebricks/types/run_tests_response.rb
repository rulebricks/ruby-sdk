# frozen_string_literal: true

module Rulebricks
  module Types
    class RunTestsResponse < Internal::Types::Model
      field :rule, -> { String }, optional: true, nullable: false

      field :flow, -> { String }, optional: true, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false

      field :passed, -> { Integer }, optional: false, nullable: false

      field :failed, -> { Integer }, optional: false, nullable: false

      field :pass_percentage, -> { String }, optional: false, nullable: false

      field :critical_failure, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :failed_tests, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :critical_failed_tests, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :results, -> { Internal::Types::Array[Rulebricks::Types::RunTestsResponseResultsItem] }, optional: false, nullable: false

      field :failures, -> { Internal::Types::Array[Rulebricks::Types::RunTestsResponseFailuresItem] }, optional: true, nullable: false
    end
  end
end
