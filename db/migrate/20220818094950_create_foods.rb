class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :num
      t.date :limit_date
      t.datetime :deadline
      t.integer :price
      t.string :where
      t.integer :user_id
      t.timestamps
    end
  end
end
