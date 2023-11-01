# frozen_string_literal: true

class HttpProtocolValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if URI.parse(value).scheme.starts_with?('http')

    record.errors.add attribute, (options[:message] || 'Invalid protocol.')
  end
end
