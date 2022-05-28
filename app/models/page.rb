class Page < ApplicationRecord
  BLACK_LIST = %w[login register logout page analytics referrals account upgrade billing checkout about pricing help
                  contact terms privacy].freeze

  has_one :page_profile, dependent: :destroy

  validates :slug, presence: true, uniqueness: { case_sensitive: false },
                   length: { in: 2..24 }, format: { with: /\A\w+\Z/ },
                   exclusion: { in: Page::BLACK_LIST }

  before_create :build_default_page_profile

  private

  def build_default_page_profile
    build_page_profile # with default params
    true # response for the callback
  end
end
