require 'omniauth-oauth2'
require 'jwt'

module OmniAuth
  module Strategies
    class XeroOauth2 < OmniAuth::Strategies::OAuth2
      option :name, :xero_oauth2

      option(
        :client_options,
        {
          site: 'https://api.xero.com/api.xro/2.0',
          authorize_url: 'https://login.xero.com/identity/connect/authorize',
          token_url: 'https://identity.xero.com/connect/token',
        },
      )

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      extra do
        {
          id_token: id_token,
          xero_tenants: xero_tenants,
          raw_info: raw_info,
        }
      end

      info do
        {
          name: raw_info['given_name'] + ' ' + raw_info['family_name'],
          first_name: raw_info['given_name'],
          last_name: raw_info['family_name'],
          email: raw_info['email'],
        }
      end

      uid { raw_info['xero_userid'] }

      private
      def id_token
        @id_token ||= access_token['id_token']
      end

      def raw_info
        if access_token['id_token'] == nil
          @raw_info = {
            'xero_userid'=> '',
            'given_name' => '',
            'family_name' => '',
            'email' => '',
          }
        else
          decoded_info ||= JWT.decode @id_token, nil, false
          @raw_info ||= decoded_info[0]
        end
      end

      def xero_tenants
        @xero_tenants ||= JSON.parse(access_token.get("https://api.xero.com/connections", {'Authorization'=>('Bearer ' + access_token.token),'Accept'=>'application/json'}).body)
      end
    end
  end
end
