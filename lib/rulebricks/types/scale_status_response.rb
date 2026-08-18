# frozen_string_literal: true

module Rulebricks
  module Types
    # Solver fleet warm-up status (self-hosted deployments). Poll GET /scale until `status` is `ready` before starting a
    # large batch workload.
    class ScaleStatusResponse < Internal::Types::Model
      field :status, -> { Rulebricks::Types::ScaleStatusResponseStatus }, optional: false, nullable: false

      field :active_workers, -> { Integer }, optional: true, nullable: false

      field :target_workers, -> { Integer }, optional: false, nullable: false

      field :expires_in_seconds, -> { Integer }, optional: false, nullable: false
    end
  end
end
