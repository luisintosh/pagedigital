class PageAppearance < ApplicationRecord
  belongs_to :page

  enum theme: Appearance::Constants::THEMES, _prefix: true
  enum font: Appearance::Constants::FONTS, _prefix: true
  enum primary_color: Appearance::Constants::COLORS, _prefix: true
end
