class CreatePageViews < ActiveRecord::Migration
  def self.up
    create_table :page_views do |t|
      t.integer :user_id
      t.string :source
      t.string :destination
      t.string :ip, :limit => 15
      t.text :user_agent
      t.string :facebook_session
      t.string :event_key
      t.integer :facebook_id
      t.string :user_session_id, :limit => 100
      t.string :server_id, :limit => 45

      t.timestamps
    end
  end

  def self.down
    drop_table :page_views
  end
end
