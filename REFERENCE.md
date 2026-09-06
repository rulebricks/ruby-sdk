# Reference
## Rules
<details><summary><code>client.rules.<a href="/lib/rulebricks/rules/client.rb">solve</a>(slug, version, request) -> Rulebricks::Types::RuleExecutionResult</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Executes a single rule identified by a unique slug. The request and response formats are dynamic, dependent on the rule configuration. Optionally target a specific published version (e.g. `3`) or a release environment (e.g. `production`) via the `version` path segment; `latest` (the default) executes the current published version.
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
  version: "version",
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

**version:** `String` — The version of the resource to target: a published version number (e.g. `3`), a release environment slug (e.g. `production`, always lowercase), or `latest` (default) to use the current published version.

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

<details><summary><code>client.rules.<a href="/lib/rulebricks/rules/client.rb">bulk_solve</a>(slug, version, request) -> Internal::Types::Array[Rulebricks::Types::BulkRuleResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Executes a particular rule against multiple request data payloads provided in a list. Optionally target a specific published version (e.g. `3`) or a release environment (e.g. `production`) via the `version` path segment; `latest` (the default) executes the current published version.
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
  version: "version",
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

**version:** `String` — The version of the resource to target: a published version number (e.g. `3`), a release environment slug (e.g. `production`, always lowercase), or `latest` (default) to use the current published version.

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

## Infra
<details><summary><code>client.infra.<a href="/lib/rulebricks/infra/client.rb">status</a>() -> Rulebricks::Types::ScaleStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reports the fleet scale-up state. Worker counts reflect solvers that have actually joined the processing group and can accept work. Self-hosted deployments only.
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
client.infra.status
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

**request_options:** `Rulebricks::Infra::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.infra.<a href="/lib/rulebricks/infra/client.rb">scale</a>() -> Rulebricks::Types::ScaleStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Scales up the deployment's solver fleet to its maximum capacity ahead of a known incoming batch workload. Usually takes 1-2 minutes to complete. This is completely optional, the solver fleet will scale up automatically as needed anyway. Self-hosted deployments only.
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
client.infra.scale
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

**request_options:** `Rulebricks::Infra::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Flows
<details><summary><code>client.flows.<a href="/lib/rulebricks/flows/client.rb">execute</a>(slug, version, request) -> Rulebricks::Types::FlowExecutionResponsePayload</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Execute a flow by slug and optional version. The flow setting `failedResponseMode` controls execution-failure responses: a missing or invalid value is treated as `return` (the default), which returns an `{ "error": "..." }` payload with HTTP 200; `fail` returns HTTP 400 for input/schema failures and HTTP 500 for escalated policy/runtime failures. Request- and entity-level errors, capacity errors, and infrastructure failures remain non-2xx responses as documented.
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
  version: "version",
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

**version:** `String` — The version of the resource to target: a published version number (e.g. `3`), a release environment slug (e.g. `production`, always lowercase), or `latest` (default) to use the current published version.

</dd>
</dl>

<dl>
<dd>

**request:** `Rulebricks::Types::FlowExecutionRequestPayload`

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
  flows: "Loan Approval Flow",
  contexts: "loans",
  trace: "7db50259-31a0-42c1-aa3c-36409ad3c756",
  statuses: "200,400,500",
  item_filter: "customer.id=cst_8f3a12"
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

**search:** `String` — Decision data query language expression to filter logs by request/response data. Supports field comparisons (`field=value`, `field>10`), contains (`field:text`), not-contains (`field!:text`), boolean operators (`AND`, `OR`), and parentheses. A bare UUID or 32-hex term resolves as an execution/correlation-id lookup automatically.

</dd>
</dl>

<dl>
<dd>

**rules:** `String` — Comma-separated list of rule names, IDs, or slugs to filter logs by. Names match partially; IDs and slugs match exactly.

</dd>
</dl>

<dl>
<dd>

**flows:** `String` — Comma-separated list of flow names, IDs, or slugs to filter logs by. Matches only flow-level execution logs; the rule executions that ran inside a flow are separate records and are not included.

</dd>
</dl>

<dl>
<dd>

**contexts:** `String` — Comma-separated list of context names or slugs to filter logs by. Matches the rule and flow executions that were triggered by those contexts (batch and interactive updates).

</dd>
</dl>

<dl>
<dd>

**trace:** `String` — Execution-trace correlation id. Returns every decision log from one execution tree: pass a log's `decision.root_flow_execution_id` (or any `flow_execution_id` / `parallel_execution_id`, including a bulk run's per-item `item_execution_ids` entries) to retrieve the flow-level record plus all subflow and rule records from that run. On self-hosted deployments, a log's observability `trace_id` is also accepted. Combine with `rules` or `search` to narrow to a specific rule or payload within the run.

