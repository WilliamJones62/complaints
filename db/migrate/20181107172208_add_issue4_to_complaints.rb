class AddIssue4ToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :issue4, :string
  end
end
