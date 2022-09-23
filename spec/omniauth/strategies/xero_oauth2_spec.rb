require 'spec_helper'
require 'omniauth/strategies/xero_oauth2'

RSpec.describe OmniAuth::Strategies::XeroOauth2 do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }
  let(:app) {
    lambda do
      [200, {}, ["Hello."]]
    end
  }

  subject do
    OmniAuth::Strategies::XeroOauth2.new(app, 'xero_api_client_id', 'xero_api_client_secret', @options || {}).tap do |strategy|
      allow(strategy).to receive(:request) do
        request
      end
    end
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe 'callback_url' do

    let(:base_url) { 'https://example.com' }

    it 'has the correct default callback path' do
      allow(subject).to receive(:full_host) { base_url }
      allow(subject).to receive(:script_name) { '' }
      expect(subject.callback_url).to eq(base_url + '/auth/xero_oauth2/callback')
    end

    it 'should set the callback path with script_name if present' do
      allow(subject).to receive(:full_host) { base_url }
      allow(subject).to receive(:script_name) { '/v1' }
      expect(subject.callback_url).to eq(base_url + '/v1/auth/xero_oauth2/callback')
    end
  end
end