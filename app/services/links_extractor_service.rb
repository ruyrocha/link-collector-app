# frozen_string_literal: true

class LinksExtractorService
  def self.call(url:)
    new(url).call
  end

  attr_reader :document

  def initialize(url)
    @document = PageFetcherService.call(url:)
  end

  def extract_links
    document.css('a').map do |element|
      href = element['href']

      next if href.starts_with?('#')

      { title: element.text, url: href }
    end.compact
  end

  def call
    extract_links
  end
end
