class RemovePropFromApplications < ActiveRecord::Migration[6.1]
  def change
    remove_column :applications, :property, :string
  end
end
