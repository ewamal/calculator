class CreateCalculations < ActiveRecord::Migration[5.2]
  def change

    create_table :calculations do |table|
      table.integer :user_id
      table.string :calculation_type, :required => true
      table.integer :numbers, array: true, :required => true
      table.float :result, :required => true
      table.timestamps 
    end
  end
end
