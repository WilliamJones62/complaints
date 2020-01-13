class Complaint < ApplicationRecord
  has_many :complaint_images, inverse_of: :complaint, :dependent => :destroy
  accepts_nested_attributes_for :complaint_images, reject_if: proc { |attributes| attributes['image'].blank? }
  validates_presence_of :user
  validates_presence_of :part
  validates_presence_of :part_count
  validates_presence_of :issue
  validates_presence_of :issue_date
  validate :invoice_lot

  def self.import(file)
    Complaint.delete_all
    CSV.foreach(file.path, headers:true) do |row|
      Complaint.create! row.to_hash
    end
  end

  def invoice_lot
    if !invoice.present? && !order.present? && !lot.present?
      errors.add(:invoice, " or Order # or Lot # is required")
    end
  end
end
