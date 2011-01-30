class CreateNotificationEvents < ActiveRecord::Migration
  def self.up
    create_table :notification_events do |t|
      t.integer :user_id
      t.string :event_type
      t.string :event_sub_type

      t.timestamps
    end
  end

  def self.down
    drop_table :notification_events
  end
end
