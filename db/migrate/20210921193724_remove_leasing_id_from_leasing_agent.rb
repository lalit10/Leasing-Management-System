class RemoveLeasingIdFromLeasingAgent < ActiveRecord::Migration[6.1]
  def change
    remove_index :leasing_agents, :leasing_id, unique: true
    remove_column :leasing_agents, :leasing_id, :string
  end
end
