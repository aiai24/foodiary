class CreateFoodstuffs < ActiveRecord::Migration[6.1]
  def change
    create_table :foodstuffs do |t|
      t.string :name
      t.timestamps      
    end
  end
end
