class CreateLeasingAgents < ActiveRecord::Migration[6.1]
  def change
    create_table :leasing_agents do |t|
      t.string :leasing_id
      t.string :name
      t.string :password
      t.string :email_address
      t.string :phone_number

      t.timestamps
    end
    add_index :leasing_agents, :leasing_id, unique: true
  end
end
