class CreateEmpAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :emp_attendances do |t|
      t.datetime :working_hours
      t.string :project_name
      t.string :task_description

      t.timestamps
    end
  end
end
