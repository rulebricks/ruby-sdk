# frozen_string_literal: true

module Rulebricks
  module Types
    module CascadeResultStatus
      extend Rulebricks::Internal::Types::Enum

      SOLVED = "solved"
      ERROR = "error"
    end
  end
end
