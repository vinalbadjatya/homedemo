class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.integer :salary_amount
      t.date :salary_date

      t.timestamps
    end
  end
end
