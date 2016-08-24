class AddPetitionerIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :petitioner_id, :integer
    add_index :requests, :petitioner_id
  end
end
