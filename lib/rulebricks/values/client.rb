# frozen_string_literal: true

module Rulebricks
  module Values
    class Client
      # @param client [Rulebricks::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve vocabulary values for the authenticated user. Results are scoped to the API key holder's user groups.
      # Optionally filter by user group name or ID when the API key has access to that group. Use the 'include'
      # parameter to control whether usage information is returned. Small workspaces may omit pagination to receive the
      # full catalog as an array (legacy behavior); workspaces above the catalog threshold must paginate with
      # 'limit'/'cursor', which returns { data, next_cursor, total? } ordered by name. The 'prefix' and 'type' filters
      # narrow results to a collection or value type.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :name
      # @option params [String, nil] :prefix
      # @option params [String, nil] :type
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :cursor
      # @option params [String, nil] :user_group
      # @option params [String, nil] :include
      # @option params [Boolean, nil] :resolve
      #
      # @return [Rulebricks::Values::Types::ListValuesResponse]
      def list(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["name"] = params[:name] if params.key?(:name)
        query_params["prefix"] = params[:prefix] if params.key?(:prefix)
        query_params["type"] = params[:type] if params.key?(:type)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["user_group"] = params[:user_group] if params.key?(:user_group)
        query_params["include"] = params[:include] if params.key?(:include)
        query_params["resolve"] = params[:resolve] if params.key?(:resolve)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "values",
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
          Rulebricks::Values::Types::ListValuesResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update existing vocabulary values or add new ones for the authenticated user. Supports both flat and nested
      # object structures.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Values::Types::UpdateValuesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rulebricks::Values::Types::UpdateValuesResponse]
      def update(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "values",
          body: Rulebricks::Values::Types::UpdateValuesRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Values::Types::UpdateValuesResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a specific vocabulary value for the authenticated user by its ID. Deletion is blocked while the value is
      # referenced by any rule or flow. Values whose entire payload references the deleted value are deleted with it
      # (cascade), and list values referencing it lose the referencing items; both effects are reported in the response.
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
      # @return [Rulebricks::Types::DeleteValueResponse]
      def delete(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["id"] = params[:id] if params.key?(:id)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "values",
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
          Rulebricks::Types::DeleteValueResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Declaratively makes a collection exactly equal to the payload. Values in the payload are upserted (Existing
      # values keep their IDs), and values under the collection that are absent from the payload are archived by
      # default. The `sync` endpoint supports uploading a particularly large amount of values (100k+) in chunks, using
      # the `sync_id` parameter to track the run.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Values::Types::SyncValuesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rulebricks::Types::SyncValuesResponse]
      def sync(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "values/sync",
          body: Rulebricks::Values::Types::SyncValuesRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::SyncValuesResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
