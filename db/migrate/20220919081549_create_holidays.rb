class CreateHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :holidays do |t|
      t.string :ocassion
      t.string :day
      t.date :on_date

      t.timestamps
    end
  end
end
