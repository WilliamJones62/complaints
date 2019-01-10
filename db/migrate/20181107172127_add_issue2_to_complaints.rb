class AddIssue2ToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :issue2, :string
  end
end
