class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.string :size
      t.boolean :features_pets
      t.boolean :features_laundry
      t.boolean :features_parking
      t.string :terms_available
      t.datetime :earliest_start_time
      t.integer :application_fee
      t.integer :monthly_rent
      t.string :occupied_by

      t.timestamps
    end
  end
end
