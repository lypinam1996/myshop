class CreateBaskets < ActiveRecord::Migration[5.1]
  def change
    create_table :baskets do |t|
      t.integer :production_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
