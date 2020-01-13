class RemoveIssue3FromComplaints < ActiveRecord::Migration[5.1]
  def change
    remove_column :complaints, :issue3, :string
  end
end
