# OmniAuth LaunchKey

LaunchKey OAuth 2.0 strategy for [OmniAuth](https://github.com/intridea/omniauth)
1.0. Read the [LaunchKey OAuth docs](https://launchkey.com/docs/oauth/getting-started)
for details.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-launchkey'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-launchkey

## Usage

Read the [OmniAuth docs](https://github.com/intridea/omniauth) for detailed
instructions. See `example/` for an example of LaunchKey's OAuth flow
using Sinatra.

### Rails Example

The OmniAuth strategy can be configured in an initializer
(e.g. `config/initializers/omniauth.rb`):

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :launchkey, ENV['LAUNCHKEY_CLIENT_ID'], ENV['LAUNCHKEY_CLIENT_SECRET']
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
