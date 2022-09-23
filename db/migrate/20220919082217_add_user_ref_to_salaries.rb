class AddUserRefToSalaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :salaries, :user, foreign_key: true
  end
end
