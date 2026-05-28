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
      #
      # @return [Rulebricks::Types::ContextInstanceState]
      def get(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
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

      # Execute a specific rule using the context instance's state as input.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Types::SolveContextRuleRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :instance
      # @option params [String] :rule_slug
      #
      # @return [Rulebricks::Types::SolveContextRuleResponse]
      def solve(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[slug instance rule_slug]
        body_params = params.except(*path_param_names)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "contexts/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params[:instance].to_s)}/solve/#{URI.encode_uri_component(params[:rule_slug].to_s)}",
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
          Rulebricks::Types::SolveContextRuleResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Trigger re-evaluation of all bound rules and flows for the instance.
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

      # Execute a specific flow using the context instance's state as input.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Types::SolveContextFlowRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :slug
      # @option params [String] :instance
      # @option params [String] :flow_slug
      #
      # @return [Rulebricks::Types::SolveContextFlowResponse]
      def execute(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[slug instance flow_slug]
        body_params = params.except(*path_param_names)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "contexts/#{URI.encode_uri_component(params[:slug].to_s)}/#{URI.encode_uri_component(params[:instance].to_s)}/flows/#{URI.encode_uri_component(params[:flow_slug].to_s)}",
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
          Rulebricks::Types::SolveContextFlowResponse.load(response.body)
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
