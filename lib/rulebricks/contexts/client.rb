# frozen_string_literal: true

module Rulebricks
  module Contexts
    class Client
      # @param client [Rulebricks::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve the current state of a context instance.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :instance
      # @option params [String, nil] :include_relations
      #
      # @return [Rulebricks::Types::ContextInstanceState]
      def get(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["include_relations"] = params[:include_relations] if params.key?(:include_relations)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "contexts/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params[:instance].to_s)}",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::ContextInstanceState.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Submit data to a context instance, creating it if it doesn't exist. May trigger bound rule/flow evaluations.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Types::SubmitContextDataRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :instance
      #
      # @return [Rulebricks::Types::SubmitContextDataResponse]
      def submit(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[slug instance]
        body_params = params.except(*path_param_names)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "contexts/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params[:instance].to_s)}",
          body: body_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::SubmitContextDataResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a specific context instance and its history.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :instance
      #
      # @return [Rulebricks::Types::DeleteContextInstanceResponse]
      def delete(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "contexts/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params[:instance].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::DeleteContextInstanceResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve the change history for a context instance.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :instance
      # @option params [String, nil] :field
      # @option params [Integer, nil] :limit
      #
      # @return [Rulebricks::Types::ContextInstanceHistory]
      def get_history(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["field"] = params[:field] if params.key?(:field)
        query_params["limit"] = params[:limit] if params.key?(:limit)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "contexts/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params[:instance].to_s)}/history",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::ContextInstanceHistory.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get list of rules/flows that need to be evaluated for this instance.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :instance
      #
      # @return [Rulebricks::Types::ContextInstancePendingResponse]
      def get_pending(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "contexts/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params[:instance].to_s)}/pending",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::ContextInstancePendingResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Re-evaluate registered pending rule and flow executions for this instance after their fact or relationship
      # dependencies may have become available. This does not run every bound asset.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Types::CascadeContextRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :instance
      #
      # @return [Rulebricks::Types::CascadeContextResponse]
      def cascade(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[slug instance]
        body_params = params.except(*path_param_names)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "contexts/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params[:instance].to_s)}/cascade",
          body: body_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::CascadeContextResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Submit an array of records to any context in one synchronous call. Records merge into their context instances
      # (matched by the context's identity fact), bound rules and flows whose inputs became satisfied execute, and the
      # response returns the resolved state of every touched instance. Retries are always safe: merges are idempotent
      # and executions are deduplicated by input hash. Fact history is recorded for tracked facts exactly as on
      # individual writes. Clients chunk large datasets across requests. On the cloud platform, a batch may not exceed
      # the plan's remaining monthly rule executions (402 above it) or a 4.5MB request body, and executed rules count
      # toward plan usage. Private (self-hosted) deployments run batches through the high-performance server with no
      # plan gating, a 10,000-records-per-request default cap (CONTEXT_BATCH_MAX_ITEMS), and NDJSON support
      # (Content-Type: application/x-ndjson).
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String, nil] :include
      #
      # @return [Rulebricks::Types::ContextBatchResponse]
      def bulk_ingest(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[slug]
        body_params = params.except(*path_param_names)

        query_param_names = %i[include]
        query_params = {}
        query_params["include"] = params[:include] if params.key?(:include)
        params = params.except(*query_param_names)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "contexts/batch/#{URI.encode_uri_component(params[:slug].to_s)}",
          query: query_params,
          body: body_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::ContextBatchResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Rulebricks::Objects::Client]
      def objects
        @objects ||= Rulebricks::Contexts::Objects::Client.new(client: @client)
      end

      # @return [Rulebricks::Relationships::Client]
      def relationships
        @relationships ||= Rulebricks::Contexts::Relationships::Client.new(client: @client)
      end
    end
  end
end
