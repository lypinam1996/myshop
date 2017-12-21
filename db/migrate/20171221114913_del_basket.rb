class DelBasket < ActiveRecord::Migration[5.1]
  def change
    drop_table :baskets
  end
end