</dd>
</dl>

<dl>
<dd>

**statuses:** `String` — Comma-separated list of HTTP status codes to filter logs by.

</dd>
</dl>

<dl>
<dd>

**include_traces:** `Rulebricks::Decisions::Types::QueryDecisionsRequestIncludeTraces` — When `true`, each flow record in the response includes a decompressed `path_trace` field: the run's executed steps with their full inputs and outputs (an object for single runs, a null-aligned array matching the request array for bulk runs). Off by default - traces are stored compressed and can be large, so only enable this when you need them. Ignored in count mode.

</dd>
</dl>

<dl>
<dd>

**item_filter:** `String` — Bulk payload filter in the form `path=value`. For each bulk record in the results (array-shaped request/response), keeps only the items whose payload value at `path` equals `value`, slicing the `request` and `response` arrays and every index-aligned field (`decision.item_execution_ids`, `decision.item_indexes`, `decision.success_idxs`, and `path_trace` when `include_traces=true`) in lockstep so input/output alignment is preserved. Filtered records gain a `matched_items` array with the surviving items' original zero-based positions. Paths use dot notation into each item (`customer.id`, `lines.0.sku`); prefix with `request.` or `response.` to match only that side (unprefixed paths match either side). Values compare as exact scalar strings (`status=200`, `approved=true`). Non-bulk records are returned unchanged; bulk records with no matching items are returned with empty item arrays. For a bulk solve of a Collect Matches rule, each response item is itself a `{ results: [...] }` envelope, so use a positional path such as `response.results.0.status`. Wildcards are available in `search`, not `item_filter`. Typical use: combine with `search`, `flows`, or `trace` to locate a bulk run, then isolate one item's payloads and its `item_execution_ids` entry without tracking indexes. Ignored in count mode.

</dd>
</dl>

<dl>
<dd>

**start:** `String` — Start date for the query range (ISO8601 format). Hosted queries may span at most 90 days. Persistent self-hosted queries may use any range within local ClickHouse retention; PVC-less archive mode is limited to 7 days. Defaults to the applicable maximum before `end` (or before now).

</dd>
</dl>

<dl>
<dd>

**end_:** `String` — End date for the query range (ISO8601 format). Defaults to now. When supplied without `start`, the query covers the preceding 90 days on hosted/table mode or 7 days in PVC-less archive mode.

</dd>
</dl>

<dl>
<dd>

**sort:** `Rulebricks::Decisions::Types::QueryDecisionsRequestSort` — Column to sort results by. `time` orders by execution timestamp, `name` by rule/flow name, `status` by HTTP status code, and `type` by operation (solve, bulk-solve, flows, etc.). Defaults to `time`.

</dd>
</dl>

<dl>
<dd>

**order:** `Rulebricks::Decisions::Types::QueryDecisionsRequestOrder` — Sort direction. Defaults to `desc`.

</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Opaque pagination token returned by the previous response. Pass it back verbatim to fetch the next page; do not construct or modify cursor values.

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Number of results to return per page (default: 100, maximum: 1000). Logs carry full request/response payloads, so use smaller limits when querying workspaces with large bulk operations. Time-sorted pagination uses a keyset cursor, so its scan cost does not grow with page depth.

</dd>
</dl>

<dl>
<dd>

**count:** `Rulebricks::Decisions::Types::QueryDecisionsRequestCount` — If set to 'true', returns only the count of matching logs instead of the log data.

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

<details><summary><code>client.assets.<a href="/lib/rulebricks/assets/client.rb">import_rbm</a>(request) -> Rulebricks::Assets::Types::ImportRbmAssetsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Import rules, flows, contexts, and values from a Rulebricks manifest file (*.rbm). Plain JSON remains supported, and clients may send the same JSON envelope gzip-compressed with `Content-Type: application/octet-stream` and `X-Rulebricks-Content-Encoding: gzip`.
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
client.assets.import_rbm
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

<details><summary><code>client.assets.<a href="/lib/rulebricks/assets/client.rb">export_rbm</a>(request) -> Rulebricks::Assets::Types::ExportRbmAssetsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Export selected rules, flows, contexts, and values to a Rulebricks manifest file (*.rbm). Dependencies are resolved automatically: exporting a flow includes its rules, contexts, vocabulary values, and any flows referenced by Run Flow nodes (recursively). Set `compress: true` to receive the manifest in compressed form (a compress-json array). Set `download: true` to receive that manifest directly as a streamed attachment instead of inside the `{ success, manifest }` envelope.
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

**compress:** `Internal::Types::Boolean` — If true, the manifest in the response is returned in compressed form: the JSON array produced by the compress-json library instead of a plain object. Compressed manifests are substantially smaller, can be saved directly as a .rbm file, and are accepted by the import endpoint as-is. Intended for raw HTTP usage and file tooling; typed SDK clients should omit this flag, since the generated response type models the manifest as an object.

