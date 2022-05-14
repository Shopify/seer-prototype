class CreateFamiliarities < ActiveRecord::Migration[7.0]
  def change
    create_table :familiarities do |t|
      t.string :description

      t.timestamps
    end
  end
end
