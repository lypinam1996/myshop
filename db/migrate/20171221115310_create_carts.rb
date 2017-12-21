class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :production_id, null: false
      t.integer :user_id, null: false
      t.integer :count, null: false
      t.integer :sum, null: false

      t.timestamps
    end
  end
end
