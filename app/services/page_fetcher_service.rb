# frozen_string_literal: true

InvalidProtocolError = Class.new(::StandardError)

# Fetch the HTML document for a given URL.
class PageFetcherService
  def self.call(url:)
    new(url).call
  end

  attr_reader :url

  PROTOCOL_REGEX = /http/i

  def initialize(url)
    # TODO: case insensitive match
    raise InvalidProtocolError unless PROTOCOL_REGEX.match?(url)

    @url = url
  end

  def call
    http = HTTPX.plugin(:follow_redirects)
    content = http.max_redirects(16).get(url)&.to_s

    Nokogiri::HTML.parse(content)
  end
end
