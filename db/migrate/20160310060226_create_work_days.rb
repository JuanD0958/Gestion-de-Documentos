class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :start_signature
      t.string :end_signature
      t.string :teacher_signature
      t.integer :approval_id

      t.timestamps null: false
    end
    add_index :work_days, :user_id
    add_index :work_days, :approval_id
  end
end
