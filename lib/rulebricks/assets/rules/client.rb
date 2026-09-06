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
        # @return [Rulebricks::Types::RuleExport]
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
        # @return [Rulebricks::Types::RuleExport]
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

        # List rules in the organization, scoped to the API key holder's user groups. Combine folder, labels,
        # user_group, id, slug, name, and search filters. When version is supplied, the filters must match exactly one
        # accessible rule: multiple matches return 400 and no matches return 404. Version accepts a published version
        # number, release environment slug, or latest, using the same publication and access checks as execution. A
        # missing version or release returns 404. The response remains an array; schemas and condition count come from
        # the selected version, while descriptive workspace metadata stays current. Without version, published rules use
        # their published schemas and unpublished rules use their drafts.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :id
        # @option params [String, nil] :slug
        # @option params [String, nil] :search
        # @option params [String, nil] :version
        # @option params [String, nil] :folder
        # @option params [String, nil] :labels
        # @option params [String, nil] :user_group
        # @option params [String, nil] :name
        #
        # @return [Array[Rulebricks::Types::RuleDetail]]
        def list(request_options: {}, **params)
          params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["id"] = params[:id] if params.key?(:id)
          query_params["slug"] = params[:slug] if params.key?(:slug)
          query_params["search"] = params[:search] if params.key?(:search)
          query_params["version"] = params[:version] if params.key?(:version)
          query_params["folder"] = params[:folder] if params.key?(:folder)
          query_params["labels"] = params[:labels] if params.key?(:labels)
          query_params["user_group"] = params[:user_group] if params.key?(:user_group)
          query_params["name"] = params[:name] if params.key?(:name)

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
