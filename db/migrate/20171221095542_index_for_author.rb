class IndexForAuthor < ActiveRecord::Migration[5.1]
  def change
    add_index :authors, :fullname, unique: true
  end
end
