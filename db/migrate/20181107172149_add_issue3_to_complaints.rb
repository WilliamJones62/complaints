class AddIssue3ToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :issue3, :string
  end
end
