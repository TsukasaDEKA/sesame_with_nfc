class AddNotNullConstrain < ActiveRecord::Migration[5.2]
  def change
    change_column_null :organizations, :name, false
    change_column_null :organizations, :auth_key, false
    change_column_null :organizations, :sesame_api_key, false

    change_column_null :users, :organization_id, false
    change_column_null :users, :name, false
    change_column_null :users, :auth_key, false
    change_column_null :users, :password_for_cms, false
    change_column_null :users, :roll, false

    change_column_null :sesame_devices, :organization_id, false
    change_column_null :sesame_devices, :device_id, false
    change_column_null :sesame_devices, :nickname, false
    change_column_null :sesame_devices, :serial, false

    change_column_null :nfc_cards, :user_id, false
    change_column_null :nfc_cards, :name, false
    change_column_null :nfc_cards, :uid, false
    change_column_null :nfc_cards, :password, false
  end
end
