class PageIntegration < ApplicationRecord
  belongs_to :page

  validates :facebook_pixel, length: { maximum: 20 }
  validates :google_analytics, length: { maximum: 20 }
end
