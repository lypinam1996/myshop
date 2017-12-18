class ChangeStatus < ActiveRecord::Migration[5.1]
  def up
    change_table :users do |t|
      t.change :telephone, :string, null:false, default:"1"
    end
  end
end

