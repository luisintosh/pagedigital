class PageProfile < ApplicationRecord
  belongs_to :page

  has_one_attached :profile_image
  has_one_attached :header_image

  validates :profile_image, blob: { content_type: ['image/png', 'image/jpeg', 'image/gif'], size_range: 0..(1.megabytes) }
  validates :header_image, blob: { content_type: ['image/png', 'image/jpeg', 'image/gif'], size_range: 0..(1.megabytes) }
  validates_length_of :display_name, { maximum: 60 }
  validates_length_of :location, { maximum: 60 }
end
