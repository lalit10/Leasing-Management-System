class AddRolesToApplicants < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :admin_role, :boolean,  default: false
  end
end
