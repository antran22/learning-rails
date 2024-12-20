class CreateDishRestaurantJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :dishes, :restaurants do |t|
      t.index %i[dish_id restaurant_id]
    end
  end
end
