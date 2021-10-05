class RemoveApplnsIdFromApplicants < ActiveRecord::Migration[6.1]
  def change
    remove_column :applicants, :applications_id, :integer
  end
end
