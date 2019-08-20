class CreateSesameDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :sesame_devices do |t|
      t.references :organization, foreign_key: true
      t.string :device_id
      t.string :nickname
      t.string :serial

      t.timestamps
    end
  end
end
