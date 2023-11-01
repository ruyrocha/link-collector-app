require 'rails_helper'

RSpec.describe "page_links/index", type: :view do
  before(:each) do
    assign(:page_links, [
      PageLink.create!(
        page: nil,
        title: "Title",
        url: "Url"
      ),
      PageLink.create!(
        page: nil,
        title: "Title",
        url: "Url"
      )
    ])
  end

  it "renders a list of page_links" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
  end
end
