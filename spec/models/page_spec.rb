require 'rails_helper'

RSpec.describe Page, type: :model do
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug).case_insensitive }
  it { should validate_length_of(:slug).is_at_least(2).is_at_most(24) }
  it { should allow_value('Username_123').for(:slug) }
  it { should_not allow_value('Wrong-Username.123').for(:slug) }
  it { should validate_exclusion_of(:slug).in_array(Page::BLACK_LIST) }
end
