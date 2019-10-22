module Swn
  class SystemAdmin < Grape::API
    before do
      system_admin_authenticate!
    end

    resource :organizations do
      get do
        organizations = Organization.all
        return organizations
      end

      post do
        organization = Organization.new(name: params['name'], sesame_api_key:  params['name'])
        organization.save
        organization_status = {
          "id":organization.id,
          "name":organization.name,
          "auth_key":organization.auth_key
        }
        organization_status
      end
    end
  end
end
