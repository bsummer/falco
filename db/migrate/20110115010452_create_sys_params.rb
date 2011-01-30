class CreateSysParams < ActiveRecord::Migration
  def self.up
    create_table :sys_params do |t|
      t.string :param_key
      t.string :param_value

      t.timestamps
    end
  end

  def self.down
    drop_table :sys_params
  end
end
