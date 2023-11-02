class LinksFetcherJob
  include Sidekiq::Job

  def perform(page_id)
    page = Page.find(page_id)

    links = LinksExtractorService.call(url: page.url)

    page.page_links.insert_all(links)
  end
end
