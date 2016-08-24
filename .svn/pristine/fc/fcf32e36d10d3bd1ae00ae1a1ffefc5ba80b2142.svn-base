class CreateAssistences < ActiveRecord::Migration
  def change
    create_table :assistences do |t|
      t.integer :student_id
      t.string :signature
      t.integer :work_day_id

      t.timestamps null: false
    end
    add_index :assistences, :student_id
    add_index :assistences, :work_day_id
  end
end
