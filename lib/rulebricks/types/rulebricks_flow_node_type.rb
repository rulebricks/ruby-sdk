# frozen_string_literal: true

module Rulebricks
  module Types
    module RulebricksFlowNodeType
      extend Rulebricks::Internal::Types::Enum

      ORIGIN = "origin"
      INPUT = "input"
      FLOW_INPUT = "flow_input"
      RULE = "rule"
      FLOW = "flow"
      SUBFLOW = "subflow"
      RUN_FLOW = "run_flow"
      RUNFLOW = "runflow"
      IFELSE = "ifelse"
      CONTINUE_IF = "continue_if"
      CONTINUEIF = "continueif"
      FOREACH = "foreach"
      FOR_EACH = "for_each"
      FOREACHITEM = "foreachitem"
      AGGREGATE = "aggregate"
      COMBINE_ITEMS = "combine_items"
      COMBINEITEMS = "combineitems"
      RESULT = "result"
      RESULT_OBJECT = "result_object"
      CODE = "code"
      RUN_CODE = "run_code"
      API = "api"
      API_REQUEST = "api_request"
      DB = "db"
      DATABASE_QUERY = "database_query"
      SOAP = "soap"
      SOAP_REQUEST = "soap_request"
      AI = "ai"
      AI_INFERENCE = "ai_inference"
      LOOKUP = "lookup"
      LOOKUP_TABLE = "lookup_table"
      VAULT = "vault"
      ENTITY = "entity"
      CONTEXT_OPERATION = "context_operation"
      ENTITYOPERATION = "entityoperation"
      NOTIFICATION = "notification"
      SEND_NOTIFICATION = "send_notification"
    end
  end
end
