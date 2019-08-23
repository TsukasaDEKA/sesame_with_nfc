module Swn
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    begin
      ActiveRecord::Base.logger = Logger.new('log/sesame_with_nfc.log')
    end

    # rescue_from Grape::Exceptions::Base, with: :bad_request!
    # rescue_from ActiveRecord::RecordNotFound, with: :not_found!
    # rescue_from ActiveRecord::StaleObjectError, with: :conflict!
    # rescue_from ActiveRecord::RecordInvalid, with: :unprocessable!
    # rescue_from ActiveRecord::RecordNotSaved, with: :unprocessable!

    mount Swn::Organizations
  end
end
