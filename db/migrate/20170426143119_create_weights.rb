class CreateWeights < ActiveRecord::Migration[5.0]
  def change
    create_table :weights do |t|
      t.float :entry
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
