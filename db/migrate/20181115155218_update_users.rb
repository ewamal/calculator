class UpdateUsers < ActiveRecord::Migration[5.2]
  def up

      change_column :users, :email, :string, :limit => 100
      change_column :users, :password, :string, :limit =>  100
      change_column :users, :first_name, :string, :limit => 30
      change_column :users, :last_name, :string, :limit => 30

    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false

  end
end
