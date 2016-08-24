class FixWorkDayIdToPings < ActiveRecord::Migration
  def self.up
  	remove_index :pings, :work_day
  	rename_column :pings, :work_day, :work_day_id
  	add_index :pings, :work_day_id
  end

  def self.down
  	remove_index :pings, :work_day_id
  	rename_column :pings, :work_day_id, :work_day
  	add_index :pings, :work_day
  end
end
