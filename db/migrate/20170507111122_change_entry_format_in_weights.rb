class ChangeEntryFormatInWeights < ActiveRecord::Migration[5.0]
  def up
    change_table :weights do |t|
      t.change :entry, :decimal, :precision => 5, :scale => 2
    end
  end

  def down
    change_table :weights do |t|
      t.change :entry, :float
    end
  end
end
