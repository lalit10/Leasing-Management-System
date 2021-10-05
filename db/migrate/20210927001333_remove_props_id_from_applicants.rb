class RemovePropsIdFromApplicants < ActiveRecord::Migration[6.1]
  def change
    remove_column :applicants, :propertiess_id, :integer
  end
end
