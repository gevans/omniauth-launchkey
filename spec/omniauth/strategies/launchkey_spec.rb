require 'spec_helper'

describe OmniAuth::Strategies::LaunchKey do

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  let(:strategy) do
    described_class.new('abc', 'def')
  end

  subject do
    strategy
  end

  it 'camelizes "launchkey" to "LaunchKey"' do
    expect(OmniAuth::Utils.camelize('launchkey')).to eq('LaunchKey')
  end

  describe 'client options' do

    let(:client) do
      strategy.client
    end

    subject(:options) do
      client.options
    end

    it 'uses https://oauth.launchkey.com as the site' do
      expect(client.site).to eq('https://oauth.launchkey.com')
    end

    it 'authorizes with /authorize' do
      expect(options[:authorize_url]).to eq('/authorize')
    end

    it 'exchanges tokens at /authorize' do
      expect(options[:token_url]).to eq('/access_token')
    end

    it 'uses packages SSL CA certificate bundle' do
      bundle_path = File.expand_path(File.join('..', '..', '..', '..', 'resources', 'ca-bundle.crt'), __FILE__)
      expect(options[:connection_opts][:ssl][:ca_file]).to eq(bundle_path)
    end
  end

  describe '#uid' do

    let(:access_token) do
      double(OAuth2::AccessToken, params: {
        'user' => '123'
      })
    end

    before do
      strategy.access_token = access_token
    end

    it 'returns user param from #access_token params' do
      expect(strategy.uid).to eq('123')
    end
  end
end
