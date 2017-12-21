class ChangeHistory2 < ActiveRecord::Migration[5.1]
  def up
    change_table :histories do |t|
      t.change :sum, :integer, null:true
      t.change :created_at, :datetime, null:true
      t.change :updated_at, :datetime, null:true
    end
  end
end
