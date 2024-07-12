# Rulebricks Ruby SDK

The Rulebricks Ruby SDK allows you to interact with the Rulebricks API to authenticate and solve rules and flows. This README provides examples of how to use the SDK for these purposes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rulebricks_api_client'
```

And then execute:

```sh
bundle install
```

Or install it yourself as:

```sh
gem install rulebricks_api_client
```

## Usage

### Authentication

To authenticate with the Rulebricks API, you need to create a client instance with your API key:

```ruby
require 'rulebricks_api_client'

api_key = 'your_api_key'
client = RulebricksApiClient::Client.new(api_key: api_key)
```

### Solving a Rule

To solve a rule using the SDK, you can use the `solve_rule` method:

```ruby
rule_id = 'your_rule_id'
input_data = {
  # Your input data here
}

response = client.solve_rule(rule_id, input_data)
puts response
```

### Solving a Flow

To solve a flow using the SDK, you can use the `solve_flow` method:

```ruby
flow_id = 'your_flow_id'
input_data = {
  # Your input data here
}

response = client.solve_flow(flow_id, input_data)
puts response
```

## Dependencies

The Rulebricks Ruby SDK depends on the following gems:

- async-http-faraday (>= 0.0, < 1.0)
- faraday (>= 1.10, < 3.0)
- faraday-net_http (>= 1.0, < 4.0)
- faraday-retry (>= 1.0, < 3.0)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rulebricks/ruby-sdk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Version

The current version of the Rulebricks Ruby SDK is 1.0.0.

## Ruby Version

This gem requires Ruby version 2.7.0 or higher.
