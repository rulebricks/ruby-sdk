# frozen_string_literal: true

module Rulebricks
  module Decisions
    module Types
      class QueryDecisionsRequest < Internal::Types::Model
        field :search, -> { String }, optional: true, nullable: false

        field :rules, -> { String }, optional: true, nullable: false

        field :flows, -> { String }, optional: true, nullable: false

        field :contexts, -> { String }, optional: true, nullable: false

        field :trace, -> { String }, optional: true, nullable: false

        field :statuses, -> { String }, optional: true, nullable: false

        field :include_traces, -> { Rulebricks::Decisions::Types::QueryDecisionsRequestIncludeTraces }, optional: true, nullable: false

        field :item_filter, -> { String }, optional: true, nullable: false

        field :start, -> { String }, optional: true, nullable: false

        field :end_, -> { String }, optional: true, nullable: false, api_name: "end"

        field :sort, -> { Rulebricks::Decisions::Types::QueryDecisionsRequestSort }, optional: true, nullable: false

        field :order, -> { Rulebricks::Decisions::Types::QueryDecisionsRequestOrder }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :count, -> { Rulebricks::Decisions::Types::QueryDecisionsRequestCount }, optional: true, nullable: false
      end
    end
  end
end
