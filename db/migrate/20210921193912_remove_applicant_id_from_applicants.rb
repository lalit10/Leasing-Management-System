class RemoveApplicantIdFromApplicants < ActiveRecord::Migration[6.1]
  def change
    remove_index :applicants, :applicant_id, unique: true
    remove_column :applicants, :applicant_id, :string
  end
end
