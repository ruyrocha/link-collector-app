require 'rails_helper'

RSpec.describe Page, type: :model do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to have_many(:page_links) }

  context 'Callbacks' do
    it 'sets the title when it is empty' do
      record = build(:page, url: 'https://www.koombea.com/', title: nil)

      record.save

      expect(record.title).not_to be_empty
      expect(record.title).to eq 'Koombea - Your App Development Partner'
    end
  end
end
