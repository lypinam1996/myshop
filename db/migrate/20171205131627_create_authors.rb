class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :fullname, default: 'Not specified', null: false

      t.timestamps
    end
  end
end
