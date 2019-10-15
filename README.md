# omniauth-ruby-oauth2

## Installation
via RubyGem.org: 
simply:
```gem install 'omniauth-xero-oauth2'```

in your **_Gemfile_** add:
```gem 'omniauth-xero-oauth2```

via local install:
1. download or clone xero-ruby-oauth2, put it next to your rails app directory
2. in your ruby application (rails or sinatra) declare this local dependency in **_Gemfile_** with relative path (or absolute if you like), like so:

```gem 'omniauth-xero-oauth2', :path => '../xero-ruby-oauth2/omniauth'```

## Usage
In the omniauth initializer file (e.g. config/initializers/omniauth.rb), add the following:

```
ENV['xero_api_client_id'] = '5BF816xxxx'
ENV['xero_api_client_secret'] = 'Hgji76MyN2xxxx'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :xero_oauth2,
    ENV['xero_api_client_id'],
    ENV['xero_api_client_secret'],
    scope: 'openid profile email files accounting.transactions accounting.transactions.read accounting.reports.read accounting.journals.read accounting.settings accounting.settings.read accounting.contacts accounting.contacts.read accounting.attachments accounting.attachments.read offline_access',
  )
end

#by default the redirect_uri is set to /auth/xero_oauth2/callback
```

Noticed above that the client_id and client_secret are stored in environment variables to allow other controllers access to this. A typical use case would be using these to to refresh the access token and refresh token in the OAuth 2.0 flow.

If you would like to change the default redirect_uri to a custom one, you will need to add the folowing in the provider() input configuration:

```redirect_uri: 'https://your.apps/callback/url'```

A successful auth_hash looks like the below one. This follows the [Omniauth auth_hash schema](https://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema).

```
{"provider"=>:xero_oauth2,
 "uid"=>"ca038fba-29c3-xxxx-8f12-5b2a13cxxxx",
 "info"=>
  {"name"=>"Jenks Guo",
   "first_name"=>"Jenks",
   "last_name"=>"Guo",
   "email"=>"jenks.guo@xero.com"},
 "credentials"=>
  {"token"=>
    "eyJhbGciOiJ...",
   "refresh_token"=>
    "ce14c143eb2...",
   "expires_at"=>1567138948,
   "expires"=>true},
 "extra"=>
  {"id_token"=>
   "eyJhbG...",
   "xero_tenants"=>
    [{"id"=>"24b383c5-cdd1-xxxx-986b-af6334dxxxx",
      "tenantId"=>"d23184db-xxxx-4230-a9ef-982f0cbxxxx",
      "tenantType"=>"ORGANISATION"}],
   "raw_info"=>
    {"nbf"=>1567138xxx,
     "exp"=>1567138xxx,
     "iss"=>"https://identity.xero.com",
     "aud"=>"5BF816xxxx4C4FC4956EC42C631xxxx",
     "iat"=>156713xxxx,
     "at_hash"=>"0jCKQT_i9F15Ap7g6uxxxx",
     "sid"=>"04f5ee5a923xxxxef90e5c69161xxxx",
     "sub"=>"7de8efb2b5axxxx6a60cb6acc81xxxx",
     "auth_time"=>1567138172,
     "idp"=>"local",
     "xero_userid"=>"ca038fba-xxxx-415c-xxxx-5b2a13cxxxx",
     "global_session_id"=>"dfc0491e94xxxx518628xxxxd2fac1e",
     "preferred_username"=>"xxxxxxxxxxxxx",
     "email"=>"jenks.guo@xero.com",
     "given_name"=>"Jenks",
     "family_name"=>"Guo",
     "amr"=>["pwd"]
   }
  }
 } 
```

This ruby on rails Xero OAuth2 demo application is a good example of how to use this gem:
TO DO

## Contributing 
Bug reports and pull requests are welcome on GitHub at https://github.com/XeroAPI/xero-ruby-oauth2/.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
