class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_mobileno, :integer
    add_column :users, :date_of_birth, :date
    add_column :users, :skills, :string
  end
end
