class RemoveIssue5FromComplaints < ActiveRecord::Migration[5.1]
  def change
    remove_column :complaints, :issue5, :string
  end
end
