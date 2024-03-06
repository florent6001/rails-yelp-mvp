class AddReviewRefToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_reference :restaurants, :review, null: true, foreign_key: true
  end
end
