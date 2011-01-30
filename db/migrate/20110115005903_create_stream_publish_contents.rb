class CreateStreamPublishContents < ActiveRecord::Migration
  def self.up
    create_table :stream_publish_contents do |t|
      t.integer :version
      t.string :type
      t.string :message
      t.string :media_name
      t.string :media_caption
      t.string :media_description
      t.string :media_src, :limit => 55
      t.string :media_action, :limit => 55

      t.timestamps
    end
  end

  def self.down
    drop_table :stream_publish_contents
  end
end
