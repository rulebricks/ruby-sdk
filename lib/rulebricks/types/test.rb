# frozen_string_literal: true

module Rulebricks
  module Types
    class Test < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :request, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :response, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :critical, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :error, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :test_state, -> { Rulebricks::Types::TestTestState }, optional: true, nullable: false, api_name: "testState"
      field :last_executed, -> { String }, optional: true, nullable: false, api_name: "lastExecuted"
    end
  end
end
