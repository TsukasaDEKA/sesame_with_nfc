module Swn
  module Helpers
    module AuthenticateHelper
      TOKEN_PREFIX = /^Bearer:\s/
      TOKEN_REGEX = /^Bearer:\s(.+)/

      def authenticate!
        error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      end

      def organization_admin_authenticate!
        error!('Unauthorized. you are not admin.', 401) unless current_user || current_user.organization_admin?
      end

      def system_admin_authenticate!
        error!('Unauthorized. you are not system admin.', 401) unless current_user || current_user.system_admin?
      end

      def current_user
        return nil unless headers['Authorization'] && headers['Authorization'].match(TOKEN_REGEX)
        auth_key = headers['Authorization'].gsub(TOKEN_PREFIX, '')
        User.find_by(auth_key: auth_key, is_activated: true)
      end

      def current_organization
        user = current_user
        user.present? ? Organization.find(user.organization_id) : nil
      end
    end
  end
end
