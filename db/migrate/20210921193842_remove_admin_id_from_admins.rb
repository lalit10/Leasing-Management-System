class RemoveAdminIdFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_index :admins, :admin_id, unique: true
    remove_column :admins, :admin_id, :string
  end
end
