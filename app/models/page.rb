class Page < ApplicationRecord
  validates :url, presence: true

  has_many :page_links

  before_create :set_title
  after_create :enqueue_links_fetcher_job

  private

  def set_title
    return if title&.present?

    document = PageFetcherService.call(url:)

    self.title = document.title
  end

  def enqueue_links_fetcher_job
    LinksFetcherJob.perform_async(id)
  end
end
