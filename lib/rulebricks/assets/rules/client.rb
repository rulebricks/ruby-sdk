# frozen_string_literal: true

module Rulebricks
  module Assets
    module Rules
      class Client
        # @param client [Rulebricks::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Delete a specific rule by its ID.
        #
        # @param request_options [Hash]
        # @param params [Rulebricks::Assets::Rules::Types::DeleteRuleRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rulebricks::Types::SuccessMessage]
        def delete(request_options: {}, **params)
          params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "admin/rules/delete",
            body: Rulebricks::Assets::Rules::Types::DeleteRuleRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::SuccessMessage.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Export a specific rule by its ID. This response preserves the raw rule document casing (for example,
        # `requestSchema`, `sampleRequest`, and `createdAt`) so it can round-trip through `/admin/rules/import` and
        # `.rbm` workflows.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Hash[String, Object]]
        def pull(request_options: {}, **params)
          params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["id"] = params[:id] if params.key?(:id)

          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "admin/rules/export",
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
            Rulebricks::Types::RuleExport.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create or update a rule. If `id` is provided, the matching rule is partially updated (all other fields
        # optional). If `id` is omitted, a new rule is created (`id` and `slug` are auto-generated; all other fields
        # required).
        #
        # @param request_options [Hash]
        # @param params [Rulebricks::Assets::Rules::Types::ImportRuleRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Hash[String, Object]]
        def push(request_options: {}, **params)
          params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "admin/rules/import",
            body: Rulebricks::Assets::Rules::Types::ImportRuleRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::RuleExport.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # List all rules in the organization. Results are scoped to the API key holder's user groups. Optionally filter
        # by folder name or ID, or by user group name or ID when the API key has access to that group.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :folder
        # @option params [String, nil] :user_group
        #
        # @return [Array[Rulebricks::Types::RuleDetail]]
        def list(request_options: {}, **params)
          params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["folder"] = params[:folder] if params.key?(:folder)
          query_params["user_group"] = params[:user_group] if params.key?(:user_group)

          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "admin/rules/list",
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
            Rulebricks::Types::RuleListResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
