class AddStatusToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :status, :string
  end
end
