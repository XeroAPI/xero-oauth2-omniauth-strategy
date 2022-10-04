require_relative 'lib/xero-oauth2/version'

Gem::Specification.new do |s|
  s.name        = 'omniauth-xero-oauth2'
  s.version     = OmniAuth::XeroOauth2::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'OAuth2 Omniauth strategy for Xero.'
  s.description = 'OAuth2 Omniauth straetgy for Xero API.'
  s.authors     = ['Xero API']
  s.email       = 'api@xero.com'
  s.homepage    = 'https://rubygems.org/gems/omniauth-xero-oauth2'
  s.metadata    = { 'source_code_uri' => 'https://github.com/XeroAPI/xero-oauth2-omniauth-strategy' }
  s.files       = ['lib/omniauth-xero-oauth2.rb','lib/xero-oauth2/version.rb','lib/omniauth/strategies/xero_oauth2.rb']

  s.add_dependency 'omniauth', '>= 2.0.0', '< 2.2.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.7.1'

  s.add_development_dependency 'rspec', '~> 3.6'
end