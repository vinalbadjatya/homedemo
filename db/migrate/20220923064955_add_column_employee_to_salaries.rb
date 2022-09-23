class AddColumnEmployeeToSalaries < ActiveRecord::Migration[5.2]
  def change
    add_column :salaries, :employee_name, :string
  end
end
