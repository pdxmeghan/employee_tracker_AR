class CreateEmployeesProjects < ActiveRecord::Migration
  def change
    create_table :employees_projects do |t|
      t.column :employee_id, :integer
      t.column :project_id, :integer

      t.timestamps
    end
  end
end
