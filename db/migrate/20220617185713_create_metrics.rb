class CreateMetrics < ActiveRecord::Migration[7.0]
  def change
    create_table :metrics do |t|
      t.string :name
      t.decimal :value
      t.integer :kind
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
