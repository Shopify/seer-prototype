class CreateEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :estimates do |t|
      t.references :expert, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.integer :max_magnitude
      t.integer :likely_magnitude
      t.integer :min_magnitude
      t.decimal :max_frequency
      t.decimal :likely_frequency
      t.decimal :min_frequency

      t.timestamps
    end
  end
end
