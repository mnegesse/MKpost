class CreateSales < ActiveRecord::Migration[5.0]
  def change

    create_table :sales do |t|
    end

    add_column :customers, :sale_id, :integer
    add_column :cars, :sale_id, :integer

    remove_column :customers, :transaction_id
    remove_column :cars, :transaction_id
  end

  def down
    drop_table :sales
  end
end
