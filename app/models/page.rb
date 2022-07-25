class Page < ApplicationRecord
  BLACK_LIST = %w[login register logout page analytics referrals account upgrade billing checkout about pricing help
                  contact terms privacy].freeze

  has_one :page_profile, dependent: :destroy
  has_one :page_appearance, dependent: :destroy
  has_one :page_contact, dependent: :destroy
  has_one :page_integration, dependent: :destroy

  has_many :content_items, dependent: :destroy

  validates :slug, presence: true, uniqueness: { case_sensitive: false },
                   length: { in: 2..24 }, format: { with: /\A\w+\Z/ },
                   exclusion: { in: Page::BLACK_LIST }

  before_create :build_default_dependencies

  scope :includes_all, -> { includes([:page_profile, :page_appearance, :page_contact, :page_integration, content_items: { custom_thumbnail_image_attachment: :blob }]) }

  # helps to url helpers to use the slug instead of id to build the url
  def to_param
    super
    slug
  end

  private

  def build_default_dependencies
    build_page_profile # with default params
    build_page_appearance
    build_page_contact
    build_page_integration
    true # response for the callback
  end
end
