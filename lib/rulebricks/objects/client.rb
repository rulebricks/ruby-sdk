# frozen_string_literal: true

module Rulebricks
  module Objects
    class Client
      # @param client [Rulebricks::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Lists the workspace's objects (JSON Schemas). The provided API key must have permission to view vocabulary
      # values. Results are scoped to the API key holder's user groups.
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Array[Rulebricks::Types::WorkspaceObject]]
      def list(request_options: {}, **_params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "objects",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Creates or updates an object by ID or name and syncs enum values it generates. `content` and at least one of
      # `id` or `name` are required. Objects help workspace admins programmatically determine multiple collections of
      # values based on Rulebricks' contracts with external systems from a single JSON Schema source. Renaming the
      # object's display name does not move its managed collection paths: those paths derive from schema field keys.
      # When a schema field key itself is renamed, `field_rename` can preserve the generated values' identities.
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Types::UpsertObjectRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rulebricks::Types::UpsertObjectResponse]
      def upsert(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "objects",
          body: Rulebricks::Types::UpsertObjectRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::UpsertObjectResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Fetches one object by ID or exact name. The provided API key must have permission to view vocabulary values.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :object_id_
      #
      # @return [Rulebricks::Types::WorkspaceObject]
      def get(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "objects/#{URI.encode_uri_component(params[:object_id_].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::WorkspaceObject.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes the object. By default, unused values are permanently deleted while values referenced by draft, current,
      # or historical rules, flows, or other vocabulary values are archived. Pass values=detach to keep every generated
      # value active as an ordinary, hand-editable value.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :object_id_
      # @option params [Rulebricks::Objects::Types::DeleteObjectsRequestValues, nil] :values
      #
      # @return [Rulebricks::Types::DeleteObjectResponse]
      def delete(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["values"] = params[:values] if params.key?(:values)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "objects/#{URI.encode_uri_component(params[:object_id_].to_s)}",
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
          Rulebricks::Types::DeleteObjectResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
