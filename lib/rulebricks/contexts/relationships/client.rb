# frozen_string_literal: true

module Rulebricks
  module Contexts
    module Relationships
      class Client
        # @param client [Rulebricks::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # List all relationships for a specific context.
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
        # @return [Rulebricks::Types::ContextRelationshipsResponse]
        def list(request_options: {}, **params)
          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "admin/contexts/#{params[:id]}/relationships",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::ContextRelationshipsResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Create a new relationship between two contexts.
        #
        # @param request_options [Hash]
        # @param params [Rulebricks::Contexts::Relationships::Types::CreateRelationshipRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Rulebricks::Types::ContextRelationshipOutgoing]
        def create(request_options: {}, **params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[to_context_id relation_type foreign_key_fact name description]
          body_bag = body_params.slice(*body_prop_names)

          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "admin/contexts/#{params[:id]}/relationships",
            body: Rulebricks::Contexts::Relationships::Types::CreateRelationshipRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::CreateRelationshipResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Delete a specific relationship between contexts.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [String] :relationship
        #
        # @return [Rulebricks::Types::DeleteRelationshipResponse]
        def delete(request_options: {}, **params)
          request = Rulebricks::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "admin/contexts/#{params[:id]}/relationships/#{params[:relationship]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rulebricks::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rulebricks::Types::DeleteRelationshipResponse.load(response.body)
          else
            error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