</dd>
</dl>

<dl>
<dd>

**download:** `Internal::Types::Boolean` — If true, returns the manifest itself as a streamed application/json attachment with Content-Disposition, rather than the normal `{ success, manifest }` response envelope. Combine with `compress: true` for large .rbm downloads.

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
<details><summary><code>client.values.<a href="/lib/rulebricks/values/client.rb">list</a>() -> Rulebricks::Values::Types::ListValuesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve vocabulary values for the authenticated user. Results are scoped to the API key holder's user groups. Optionally filter by user group name or ID when the API key has access to that group. Use the 'include' parameter to control whether usage information is returned. Small workspaces may omit pagination to receive the full catalog as an array (legacy behavior); workspaces above the catalog threshold must paginate with 'limit'/'cursor', which returns { data, next_cursor, total? } ordered by name. The 'prefix' and 'type' filters narrow results to a collection or value type.
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

**name:** `String` — Query all vocabulary values containing a specific name

</dd>
</dl>

<dl>
<dd>

**prefix:** `String` — Only return values whose name starts with this collection prefix (e.g. 'Countries.').

</dd>
</dl>

<dl>
<dd>

**type:** `String` — Only return values of this type (string, number, boolean, list, date, function).

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Page size (default 100, max 1000). Providing limit or cursor switches the response to the paginated { data, next_cursor } envelope.

</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Opaque pagination cursor from a previous page's next_cursor.

</dd>
</dl>

<dl>
<dd>

**user_group:** `String` — Filter results by user group name or ID. The value is validated against workspace groups. Admin/unrestricted API keys can request any group-specific view; restricted API keys may only filter to one of their assigned groups and receive a 403 when filtering outside those groups.

</dd>
</dl>

<dl>
<dd>

**include:** `String` — Comma-separated list of additional data to include. Use 'usage' to include which rules reference each value.

</dd>
</dl>

<dl>
<dd>

**resolve:** `Internal::Types::Boolean` — By default, payloads containing value-to-value references are returned materialized (references replaced with their resolved values). Pass 'false' to return stored payloads as-is, with { "$rb": "globalValue", "id": "..." } reference markers intact, so the reference graph round-trips.

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

<details><summary><code>client.values.<a href="/lib/rulebricks/values/client.rb">update</a>(request) -> Rulebricks::Values::Types::UpdateValuesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update existing vocabulary values or add new ones for the authenticated user. Supports both flat and nested object structures.
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

**values:** `Internal::Types::Hash[String, Object]` — Values to create or update. Nested objects use dot-separated names and payloads may reference other values.

</dd>
</dl>

<dl>
<dd>

**user_groups:** `Internal::Types::Array[String]` — Optional array of user group names or IDs. If omitted and user belongs to user groups, values will be assigned to all user's user groups. Required if values should be restricted to specific user groups.

</dd>
</dl>

<dl>
<dd>

**metadata_by_name:** `Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]` — Optional metadata keyed by vocabulary value name. This is the canonical snake_case field; legacy clients may still send `metadataByName`. System-owned keys (managedBy, source, lockedReason, previousTokens, and archive/tombstone fields) are stripped from user payloads - managed provenance and archive state cannot be forged.

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

<details><summary><code>client.values.<a href="/lib/rulebricks/values/client.rb">delete</a>() -> Rulebricks::Types::DeleteValueResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a value by ID. Rule and flow references block deletion; value references are replaced with the deleted value's content.
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

**id:** `String` — ID of the vocabulary value to delete

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

