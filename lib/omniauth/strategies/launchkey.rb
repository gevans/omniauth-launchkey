require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class LaunchKey < OmniAuth::Strategies::OAuth2

      option :client_options, {
        authorize_url: '/authorize',
        site: 'https://oauth.launchkey.com',
        ssl: {
          ca_file: File.expand_path(File.join('..', '..', '..', '..', 'resources', 'ca-bundle.crt'), __FILE__)
        },
        token_url: '/access_token'
      }

      uid do
        access_token.params['user']
      end
    end
  end
end

OmniAuth.config.add_camelization 'launchkey', 'LaunchKey'
