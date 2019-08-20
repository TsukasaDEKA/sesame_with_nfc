json.extract! door_log, :id, :sesame_device_id, :user_id, :before_door_status, :after_door_status, :created_at, :updated_at
json.url door_log_url(door_log, format: :json)
