class AddColumnToEmpAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :emp_attendances, :mail_to, :string
  end
end
