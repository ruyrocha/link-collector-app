class LinksFetcherJob
  include Sidekiq::Job

  def perform(page_id)
    page = Page.find_by!(page_id)

    links = LinksExtractorService.call(url: page.url)
  end
end
