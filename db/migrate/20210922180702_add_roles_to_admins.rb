class AddRolesToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :admin_role, :boolean, default: true
  end
end
