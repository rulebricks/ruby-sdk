# frozen_string_literal: true

module Rulebricks
  module Types
    module ScaleStatusResponseStatus
      extend Rulebricks::Internal::Types::Enum

      IDLE = "idle"
      SCALING = "scaling"
      READY = "ready"
    end
  end
end
