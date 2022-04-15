class CreateExperts < ActiveRecord::Migration[7.0]
  def change
    create_table :experts do |t|
      t.string :name

      t.timestamps
    end
  end
end
