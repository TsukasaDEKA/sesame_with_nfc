json.extract! user, :id, :organization_id, :name, :auth_key, :password_for_cms, :roll, :is_activated, :created_at, :updated_at
json.url user_url(user, format: :json)
