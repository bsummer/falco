class CreateStreamQueues < ActiveRecord::Migration
  def self.up
    create_table :stream_queues do |t|
      t.integer :user_id
      t.string :published, :limit => 1
      t.text :stream_data
      t.integer :publish_attempt
      t.integer :to_facebook_id
      t.string :event_key, :limit => 64
      t.timestamp :date_completed
      t.timestamp :date_scheduled
      t.string :event_sub_type

      t.timestamps
    end
  end

  def self.down
    drop_table :stream_queues
  end
end
