class ChangeDataTypeForBreaks < ActiveRecord::Migration[5.2]
  def up
    change_column :breaks, :f_date, :date
  end

  def down
    change_column :breaks, :f_date, :date
  end
end
