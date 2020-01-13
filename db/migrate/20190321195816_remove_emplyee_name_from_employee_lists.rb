class RemoveEmplyeeNameFromEmployeeLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :employee_lists, :Emplyee_Name, :string
  end
end
