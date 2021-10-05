class AddRolesToLeasingAgents < ActiveRecord::Migration[6.1]
  def change
    add_column :leasing_agents, :admin_role, :boolean,  default: false
  end
end
