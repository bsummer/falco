class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.integer :enabled, :limit => 4
      t.datetime :date_last_start
      t.datetime :date_last_end
      t.string :last_node
      t.integer :duration_limit_sec

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
