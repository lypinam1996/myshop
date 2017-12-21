class DefaultProductions < ActiveRecord::Migration[5.1]
  def up
    change_table :productions do |t|
      t.change :title, :string, null:false, default:" "
      t.change :price, :integer, null:false, default:0
      t.change :pages, :integer, null:false, default:0
    end
  end
end
