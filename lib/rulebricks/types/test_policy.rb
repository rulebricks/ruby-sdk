# frozen_string_literal: true

module Rulebricks
  module Types
    module TestPolicy
      extend Rulebricks::Internal::Types::Enum

      CONTAINS = "contains"
      MATCHES = "matches"
      EXCLUDES = "excludes"
    end
  end
end
