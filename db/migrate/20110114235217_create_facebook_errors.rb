class CreateFacebookErrors < ActiveRecord::Migration
  def self.up
    create_table :facebook_errors do |t|
      t.integer :user_id
      t.integer :stream_queue_id
      t.string :event_key
      t.text :action
      t.text :error
      t.integer :code

      t.timestamps
    end
  end

  def self.down
    drop_table :facebook_errors
  end
end
