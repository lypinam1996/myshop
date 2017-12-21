class ChangeHistory < ActiveRecord::Migration[5.1]
  def up
    change_table :histories do |t|
      t.change :production_id, :integer, null:true
      t.change :user_id, :integer, null:true
      t.change :count, :integer, null:true
    end
  end
end
