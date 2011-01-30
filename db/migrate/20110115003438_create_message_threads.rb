class CreateMessageThreads < ActiveRecord::Migration
  def self.up
    create_table :message_threads do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.string :subject
      t.timestamp :date_removed_by_sender
      t.timestamp :date_removed_by_receiver

      t.timestamps
    end
  end

  def self.down
    drop_table :message_threads
  end
end
