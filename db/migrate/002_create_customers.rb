class CreateCustomers < ActiveRecord::Migration[5.0]
  def up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.string :phone_number
      t.integer :transaction_id
    end
  end

  def down
    drop_table :customers
  end
end
