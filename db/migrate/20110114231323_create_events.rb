class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :user_id
      t.string :event_type
      t.string :event_sub_type
      t.integer :response
      t.string :event_key, :limit => 36
      t.string :user_session_guid, :limit => 36

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
