module Swn
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    helpers Swn::Helpers::AuthenticateHelper
    helpers Swn::Helpers::EncryptHelper

    begin
      ActiveRecord::Base.logger = Logger.new('log/sesame_with_nfc.log')
    end

    # rescue_from Grape::Exceptions::Base, with: :bad_request!
    # rescue_from ActiveRecord::RecordNotFound, with: :not_found!
    # rescue_from ActiveRecord::StaleObjectError, with: :conflict!
    # rescue_from ActiveRecord::RecordInvalid, with: :unprocessable!
    # rescue_from ActiveRecord::RecordNotSaved, with: :unprocessable!

    mount Swn::Organizations
    mount Swn::Users
    mount Swn::SystemAdmin

  end
end
