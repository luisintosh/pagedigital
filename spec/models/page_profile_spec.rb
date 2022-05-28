require 'rails_helper'

RSpec.describe PageProfile, type: :model do
  it { should belong_to(:page) }
  it { should validate_length_of(:display_name).is_at_most(60) }
  it { should validate_length_of(:location).is_at_most(60) }
end
