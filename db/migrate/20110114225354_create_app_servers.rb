class CreateAppServers < ActiveRecord::Migration
  def self.up
    create_table :app_servers do |t|
      t.string :host
      t.string :role
      t.string :server_url
      t.datetime :heartbeat

      t.timestamps
    end
  end

  def self.down
    drop_table :app_servers
  end
end
