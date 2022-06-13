class ContentItem < ApplicationRecord
  include Validators

  belongs_to :page

  validates :url, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :subtitle, length: { maximum: 255 }
  validates :position, numericality: { only_integer: true }, length: { maximum: 2 }

  scope :ordered, -> { order(position: :desc) }
end
