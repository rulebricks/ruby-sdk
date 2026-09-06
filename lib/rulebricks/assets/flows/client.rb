# frozen_string_literal: true

module Rulebricks
  module Assets
    module Flows
      class Client
        # @param client [Rulebricks::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # List flows in the organization, scoped to the API key holder's user groups. Combine folder, labels,
        # user_group, id, slug, name, and search filters. When version is supplied, the filters must match exactly one
        # accessible flow: multiple matches return 400 and no matches return 404. Version accepts a published version
        # number, release environment slug, or latest, using the same publication and access checks as execution. A
        # missing version or release returns 404. The response remains an array; request_schema and origin_rule come
        # from the selected graph, while descriptive workspace metadata stays current. Without version, published flows
        # use their published graph and unpublished flows use their draft graph. Flows do not declare a response schema.
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
        # @return [Array[Rulebricks::Types::FlowDetail]]
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
            path: "admin/flows/list",
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
            Rulebricks::Types::FlowListResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create or update a flow from the Rulebricks Flow Schema (a list of `nodes` and `connections`). The server
        # expands the Rulebricks Flow Schema definition into the full flow graph - laying it out, wiring
        # property/control handles, resolving referenced published rules, and backfilling node defaults - so the result
        # both renders in the editor and executes via `/flows/{slug}` without any manual editing. If `id` is provided
        # the matching flow is updated; otherwise a new flow is created (`id`/`slug` auto-generated). Flows auto-publish
        # unless `_publish` is set to `false`.
        #
        # @param request_options [Hash]
        # @param params [Rulebricks::Assets::Flows::Types::ImportFlowRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rulebricks::Types::FlowImportResponse]
        def push(request_options: {}, **params)
          params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "admin/flows/import",
            body: Rulebricks::Assets::Flows::Types::ImportFlowRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::FlowImportResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Export a flow into the Rulebricks Flow Schema (nodes + connections), the same shape accepted by
        # `/admin/flows/import`. Works for flows built entirely by hand in the editor, so they can be round-tripped or
        # version-controlled. This is distinct from the top-level `/admin/export`, which produces `.rbm` manifests.
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
        #
        # @return [Rulebricks::Types::FlowImportPayload]
        def pull(request_options: {}, **params)
          params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["id"] = params[:id] if params.key?(:id)
          query_params["slug"] = params[:slug] if params.key?(:slug)

          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "admin/flows/export",
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
            Rulebricks::Types::FlowImportPayload.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete a specific flow by its ID.
        #
        # @param request_options [Hash]
        # @param params [Rulebricks::Assets::Flows::Types::DeleteFlowRequest]
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
            path: "admin/flows/delete",
            body: Rulebricks::Assets::Flows::Types::DeleteFlowRequest.new(params).to_h,
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
      end
    end
  end
end
