class CreateMonitorings < ActiveRecord::Migration
  def change
    create_table :monitorings do |t|
      t.integer :user_id
      t.integer :hours
      t.string :assignature
      t.text :schelude
      t.datetime :start_date
      t.datetime :end_date
      t.string :status

      t.timestamps null: false
    end
    add_index :monitorings, :user_id
  end
end
