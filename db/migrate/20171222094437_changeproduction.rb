class Changeproduction < ActiveRecord::Migration[5.1]
  def up
    change_table :productions do |t|
      t.change :title, :string, null:false, default: "Not specified"
    end
  end
end
