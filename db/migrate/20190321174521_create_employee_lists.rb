class CreateEmployeeLists < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_lists do |t|
      t.string :Employee_Status
      t.string :Badge_#
      t.string :Cost_Center_Code
      t.string :Department
      t.string :Lastname
      t.string :Firstname
      t.string :Emplyee_Name
      t.date :Hire_Date
      t.date :Termination_Date

      t.timestamps
    end
  end
end
