class ChangeHistory3 < ActiveRecord::Migration[5.1]
  def up
    change_table :histories do |t|
      t.change :production_id, :integer, null:true, default: 5
      t.change :user_id, :integer, null:true, default: 18
    end
  end
end
