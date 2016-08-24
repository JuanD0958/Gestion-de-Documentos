class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.integer :work_day
      t.string :ip

      t.timestamps null: false
    end
    add_index :pings, :work_day
  end
end
