class CreateWaitlists < ActiveRecord::Migration[6.1]
  def change
    create_table :waitlists do |t|
      t.string :applicants
      t.datetime :date_time
      t.string :property
      t.string :status

      t.timestamps
    end
  end
end
