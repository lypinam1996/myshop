class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, default: 'Not specified', null: false
      t.integer :price, default: 0, null: false
      t.integer :author
      t.integer :count, default: 0, null: false
      t.integer :pages, default: 0, null: false

      t.timestamps
    end
  end
end
