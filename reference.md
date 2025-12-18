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
  slug: 'slug',
  request: {}
);
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
  slug: 'slug',
  body: [{}, {}]
);
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
  body: {}
});
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
  slug: 'slug',
  request: {}
);
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
  search: 'status=200',
  rules: 'Lead Qualification,Pricing Calculator',
  statuses: '200,400,500'
);
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

Invite a new user to the organization or update role or access group data for an existing user.
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
  email: 'newuser@example.com',
  role: 'developer',
  access_groups: ['group1', 'group2']
);
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

**access_groups:** `Internal::Types::Array[String]` — List of access group names or IDs to assign to the user. All specified groups must exist in your organization.
    
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

List all users (including the admin and all team members) in the organization with their details including email, name, API key, role, access groups, and join date.
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
client.users.list();
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
  email: 'newuser@example.com',
  password: 'securePassword123'
);
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

**access_groups:** `Internal::Types::Array[String]` — List of access group names or IDs to assign to the user.
    
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
client.assets.get_usage();
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
client.values.list(include: 'usage');
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
  access_groups: ['marketing', 'developers']
);
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

**access_groups:** `Internal::Types::Array[String]` — Optional array of access group names or IDs. If omitted and user belongs to access groups, values will be assigned to all user's access groups. Required if values should be restricted to specific access groups.
    
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
client.values.delete(id: 'id');
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
client.assets.rules.delete(id: '2855f8da-2654-4df9-8903-8f797cbfe8eb');
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

Export a specific rule by its ID.
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
client.assets.rules.pull(id: '2855f8da-2654-4df9-8903-8f797cbfe8eb');
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

Import a rule into the user's account.
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
client.assets.rules.push(rule: {});
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

**rule:** `Internal::Types::Hash[String, Object]` — The rule data to import.
    
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

List all rules in the organization. Optionally filter by folder name or ID.
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
client.assets.rules.list(folder: 'Marketing Rules');
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
client.assets.flows.list();
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
client.assets.folders.list();
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
  name: 'Marketing Rules',
  description: 'Rules for marketing automation workflows'
);
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
client.assets.folders.delete(id: 'abc123');
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
client.tests.rules.list(slug: 'slug');
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
  slug: 'slug',
  name: 'Test 3',
  request: {},
  response: {},
  critical: true
);
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
  slug: 'slug',
  test_id: 'testId'
);
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
client.tests.flows.list(slug: 'slug');
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
  slug: 'slug',
  name: 'Test 3',
  request: {},
  response: {},
  critical: true
);
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
  slug: 'slug',
  test_id: 'testId'
);
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
client.users.groups.list();
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
  name: 'NewGroup',
  description: 'Description of the new group.'
);
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