<details><summary><code>client.values.<a href="/lib/rulebricks/values/client.rb">sync</a>(request) -> Rulebricks::Types::SyncValuesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Declaratively makes a collection exactly equal to the payload. Values in the payload are upserted (Existing values keep their IDs), and values under the collection that are absent from the payload are archived by default. The `sync` endpoint supports uploading a particularly large amount of values (100k+) in chunks, using the `sync_id` parameter to track the run.
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
client.values.sync(
  collection: "Medical Codes",
  values: {}
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

**collection:** `String` — Collection path to sync (e.g. 'Medical Codes'). Only values under this path are affected.

</dd>
</dl>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Object]` — Desired members of the collection, keyed relative to the collection path ('A123' becomes 'Medical Codes.A123'). Nested objects flatten with dot notation, and payloads may use ValueReference markers. An empty object empties the collection. May be omitted on a pure finalize call (sync_id + complete).

</dd>
</dl>

<dl>
<dd>

**sync_id:** `String` — Identifier for a chunked run. Repeat the call with the same sync_id for each chunk of the desired state; nothing is removed until a call with complete: true. Abandoned runs are purged after 24 hours without removing anything.

</dd>
</dl>

<dl>
<dd>

**complete:** `Internal::Types::Boolean` — Marks the run as complete, triggering the removal sweep. Implicitly true when sync_id is omitted (single-request syncs), false otherwise.

</dd>
</dl>

<dl>
<dd>

**permanently_delete:** `Internal::Types::Boolean` — Hard-delete removed values instead of archiving them. Removals still referenced by a rule, flow, or surviving value are archived instead and reported in 'blocked'. Self-hosted deployments retain tombstones regardless.

</dd>
</dl>

<dl>
<dd>

**dry_run:** `Internal::Types::Boolean` — Compute and return the full diff without writing anything. Only supported for single-request syncs (omit sync_id).

</dd>
</dl>

<dl>
<dd>

**user_groups:** `Internal::Types::Array[String]` — Optional array of user group names to assign to written values, matching POST /values.

</dd>
</dl>

<dl>
<dd>

**metadata_by_name:** `Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]` — Optional metadata keyed by FULL value name (including the collection prefix).

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

## Objects
<details><summary><code>client.objects.<a href="/lib/rulebricks/objects/client.rb">list</a>() -> Internal::Types::Array[Rulebricks::Types::WorkspaceObject]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the workspace's objects (JSON Schemas). The provided API key must have permission to view vocabulary values. Results are scoped to the API key holder's user groups.
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
client.objects.list
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

**request_options:** `Rulebricks::Objects::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.objects.<a href="/lib/rulebricks/objects/client.rb">upsert</a>(request) -> Rulebricks::Types::UpsertObjectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates an object and syncs its generated enum values.
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
client.objects.upsert
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

**request:** `Rulebricks::Types::UpsertObjectRequest`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Objects::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.objects.<a href="/lib/rulebricks/objects/client.rb">get</a>(object_id_) -> Rulebricks::Types::WorkspaceObject</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetches one object by ID or exact name. The provided API key must have permission to view vocabulary values.
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
client.objects.get(object_id_: "objectId")
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

**object_id_:** `String` — Object ID or exact name

</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Objects::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.objects.<a href="/lib/rulebricks/objects/client.rb">delete</a>(object_id_) -> Rulebricks::Types::DeleteObjectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the object. By default, unused values are permanently deleted while values referenced by draft, current, or historical rules, flows, or other vocabulary values are archived. Pass values=detach to keep every generated value active as an ordinary, hand-editable value.
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
client.objects.delete(object_id_: "objectId")
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

**object_id_:** `String` — Object ID or exact name

</dd>
</dl>

<dl>
<dd>

