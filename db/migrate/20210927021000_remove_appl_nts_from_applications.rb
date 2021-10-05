class RemoveApplNtsFromApplications < ActiveRecord::Migration[6.1]
  def change
    remove_column :applications, :applicant, :string
  end
end
