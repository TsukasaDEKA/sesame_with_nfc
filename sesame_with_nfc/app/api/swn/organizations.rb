module Swn
  class Organizations < Grape::API
    resource :organizations do
      # index
      get do
        system_admin_authenticate!
        Organization.all
      end

      # create
      post do
=begin
        細部は Swagger に書く。
        params:
          organization_name:string,
          sesame_api_key:string,
          admin_name:string,
          password:string
=end
        system_admin_authenticate!
        organization = Organization.new(name: params['organization_name'],
                                        sesame_api_key: params['sesame_api_key'])
        error!("Couldn't create organization.", 421) unless organization.save

        organization_admin = User.new(organization_id: organization.id,
                                      name: params['admin_name'],
                                      password_for_cms:  params['password'],
                                      roll: User.rolls['organization_admin'])
        if !organization_admin.save
          organization.destroy
          error!("Couldn't create organization admin.", 421)
        end

        organization_status = {
          "organization":{
            "id":organization.id,
            "name":organization.name,
            "auth_key":organization.auth_key
          },
          "organization_admin":{
            "id":organization_admin.id,
            "name":organization_admin.name,
            "auth_key":organization_admin.auth_key
          }
        }

        organization_status
      end

    end
  end
end
