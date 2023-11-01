class Page < ApplicationRecord
  validates :url, presence: true

  has_many :page_links

  before_create :set_title

  private

  def set_title
    return if title&.present?

    document = PageFetcherService.call(url:)

    self.title = document.title
  end
end
