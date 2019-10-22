module Swn
  class Users < Grape::API
    resource :users do
      # index
      get do
        organization_admin_authenticate!
        User.where(organization_id: current_organization.id)
      end

      # create
      post do
        organization_admin_authenticate!
        params_validate(params)
        roll = params['roll'].present? ? params['roll'].to_i : User.rolls['general_user']
        default_password = SecureRandom.hex(10).encode("UTF-8")
        new_user = User.new(organization_id: current_organization.id,
                            name: params['name'],
                            password_for_cms: default_password,
                            roll: roll)
        error!("Couldn't create new_user.", 421) unless new_user.save

        new_user.decrypt_password_for_cms
        new_user_status = {
          "id": new_user.id,
          "name": new_user.name,
          "default_password": new_user.password_for_cms
        }
        new_user_status
      end

      # login
      post ':id/login' do
        password = encrypt(params[:password])
        user = User.find_by(id: params[:id], name: params[:name], password_for_cms: password)
        error!("Invalid user_id, name or password.", 401) unless user
        user.regenerate_auth_key
        return {"new_auth_key":user.auth_key}
      end
    end

    helpers do
      def params_validate params
        valid_roll = [nil, User.rolls['general_user'], User.rolls['organization_admin']]
        error!("Invalid roll.", 421) unless valid_roll.include?(params['roll'].to_i)
      end
    end
  end
end
