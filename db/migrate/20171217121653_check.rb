class Check < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :check, :int, null:false, default:1
  end
end
