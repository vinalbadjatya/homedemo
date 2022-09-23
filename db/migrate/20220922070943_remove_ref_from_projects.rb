class RemoveRefFromProjects < ActiveRecord::Migration[5.2]
 remove_column :projects, :user_id, :integer
end
