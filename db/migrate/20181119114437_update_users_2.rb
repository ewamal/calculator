class UpdateUsers2 < ActiveRecord::Migration[5.2]
  def up

      change_column :users, :email, :string, null: false
      change_column :users, :password, :string, null: false

  end
end
