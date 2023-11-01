require 'rails_helper'

RSpec.describe "page_links/show", type: :view do
  before(:each) do
    assign(:page_link, PageLink.create!(
      page: nil,
      title: "Title",
      url: "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
  end
end
