class CreateFacebookProfiles < ActiveRecord::Migration
  def self.up
    create_table :facebook_profiles do |t|
      t.integer :user_id
      t.string :sex, :limit => 6
      t.date :birthday
      t.string :locale, :limit => 10
      t.string :about_me, :limit => 4000
      t.string :first_name, :limit => 55
      t.string :last_name, :limit => 55
      t.string :country, :limit => 55
      t.string :state, :limit => 55
      t.string :city, :limit => 55
      t.integer :zip, :limit => 11
      t.integer :facebook_friend_count, :limit => 11
      t.string :pic_big
      t.string :pic_square
      t.integer :lat, :limit => 11
      t.integer :lng, :limit => 11

      t.timestamps
    end
  end

  def self.down
    drop_table :facebook_profiles
  end
end
