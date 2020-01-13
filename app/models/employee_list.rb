class EmployeeList < ApplicationRecord
  def self.import(file)
    EmployeeList.delete_all
    CSV.foreach(file.path, headers:true) do |row|
      EmployeeList.create! row.to_hash
    end
  end

end
