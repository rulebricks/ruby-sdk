# Reference
## Rules
<details><summary><code>client.rules.<a href="/lib/rulebricks/rules/client.rb">solve</a>(slug, request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Executes a single rule identified by a unique slug. The request and response formats are dynamic, dependent on the rule configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules.solve(
  slug: "slug",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rules.<a href="/lib/rulebricks/rules/client.rb">bulk_solve</a>(slug, request) -> Internal::Types::Array[Rulebricks::Types::BulkRuleResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Executes a particular rule against multiple request data payloads provided in a list.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules.bulk_solve(
  slug: "slug",
  body: [{}, {}]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Internal::Types::Hash[String, Object]]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.rules.<a href="/lib/rulebricks/rules/client.rb">parallel_solve</a>(request) -> Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Executes multiple rules or flows in parallel based on a provided mapping of rule/flow slugs to payloads.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.rules.parallel_solve(request: {
  eligibility: {
    rule: "1ef03ms"
  },
  offers: {
    flow: "OvmsYwn"
  }
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Rulebricks::Types::ParallelSolveRequestValue]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Flows
<details><summary><code>client.flows.<a href="/lib/rulebricks/flows/client.rb">execute</a>(slug, request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Execute a flow by its slug.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.flows.execute(
  slug: "slug",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Decisions
<details><summary><code>client.decisions.<a href="/lib/rulebricks/decisions/client.rb">query</a>() -> Rulebricks::Types::DecisionLogResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Query decision logs with support for the decision data query language, rule/status filters, date ranges, and pagination. The query language supports field comparisons (e.g., `alpha=0`, `score>10`), contains/not-contains (e.g., `name:John`, `status!:error`), boolean logic (`AND`, `OR`), and parentheses for grouping.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.decisions.query(
  search: "status=200",
  rules: "Lead Qualification,Pricing Calculator",
  statuses: "200,400,500"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**search:** `String` — Decision data query language expression to filter logs by request/response data. Supports field comparisons (`field=value`, `field>10`), contains (`field:text`), not-contains (`field!:text`), boolean operators (`AND`, `OR`), and parentheses.
    
</dd>
</dl>

<dl>
<dd>

**rules:** `String` — Comma-separated list of rule names to filter logs by.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `String` — Comma-separated list of HTTP status codes to filter logs by.
    
</dd>
</dl>

<dl>
<dd>

**start:** `String` — Start date for the query range (ISO8601 format).
    
</dd>
</dl>

<dl>
<dd>

**end_:** `String` — End date for the query range (ISO8601 format).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Cursor for pagination (returned from previous query).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Number of results to return per page (default: 100).
    
</dd>
</dl>

<dl>
<dd>

**count:** `Rulebricks::Decisions::Types::QueryDecisionsRequestCount` — If set to 'true', returns only the count of matching logs instead of the log data.
    
</dd>
</dl>

<dl>
<dd>

**slug:** `String` — (Deprecated) Legacy parameter for filtering by rule slug. Use 'rules' parameter instead.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Decisions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users
<details><summary><code>client.users.<a href="/lib/rulebricks/users/client.rb">invite</a>(request) -> Rulebricks::Types::UserInviteResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Invite a new user to the organization or update role or user group data for an existing user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.invite(
  email: "newuser@example.com",
  role: "developer",
  user_groups: %w[group1 group2]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**email:** `String` — Email of the user to invite.
    
</dd>
</dl>

<dl>
<dd>

**role:** `Rulebricks::Users::Types::UserInviteRequestRole` — System or custom role ID to assign to the user. Available system roles include 'admin', 'editor', and 'developer'.
    
</dd>
</dl>

<dl>
<dd>

**user_groups:** `Internal::Types::Array[String]` — List of user group names or IDs to assign to the user. All specified groups must exist in your organization.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/rulebricks/users/client.rb">list</a>() -> Internal::Types::Array[Rulebricks::Types::UserDetail]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all users (including the admin and all team members) in the organization with their details including email, name, API key, role, user groups, and join date.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Rulebricks::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/lib/rulebricks/users/client.rb">create</a>(request) -> Rulebricks::Types::CreateUserResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new user directly with a password, bypassing the email invitation flow. The user can immediately log in with the provided credentials.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.create(
  email: "newuser@example.com",
  password: "securePassword123"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**email:** `String` — Email address for the new user.
    
</dd>
</dl>

<dl>
<dd>

**password:** `String` — Password for the new user (minimum 8 characters). The user can log in immediately with this password.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Display name for the user.
    
</dd>
</dl>

<dl>
<dd>

**role:** `String` — Role to assign to the user. Defaults to 'developer' if not specified.
    
</dd>
</dl>

<dl>
<dd>

**user_groups:** `Internal::Types::Array[String]` — List of user group names or IDs to assign to the user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Users::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Assets
<details><summary><code>client.assets.<a href="/lib/rulebricks/assets/client.rb">get_usage</a>() -> Rulebricks::Types::UsageStatistics</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get the rule execution usage of your organization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.get_usage
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.<a href="/lib/rulebricks/assets/client.rb">import_rbm</a>(request) -> Rulebricks::Types::ImportManifestResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Import rules, flows, contexts, and values from an Rulebricks manifest file (*.rbm).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.import_rbm(
  manifest: {
    version: "1.0",
    rules: [{}],
    flows: [{}],
    entities: [{}],
    values: [{}]
  },
  conflict_strategy: "update"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**manifest:** `Rulebricks::Assets::Types::ImportManifestRequestManifest` — The RBM manifest object containing assets to import. Asset objects inside the manifest intentionally preserve `.rbm`/database casing so exported manifests can be imported without rewriting asset payloads.
    
</dd>
</dl>

<dl>
<dd>

**conflict_strategy:** `Rulebricks::Assets::Types::ImportManifestRequestConflictStrategy` — How to handle conflicts with existing assets. 'update' overwrites, 'skip' ignores, 'error' fails.
    
</dd>
</dl>

<dl>
<dd>

**target_folder_name:** `String` — Optional folder name to place imported assets into. Created if it doesn't exist.
    
</dd>
</dl>

<dl>
<dd>

**legacy_rule_mapping:** `Internal::Types::Hash[String, Rulebricks::Assets::Types::ImportManifestRequestLegacyRuleMappingValue]` — Optional mapping for legacy flow imports to reuse existing rules.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.<a href="/lib/rulebricks/assets/client.rb">export_rbm</a>(request) -> Rulebricks::Assets::Types::ExportRbmAssetsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Export selected rules, flows, contexts, and values to an Rulebricks manifest file (*.rbm).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.export_rbm(
  root_type: "rule",
  root_ids: %w[pricing-rule eligibility-check],
  include_downstream: false
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**root_type:** `Rulebricks::Assets::Types::ExportManifestRequestRootType` — The type of root asset to export. All dependencies will be included.
    
</dd>
</dl>

<dl>
<dd>

**root_ids:** `Internal::Types::Array[String]` — Array of IDs for the root assets to export. Dependencies are automatically resolved.
    
</dd>
</dl>

<dl>
<dd>

**include_downstream:** `Internal::Types::Boolean` — For context exports, whether to include rules and flows bound to the context.
    
</dd>
</dl>

<dl>
<dd>

**manifest_name:** `String` — Optional name for the exported manifest.
    
</dd>
</dl>

<dl>
<dd>

**manifest_description:** `String` — Optional description for the exported manifest.
    
</dd>
</dl>

<dl>
<dd>

**preview_only:** `Internal::Types::Boolean` — If true, returns a preview of what would be exported without the full data.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Values
<details><summary><code>client.values.<a href="/lib/rulebricks/values/client.rb">list</a>() -> Internal::Types::Array[Rulebricks::Types::DynamicValue]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all dynamic values for the authenticated user. Use the 'include' parameter to control whether usage information is returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.values.list(include: "usage")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Query all dynamic values containing a specific name
    
</dd>
</dl>

<dl>
<dd>

**include:** `String` — Comma-separated list of additional data to include. Use 'usage' to include which rules reference each value.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Values::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.values.<a href="/lib/rulebricks/values/client.rb">update</a>(request) -> Internal::Types::Array[Rulebricks::Types::DynamicValue]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update existing dynamic values or add new ones for the authenticated user. Supports both flat and nested object structures. Nested objects are automatically flattened using dot notation and keys are converted to readable format (e.g., 'user_name' becomes 'User Name', nested 'user.contact_info.email' becomes 'User.Contact Info.Email').
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.values.update(
  values: {},
  user_groups: %w[marketing developers]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Object]` — A dictionary of keys and values to update or add. Supports both flat key-value pairs and nested objects. Nested objects will be automatically flattened using dot notation with readable key names (e.g., 'user.contact_info.email' becomes 'User.Contact Info.Email').
    
</dd>
</dl>

<dl>
<dd>

**user_groups:** `Internal::Types::Array[String]` — Optional array of user group names or IDs. If omitted and user belongs to user groups, values will be assigned to all user's user groups. Required if values should be restricted to specific user groups.
    
</dd>
</dl>

<dl>
<dd>

**metadata_by_name:** `Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]` — Optional metadata keyed by dynamic value name. This is the canonical snake_case field; legacy clients may still send `metadataByName`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Values::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.values.<a href="/lib/rulebricks/values/client.rb">delete</a>() -> Rulebricks::Types::SuccessMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a specific dynamic value for the authenticated user by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.values.delete(id: "id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the dynamic value to delete
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Values::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Contexts
<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">get</a>(slug, instance) -> Rulebricks::Types::ContextInstanceState</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the current state of a context instance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.get(
  slug: "customer",
  instance: "cust-12345"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique slug for the context.
    
</dd>
</dl>

<dl>
<dd>

**instance:** `String` — The unique identifier for the context instance.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">submit</a>(slug, instance, request) -> Rulebricks::Types::SubmitContextDataResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit data to a context instance, creating it if it doesn't exist. May trigger bound rule/flow evaluations.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.submit(
  slug: "customer",
  instance: "cust-12345",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique slug for the context.
    
</dd>
</dl>

<dl>
<dd>

**instance:** `String` — The unique identifier for the context instance.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">delete</a>(slug, instance) -> Rulebricks::Types::DeleteContextInstanceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a specific context instance and its history.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.delete(
  slug: "customer",
  instance: "cust-12345"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique slug for the context.
    
</dd>
</dl>

<dl>
<dd>

**instance:** `String` — The unique identifier for the context instance.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">get_history</a>(slug, instance) -> Rulebricks::Types::ContextInstanceHistory</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the change history for a context instance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.get_history(
  slug: "customer",
  instance: "cust-12345"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique slug for the context.
    
</dd>
</dl>

<dl>
<dd>

**instance:** `String` — The unique identifier for the context instance.
    
</dd>
</dl>

<dl>
<dd>

**field:** `String` — Filter history to a specific field.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Maximum number of history entries to return.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">get_pending</a>(slug, instance) -> Rulebricks::Types::ContextInstancePendingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get list of rules/flows that need to be evaluated for this instance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.get_pending(
  slug: "customer",
  instance: "cust-12345"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique slug for the context.
    
</dd>
</dl>

<dl>
<dd>

**instance:** `String` — The unique identifier for the context instance.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">solve</a>(slug, instance, rule_slug, request) -> Rulebricks::Types::SolveContextRuleResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Execute a specific rule using the context instance's state as input.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.solve(
  slug: "customer",
  instance: "cust-12345",
  rule_slug: "eligibility-check",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique slug for the context.
    
</dd>
</dl>

<dl>
<dd>

**instance:** `String` — The unique identifier for the context instance.
    
</dd>
</dl>

<dl>
<dd>

**rule_slug:** `String` — The unique slug for the rule.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">cascade</a>(slug, instance, request) -> Rulebricks::Types::CascadeContextResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Trigger re-evaluation of all bound rules and flows for the instance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.cascade(
  slug: "customer",
  instance: "cust-12345",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique slug for the context.
    
</dd>
</dl>

<dl>
<dd>

**instance:** `String` — The unique identifier for the context instance.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">execute</a>(slug, instance, flow_slug, request) -> Rulebricks::Types::SolveContextFlowResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Execute a specific flow using the context instance's state as input.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.execute(
  slug: "customer",
  instance: "cust-12345",
  flow_slug: "onboarding-flow",
  request: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique slug for the context.
    
</dd>
</dl>

<dl>
<dd>

**instance:** `String` — The unique identifier for the context instance.
    
</dd>
</dl>

<dl>
<dd>

**flow_slug:** `String` — The unique slug for the flow.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Assets Rules
<details><summary><code>client.assets.rules.<a href="/lib/rulebricks/assets/rules/client.rb">delete</a>(request) -> Rulebricks::Types::SuccessMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a specific rule by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.rules.delete(id: "2855f8da-2654-4df9-8903-8f797cbfe8eb")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the rule to delete.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.rules.<a href="/lib/rulebricks/assets/rules/client.rb">pull</a>() -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Export a specific rule by its ID. This response preserves the raw rule document casing (for example, `requestSchema`, `sampleRequest`, and `createdAt`) so it can round-trip through `/admin/rules/import` and `.rbm` workflows.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.rules.pull(id: "2855f8da-2654-4df9-8903-8f797cbfe8eb")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the rule to export.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.rules.<a href="/lib/rulebricks/assets/rules/client.rb">push</a>(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create or update a rule. If `id` is provided, the matching rule is partially updated (all other fields optional). If `id` is omitted, a new rule is created (`id` and `slug` are auto-generated; all other fields required).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.rules.push(rule: {
  name: "Basic Pricing Rule",
  description: "",
  created_at: "2026-02-12T01:29:23.000Z",
  updated_at: "2026-02-12T01:29:23.000Z",
  published: false,
  test_request: {},
  sample_request: {},
  sample_response: {},
  request_schema: [{
    key: "customer_tier",
    show: true,
    name: "Customer Tier",
    type: "string"
  }, {
    key: "order_total",
    show: true,
    name: "Order Total",
    type: "number"
  }, {
    key: "expedited",
    show: true,
    name: "Expedited",
    type: "boolean"
  }],
  response_schema: [{
    key: "discount_rate",
    show: true,
    name: "Discount Rate",
    type: "number"
  }, {
    key: "approval_status",
    show: true,
    name: "Approval Status",
    type: "string"
  }],
  conditions: [{
    request: {
      customer_tier: {
        op: "equals",
        args: []
      }
    },
    response: {
      discount_rate: {},
      approval_status: {}
    },
    settings: {
      enabled: true,
      group_id: nil,
      priority: 0,
      schedule: []
    }
  }, {
    request: {
      expedited: {
        op: "equals",
        args: []
      }
    },
    response: {
      discount_rate: {},
      approval_status: {}
    },
    settings: {
      enabled: true,
      group_id: nil,
      priority: 1,
      schedule: []
    }
  }, {
    request: {},
    response: {
      discount_rate: {},
      approval_status: {}
    },
    settings: {
      enabled: true,
      group_id: nil,
      priority: 2,
      schedule: []
    }
  }],
  history: []
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rule:** `Rulebricks::Types::RuleImportPayload` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.rules.<a href="/lib/rulebricks/assets/rules/client.rb">list</a>() -> Internal::Types::Array[Rulebricks::Types::RuleDetail]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all rules in the organization. Results are scoped to the API key holder's user groups. Optionally filter by folder name or ID, or by user group name or ID when the API key has access to that group.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.rules.list(folder: "Marketing Rules")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**folder:** `String` — Filter rules by folder name or folder ID
    
</dd>
</dl>

<dl>
<dd>

**user_group:** `String` — Filter rules by user group name or ID. The value is validated against workspace groups. Admin/unrestricted API keys can request any group-specific view; restricted API keys may only filter to one of their assigned groups and receive a 403 when filtering outside those groups.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Assets Flows
<details><summary><code>client.assets.flows.<a href="/lib/rulebricks/assets/flows/client.rb">list</a>() -> Internal::Types::Array[Rulebricks::Types::FlowDetail]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all flows in the organization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.flows.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Assets Folders
<details><summary><code>client.assets.folders.<a href="/lib/rulebricks/assets/folders/client.rb">list</a>() -> Internal::Types::Array[Rulebricks::Types::Folder]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all rule folders for the authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.folders.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Folders::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.folders.<a href="/lib/rulebricks/assets/folders/client.rb">upsert</a>(request) -> Rulebricks::Types::Folder</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new rule folder or update an existing one for the authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.folders.upsert(
  name: "Marketing Rules",
  description: "Rules for marketing automation workflows"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Folder ID (required for updates, omit for creation)
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Name of the folder
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Description of the folder
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Folders::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.folders.<a href="/lib/rulebricks/assets/folders/client.rb">delete</a>(request) -> Rulebricks::Types::Folder</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a specific rule folder for the authenticated user. This does not delete the rules within the folder.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.assets.folders.delete(id: "abc123")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the folder to delete
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Folders::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Contexts Objects
<details><summary><code>client.contexts.objects.<a href="/lib/rulebricks/contexts/objects/client.rb">list</a>() -> Internal::Types::Array[Rulebricks::Types::ContextListItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all contexts for the authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.objects.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::Objects::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.objects.<a href="/lib/rulebricks/contexts/objects/client.rb">create</a>(request) -> Rulebricks::Types::ContextDetail</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new context for the authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.objects.create(
  name: "Customer",
  description: "Represents a customer in the system",
  schema: [{
    key: "email",
    name: "Email",
    type: "string"
  }, {
    key: "age",
    name: "Age",
    type: "number"
  }],
  identity_fact: "email"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — The name of the context.
    
</dd>
</dl>

<dl>
<dd>

**slug:** `String` — Optional custom slug. Auto-generated if not provided.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — The description of the context.
    
</dd>
</dl>

<dl>
<dd>

**schema:** `Internal::Types::Array[Rulebricks::Contexts::Objects::Types::CreateContextRequestSchemaItem]` — Initial schema fields for the context. At least one field must be defined.
    
</dd>
</dl>

<dl>
<dd>

**identity_fact:** `String` — The field key to use as the unique identifier for instances. Must be a key from the schema.
    
</dd>
</dl>

<dl>
<dd>

**auto_execute_decisions:** `Internal::Types::Boolean` — When true (default), bound rules and flows automatically execute when their inputs are satisfied.
    
</dd>
</dl>

<dl>
<dd>

**ttl_seconds:** `Integer` — Time-to-live in seconds for live context instances. Instances expire after this duration.
    
</dd>
</dl>

<dl>
<dd>

**history_limit:** `Integer` — Maximum number of history entries to retain per field.
    
</dd>
</dl>

<dl>
<dd>

**on_schema_mismatch:** `Rulebricks::Contexts::Objects::Types::CreateContextRequestOnSchemaMismatch` — How to handle fields that don't match the schema.
    
</dd>
</dl>

<dl>
<dd>

**webhook_on_solve:** `String` — Webhook URL called when a rule or flow successfully solves.
    
</dd>
</dl>

<dl>
<dd>

**webhook_on_expire:** `String` — Webhook URL called when a live context expires due to TTL.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::Objects::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.objects.<a href="/lib/rulebricks/contexts/objects/client.rb">get</a>(id) -> Rulebricks::Types::ContextDetail</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a specific context by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.objects.get(id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier for the context.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::Objects::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.objects.<a href="/lib/rulebricks/contexts/objects/client.rb">update</a>(id, request) -> Rulebricks::Types::UpdateContextResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an existing context's properties and schema.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.objects.update(
  id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  name: "Updated Customer",
  description: "Updated description for premium customers"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier for the context.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — The name of the context.
    
</dd>
</dl>

<dl>
<dd>

**slug:** `String` — The slug of the context.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — The description of the context.
    
</dd>
</dl>

<dl>
<dd>

**schema:** `Internal::Types::Array[Rulebricks::Contexts::Objects::Types::UpdateContextRequestSchemaItem]` — Updated schema fields for the context.
    
</dd>
</dl>

<dl>
<dd>

**auto_execute_decisions:** `Internal::Types::Boolean` — When true, bound rules and flows automatically execute when their inputs are satisfied.
    
</dd>
</dl>

<dl>
<dd>

**ttl_seconds:** `Integer` — Time-to-live in seconds for live context instances. Instances expire after this duration.
    
</dd>
</dl>

<dl>
<dd>

**history_limit:** `Integer` — Maximum number of history entries to retain per field.
    
</dd>
</dl>

<dl>
<dd>

**on_schema_mismatch:** `Rulebricks::Contexts::Objects::Types::UpdateContextRequestOnSchemaMismatch` — How to handle fields that don't match the schema.
    
</dd>
</dl>

<dl>
<dd>

**webhook_on_solve:** `String` — Webhook URL called when a rule or flow successfully solves.
    
</dd>
</dl>

<dl>
<dd>

**webhook_on_expire:** `String` — Webhook URL called when a live context expires due to TTL.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::Objects::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.objects.<a href="/lib/rulebricks/contexts/objects/client.rb">delete</a>(id) -> Rulebricks::Types::DeleteContextResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a specific context and all its instances.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.objects.delete(id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier for the context.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::Objects::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Contexts Relationships
<details><summary><code>client.contexts.relationships.<a href="/lib/rulebricks/contexts/relationships/client.rb">list</a>(id) -> Rulebricks::Types::ContextRelationshipsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all relationships for a specific context.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.relationships.list(id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier for the context.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::Relationships::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.relationships.<a href="/lib/rulebricks/contexts/relationships/client.rb">create</a>(id, request) -> Rulebricks::Types::ContextRelationshipOutgoing</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new relationship between two contexts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.relationships.create(
  id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  to_context_id: "b2c3d4e5-f6a7-8901-bcde-f12345678901",
  relation_type: "has_many",
  foreign_key_fact: "customer_id",
  name: "Customer Orders"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier for the context.
    
</dd>
</dl>

<dl>
<dd>

**to_context_id:** `String` — The ID of the target context.
    
</dd>
</dl>

<dl>
<dd>

**relation_type:** `Rulebricks::Contexts::Relationships::Types::CreateRelationshipRequestRelationType` — The type of relationship.
    
</dd>
</dl>

<dl>
<dd>

**foreign_key_fact:** `String` — The field key to use as the foreign key.
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Display name for the relationship.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Description of the relationship.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::Relationships::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.contexts.relationships.<a href="/lib/rulebricks/contexts/relationships/client.rb">delete</a>(id, relationship) -> Rulebricks::Types::DeleteRelationshipResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a specific relationship between contexts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.contexts.relationships.delete(
  id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  relationship: "c3d4e5f6-a7b8-9012-cdef-123456789012"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier for the context.
    
</dd>
</dl>

<dl>
<dd>

**relationship:** `String` — The unique identifier for the relationship.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Contexts::Relationships::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tests Rules
<details><summary><code>client.tests.rules.<a href="/lib/rulebricks/tests/rules/client.rb">list</a>(slug) -> Internal::Types::Array[Rulebricks::Types::Test]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a list of tests associated with the rule identified by the slug.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tests.rules.list(slug: "slug")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Tests::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tests.rules.<a href="/lib/rulebricks/tests/rules/client.rb">create</a>(slug, request) -> Rulebricks::Types::Test</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a new test to the test suite of a rule identified by the slug.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tests.rules.create(
  slug: "slug",
  name: "Test 3",
  request: {},
  response: {},
  critical: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Rulebricks::Types::CreateTestRequest` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Tests::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tests.rules.<a href="/lib/rulebricks/tests/rules/client.rb">delete</a>(slug, test_id) -> Rulebricks::Types::Test</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a test from the test suite of a rule identified by the slug.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tests.rules.delete(
  slug: "slug",
  test_id: "testId"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**test_id:** `String` — The ID of the test.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Tests::Rules::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Tests Flows
<details><summary><code>client.tests.flows.<a href="/lib/rulebricks/tests/flows/client.rb">list</a>(slug) -> Internal::Types::Array[Rulebricks::Types::Test]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a list of tests associated with the flow identified by the slug.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tests.flows.list(slug: "slug")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Tests::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tests.flows.<a href="/lib/rulebricks/tests/flows/client.rb">create</a>(slug, request) -> Rulebricks::Types::Test</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a new test to the test suite of a flow identified by the slug.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tests.flows.create(
  slug: "slug",
  name: "Test 3",
  request: {},
  response: {},
  critical: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Rulebricks::Types::CreateTestRequest` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Tests::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.tests.flows.<a href="/lib/rulebricks/tests/flows/client.rb">delete</a>(slug, test_id) -> Rulebricks::Types::Test</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a test from the test suite of a flow identified by the slug.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.tests.flows.delete(
  slug: "slug",
  test_id: "testId"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**slug:** `String` — The unique identifier for the resource.
    
</dd>
</dl>

<dl>
<dd>

**test_id:** `String` — The ID of the test.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Tests::Flows::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Groups
<details><summary><code>client.users.groups.<a href="/lib/rulebricks/users/groups/client.rb">list</a>() -> Internal::Types::Array[Rulebricks::Types::UserGroup]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all user groups available in your Rulebricks organization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.groups.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Rulebricks::Users::Groups::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.groups.<a href="/lib/rulebricks/users/groups/client.rb">create</a>(request) -> Rulebricks::Types::UserGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new user group in your Rulebricks organization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.users.groups.create(
  name: "NewGroup",
  description: "Description of the new group."
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — Unique name of the user group.
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — Description of the user group.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Users::Groups::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