**values:** `Rulebricks::Objects::Types::DeleteObjectsRequestValues` — What happens to generated values: 'archive' (default) permanently deletes unused values and archives referenced values; 'detach' retains all values as active ordinary values.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Objects::RequestOptions`

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

**include:** `String` — Select comma-separated fields; `context` is always returned. Default: state and execution summaries. Opt-ins: `executions` (GET last-run metadata), `execution_results` (POST `cascaded[].result`). Unavailable fields are omitted; relations require `include_relations`. History: `/history`. Fields: positions, is_new, status, have, need, state, derived, expires_at, created_at, updated_at, executions, executed, triggered, reason, cascaded, relations, execution_results.

</dd>
</dl>

<dl>
<dd>

**include_relations:** `String` — Include named relationships under `relations` (comma-separated; `*` for all). `has_many` returns a list; `has_one`/`belongs_to` return one state or null. Omitted by default.

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

Submit data to a context instance, creating it if it doesn't exist. May trigger bound rule/flow evaluations. Each instance supports up to 64 MiB of combined stored state and execution metadata, measured as serialized database JSON. Deployment transport limits and execution deadlines also apply.
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

**include:** `String` — Select comma-separated fields; `context` is always returned. Default: state and execution summaries. Opt-ins: `executions` (GET last-run metadata), `execution_results` (POST `cascaded[].result`). Unavailable fields are omitted; relations require `include_relations`. History: `/history`. Fields: positions, is_new, status, have, need, state, derived, expires_at, created_at, updated_at, executions, executed, triggered, reason, cascaded, relations, execution_results.

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

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">cascade</a>(slug, instance, request) -> Rulebricks::Types::CascadeContextResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-evaluate registered pending rule and flow executions for this instance after their fact or relationship dependencies may have become available. This does not run every bound asset.
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

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">solve_rule</a>(slug, instance, rule_slug, request) -> Rulebricks::Types::SolveContextRuleResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Execute one rule bound to this context. An optional object body is validated and persisted before evaluation. Returns HTTP 202 and registers pending work when that rule's own inputs are not yet available.
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
client.contexts.solve_rule(
  slug: "slug",
  instance: "instance",
  rule_slug: "ruleSlug",
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

**rule_slug:** `String` — Slug of a rule bound to this context.

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

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">solve_flow</a>(slug, instance, flow_slug, request) -> Rulebricks::Types::SolveContextFlowResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Execute one flow bound to this context. An optional object body is validated and persisted before evaluation. Returns HTTP 202 and registers pending work when that flow's own inputs are not yet available.
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
client.contexts.solve_flow(
  slug: "slug",
  instance: "instance",
  flow_slug: "flowSlug",
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

**flow_slug:** `String` — Slug of a flow bound to this context.

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

<details><summary><code>client.contexts.<a href="/lib/rulebricks/contexts/client.rb">bulk_ingest</a>(slug, request) -> Rulebricks::Types::ContextBatchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Synchronously merge records by identity, record tracked history, and execute ready bound rules/flows. Returns each touched instance's resolved state and execution summary. Successful runs are deduplicated by input hash; lost responses can cause repeated external effects. Each instance supports up to 64 MiB of combined stored state and execution metadata, measured as serialized database JSON. Contexts impose no separate request-wide size or record-count budget. Deployment transport limits, available resources, and execution deadlines still apply. Error responses identify committed and failed instances when known; a failed request does not imply rollback of earlier writes.
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
client.contexts.bulk_ingest(
  slug: "loan-application",
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

**slug:** `String` — The unique slug for the context.

</dd>
</dl>

<dl>
<dd>

**include:** `String` — Select comma-separated fields; `instance_id` is always returned. Default: state and execution summaries. Opt-ins: `executions` (stored metadata), `execution_results` (`executed[].result`). Compact outcomes with flow IDs: `status,triggered,executed`. Unavailable fields are omitted. History: `/history`. Fields: positions, is_new, status, have, need, state, derived, expires_at, created_at, updated_at, executions, executed, triggered, reason, cascaded, relations, execution_results.

</dd>
</dl>

<dl>
<dd>

**request:** `Internal::Types::Array[Internal::Types::Hash[String, Object]]`

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

<details><summary><code>client.assets.rules.<a href="/lib/rulebricks/assets/rules/client.rb">pull</a>() -> Rulebricks::Types::RuleExport</code></summary>
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

<details><summary><code>client.assets.rules.<a href="/lib/rulebricks/assets/rules/client.rb">push</a>(request) -> Rulebricks::Types::RuleExport</code></summary>
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
      priority: 0,
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
      priority: 0,
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

List rules in the organization, scoped to the API key holder's user groups. Combine folder, labels, user_group, id, slug, name, and search filters. When version is supplied, the filters must match exactly one accessible rule: multiple matches return 400 and no matches return 404. Version accepts a published version number, release environment slug, or latest, using the same publication and access checks as execution. A missing version or release returns 404. The response remains an array; schemas and condition count come from the selected version, while descriptive workspace metadata stays current. Without version, published rules use their published schemas and unpublished rules use their drafts.
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

**id:** `String` — Filter by the exact rule or flow ID.

</dd>
</dl>

<dl>
<dd>

**slug:** `String` — Filter by the exact rule or flow slug (case-sensitive).

</dd>
</dl>

<dl>
<dd>

**search:** `String` — Match an exact ID or slug, or a case-insensitive substring of the name. Combined with all other filters.

</dd>
</dl>

<dl>
<dd>

**version:** `String` — Select a published version number (e.g. 3), release environment slug (e.g. production), or latest. Requires exactly one asset after all filters and permission checks. Multiple matches or an invalid version return 400; no match, an unpublished asset, or a missing version/release returns 404. The response is still a one-item array.

</dd>
</dl>

<dl>
<dd>

**folder:** `String` — Filter results by folder name or folder ID.

</dd>
</dl>

<dl>
<dd>

**labels:** `String` — Filter results to assets containing all comma-separated labels.

</dd>
</dl>

<dl>
<dd>

**user_group:** `String` — Filter results by user group name or ID. The value is validated against workspace groups. Admin/unrestricted API keys can request any group-specific view; restricted API keys may only filter to one of their assigned groups and receive a 403 when filtering outside those groups.

</dd>
</dl>

<dl>
<dd>

**name:** `String` — Filter results by name using a case-insensitive substring match.

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

List flows in the organization, scoped to the API key holder's user groups. Combine folder, labels, user_group, id, slug, name, and search filters. When version is supplied, the filters must match exactly one accessible flow: multiple matches return 400 and no matches return 404. Version accepts a published version number, release environment slug, or latest, using the same publication and access checks as execution. A missing version or release returns 404. The response remains an array; request_schema and origin_rule come from the selected graph, while descriptive workspace metadata stays current. Without version, published flows use their published graph and unpublished flows use their draft graph. Flows do not declare a response schema.
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

**id:** `String` — Filter by the exact rule or flow ID.

</dd>
</dl>

<dl>
<dd>

**slug:** `String` — Filter by the exact rule or flow slug (case-sensitive).

</dd>
</dl>

<dl>
<dd>

**search:** `String` — Match an exact ID or slug, or a case-insensitive substring of the name. Combined with all other filters.

</dd>
</dl>

<dl>
<dd>

**version:** `String` — Select a published version number (e.g. 3), release environment slug (e.g. production), or latest. Requires exactly one asset after all filters and permission checks. Multiple matches or an invalid version return 400; no match, an unpublished asset, or a missing version/release returns 404. The response is still a one-item array.

</dd>
</dl>

<dl>
<dd>

**folder:** `String` — Filter results by folder name or folder ID.

</dd>
</dl>

<dl>
<dd>

**labels:** `String` — Filter results to assets containing all comma-separated labels.

</dd>
</dl>

<dl>
<dd>

**user_group:** `String` — Filter results by user group name or ID. The value is validated against workspace groups. Admin/unrestricted API keys can request any group-specific view; restricted API keys may only filter to one of their assigned groups and receive a 403 when filtering outside those groups.

</dd>
</dl>

<dl>
<dd>

**name:** `String` — Filter results by name using a case-insensitive substring match.

</dd>
</dl>

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

<details><summary><code>client.assets.flows.<a href="/lib/rulebricks/assets/flows/client.rb">push</a>(request) -> Rulebricks::Types::FlowImportResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create or update a flow from the Rulebricks Flow Schema (a list of `nodes` and `connections`). The server expands the Rulebricks Flow Schema definition into the full flow graph - laying it out, wiring property/control handles, resolving referenced published rules, and backfilling node defaults - so the result both renders in the editor and executes via `/flows/{slug}` without any manual editing. If `id` is provided the matching flow is updated; otherwise a new flow is created (`id`/`slug` auto-generated). Flows auto-publish unless `_publish` is set to `false`.
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
client.assets.flows.push(flow: {
  name: "Underwriting Flow",
  publish: true,
  nodes: [{
    ref: "input",
    type: "origin",
    rule: "customer-eligibility"
  }, {
    ref: "gate",
    type: "continue_if",
    condition: {
      property: "approved",
      operator: "equals",
      args: []
    }
  }, {
    ref: "enrich",
    type: "code",
    code: "outputs.tier = inputs.score > 700 ? 'A' : 'B'",
    outputs: [{
      key: "tier",
      type: "string"
    }]
  }, {
    ref: "out",
    type: "result",
    key: "data"
  }],
  connections: [{
    from: "input",
    output: "approved",
    to: "gate"
  }, {
    from: "input",
    output: "score",
    to: "enrich",
    input: "score"
  }, {
    from: "gate",
    to: "out",
    control: true
  }, {
    from: "enrich",
    output: "tier",
    to: "out"
  }]
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

**flow:** `Rulebricks::Types::FlowImportPayload`

</dd>
</dl>

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

<details><summary><code>client.assets.flows.<a href="/lib/rulebricks/assets/flows/client.rb">pull</a>() -> Rulebricks::Types::FlowImportPayload</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Export a flow into the Rulebricks Flow Schema (nodes + connections), the same shape accepted by `/admin/flows/import`. Works for flows built entirely by hand in the editor, so they can be round-tripped or version-controlled. This is distinct from the top-level `/admin/export`, which produces `.rbm` manifests.
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
client.assets.flows.pull
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

**id:** `String` — The ID of the flow to export (provide `id` or `slug`).

</dd>
</dl>

<dl>
<dd>

**slug:** `String` — The slug of the flow to export (provide `id` or `slug`).

</dd>
</dl>

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

<details><summary><code>client.assets.flows.<a href="/lib/rulebricks/assets/flows/client.rb">delete</a>(request) -> Rulebricks::Types::SuccessMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a specific flow by its ID.
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
client.assets.flows.delete(id: "3855f8da-2654-4df9-8903-8f797cbfe8ec")
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

**id:** `String` — The ID of the flow to delete.

</dd>
</dl>

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

**user_group:** `String` — Filter results by user group name or ID. The value is validated against workspace groups. Admin/unrestricted API keys can request any group-specific view; restricted API keys may only filter to one of their assigned groups and receive a 403 when filtering outside those groups.

</dd>
</dl>

<dl>
<dd>

**name:** `String` — Filter results by name using a case-insensitive substring match.

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

<details><summary><code>client.assets.folders.<a href="/lib/rulebricks/assets/folders/client.rb">upsert</a>(request) -> Rulebricks::Types::Folder</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new folder or update an existing one for the authenticated user. Folders are typed to organize rules (the default), flows, or contexts.
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

**type:** `Rulebricks::Assets::Folders::Types::UpsertFolderRequestType` — The type of assets the folder organizes. Applies on creation; ignored when updating an existing folder.

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

## Assets Contexts
<details><summary><code>client.assets.contexts.<a href="/lib/rulebricks/assets/contexts/client.rb">list</a>() -> Rulebricks::Assets::Contexts::Types::ListContextsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List contexts accessible to the API key. Filter by context name, folder name/ID, or an accessible user group's name/ID. Returns an array when pagination is omitted; optional limit/cursor pagination returns {data,cursor} in descending creation time and ID order.
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
client.assets.contexts.list
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

**limit:** `Integer` — Page size; enables the {data,cursor} response.

</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Opaque cursor returned by the previous page; requires limit.

</dd>
</dl>

<dl>
<dd>

**folder:** `String` — Filter results by folder name or folder ID.

</dd>
</dl>

<dl>
<dd>

**user_group:** `String` — Filter results by user group name or ID. The value is validated against workspace groups. Admin/unrestricted API keys can request any group-specific view; restricted API keys may only filter to one of their assigned groups and receive a 403 when filtering outside those groups.

</dd>
</dl>

<dl>
<dd>

**name:** `String` — Filter results by name using a case-insensitive substring match.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Contexts::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.contexts.<a href="/lib/rulebricks/assets/contexts/client.rb">create</a>(request) -> Rulebricks::Types::CreateContextResponse</code></summary>
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
client.assets.contexts.create(
  name: "Customer",
  description: "Represents a customer in the system",
  schema: {
    base: [{
      key: "email",
      name: "Email",
      type: "string",
      required: true
    }, {
      key: "age",
      name: "Age",
      type: "number"
    }],
    derived: []
  },
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

**name:** `String` — The name of the context. The context's slug is generated from it (suffixed on collision).

</dd>
</dl>

<dl>
<dd>

**description:** `String` — The description of the context.

</dd>
</dl>

<dl>
<dd>

**schema:** `Rulebricks::Types::ContextSchema` — The context's schema: an object with `base` (stored facts; at least one required) and optional `derived` (expression-computed facts) field arrays.

</dd>
</dl>

<dl>
<dd>

**identity_fact:** `String` — The fact key to use as the unique identifier for instances. Must be a key from schema.base.

</dd>
</dl>

<dl>
<dd>

**auto_execute_decisions:** `Internal::Types::Boolean` — When true (default), bound rules and flows automatically execute when their inputs are satisfied.

</dd>
</dl>

<dl>
<dd>

**ttl_seconds:** `Integer` — Time-to-live in seconds for live context instances (60 seconds to 30 days). Instances expire after this duration; each write extends the expiry.

</dd>
</dl>

<dl>
<dd>

**history_limit:** `Integer` — Maximum number of history entries to retain per field.

</dd>
</dl>

<dl>
<dd>

**on_schema_mismatch:** `Rulebricks::Assets::Contexts::Types::CreateContextRequestOnSchemaMismatch` — How to handle submitted fields that don't match the schema: `ignore` drops them, `reject` fails the request (or the batch item), `store` persists them alongside declared facts.

</dd>
</dl>

<dl>
<dd>

**source_objects:** `Internal::Types::Array[String]` — Workspace object IDs associated with this context schema.

</dd>
</dl>

<dl>
<dd>

**user_groups:** `Internal::Types::Array[String]` — User groups allowed to access the context.

</dd>
</dl>

<dl>
<dd>

**folder:** `String` — Context folder ID.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Contexts::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.contexts.<a href="/lib/rulebricks/assets/contexts/client.rb">get</a>(id) -> Rulebricks::Types::ContextDetail</code></summary>
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
client.assets.contexts.get(id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")
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

**request_options:** `Rulebricks::Assets::Contexts::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.contexts.<a href="/lib/rulebricks/assets/contexts/client.rb">update</a>(id, request) -> Rulebricks::Types::UpdateContextResponse</code></summary>
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
client.assets.contexts.update(
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

**name:** `String` — The name of the context. Changing it regenerates the context's slug.

</dd>
</dl>

<dl>
<dd>

**description:** `String` — The description of the context.

</dd>
</dl>

<dl>
<dd>

**schema:** `Rulebricks::Types::ContextSchema` — Updated schema for the context: an object with `base` and optional `derived` field arrays.

</dd>
</dl>

<dl>
<dd>

**identity_fact:** `String` — The fact key to use as the unique identifier for instances. Must be a key from schema.base. Caution: changing this on a context with live instances changes how future writes resolve instances.

</dd>
</dl>

<dl>
<dd>

**auto_execute_decisions:** `Internal::Types::Boolean` — When true, bound rules and flows automatically execute when their inputs are satisfied.

</dd>
</dl>

<dl>
<dd>

**ttl_seconds:** `Integer` — Time-to-live in seconds for live context instances (60 seconds to 30 days). Instances expire after this duration.

</dd>
</dl>

<dl>
<dd>

**history_limit:** `Integer` — Maximum number of history entries to retain per field.

</dd>
</dl>

<dl>
<dd>

**on_schema_mismatch:** `Rulebricks::Assets::Contexts::Types::UpdateContextRequestOnSchemaMismatch` — How to handle submitted fields that don't match the schema: `ignore` drops them, `reject` fails the request (or the batch item), `store` persists them alongside declared facts.

</dd>
</dl>

<dl>
<dd>

**source_objects:** `Internal::Types::Array[String]` — Workspace object IDs associated with this context schema.

</dd>
</dl>

<dl>
<dd>

**user_groups:** `Internal::Types::Array[String]` — User groups allowed to access the context.

</dd>
</dl>

<dl>
<dd>

**folder:** `String` — Context folder ID.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Contexts::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.contexts.<a href="/lib/rulebricks/assets/contexts/client.rb">delete</a>(id) -> Rulebricks::Types::DeleteContextResponse</code></summary>
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
client.assets.contexts.delete(id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")
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

**request_options:** `Rulebricks::Assets::Contexts::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Assets Contexts Relationships
<details><summary><code>client.assets.contexts.relationships.<a href="/lib/rulebricks/assets/contexts/relationships/client.rb">list</a>(id) -> Rulebricks::Types::ContextRelationshipsResponse</code></summary>
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
client.assets.contexts.relationships.list(id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")
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

**request_options:** `Rulebricks::Assets::Contexts::Relationships::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.contexts.relationships.<a href="/lib/rulebricks/assets/contexts/relationships/client.rb">create</a>(id, request) -> Rulebricks::Types::ContextRelationshipOutgoing</code></summary>
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
client.assets.contexts.relationships.create(
  id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  to_context_id: "b2c3d4e5-f6a7-8901-bcde-f12345678901",
  relation_type: "has_many",
  foreign_key_fact: "customer_id",
  name: "customer_orders"
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

**relation_type:** `Rulebricks::Assets::Contexts::Relationships::Types::CreateRelationshipRequestRelationType` — The type of relationship.

</dd>
</dl>

<dl>
<dd>

**foreign_key_fact:** `String` — The field key to use as the foreign key.

</dd>
</dl>

<dl>
<dd>

**name:** `String` — Optional runtime relationship key. It is normalized to lowercase snake_case; the target context slug is used when omitted.

</dd>
</dl>

<dl>
<dd>

**description:** `String` — Description of the relationship.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Rulebricks::Assets::Contexts::Relationships::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.assets.contexts.relationships.<a href="/lib/rulebricks/assets/contexts/relationships/client.rb">delete</a>(id, relationship) -> Rulebricks::Types::DeleteRelationshipResponse</code></summary>
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
client.assets.contexts.relationships.delete(
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

**request_options:** `Rulebricks::Assets::Contexts::Relationships::RequestOptions`

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

Adds a new test to the rule. `contains` (Contains Data, the default) finds the expected fragment anywhere in the output, `matches` (Matches Exactly) requires complete equality, and `excludes` (Excludes Data) requires the fragment to be absent.
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
  policy: "contains",
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

<details><summary><code>client.tests.rules.<a href="/lib/rulebricks/tests/rules/client.rb">run</a>(slug, request) -> Rulebricks::Types::RunTestsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Executes every test in the rule's test suite (or only the critical tests when `critical_only` is true) and returns a summary of which passed, which failed, and whether any CRITICAL test failed. Use the `critical_failure` flag as the signal for whether a release should be blocked. Tests always run against the latest draft of the rule; version targeting does not apply.
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
client.tests.rules.run(
  slug: "slug",
  critical_only: false
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

**request:** `Rulebricks::Types::RunTestsRequest`

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

Adds a new test to the flow. `contains` (Contains Data, the default) finds the expected fragment anywhere in the output, `matches` (Matches Exactly) requires complete equality, and `excludes` (Excludes Data) requires the fragment to be absent.
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
  policy: "contains",
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

<details><summary><code>client.tests.flows.<a href="/lib/rulebricks/tests/flows/client.rb">run</a>(slug, request) -> Rulebricks::Types::RunTestsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Executes every test in the flow's test suite (or only the critical tests when `critical_only` is true) against the flow's current graph and returns a summary of which passed, which failed, and whether any CRITICAL test failed. Tests always run against the latest draft of the flow; version targeting does not apply.
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
client.tests.flows.run(
  slug: "slug",
  critical_only: false
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

**request:** `Rulebricks::Types::RunTestsRequest`

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

