class AddEmployeeNameToEmployeeLists < ActiveRecord::Migration[5.1]
  def change
    add_column :employee_lists, :Employee_Name, :string
  end
end
