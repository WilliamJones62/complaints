class AddWithVendorToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :with_vendor, :boolean
  end
end
