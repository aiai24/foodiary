class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :body
      t.integer :user_id
      t.string :where
      t.string :food
      t.integer :price
      t.date :date
      t.timestamps
    end
  end
end
