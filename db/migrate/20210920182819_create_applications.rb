class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :applicants
      t.datetime :date_time
      t.string :property
      t.string :status

      t.timestamps
    end
  end
end
