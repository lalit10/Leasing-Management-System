class RemovePropsId1FromApplicants < ActiveRecord::Migration[6.1]
  def change
    remove_column :applicants, :properties_id, :integer
  end
end
