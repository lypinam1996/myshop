class ChangeStatus < ActiveRecord::Migration[5.1]
  def up
    change_table :users do |t|
      t.change :role, :boolean, null:false, default:false
    end
  end
end

