# frozen_string_literal: true

module Rulebricks
  class Client
    # @param base_url [String, nil]
    # @param api_key [String]
    #
    # @return [void]
    def initialize(api_key:, base_url: nil)
      @raw_client = Rulebricks::Internal::Http::RawClient.new(
        base_url: base_url || Rulebricks::Environment::DEFAULT,
        headers: {
          "X-Fern-Language" => "Ruby",
          "x-api-key" => api_key.to_s
        }
      )
    end

    # @return [Rulebricks::Rules::Client]
    def rules
      @rules ||= Rulebricks::Rules::Client.new(client: @raw_client)
    end

    # @return [Rulebricks::Flows::Client]
    def flows
      @flows ||= Rulebricks::Flows::Client.new(client: @raw_client)
    end

    # @return [Rulebricks::Decisions::Client]
    def decisions
      @decisions ||= Rulebricks::Decisions::Client.new(client: @raw_client)
    end

    # @return [Rulebricks::Users::Client]
    def users
      @users ||= Rulebricks::Users::Client.new(client: @raw_client)
    end

    # @return [Rulebricks::Assets::Client]
    def assets
      @assets ||= Rulebricks::Assets::Client.new(client: @raw_client)
    end

    # @return [Rulebricks::Values::Client]
    def values
      @values ||= Rulebricks::Values::Client.new(client: @raw_client)
    end

    # @return [Rulebricks::Tests::Client]
    def tests
      @tests ||= Rulebricks::Tests::Client.new(client: @raw_client)
    end
  end
end
