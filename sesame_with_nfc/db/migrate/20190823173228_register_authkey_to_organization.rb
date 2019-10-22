class RegisterAuthkeyToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_index :organizations, :auth_key, unique: true
    add_index :users, :auth_key, unique: true
  end
end
