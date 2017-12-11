class CreateProductions < ActiveRecord::Migration[5.1]
  def change
    create_table :productions do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.integer :author_id, null: false
      t.integer :count
      t.integer :pages, null: false

      t.timestamps
    end
  end
end
