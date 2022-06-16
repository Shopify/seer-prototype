class AddJustificationToEstimate < ActiveRecord::Migration[7.0]
  def change
    add_column :estimates, :justification, :text
  end
end
