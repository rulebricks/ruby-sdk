# frozen_string_literal: true

module Rulebricks
  module Assets
    class Client
      # @param client [Rulebricks::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Get the rule execution usage of your organization.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rulebricks::Types::UsageStatistics]
      def get_usage(request_options: {}, **_params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "admin/usage",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::UsageStatistics.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Rulebricks::Rules::Client]
      def rules
        @rules ||= Rulebricks::Assets::Rules::Client.new(client: @client)
      end

      # @return [Rulebricks::Flows::Client]
      def flows
        @flows ||= Rulebricks::Assets::Flows::Client.new(client: @client)
      end

      # @return [Rulebricks::Folders::Client]
      def folders
        @folders ||= Rulebricks::Assets::Folders::Client.new(client: @client)
      end
    end
  end
end
