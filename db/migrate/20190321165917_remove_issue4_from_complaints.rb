class RemoveIssue4FromComplaints < ActiveRecord::Migration[5.1]
  def change
    remove_column :complaints, :issue4, :string
  end
end
