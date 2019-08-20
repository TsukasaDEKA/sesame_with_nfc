json.extract! nfc_card, :id, :user_id, :name, :uid, :password, :is_activated, :created_at, :updated_at
json.url nfc_card_url(nfc_card, format: :json)
