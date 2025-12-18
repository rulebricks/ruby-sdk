# frozen_string_literal: true

module Rulebricks
  module Tests
    class Client
      # @param client [Rulebricks::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Rulebricks::Rules::Client]
      def rules
        @rules ||= Rulebricks::Tests::Rules::Client.new(client: @client)
      end

      # @return [Rulebricks::Flows::Client]
      def flows
        @flows ||= Rulebricks::Tests::Flows::Client.new(client: @client)
      end
    end
  end
end
