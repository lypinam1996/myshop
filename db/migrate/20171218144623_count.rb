class Count < ActiveRecord::Migration[5.1]
  def change
     add_column :baskets, :count, :integer, default: 1, null: false
  end
end
