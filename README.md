# WeiboApi

A Ruby wrapper for the Weibo API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weibo_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weibo_api

## Usage

**config/initializers/weibo_api.rb**
```ruby
WeiboApi.config do |config|
  config.client_id = ENV['weibo_client_id']
  config.client_secret = ENV['weibo_client_secret']
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ocarta-l/weibo_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
