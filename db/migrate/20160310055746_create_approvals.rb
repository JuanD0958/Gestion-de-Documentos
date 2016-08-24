class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.integer :user_id
      t.string :signature

      t.timestamps null: false
    end
    add_index :approvals, :user_id
  end
end
