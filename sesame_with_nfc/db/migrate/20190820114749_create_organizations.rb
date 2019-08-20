class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :auth_key
      t.string :sesame_api_key
      t.boolean :is_activated, null: false, default: true

      t.timestamps
    end
  end
end
