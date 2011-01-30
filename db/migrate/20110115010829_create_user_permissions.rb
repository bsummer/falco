class CreateUserPermissions < ActiveRecord::Migration
  def self.up
    create_table :user_permissions do |t|
      t.integer :user_id
      t.string :permission_type
      t.string :source
      t.integer :response, :limit => 4
      t.string :permission_source

      t.timestamps
    end
  end

  def self.down
    drop_table :user_permissions
  end
end
