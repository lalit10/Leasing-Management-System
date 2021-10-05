class AddOccupantIdToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :occupant_id, :integer
  end
end
