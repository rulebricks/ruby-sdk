# frozen_string_literal: true

module Rulebricks
  module Types
    # The state of the test after execution.
    class TestTestState < Internal::Types::Model
      field :duration, -> { Integer }, optional: true, nullable: false
      field :response, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :conditions, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      field :http_status, -> { Integer }, optional: true, nullable: false, api_name: "httpStatus"
      field :success_idxs, -> { Internal::Types::Array[Integer] }, optional: true, nullable: false, api_name: "successIdxs"
      field :evaluation_error, -> { Rulebricks::Types::TestTestStateEvaluationError }, optional: true, nullable: false, api_name: "evaluationError"
    end
  end
end
