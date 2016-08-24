class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :content
      t.integer :applied_id

      t.timestamps null: false
    end
    add_index :requests, :applied_id
  end
end
