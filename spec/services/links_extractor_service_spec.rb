require 'rails_helper'

RSpec.describe LinksExtractorService do
  def document
    html = <<~HTML
      <div id="block1">
          <a href="https://google.com">Google</a>
      </div>
      <div id="block2">
          <a href="https://github.com">GitHub</a>
      </div>
    HTML

    Nokogiri::HTML.parse(html)
  end

  describe '::call' do
    it 'extracts the links from a page' do
      url = 'https://example.com'

      allow(PageFetcherService).to receive(:call).with(url:).and_return(document)

      service = described_class.call(url:)

      expect(service).to be_an(Array)

      service.each { |s| expect(%w[Google GitHub]).to include s[:title] }
    end
  end
end
