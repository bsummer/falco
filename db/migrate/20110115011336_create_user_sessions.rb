class CreateUserSessions < ActiveRecord::Migration
  def self.up
    create_table :user_sessions do |t|
      t.integer :user_id
      t.string :last_user_session_guid, :limit => 36
      t.string :facebook_session, :limit => 80
      t.string :facebook_access_token, :limit => 120
      t.string :facebook_session_type, :limit => 45
      t.timestamp :date_last_connected
      t.timestamp :date_last_disconnected

      t.timestamps
    end
  end

  def self.down
    drop_table :user_sessions
  end
end
