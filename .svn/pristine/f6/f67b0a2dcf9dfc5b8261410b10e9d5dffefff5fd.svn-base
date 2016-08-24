class AddMonitoringIdToWorkDays < ActiveRecord::Migration
  def change
    add_column :work_days, :monitoring_id, :integer
    add_index :work_days, :monitoring_id
  end
end
