require 'rails_helper'
RSpec.describe LinksFetcherJob, type: :job do
  it 'creates the pages links for a given page ID' do
    page = create(:page, url: 'https://google.com')

    LinksFetcherJob.perform_sync(page.id)

    expect(page.page_links.count).not_to be_zero
  end
end
