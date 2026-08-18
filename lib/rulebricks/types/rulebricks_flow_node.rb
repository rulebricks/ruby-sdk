# frozen_string_literal: true

module Rulebricks
  module Types
    # A single node in a Rulebricks Flow. `ref` is a flow-local id used only to wire `connections`; `type` selects the
    # node kind. All other properties are that node type's config and unknown keys are preserved. Rule/origin request
    # and response keys are defined by the referenced rule and validated server-side, so connection `output`/`input`
    # keys are accepted as free-form strings.
    #
    # Node types:
    # - **Flow Input** - `type: origin` (aliases: `input`, `flow_input`). Input: no data input. requires a published
    # rule.
    #   - Config: `rule`, `version`, `name`
    #   - Example: `{"ref":"origin","type":"origin","rule":"customer-eligibility"}`
    # - **Rule** - `type: rule`. Input: per-key input (each connection sets `input`). requires a published rule;
    # gateable by Continue If.
    #   - Config: `rule`, `version`, `name`
    #   - Example: `{"ref":"rule","type":"rule","rule":"risk-score","version":"2"}`
    # - **Run Flow** - `type: flow` (aliases: `subflow`, `run_flow`). Input: per-key input (each connection sets
    # `input`). gateable by Continue If.
    #   - Config: `flow`, `version`, `name`, `outputs`, `useCache`, `cacheExpiration`, `cacheKey`
    # - Example:
    # `{"ref":"flow","type":"flow","flow":"credit-check","version":"2","outputs":[{"key":"data.approved","type":"boolean"}]}`
    # - **Continue If** - `type: ifelse` (aliases: `continue_if`, `continueif`). Input: single input (key derived from
    # the source output). emits control edges; gateable by Continue If.
    #   - Config: `condition`
    #   - Example: `{"ref":"continue_if","type":"continue_if","condition":{"operator":"greater than","args":[700]}}`
    # - **For Each Item** - `type: foreach` (aliases: `for_each`, `foreachitem`). Input: single input (key forced to
    # `list`). gateable by Continue If.
    #   - Config: `name`, `outputs`
    #   - Example: `{"ref":"for_each","type":"for_each","outputs":[{"key":"amount","type":"number"}]}`
    # - **Combine Items** - `type: aggregate` (aliases: `combine_items`, `combineitems`). Input: single input (key
    # derived from the source output). gateable by Continue If.
    #   - Config: `mode`, `aggregations`, `filters`
    # - Example:
    # `{"ref":"combine_items","type":"combine_items","mode":"fields","aggregations":{"amount":{"operator":"sum"}}}`
    # - **Result Object** - `type: result` (aliases: `result_object`). Input: single input (key derived from the source
    # output). terminal; gateable by Continue If.
    #   - Config: `key`, `immediateExit`, `keyMappings`, `customExitData`
    #   - Example: `{"ref":"result","type":"result","key":"data"}`
    # - **Run Code** - `type: code` (aliases: `run_code`). Input: single input (key derived from the source output).
    # gateable by Continue If.
    #   - Config: `name`, `code`, `prompt`, `outputs`
    # - Example: `{"ref":"code","type":"code","name":"Score Tier Script","code":"outputs.tier = inputs.score > 700 ? 'A'
    # : 'B'","outputs":[{"key":"tier","type":"string"}]}`
    # - **API Request** - `type: api` (aliases: `api_request`). Input: single input (key derived from the source
    # output). gateable by Continue If.
    # - Config: `url`, `method`, `headers`, `body`, `useCache`, `cacheExpiration`, `jsonPaths`, `extractPaths`,
    # `outputs`
    # - Example:
    # `{"ref":"api","type":"api","url":"https://api.example.com/lookup","method":"POST","headers":{"Authorization":"Bearer
    # <token>"},"body":{"id":1},"outputs":[{"key":"ok","type":"boolean"}]}`
    # - **Database Query** - `type: db` (aliases: `database_query`). Input: single input (key derived from the source
    # output). gateable by Continue If.
    #   - Config: `connectionString`, `query`, `useCache`, `cacheExpiration`, `outputs`
    # - Example: `{"ref":"db","type":"db","connectionString":"postgres://user:pass@host:5432/db","query":"SELECT score
    # FROM customers WHERE id = $1","outputs":[{"key":"score","type":"number"}]}`
    # - **SOAP Request** - `type: soap` (aliases: `soap_request`). Input: single input (key derived from the source
    # output). gateable by Continue If.
    #   - Config: `wsdlUrl`, `outputs`
    # - Example:
    # `{"ref":"soap","type":"soap","wsdlUrl":"https://example.com/service?wsdl","outputs":[{"key":"result","type":"object"}]}`
    # - **AI Inference** - `type: ai` (aliases: `ai_inference`). Input: single input (key derived from the source
    # output). gateable by Continue If.
    #   - Config: `model`, `labels`
    # - Example: `{"ref":"ai","type":"ai","labels":[{"name":"Sentiment","type":"string","description":"Overall
    # sentiment"}]}`
    # - **Lookup Table** - `type: lookup` (aliases: `lookup_table`). Input: single input (key forced to `lookup`).
    # gateable by Continue If.
    #   - Config: `table`, `keyType`, `valueType`, `defaultValue`
    # - Example:
    # `{"ref":"lookup","type":"lookup","table":[{"key":"gold","value":0.2},{"key":"silver","value":0.1}],"keyType":"string","valueType":"number","defaultValue":0}`
    # - **Vault** - `type: vault`. Input: no data input.
    #   - Config: `provider`, `credentials`, `secrets`
    #   - Example: `{"ref":"vault","type":"vault","secrets":[{"name":"STRIPE_API_KEY"}]}`
    # - **Context Operation** - `type: entity` (aliases: `context_operation`). Input: per-key input (each connection
    # sets `input`). gateable by Continue If.
    # - Config: `operation`, `entitySlug`, `identityFieldKey`, `selectedUpdateFields`, `updateValues`,
    # `includeRelations`, `outputs`
    #   - Example: `{"ref":"entity","type":"entity","operation":"read","entitySlug":"customer"}`
    # - **Send Notification** - `type: notification` (aliases: `send_notification`). Input: single input (key derived
    # from the source output). terminal; gateable by Continue If.
    #   - Config: `channels`, `titleTemplate`, `messageTemplate`
    # - Example:
    # `{"ref":"notification","type":"notification","channels":{"email":{"enabled":true,"addresses":["alerts@example.com"]}},"titleTemplate":"Flow
    # alert","messageTemplate":"A flow reached the notification step."}`
    class RulebricksFlowNode < Internal::Types::Model
      field :ref, -> { String }, optional: false, nullable: false

      field :type, -> { Rulebricks::Types::RulebricksFlowNodeType }, optional: false, nullable: false

      field :rule, -> { String }, optional: true, nullable: false

      field :version, -> { Object }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :flow, -> { String }, optional: true, nullable: false

      field :outputs, -> { Internal::Types::Array[Rulebricks::Types::RulebricksFlowNodeOutputsItem] }, optional: true, nullable: false

      field :use_cache, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "useCache"

      field :cache_expiration, -> { Integer }, optional: true, nullable: false, api_name: "cacheExpiration"

      field :cache_key, -> { String }, optional: true, nullable: false, api_name: "cacheKey"

      field :condition, -> { Rulebricks::Types::RulebricksFlowNodeCondition }, optional: true, nullable: false

      field :mode, -> { Rulebricks::Types::RulebricksFlowNodeMode }, optional: true, nullable: false

      field :aggregations, -> { Internal::Types::Hash[String, Rulebricks::Types::RulebricksFlowNodeAggregationsValue] }, optional: true, nullable: false

      field :filters, -> { Internal::Types::Array[Object] }, optional: true, nullable: false

      field :key, -> { String }, optional: true, nullable: false

      field :immediate_exit, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "immediateExit"

      field :key_mappings, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false, api_name: "keyMappings"

      field :custom_exit_data, -> { String }, optional: true, nullable: false, api_name: "customExitData"

      field :code, -> { String }, optional: true, nullable: false

      field :prompt, -> { String }, optional: true, nullable: false

      field :url, -> { String }, optional: true, nullable: false

      field :method_, -> { String }, optional: true, nullable: false, api_name: "method"

      field :headers, -> { Object }, optional: true, nullable: false

      field :body, -> { Object }, optional: true, nullable: false

      field :json_paths, -> { Object }, optional: true, nullable: false, api_name: "jsonPaths"

      field :extract_paths, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "extractPaths"

      field :connection_string, -> { String }, optional: true, nullable: false, api_name: "connectionString"

      field :query, -> { String }, optional: true, nullable: false

      field :wsdl_url, -> { String }, optional: true, nullable: false, api_name: "wsdlUrl"

      field :model, -> { String }, optional: true, nullable: false

      field :labels, -> { Internal::Types::Array[Rulebricks::Types::RulebricksFlowNodeLabelsItem] }, optional: true, nullable: false

      field :table, -> { Internal::Types::Array[Rulebricks::Types::RulebricksFlowNodeTableItem] }, optional: true, nullable: false

      field :key_type, -> { String }, optional: true, nullable: false, api_name: "keyType"

      field :value_type, -> { String }, optional: true, nullable: false, api_name: "valueType"

      field :default_value, -> { Object }, optional: true, nullable: false, api_name: "defaultValue"

      field :provider, -> { String }, optional: true, nullable: false

      field :credentials, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :secrets, -> { Internal::Types::Array[Rulebricks::Types::RulebricksFlowNodeSecretsItem] }, optional: true, nullable: false

      field :operation, -> { Rulebricks::Types::RulebricksFlowNodeOperation }, optional: true, nullable: false

      field :entity_slug, -> { String }, optional: true, nullable: false, api_name: "entitySlug"

      field :identity_field_key, -> { String }, optional: true, nullable: false, api_name: "identityFieldKey"

      field :selected_update_fields, -> { Internal::Types::Hash[String, Internal::Types::Boolean] }, optional: true, nullable: false, api_name: "selectedUpdateFields"

      field :update_values, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "updateValues"

      field :include_relations, -> { Internal::Types::Hash[String, Internal::Types::Boolean] }, optional: true, nullable: false, api_name: "includeRelations"

      field :channels, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :title_template, -> { String }, optional: true, nullable: false, api_name: "titleTemplate"

      field :message_template, -> { String }, optional: true, nullable: false, api_name: "messageTemplate"

      field :data, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
