class IndexForBooks < ActiveRecord::Migration[5.1]
  def change
  	add_index :productions, :title, unique: true
  end
end
