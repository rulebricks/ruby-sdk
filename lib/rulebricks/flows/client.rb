# frozen_string_literal: true

module Rulebricks
  module Flows
    class Client
      # @param client [Rulebricks::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Execute a flow by slug and optional version. Policy failures return `{ error }` with status 200, including
      # per-item errors for bulk requests. Errors: 400 invalid input, 500 unhandled execution failure, 503 unavailable,
      # 504 timeout.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Types::FlowExecutionRequestPayload]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :version
      #
      # @return [Rulebricks::Types::FlowExecutionResponsePayload]
      def execute(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[slug version]
        body_params = params.except(*path_param_names)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "flows/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params.fetch(:version, "latest").to_s)}",
          body: Rulebricks::Types::FlowExecutionRequestPayload.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::FlowExecutionResponsePayload.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
