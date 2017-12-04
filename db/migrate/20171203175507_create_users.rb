class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t| 
      t.string :email, default: 'Not specified', null: false
      t.string :password_digest, default: '', null: false
      t.string :full_name
      t.integer :role

      t.timestamps
    end
  end
end
