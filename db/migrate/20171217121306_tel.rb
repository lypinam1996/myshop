class Tel < ActiveRecord::Migration[5.1]
  def up
    change_table :users do |t|
      t.change :, :boolean, null:false, default:false
    end
  end
end
