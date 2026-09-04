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
      # @param _params [Hash]
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

      # Import rules, flows, contexts, and values from a Rulebricks manifest file (*.rbm). Plain JSON remains supported,
      # and clients may send the same JSON envelope gzip-compressed with `Content-Type: application/octet-stream` and
      # `X-Rulebricks-Content-Encoding: gzip`.
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rulebricks::Assets::Types::ImportRbmAssetsResponse]
      def import_rbm(request_options: {}, **_params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "admin/import",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Assets::Types::ImportRbmAssetsResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Export selected rules, flows, contexts, and values to a Rulebricks manifest file (*.rbm). Dependencies are
      # resolved automatically: exporting a flow includes its rules, contexts, vocabulary values, and any flows
      # referenced by Run Flow nodes (recursively). Set `compress: true` to receive the manifest in compressed form (a
      # compress-json array). Set `download: true` to receive that manifest directly as a streamed attachment instead of
      # inside the `{ success, manifest }` envelope.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Assets::Types::ExportManifestRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rulebricks::Assets::Types::ExportRbmAssetsResponse]
      def export_rbm(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "admin/export",
          body: Rulebricks::Assets::Types::ExportManifestRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Assets::Types::ExportRbmAssetsResponse.load(response.body)
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

      # @return [Rulebricks::Contexts::Client]
      def contexts
        @contexts ||= Rulebricks::Assets::Contexts::Client.new(client: @client)
      end
    end
  end
end
