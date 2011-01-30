class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :facebook_id
      t.string :userguid, :limit => 36
      t.string :email
      t.string :event_key
      t.timestamp :date_removed

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
