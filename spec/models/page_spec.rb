require 'rails_helper'

RSpec.describe Page, type: :model do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to have_many(:page_links) }
end
