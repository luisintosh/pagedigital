class PageProfile < ApplicationRecord
  belongs_to :page
  validates_length_of :display_name, { maximum: 60 }
  validates_length_of :location, { maximum: 60 }
end
