class CreateNfcCards < ActiveRecord::Migration[5.2]
  def change
    create_table :nfc_cards do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :uid
      t.string :password
      t.boolean :is_activated, null: false, default: true

      t.timestamps
    end
  end
end
