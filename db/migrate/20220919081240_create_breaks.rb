class CreateBreaks < ActiveRecord::Migration[5.2]
  def change
    create_table :breaks do |t|
      t.date :f_date
      t.date :t_date
      t.integer :day
      t.string :reason

      t.timestamps
    end
  end
end
