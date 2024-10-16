class HelloController < ApplicationController
require 'paypal_server_sdk' #---according to instructions
include PaypalServerSdk #--according to instructions



  def index
    @client = ::PaypalServerSdk::Client.new(
      client_credentials_auth_credentials: ClientCredentialsAuthCredentials.new(
        o_auth_client_id: Rails.application.credentials.paypal[:OAuthClientId],
        o_auth_client_secret: Rails.application.credentials.paypal[:OAuthClientSecret]
      ),
      environment: Environment::SANDBOX,
      logging_configuration: LoggingConfiguration.new(
        log_level: Logger::INFO,
        request_logging_config: RequestLoggingConfiguration.new(
          log_body: true
        ),
        response_logging_config: ResponseLoggingConfiguration.new(
          log_headers: true
        )
      )
    )
  end

end
