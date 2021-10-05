class AddKeysToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_reference :applicants, :applications, null: false, foreign_key: true
    add_reference :applicants, :properties, null: false, foreign_key: true
  end
end
