class RemoveColumnProjectName < ActiveRecord::Migration
  def change
    remove_column :employees, :project_id
  end
end
