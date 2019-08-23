module Swn
  class Organizations < Grape::API
    resource :organizations do
      get do
        Rails.logger.debug "this is api method"
        organizations = Organization.all
        return organizations.count()
      end
    end
  end
end
