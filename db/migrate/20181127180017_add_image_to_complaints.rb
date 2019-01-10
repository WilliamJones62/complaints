class AddImageToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :image, :string
  end
end
