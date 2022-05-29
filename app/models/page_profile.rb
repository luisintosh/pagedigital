class PageProfile < ApplicationRecord
  belongs_to :page

  has_one_attached :profile_image
  has_one_attached :header_image

  validates_length_of :display_name, { maximum: 60 }
  validates_length_of :location, { maximum: 60 }
end
