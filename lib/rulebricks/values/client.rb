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

      # Retrieve all dynamic values for the authenticated user. Use the 'include' parameter to control whether usage
      # information is returned.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :name
      # @option params [String, nil] :include
      #
      # @return [Array[Rulebricks::Types::DynamicValue]]
      def list(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.symbolize_keys(params)
        query_param_names = %i[name include]
        query_params = {}
        query_params["name"] = params[:name] if params.key?(:name)
        query_params["include"] = params[:include] if params.key?(:include)
        params.except(*query_param_names)

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
          Rulebricks::Types::DynamicValueListResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update existing dynamic values or add new ones for the authenticated user. Supports both flat and nested object
      # structures. Nested objects are automatically flattened using dot notation and keys are converted to readable
      # format (e.g., 'user_name' becomes 'User Name', nested 'user.contact_info.email' becomes 'User.Contact
      # Info.Email').
      #
      # @param request_options [Hash]
      # @param params [Rulebricks::Values::Types::UpdateValuesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Array[Rulebricks::Types::DynamicValue]]
      def update(request_options: {}, **params)
        body_prop_names = %i[values access_groups]
        body_bag = params.slice(*body_prop_names)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "values",
          body: Rulebricks::Values::Types::UpdateValuesRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rulebricks::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rulebricks::Types::DynamicValueListResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete a specific dynamic value for the authenticated user by its ID.
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
      # @return [Rulebricks::Types::SuccessMessage]
      def delete(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.symbolize_keys(params)
        query_param_names = %i[id]
        query_params = {}
        query_params["id"] = params[:id] if params.key?(:id)
        params.except(*query_param_names)

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
          Rulebricks::Types::SuccessMessage.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
