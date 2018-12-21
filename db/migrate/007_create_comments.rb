class CreateComments < ActiveRecord::Migration[5.0]
  def up
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :post_id
      t.timestamp :time
    end
  end

  def down
    drop_table :comments
  end
end
