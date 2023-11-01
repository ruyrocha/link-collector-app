# frozen_string_literal: true

require 'rails_helper'

module Test
  class HttpProtocolValidatable
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :url

    validates :url, http_protocol: true
  end
end

RSpec.describe HttpProtocolValidator do
  it 'is valid when the URL protocol is HTTP(S)' do
    record = Test::HttpProtocolValidatable.new(url: 'https://google.com')

    record.url = 'https://google.com'

    expect(record).to be_valid
  end

  it 'is invalid when URL protocol is not HTTP(S)' do
    record = Test::HttpProtocolValidatable.new(url: 'sftp://some-host')

    expect(record).not_to be_valid
  end
end
