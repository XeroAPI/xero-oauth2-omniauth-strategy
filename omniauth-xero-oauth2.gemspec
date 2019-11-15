Gem::Specification.new do |s|
  s.name        = 'omniauth-xero-oauth2'
  s.version     = '0.9.3'
  s.licenses    = ['MIT']
  s.summary     = 'OAuth2 Omniauth strategy for Xero.'
  s.description = 'OAuth2 Omniauth straetgy for Xero API.'
  s.authors     = ['Xero API']
  s.email       = 'api@xero.com'
  s.homepage    = 'https://rubygems.org/gems/omniauth-xero-oauth2'
  s.metadata    = { 'source_code_uri' => 'https://github.com/XeroAPI/xero-oauth2-omniauth-strategy' }
  s.files       = ['lib/omniauth-xero-oauth2.rb','lib/xero-oauth2/version.rb','lib/omniauth/strategies/xero_oauth2.rb']

  s.add_dependency 'omniauth', '~>1.3'
  s.add_dependency 'omniauth-oauth2', '~>1.5'
  s.add_development_dependency 'bundler', '~> 1.16'
  s.add_development_dependency 'rake', '~> 10.0'
end