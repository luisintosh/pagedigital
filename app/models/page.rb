class Page < ApplicationRecord
  BLACK_LIST = %w[login register logout page analytics referrals account upgrade billing checkout about pricing help
                  contact terms privacy].freeze

  validates :slug, presence: true, uniqueness: { case_sensitive: false },
                   length: { in: 2..24 }, format: { with: /\A\w+\Z/ },
                   exclusion: { in: Page::BLACK_LIST }
end
