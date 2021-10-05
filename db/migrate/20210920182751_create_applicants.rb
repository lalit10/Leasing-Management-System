class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :applicant_id
      t.string :name
      t.string :password
      t.string :email_address
      t.string :phone_number
      t.string :property_applied
      t.string :property_occupied

      t.timestamps
    end
    add_index :applicants, :applicant_id, unique: true
  end
end
