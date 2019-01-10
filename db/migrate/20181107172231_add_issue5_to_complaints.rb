class AddIssue5ToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :issue5, :string
  end
end
