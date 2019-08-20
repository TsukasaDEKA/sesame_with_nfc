class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :organization, foreign_key: true
      t.string :name
      t.string :auth_key
      t.string :password_for_cms
      t.integer :roll
      t.boolean :is_activated, null: false, default: true

      t.timestamps
    end
  end
end
