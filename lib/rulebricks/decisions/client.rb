# frozen_string_literal: true

module Rulebricks
  module Decisions
    class Client
      # @param client [Rulebricks::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Query decision logs with support for the decision data query language, rule/status filters, date ranges, and
      # pagination. The query language supports field comparisons (e.g., `alpha=0`, `score>10`), contains/not-contains
      # (e.g., `name:John`, `status!:error`), boolean logic (`AND`, `OR`), and parentheses for grouping.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :search
      # @option params [String, nil] :rules
      # @option params [String, nil] :statuses
      # @option params [String, nil] :start
      # @option params [String, nil] :end_
      # @option params [String, nil] :cursor
      # @option params [Integer, nil] :limit
      # @option params [Rulebricks::Decisions::Types::QueryDecisionsRequestCount, nil] :count
      # @option params [String, nil] :slug
      #
      # @return [Rulebricks::Types::DecisionLogResponse]
      def query(request_options: {}, **params)
        params = Rulebricks::Internal::Types::Utils.symbolize_keys(params)
        query_param_names = %i[search rules statuses start end_ cursor limit count slug]
        query_params = {}
        query_params["search"] = params[:search] if params.key?(:search)
        query_params["rules"] = params[:rules] if params.key?(:rules)
        query_params["statuses"] = params[:statuses] if params.key?(:statuses)
        query_params["start"] = params[:start] if params.key?(:start)
        query_params["end"] = params[:end_] if params.key?(:end_)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["count"] = params[:count] if params.key?(:count)
        query_params["slug"] = params[:slug] if params.key?(:slug)
        params.except(*query_param_names)

        request = Rulebricks::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "decisions/query",
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
          Rulebricks::Types::DecisionLogResponse.load(response.body)
        else
          error_class = Rulebricks::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
