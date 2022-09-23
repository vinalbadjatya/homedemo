class AddUserRefToEmpAttendances < ActiveRecord::Migration[5.2]
  def change
    add_reference :emp_attendances, :user, foreign_key: true
  end
end
