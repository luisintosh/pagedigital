class ContentItem < ApplicationRecord
  include Validators

  belongs_to :page

  has_one_attached :custom_thumbnail_image

  validates :custom_thumbnail_image, blob: { content_type: ['image/png', 'image/jpeg', 'image/gif'], size_range: 0..(1.megabytes) }
  validates :url, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :subtitle, length: { maximum: 255 }
  validates :position, numericality: { only_integer: true }, length: { maximum: 2 }

  after_create :update_position_in_list

  scope :ordered, -> { order(position: :asc) }
  scope :includes_all, -> { ordered.includes([:page, { custom_thumbnail_image_attachment: :blob }]) }

  # on position change update the entire list of content items
  def update_position(index)
    self.position = index
    return unless position_changed?

    update_position_in_list
  end

  private

  # update the entire list of content items
  def update_position_in_list
    ActiveRecord::Base.transaction do
      ids = ContentItem.select(:id).where(page_id:).ordered.collect(&:id)
      ids.delete(id)
      if position >= ids.length
        ids.push(id)
      else
        ids.insert(position, id)
      end
      values = ids.map.with_index { |_, index| { position: index } }
      ContentItem.update!(ids, values)
    end
  end
end
