class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :admin_id
      t.string :name
      t.string :password
      t.string :email_address
      t.string :phone_number

      t.timestamps
    end
    add_index :admins, :admin_id, unique: true
  end
end
