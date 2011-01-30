class CreateEventPublishings < ActiveRecord::Migration
  def self.up
    create_table :event_publishings do |t|
      t.integer :event_id
      t.integer :stream_publish_post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :event_publishings
  end
end
