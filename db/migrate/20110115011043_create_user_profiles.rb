class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :sex, :limit => 6
      t.date :birthday
      t.string :seeking
      t.string :country
      t.string :city
      t.string :state
      t.integer :sync, :limit => 4
      t.string :about_me, :limit => 4000
      t.integer :lat, :limit => 11
      t.integer :lng, :limit => 11

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
