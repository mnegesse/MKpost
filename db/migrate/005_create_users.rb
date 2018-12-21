class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :email
      t.string :image
      t.integer :age
      t.string :bio
      t.timestamp :time
    end
  end

  def down
    drop_table :users
  end
end
