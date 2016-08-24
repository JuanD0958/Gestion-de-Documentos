class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :user_id
      t.integer :request_id

      t.timestamps null: false
    end
    add_index :answers, :user_id
    add_index :answers, :request_id
  end
end
