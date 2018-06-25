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
WeiboApi.configure do |config|
  config.client_id = ENV['weibo_client_id']
  config.client_secret = ENV['weibo_client_secret']
end
```

All methods return a hash

```ruby
    # the access_token and the uid can be find with the omniauth gem https://github.com/beenhero/omniauth-weibo-oauth2
    weibo_user = WeiboApi::User.new(access_token, uid)
    
    # get the user info
    weibo_user.info
    
    # get the lastest weibos of the user
    weibo_user.timeline

    # or just find one specific
    weibo_user.show_status(weibo_id)
    
    # do a custom search
    weibo_user.custom_request('/comments/to_me')
```

Methods can take parameters (available on the [official documentation](http://open.weibo.com/wiki/API))

```ruby
    weibo_user.timeline(page: pages_count, since_id: starting_id)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ocarta-l/weibo_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
