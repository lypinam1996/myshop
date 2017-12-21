class CartDefault < ActiveRecord::Migration[5.1]
  def up
    change_table :carts do |t|
      t.change :production_id, :integer, null:false
      t.change :user_id, :integer, null:false
      t.change :count, :integer, null:false, default:1
    end
  end
end
