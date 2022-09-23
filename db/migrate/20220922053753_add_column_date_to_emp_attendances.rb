class AddColumnDateToEmpAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :emp_attendances, :status_date, :datetime
  end
end
