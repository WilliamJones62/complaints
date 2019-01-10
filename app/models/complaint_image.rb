class ComplaintImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :complaint, :foreign_key => "complaint_id"
end
