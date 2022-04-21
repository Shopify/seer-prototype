class CreateScenarioBins < ActiveRecord::Migration[7.0]
  def change
    create_table :scenario_bins do |t|
      t.references :estimate, null: false, foreign_key: true
      t.decimal :value
      t.integer :count

      t.timestamps
    end
  end
end
