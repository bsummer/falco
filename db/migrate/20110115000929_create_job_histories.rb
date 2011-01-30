class CreateJobHistories < ActiveRecord::Migration
  def self.up
    create_table :job_histories do |t|
      t.integer :job_id
      t.datetime :date_start
      t.datetime :date_end
      t.integer :num_operations
      t.string :summary, :limit => 1024
      t.string :request_id, :limit => 60

      t.timestamps
    end
  end

  def self.down
    drop_table :job_histories
  end
end
