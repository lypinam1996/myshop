class ChangeHistory4 < ActiveRecord::Migration[5.1]
  def up
    change_table :histories do |t|
      t.change :production_id, :integer, null:true, default: 1
    end
  end
end
