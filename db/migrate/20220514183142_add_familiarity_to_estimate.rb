class AddFamiliarityToEstimate < ActiveRecord::Migration[7.0]
  def change
    add_reference :estimates, :familiarity, null: false, foreign_key: true
  end
end
