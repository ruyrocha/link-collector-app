require 'rails_helper'

RSpec.describe PageFetcherService do
  describe '::call' do
    it 'raises an error when URL protocol is different than HTTP or HTTPS' do
      url = 'sftp://some-host'

      expect { described_class.call(url:) }.to raise_error(InvalidProtocolError)
    end

    it 'raises an error when the URL is inaccessible'

    it 'returns the parsed HTML document for the given URL' do
      url = 'https://www.koombea.com/'
      page_title = 'Koombea - Your App Development Partner'

      document = described_class.call(url:)

      expect(document).not_to be_nil
      expect(document.title).to eq page_title
    end

    it 'returns the parsed HTML document for the given URL when there are redirects' do
      url = 'https://koombea.com/'
      page_title = 'Koombea - Your App Development Partner'

      document = described_class.call(url:)

      expect(document).not_to be_nil
      expect(document.title).to eq page_title
    end
  end
end
