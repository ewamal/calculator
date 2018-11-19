class UpdateCalculations2 < ActiveRecord::Migration[5.2]
  def up

    change_column :calculations, :calculation_type, :string, null: false
    change_column :calculations, :result, :float, null: false
    
  end
end
