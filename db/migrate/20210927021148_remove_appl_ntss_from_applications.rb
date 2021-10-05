class RemoveApplNtssFromApplications < ActiveRecord::Migration[6.1]
  def change
    remove_column :applications, :applicants, :string
  end
end
