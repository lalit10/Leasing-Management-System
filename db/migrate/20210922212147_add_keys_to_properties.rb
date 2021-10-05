class AddKeysToProperties < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :leasing_agent, null: false, foreign_key: true
  end
end
