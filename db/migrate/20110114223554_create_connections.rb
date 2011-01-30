class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.integer :user_id
      t.integer :selected_user_id
      t.string :selection_state
      t.string :action_state
      t.datetime :date_created
      t.datetime :date_modified

      t.timestamps
    end
  end

  def self.down
    drop_table :connections
  end
end
