class AddKeysToApplications < ActiveRecord::Migration[6.1]
  def change
    add_reference :applications, :applicant, null: false, foreign_key: true
  end
end
