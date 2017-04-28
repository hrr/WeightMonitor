class AddTargetWeightToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :targetWeight, :float
  end
end
