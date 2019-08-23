module Swn
  class Organizations < Grape::API
    resource :organizations do
      get do
        organizations = Organization.all
        return organizations
      end

      post do
        Rails.logger.debug 'POST Organizations' + params.inspect
        organizations = Organization.new
        return organizations
      end

    end
  end
end
