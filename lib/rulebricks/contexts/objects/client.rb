# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Objects
      class Client
        # @param client [Rulebricks::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Retrieve all contexts for the authenticated user.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Rulebricks::Types::ContextListItem]]
        def list(request_options: {}, **_params)
          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "admin/contexts",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::ContextListResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create a new context for the authenticated user.
        #
        # @param request_options [Hash]
        # @param params [Rulebricks::Contexts::Objects::Types::CreateContextRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rulebricks::Types::ContextDetail]
        def create(request_options: {}, **params)
          body_prop_names = %i[name slug description schema identity_fact auto_execute_decisions ttl_seconds history_limit on_schema_mismatch webhook_on_solve webhook_on_expire]
          body_bag = params.slice(*body_prop_names)

          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "admin/contexts",
            body: Rulebricks::Contexts::Objects::Types::CreateContextRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::CreateContextResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve a specific context by its ID.
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
        # @return [Rulebricks::Types::ContextDetail]
        def get(request_options: {}, **params)
          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "admin/contexts/#{params[:id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::ContextDetail.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update an existing context's properties and schema.
        #
        # @param request_options [Hash]
        # @param params [Rulebricks::Contexts::Objects::Types::UpdateContextRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Rulebricks::Types::UpdateContextResponse]
        def update(request_options: {}, **params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[name slug description schema auto_execute_decisions ttl_seconds history_limit on_schema_mismatch webhook_on_solve webhook_on_expire]
          body_bag = body_params.slice(*body_prop_names)

          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "admin/contexts/#{params[:id]}",
            body: Rulebricks::Contexts::Objects::Types::UpdateContextRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::UpdateContextResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete a specific context and all its instances.
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
        # @return [Rulebricks::Types::DeleteContextResponse]
        def delete(request_options: {}, **params)
          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "admin/contexts/#{params[:id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::DeleteContextResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
