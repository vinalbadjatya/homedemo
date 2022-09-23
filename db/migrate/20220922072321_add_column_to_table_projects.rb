class AddColumnToTableProjects < ActiveRecord::Migration[5.2]
  def change
    add_column  :projects, :employee_name, :string
  end
end
