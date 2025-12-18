![Banner](banner.png)

![License](https://img.shields.io/github/license/rulebricks/ruby-sdk)

## Ruby SDK

The Rulebricks Ruby library provides convenient access to the Rulebricks APIs from Ruby.

## Table of Contents

- [Reference](#reference)
- [Usage](#usage)
- [Environments](#environments)
- [Errors](#errors)
- [Advanced](#advanced)
  - [Timeouts](#timeouts)
- [Contributing](#contributing)

## Reference

A full reference for this library is available [here](./reference.md).

## Usage

Instantiate and use the client with the following:

```ruby
require "rulebricks"

client = Rulebricks::Client.new(api_key: '<value>');

client.rules.solve(
  slug: 'slug',
  request: {}
);
```

## Environments

This SDK allows you to configure different environments or custom URLs for API requests. You can either use the predefined environments or specify your own custom URL.

### Environments

```ruby
require "rulebricks"

rulebricks = Rulebricks::Client.new(
    base_url: Rulebricks::Environment::DEFAULT
)
```

### Custom URL

```ruby
require "rulebricks"

client = Rulebricks::Client.new(
    base_url: "https://rulebricks.com/api/v1"
)
```

## Errors

Failed API calls will raise errors that can be rescued from granularly.

```ruby
require "rulebricks"

client = Rulebricks::Client.new(
    base_url: "https://rulebricks.com/api/v1"
)

begin
    result = client.rules.solve
rescue Rulebricks::Errors::TimeoutError
    puts "API didn't respond before our timeout elapsed"
rescue Rulebricks::Errors::ServiceUnavailableError
    puts "API returned status 503, is probably overloaded, try again later"
rescue Rulebricks::Errors::ServerError
    puts "API returned some other 5xx status, this is probably a bug"
rescue Rulebricks::Errors::ResponseError => e
    puts "API returned an unexpected status other than 5xx: #{e.code} #{e.message}"
rescue Rulebricks::Errors::ApiError => e
    puts "Some other error occurred when calling the API: #{e.message}"
end
```

## Advanced

### Timeouts

The SDK defaults to a 60 second timeout. Use the `timeout` option to configure this behavior.

```ruby
require "rulebricks"

response = client.rules.solve(
    ...,
    timeout: 30  # 30 second timeout
)
```

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically.
Additions made directly to this library would have to be moved over to our generation code,
otherwise they would be overwritten upon the next generated release. Feel free to open a PR as
a proof of concept, but know that we will not be able to merge it as-is. We suggest opening
an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
