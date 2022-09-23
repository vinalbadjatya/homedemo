class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :duration
      t.integer :team_size
      t.string :lead_name
      t.date :start_date

      t.timestamps
    end
  end
end
