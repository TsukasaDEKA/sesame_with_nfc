class CreateDoorLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :door_logs do |t|
      t.references :sesame_device, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :before_door_status, null: false, default: false
      t.boolean :after_door_status, null: false, default: false

      t.timestamps
    end
  end
end
