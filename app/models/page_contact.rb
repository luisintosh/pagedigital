class PageContact < ApplicationRecord
  include Validators

  belongs_to :page

  validates :public_email, email: true, allow_blank: true
  validates :public_phone, numericality: { only_integer: true }, length: { maximum: 13 }, allow_blank: true

  serialize :main_contact_links, Array

  enum public_phone_type: { call: 0, sms: 1, whatsapp: 2, telegram: 3 }, _prefix: true
end
