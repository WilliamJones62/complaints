class AddNotesToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :notes, :text
  end
end
